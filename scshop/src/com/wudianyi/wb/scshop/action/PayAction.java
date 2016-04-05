package com.wudianyi.wb.scshop.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.unionpay.acp.sdk.HttpClient;
import com.unionpay.acp.sdk.SDKConfig;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Address;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.entity.Customer;
import com.wudianyi.wb.scshop.entity.Order;
import com.wudianyi.wb.scshop.entity.OrderItem;
import com.wudianyi.wb.scshop.entity.UserCoupon;
import com.wudianyi.wb.scshop.entity.WebInfo;
import com.wudianyi.wb.scshop.service.AddressService;
import com.wudianyi.wb.scshop.service.CustomerService;
import com.wudianyi.wb.scshop.service.OrderItemService;
import com.wudianyi.wb.scshop.service.OrderService;
import com.wudianyi.wb.scshop.service.UserCouponService;
import com.wudianyi.wb.scshop.service.WebInfoService;
import com.wudianyi.wb.scshop.util.StringUtils;
import com.wudianyi.wb.scshop.util.UnionpayUtil;

public class PayAction extends BaseAction {
	private String id;

	private String aid;
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
	private UserCouponService userCouponService;

	public String sure() {
		Order order = orderService.get(id);
		boolean update = false;
		Integer userid = (Integer) getSession(Const.SESSION_CUSTOMER_ID);

		Object weixinidObj = getSession(Const.SESSION_WEIXINID);
		if (weixinidObj != null) {
			setAttribute("weixinid", weixinidObj.toString());
		}

		Customer user = customerService.get(userid);

		if (!StringUtils.isEmpty(order.getCouponid()) || order.getPoint() > 0) {
			if (!StringUtils.isEmpty(order.getCouponid())) {
				UserCoupon userCoupon = userCouponService.get(order
						.getCouponid());
				if (userCoupon != null && userCoupon.getStat() == -1) {
					userCoupon.setStat(0);
					userCouponService.update(userCoupon);
				}
			}
			if (order.getPoint() > 0) {
				int point = order.getPoint();
				user.setPoint(user.getPoint() + point);
				customerService.update(user);
				order.setPoint(0);
				order.setPointMoney(0.00);
			}
			List<OrderItem> items = orderItemService.getList(
					new QueryParam(1).add("orderid", order.getId()), 0, 0,
					null, null, false);
			double money = 0.00;
			for (OrderItem item : items) {
				money = money + item.getPrice() * item.getNum();
			}
			money = Math.round(money * 100) * 0.01d;
			order.setMoney(money);
			order.setRealmoney(money + order.getPostage());
			update = true;

		}
		if (!StringUtils.isEmpty(aid)) {
			Address address = addressService.get(aid);
			order.setAddressid(aid);
			order.setAddress(address.getFullAddress());
			order.setName(address.getName());
			order.setPhone(address.getPhone());
			order.setIdentity(address.getIdentity());
			update = true;

		}
		if (update) {
			orderService.update(order);
		}

		setAttribute("order", order);
		setAttribute("user", user);
		list = orderItemService.getList(new QueryParam(1).add("orderid", id),
				0, 0, null, null, false);
		WebInfo info = webInfoService.get(Const.WEBINFO_ID);
		setAttribute("info", info);
		System.err.println("order.getPromotions()===" + order.getPromotions());
		if (order.getPromotions() == null || !order.getPromotions().equals(1)) {
			List<UserCoupon> coupons = userCouponService
					.getUserAvailableCoupon(list, order.getShopid(), userid,
							order.getRealmoney());
			System.err.println(coupons.size());
			setAttribute("coupons", coupons);
		}
		return "sure";
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
		data.put("frontUrl", "http://" + Const.BASE_URL + "/order.action?id="
				+ order.getId());
		// 后台通知地址
		// data.put("backUrl",
		// "http://222.222.222.222:8080/ACPTest/acp_back_url.do");
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
		String requestFrontUrl = SDKConfig.getConfig().getFrontRequestUrl();

		/**
		 * 创建表单
		 */
		String html = UnionpayUtil.createHtml(requestFrontUrl, submitFromData);
		System.err.println(html);
		getResponse().setCharacterEncoding("utf-8");
		getResponse().setContentType("text/html; charset=utf-8");
		getResponse().getWriter().println(html);
		return null;
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
	
	
	public static void main(String[] args) {
		System.out.println(Math.round(100*0.01)*0.01d);
	}
}
