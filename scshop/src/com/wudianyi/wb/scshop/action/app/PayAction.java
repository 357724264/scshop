package com.wudianyi.wb.scshop.action.app;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.google.gson.JsonObject;
import com.lulu.tool.DateUtil;
import com.unionpay.acp.sdk.HttpClient;
import com.unionpay.acp.sdk.LogUtil;
import com.unionpay.acp.sdk.SDKConfig;
import com.unionpay.acp.sdk.SDKUtil;
import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.common.WxPayReqData;
import com.wudianyi.wb.scshop.entity.Address;
import com.wudianyi.wb.scshop.entity.Cart;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.entity.Coupon;
import com.wudianyi.wb.scshop.entity.Customer;
import com.wudianyi.wb.scshop.entity.Jflog;
import com.wudianyi.wb.scshop.entity.Order;
import com.wudianyi.wb.scshop.entity.OrderItem;
import com.wudianyi.wb.scshop.entity.Product;
import com.wudianyi.wb.scshop.entity.SubProduct;
import com.wudianyi.wb.scshop.entity.UserCoupon;
import com.wudianyi.wb.scshop.entity.WebInfo;
import com.wudianyi.wb.scshop.service.AddressService;
import com.wudianyi.wb.scshop.service.CartService;
import com.wudianyi.wb.scshop.service.CustomerService;
import com.wudianyi.wb.scshop.service.JflogService;
import com.wudianyi.wb.scshop.service.OrderItemService;
import com.wudianyi.wb.scshop.service.OrderService;
import com.wudianyi.wb.scshop.service.ProductService;
import com.wudianyi.wb.scshop.service.SubProductService;
import com.wudianyi.wb.scshop.service.UserCouponService;
import com.wudianyi.wb.scshop.service.WebInfoService;
import com.wudianyi.wb.scshop.util.NumberUtil;
import com.wudianyi.wb.scshop.util.StringUtils;
import com.wudianyi.wb.scshop.util.UnionpayUtil;
import com.wudianyi.wb.scshop.util.WxPayUtil;
import com.wudianyi.wb.scshop.util.WxSignature;

public class PayAction extends BaseAction {
	private String id;

	private String aid;

	private String message;
	private int usepoint;
	private String pt;
	private String couponid;

	static SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
	static SimpleDateFormat dateFormate = new SimpleDateFormat(
			"yyyy/MM/dd HH:mm:ss");
	@Resource
	private SubProductService subProductService;
	@Resource
	private WebInfoService webInfoService;
	@Resource
	private OrderService orderService;

	@Resource
	private OrderItemService orderItemService;

	@Resource
	private CustomerService customerService;

	@Resource
	private AddressService addressService;

	@Resource
	private JflogService jflogService;
	@Resource
	private CartService cartService;
	@Resource
	private UserCouponService userCouponService;
	@Resource
	private ProductService productService;

	public String execute() throws Exception {
//		String agent = getRequest().getHeader("user-agent");
//		String resource = "weixin";
//		if (agent.toLowerCase().indexOf("apicloud") > -1) {
//			resource = "app";
//		}
		if (StringUtils.isEmpty(aid)) {
			return ajaxJsonErrorMessage("请选择一个地址");
		}
//		System.err.println("resource-===" + resource);
//		Object weixinidObj = getSession(Const.SESSION_WEIXINID);
//		if (resource.equals("weixin") && weixinidObj == null && pt.equals("wx")) {
//			return ajaxJsonErrorMessage("缺少weixinid");
//		}
		Integer userid = (Integer) getSession(Const.SESSION_CUSTOMER_ID);
		Order order = orderService.get(id);
		if (order.getPayStat() == 0
				&& (order.getStatOverdueTime() < new Date().getTime())) {
			return ajaxJsonErrorMessage("该订单已失效");
		}
		if (order.getPromotionproductid() != null
				&& order.getPromotionproductid().equals(1)) {
			// 判断产品是不是已经够了
			// List<OrderItem> items = orderItemService.getList(
			// new QueryParam(1).add("orderid", order.getId()), 0, 0,
			// null, null, false);
			// for (OrderItem item : items) {
			SubProduct product = subProductService.get(order
					.getSubpromotionproductid());
			Product theproduct = productService.get(product.getProductid());
			// 判断是不是已经购买过了
			int joinnum = orderService.isUserJoinPromotions(userid,
					theproduct.getId());
			int canjoinnum = (theproduct.getProlimintnum() == null ? 1
					: theproduct.getProlimintnum());
			if (canjoinnum <= joinnum) {
				return ajaxJsonErrorMessage("该活动已经参加过了");
			}
			if (product.getSeckillNum() != null && product.getSeckillNum() < 1) {
				return ajaxJsonErrorMessage("已被抢光");
			}

			// }

		}
		WebInfo webInfo = webInfoService.get(Const.WEBINFO_ID);
		int point = 0;
		System.err.println("usepointusepointusepointusepoint===" + usepoint);
		if (usepoint == 1) {
			Customer customer = customerService.get(userid);
			int haspoints = customer.getPoint();
			if (order.getRealmoney() * webInfo.getPointperyuan() <= haspoints) {// 如果用户的积分足够支付订单

				customer.setPoint(haspoints
						- (int) (order.getRealmoney() * webInfo.getPointperyuan()));
				point = (int) (order.getRealmoney() * webInfo.getPointperyuan());

			} else {// 如果不是完全用积分的，则
				point = customer.getPoint();
				customer.setPoint(0);

			}
			customerService.update(customer);

		}

		Address address = addressService.get(aid);
		String ordeSn = NumberUtil.creatSn(order.getUserid() + "");
		order.setLeavemessage(message);
		order.setOrderSn(ordeSn);
		order.setAddress(address.getFullAddress());
		order.setName(address.getName());
		order.setPhone(address.getPhone());
		order.setDel(0);
		order.setPoint(point);
		order.setResource("app");
		if (webInfo.getPointperyuan() > 0) {
			System.err.println(point);
			order.setPointMoney((double) point
					/ (double) webInfo.getPointperyuan());
		} else {
			order.setPointMoney(0);
		}

		order.setRealmoney(order.getRealmoney() - order.getPointMoney());
		UserCoupon coupon = null;
		if (StringUtils.isNotEmpty(couponid)) {
			coupon = userCouponService.get(couponid);
			if (coupon.getUserid() == userid) {
				order.setRealmoney(order.getRealmoney() - coupon.getMoney());
				order.setCouponid(couponid);
			}
		}
		if (order.getRealmoney() <= 0) {
			order.setPayStat(1);
			order.setRealmoney(0.00);
		} else { // 最后数据装换一下
			order.setRealmoney(Math.round(order.getRealmoney() * 100) * 0.01d);
			order.setMoney(Math.round(order.getMoney() * 100) * 0.01d);
		}

		orderService.update(order);
		Calendar calendar = Calendar.getInstance();
		calendar.add(Calendar.MINUTE, 30);
		JSONObject retjson = new JSONObject();
		if (order.getRealmoney() > 0) {// 如果积分不够的
			if (pt != null & pt.equals("wx")) {
				String body = "";
				JSONArray itemAry = JSONArray.fromObject(order.getItemjson());
				for(int i=0;i<itemAry.size();i++) {
					JSONObject obj = JSONObject.fromObject(itemAry.get(i));
					if(i==0) body = obj.get("name").toString();
				}
				retjson.put("body", body);
				retjson.put("totalFee",(int)(order.getRealmoney()*100));
				retjson.put("tradeNo", order.getOrderSn());
				retjson.put("oid", order.getId());
				retjson.put("appId", "wx2796b0b5e52a7a15");
				retjson.put("mchId", "1318267601");
				retjson.put("partnerKey", "sda45sd465as4d56as465asc455x45a4");
				retjson.put("notifyUrl", "http://" + Const.BASEURL + "/json/paynotify!wx.action");
				// 微信预订单
//				String preid = WxPayUtil.unifiedorder(new WxPayReqData(webInfo
//						.getAppid(), webInfo.getWxpayno(), "shop", "attach",
//						order.getOrderSn(), (int) (order.getRealmoney() * 100),
//						"112.74.23.48", sdf.format(order.getCreateDate()), sdf
//								.format(calendar.getTime()), "http://"
//								+ Const.BASEURL + "/json/paynotify!wx.action",
//						weixinidObj == null ? null : weixinidObj.toString(),
//						webInfo.getWxpaySecret(),
//						resource.equals("app") ? "APP" : "JSAPI"));// JSAPI
//				Map<String, Object> map = new HashMap<String, Object>();
//				map.put("appId", webInfo.getAppid());
//				map.put("nonceStr", "5K8264ILTKCH16CQ2502SI8ZNMTM67VS");
//				map.put("package", "prepay_id=" + preid);
//				map.put("signType", "MD5");
//				map.put("timeStamp", "1");
//				String paySign = WxSignature.getSign(map,
//						webInfo.getWxpaySecret());
				retjson.put("ok", 0);
				retjson.put("success", true);
//				retjson.put("preid", preid);
//				retjson.put("paySign", paySign);
//				retjson.put("oid", order.getId());
//				retjson.put("sn", order.getOrderSn());
			} else if (pt.equals("alipay")) {
				retjson.put("ok", 0);
				retjson.put("success", true);
				retjson.put("sn", order.getOrderSn());
				retjson.put("oid", order.getId());
				retjson.put("money", order.getRealmoney());
			} else {
				retjson.put("ok", 0);
				retjson.put("success", true);
				retjson.put("url", "app/pay!unionpay.action");
				retjson.put("id", order.getId());
			}
			// 锁定优惠券
			if (coupon != null) {
				coupon.setStat(-1);
			}

		} else {// 积分已经够的
				// 保存积分
			Jflog jflog = new Jflog();
			jflog.setThein(0);
			jflog.setPoint(point);
			jflog.setPtype(-1);
			jflog.setUserid(userid);
			jflog.setLinkid(order.getId());
			jflogService.save(jflog);
			retjson.put("success", true);
			retjson.put("ok", 1);
			retjson.put("oid", order.getId());
			// 使用了优惠券
			if (coupon != null) {
				coupon.setStat(1);
				coupon.setUseDate(new Date().getTime());
				coupon.setOrderid(order.getId());
			}
		}
		if (coupon != null) {// 更新优惠券状态
			userCouponService.update(coupon);
		}
		// 删除购物车里面的一些项目
		Cart cart = cartService.get(new QueryParam(2).add("userid", userid)
				.add("shopid", order.getShopid()), false);
		// 返回减少的数量
		int js = cartService.deletefromCart(cart, order);
		if (cookieGet(Const.COOKIE_CARTNUM) != null) {
			int now = Integer.parseInt(cookieGet(Const.COOKIE_CARTNUM));
			cookieSet(Const.COOKIE_CARTNUM, (now - js) + "");
		}
		return ajaxJson(retjson.toString());
	}

	public String sure() {
		System.out.println("appid...." + id);
		Order order = orderService.get(id);
		if (!StringUtils.isEmpty(aid)) {
			Address address = addressService.get(aid);
			order.setAddressid(aid);
			order.setAddress(address.getFullAddress());
			order.setName(address.getName());
			order.setPhone(address.getPhone());
			orderService.update(order);
		}

		// setAttribute("order", order);
		JSONObject retObject = new JSONObject();
		JSONObject orderObject = new JSONObject();
		orderObject.put("realmoney", order.getRealmoney());
		orderObject.put("id", order.getId());
		orderObject.put("address", order.getAddress());
		orderObject.put("addressid", order.getAddressid());
		orderObject.put("name", order.getName());
		orderObject.put("phone", order.getPhone());
		orderObject.put("shopname", order.getShopname());
		orderObject.put("leavemessage", order.getLeavemessage());
		orderObject.put("orderSn", order.getOrderSn());
		orderObject.put("edittime", order.getEdittime());
		orderObject.put("postage", order.getPostage());
        orderObject.put("promotions",order.getPromotions());
		retObject.put("order", orderObject);

		Integer userid = (Integer) getSession(Const.SESSION_CUSTOMER_ID);
		Object weixinidObj = getSession(Const.SESSION_WEIXINID);
		if (weixinidObj != null) {
			// setAttribute("weixinid", weixinidObj.toString());
			retObject.put("weixinid", weixinidObj.toString());
		}

		Customer user = customerService.get(userid);
		// setAttribute("user", user);
		JSONObject userObject = new JSONObject();
		userObject.put("point", user.getPoint());
		retObject.put("user", userObject);
		List<OrderItem> orditemlist = orderItemService.getList(
				new QueryParam(2).add("orderid", id), 0, 0, null, null, false);
		JSONArray orditemArray = new JSONArray();
		for (OrderItem orderItem : orditemlist) {
			JSONObject orditemObject = new JSONObject();
			orditemObject.put("pic", orderItem.getPic());
			orditemObject.put("name", orderItem.getName());
			orditemObject.put("price", orderItem.getPrice());
			orditemObject.put("num", orderItem.getNum());
			orditemArray.add(orditemObject);
		}
		retObject.put("item", orditemArray);

		WebInfo info = webInfoService.get(Const.WEBINFO_ID);
		// setAttribute("info", info);
		JSONObject infoObject = new JSONObject();
		infoObject.put("appid", info.getAppid());
		infoObject.put("pointperyuan", info.getPointperyuan());
		retObject.put("info", infoObject);

		if (order.getPromotions() == null || !order.getPromotions().equals(1)) {
			JSONArray couponAry = new JSONArray();
			List<UserCoupon> coupons = userCouponService
					.getUserAvailableCoupon(orditemlist, order.getShopid(),
							userid, order.getRealmoney());
			for (UserCoupon userCoupon : coupons) {
				JSONObject couponObj = new JSONObject();
				couponObj.put("id", userCoupon.getId());
				couponObj.put("money", userCoupon.getMoney());
				couponObj.put("title", userCoupon.getTitle());
				if (userCoupon.getEndDate() == Coupon.FOREVERY_TIME) {
					System.out.println(userCoupon.getEndDate());
					couponObj.put("forever", true);
				} else {
					couponObj.put("endDate", DateUtil.toString(new Date(
							userCoupon.getEndDate()), dateFormate));
				}
				couponAry.add(couponObj);
			}
			System.err.println(coupons.size());
			retObject.put("coupons", couponAry);
		}
		System.out.println(retObject.toString());
		return ajaxJson(retObject.toString());
	}

	public String unionpay() throws IOException {

		Order order = orderService.get(id);

		/**
		 * 参数初始化 在java main 方式运行时必须每次都执行加载 如果是在web应用开发里,这个方写在可使用监听的方式写入缓存,无须在这出现
		 */
		SDKConfig.getConfig().loadPropertiesFromSrc();// 从classpath加载acp_sdk.properties文件
		/**
		 * 组装请求报文
		 */
		Map<String, String> data = new HashMap<String, String>();
		// 版本号
		data.put("version", "5.0.0");
		// 字符集编码 默认"UTF-8"
		data.put("encoding", "UTF-8");
		// 签名方法 01 RSA
		data.put("signMethod", "01");
		// 交易类型 01-消费
		data.put("txnType", "01");
		// 交易子类型 01:自助消费 02:订购 03:分期付款
		data.put("txnSubType", "01");
		// 业务类型
		data.put("bizType", "000201");
		// 渠道类型，07-PC，08-手机
		data.put("channelType", "08");
		// 前台通知地址 ，控件接入方式无作用
//		 data.put("frontUrl", "http://116.25.93.127:9999/order.action?id="
//		 + order.getId());
		data.put("frontUrl", "http://" + Const.BASE_URL + "/order.action?id="
				+ order.getId());
		// 后台通知地址
		// data.put("backUrl",
		// "http://222.222.222.222:8080/ACPTest/acp_back_url.do");
//		 data.put("backUrl",
//		 "http://116.25.93.127:9999/json/paynotify!unionpay.action");
		data.put("backUrl", "http://" + Const.BASE_URL
				+ "/json/paynotify!unionpay.action");
		// 接入类型，商户接入填0 0- 商户 ， 1： 收单， 2：平台商户
		data.put("accessType", "0");
		// 商户号码，请改成自己的商户号
		data.put("merId", "898440453110045");
		// 商户订单号，8-40位数字字母
		data.put("orderId", order.getOrderSn());
		// 订单发送时间，取系统时间
		data.put("txnTime",
				new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()));
		// 交易金额，单位分
		data.put("txnAmt", (int) (order.getRealmoney() * 100) + "");
		// data.put("txnAmt", (int) (1) + "");
		// data.put("txnAmt", "1");
		// 交易币种
		data.put("currencyCode", "156");
		// 请求方保留域，透传字段，查询、通知、对账文件中均会原样出现
		// data.put("reqReserved", "透传信息");
		// 订单描述，可不上送，上送时控件中会显示该信息
		// data.put("orderDesc", "订单描述");
		Map<String, String> submitFromData = UnionpayUtil.signData(data);

		// 交易请求url 从配置文件读取
		String requestFrontUrl = SDKConfig.getConfig().getAppRequestUrl();
		JSONObject retObj = new JSONObject();
		HttpClient hc = new HttpClient(requestFrontUrl, 30000, 30000);
		try {
			int status = hc.send(submitFromData, "UTF-8");
			System.out.println("status ===" + status);
			if (200 == status) {
				String resultString = hc.getResult();
				if (null != resultString && !"".equals(resultString)) {
					// 将返回结果转换为map
					Map<String, String> rspData = SDKUtil
							.convertResultStringToMap(resultString);
					String respCode = rspData.get("respCode");
					if ("00".equals(respCode)) {
						String tn = rspData.get("tn");
						retObj.put("success", true);
						retObj.put("tn", tn);
					}
					System.out.println(respCode);
					System.out.println("tn====" + rspData.get("tn"));

				} else {
					retObj.put("success", false);
					retObj.put("msg", "返回结果为空");
				}

			} else {
				LogUtil.writeLog("返回http状态码[" + status + "]，请检查请求报文或者请求地址是否正确");
				return ajaxJsonErrorMessage("请求操作有误,status:" + status);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ajaxJsonErrorMessage("http请求出现异常");
		}
		System.out.println(retObj.toString());
		return ajaxJson(retObj.toString());
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAid() {
		return aid;
	}

	public void setAid(String aid) {
		this.aid = aid;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public int getUsepoint() {
		return usepoint;
	}

	public void setUsepoint(int usepoint) {
		this.usepoint = usepoint;
	}

	public String getPt() {
		return pt;
	}

	public void setPt(String pt) {
		this.pt = pt;
	}

	public String getCouponid() {
		return couponid;
	}

	public void setCouponid(String couponid) {
		this.couponid = couponid;
	}

}
