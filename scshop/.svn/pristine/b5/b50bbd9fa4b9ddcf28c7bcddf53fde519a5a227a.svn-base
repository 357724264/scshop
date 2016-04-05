package com.wudianyi.wb.scshop.action.json;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import com.unionpay.acp.sdk.SDKConfig;
import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.common.WxPayReqData;
import com.wudianyi.wb.scshop.entity.Address;
import com.wudianyi.wb.scshop.entity.Cart;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.entity.Customer;
import com.wudianyi.wb.scshop.entity.Jflog;
import com.wudianyi.wb.scshop.entity.Order;
import com.wudianyi.wb.scshop.entity.OrderItem;
import com.wudianyi.wb.scshop.entity.Product;
import com.wudianyi.wb.scshop.entity.SubProduct;
import com.wudianyi.wb.scshop.entity.UserCoupon;
import com.wudianyi.wb.scshop.entity.WebInfo;
import com.wudianyi.wb.scshop.service.AddressService;
import com.wudianyi.wb.scshop.service.CacheService;
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

	public static void main(String[] args) {
		System.err.println(new Date(1453185294467l));
	}

	static SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");

	private String id;
	private String aid;
	private String message;
	private int usepoint;
	private String pt;
	private String couponid;
	@Resource
	private OrderService orderService;
	@Resource
	private AddressService addressService;
	@Resource
	private WebInfoService webInfoService;
	@Resource
	private CustomerService customerService;
	@Resource
	private SubProductService subProductService;
	@Resource
	private JflogService jflogService;
	@Resource
	private CartService cartService;
	@Resource
	private UserCouponService userCouponService;
	@Resource
	private ProductService productService;

	public String execute() throws Exception {
		String agent = getRequest().getHeader("user-agent");
		String resource = "weixin";
		if (agent.toLowerCase().indexOf("apicloud") > -1) {
			resource = "app";
		}
		if (StringUtils.isEmpty(aid)) {
			return ajaxJsonErrorMessage("请选择一个地址");
		}
		System.err.println("resource-===" + resource);
		Object weixinidObj = getSession(Const.SESSION_WEIXINID);
		if (resource.equals("weixin") && weixinidObj == null && pt.equals("wx")) {
			return ajaxJsonErrorMessage("缺少weixinid");
		}
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
						- (int) (order.getMoney() * webInfo.getPointperyuan()));
				point = (int) (order.getMoney() * webInfo.getPointperyuan());

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
		order.setResource(resource);
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

				// 微信预订单
				String preid = WxPayUtil.unifiedorder(new WxPayReqData(webInfo
						.getAppid(), webInfo.getWxpayno(), "shop", "attach",
						order.getOrderSn(), (int) (order.getRealmoney() * 100),
						"112.74.23.48", sdf.format(order.getCreateDate()), sdf
								.format(calendar.getTime()), "http://"
								+ Const.BASEURL + "/json/paynotify!wx.action",
						weixinidObj == null ? null : weixinidObj.toString(),
						webInfo.getWxpaySecret(),
						resource.equals("app") ? "APP" : "JSAPI"));// JSAPI
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("appId", webInfo.getAppid());
				map.put("nonceStr", "5K8264ILTKCH16CQ2502SI8ZNMTM67VS");
				map.put("package", "prepay_id=" + preid);
				map.put("signType", "MD5");
				map.put("timeStamp", "1");
				String paySign = WxSignature.getSign(map,
						webInfo.getWxpaySecret());
				retjson.put("ok", 0);
				retjson.put("success", true);
				retjson.put("preid", preid);
				retjson.put("paySign", paySign);
				retjson.put("oid", order.getId());
				retjson.put("sn", order.getOrderSn());
			} else if (pt.equals("alipay")) {
				retjson.put("ok", 0);
				retjson.put("success", true);
				retjson.put("sn", order.getOrderSn());
				retjson.put("money", order.getRealmoney());
			} else {
				retjson.put("ok", 0);
				retjson.put("success", true);
				retjson.put("url", "pay!unionpay.action?id=" + order.getId());
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
