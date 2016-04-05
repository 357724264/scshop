package com.wudianyi.wb.scshop.action.json;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.alipay.util.AlipayCore;
import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Jflog;
import com.wudianyi.wb.scshop.entity.Order;
import com.wudianyi.wb.scshop.entity.OrderItem;
import com.wudianyi.wb.scshop.entity.SubProduct;
import com.wudianyi.wb.scshop.entity.UserCoupon;
import com.wudianyi.wb.scshop.service.JflogService;
import com.wudianyi.wb.scshop.service.OrderItemService;
import com.wudianyi.wb.scshop.service.OrderService;
import com.wudianyi.wb.scshop.service.SubProductService;
import com.wudianyi.wb.scshop.service.UserCouponService;
import com.wudianyi.wb.scshop.util.AlipayConfig;
import com.wudianyi.wb.scshop.util.AlipayNotify;
import com.wudianyi.wb.scshop.util.RSA;
import com.wudianyi.wb.scshop.util.StringUtils;

public class AlinotifyAction extends BaseAction {
	/**
	 * 支付宝消息验证地址
	 */
	private static final String HTTPS_VERIFY_URL = "https://mapi.alipay.com/gateway.do?service=notify_verify&";

	@Resource
	private OrderService orderService;
	@Resource
	private JflogService jflogService;
	@Resource
	private OrderItemService orderItemService;
	@Resource
	private SubProductService subProductService;
	@Resource
	private UserCouponService userCouponService;

	@Override
	public String execute() throws Exception {
		// 获取支付宝POST过来反馈信息
		Map<String, String> params = new HashMap<String, String>();
		Map requestParams = getRequest().getParameterMap();
		for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i]
						: valueStr + values[i] + ",";
			}
			// 乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
			// valueStr = new String(valueStr.getBytes("ISO-8859-1"), "gbk");
			params.put(name, valueStr);
		}

		// 获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以下仅供参考)//
		// 商户订单号
		String out_trade_no = new String(getRequest().getParameter(
				"out_trade_no").getBytes("ISO-8859-1"), "UTF-8");

		// 支付宝交易号
		String trade_no = new String(getRequest().getParameter("trade_no")
				.getBytes("ISO-8859-1"), "UTF-8");

		// 交易状态
		String trade_status = new String(getRequest().getParameter(
				"trade_status").getBytes("ISO-8859-1"), "UTF-8");

		// 获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以上仅供参考)//

		if (AlipayNotify.verify(params)) {// 验证成功
			System.err.println("验证成功!");
			// ////////////////////////////////////////////////////////////////////////////////////////
			// 请在这里加上商户的业务逻辑程序代码

			// ——请根据您的业务逻辑来编写程序（以下代码仅作参考）——

			if (trade_status.equals("TRADE_FINISHED")) {
				System.err.println("TRADE_FINISHED");
				// 判断该笔订单是否在商户网站中已经做过处理
				// 如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
				// 如果有做过处理，不执行商户的业务程序

				// 注意：
				// 退款日期超过可退款期限后（如三个月可退款），支付宝系统发送该交易状态通知
				// 请务必判断请求时的total_fee、seller_id与通知时获取的total_fee、seller_id为一致的
			} else if (trade_status.equals("TRADE_SUCCESS")) {
				Order order = orderService.get(
						new QueryParam(1).add("orderSn", out_trade_no), false);

				System.err.println("order.getPayStat()=-==="
						+ order.getPayStat());
				if (order.getPayStat() < 1) {
					order.setPayStat(1);
					order.setPaytype(0);
					order.setPayret(trade_no);
					order.setPayDate(new Date().getTime());
					orderService.update(order);
					// 记录积分
					if (order.getPoint() > 0) {
						Jflog jflog = new Jflog();
						jflog.setThein(0);
						jflog.setLinkid(order.getId());
						jflog.setPoint(order.getPoint());
						jflog.setPtype(-1);
						jflog.setUserid(order.getUserid());
						jflogService.save(jflog);
					}
					// 库存管理
					List<OrderItem> items = orderItemService.getList(
							new QueryParam(1).add("orderid", order.getId()), 0,
							0, null, null, false);
					for (OrderItem item : items) {
						int subproductid = item.getSubproductid();
						SubProduct subProduct = subProductService
								.get(subproductid);
						subProduct.setInventory(subProduct.getInventory()
								- item.getNum());
						// if (order.getPromotions() != null
						// && order.getPromotions().equals(1)) {// 促销活动
						// subProduct.setSeckillNum(subProduct.getSeckillNum() -
						// 1);
						// productService.updateProductPromotionsInfo(
						// subProduct.getProductid(), subProduct);
						// }
						if (subProduct.getInventory() < 0) {
							subProduct.setInventory(0);
						}
						subProductService.update(subProduct);
					}

					// 成功后优惠券状态变成已使用
					if (!StringUtils.isEmpty(order.getCouponid())) {
						UserCoupon coupon = userCouponService.get(order
								.getCouponid());
						if (coupon != null && coupon.getStat() != 1) {
							coupon.setStat(1);
							coupon.setUseDate(new Date().getTime());
							userCouponService.update(coupon);
						}
					}

					// 赠送优惠券
					userCouponService.saveCouponToUser(items,
							order.getShopid(), order.getUserid(),
							order.getId(), order.getShopname());
				}
			}
			// ——请根据您的业务逻辑来编写程序（以上代码仅作参考）——

			getResponse().getWriter().println("success"); // 请不要修改或删除

			// ////////////////////////////////////////////////////////////////////////////////////////
		} else {// 验证失败
			getResponse().getWriter().println("fail");
		}
		return null;
	}

	/**
	 * 验证消息是否是支付宝发出的合法消息
	 * 
	 * @param params
	 *            通知返回来的参数数组
	 * @return 验证结果
	 */
	public static boolean verify(Map<String, String> params) {

		// 判断responsetTxt是否为true，isSign是否为true
		// responsetTxt的结果不是true，与服务器设置问题、合作身份者ID、notify_id一分钟失效有关
		// isSign不是true，与安全校验码、请求时的参数格式（如：带自定义参数等）、编码格式有关
		String responseTxt = "false";
		if (params.get("notify_id") != null) {
			String notify_id = params.get("notify_id");
			responseTxt = verifyResponse(notify_id);
		}
		String sign = "";
		if (params.get("sign") != null) {
			sign = params.get("sign");
		}
		boolean isSign = getSignVeryfy(params, sign);

		// 写日志记录（若要调试，请取消下面两行注释）
		// String sWord = "responseTxt=" + responseTxt + "\n isSign=" + isSign +
		// "\n 返回回来的参数：" + AlipayCore.createLinkString(params);
		// AlipayCore.logResult(sWord);

		if (isSign && responseTxt.equals("true")) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 根据反馈回来的信息，生成签名结果
	 * 
	 * @param Params
	 *            通知返回来的参数数组
	 * @param sign
	 *            比对的签名结果
	 * @return 生成的签名结果
	 */
	private static boolean getSignVeryfy(Map<String, String> Params, String sign) {
		// 过滤空值、sign与sign_type参数
		Map<String, String> sParaNew = AlipayCore.paraFilter(Params);
		// 获取待签名字符串
		String preSignStr = AlipayCore.createLinkString(sParaNew);
		// 获得签名验证结果
		boolean isSign = false;
		if (AlipayConfig.sign_type.equals("RSA")) {
			isSign = RSA.verify(preSignStr, sign, AlipayConfig.ali_public_key,
					AlipayConfig.input_charset);
		}
		return isSign;
	}

	/**
	 * 获取远程服务器ATN结果,验证返回URL
	 * 
	 * @param notify_id
	 *            通知校验ID
	 * @return 服务器ATN结果 验证结果集： invalid命令参数不对 出现这个错误，请检测返回处理中partner和key是否为空 true
	 *         返回正确信息 false 请检查防火墙或者是服务器阻止端口问题以及验证时间是否超过一分钟
	 */
	private static String verifyResponse(String notify_id) {
		// 获取远程服务器ATN结果，验证是否是支付宝服务器发来的请求

		String partner = AlipayConfig.partner;
		String veryfy_url = HTTPS_VERIFY_URL + "partner=" + partner
				+ "&notify_id=" + notify_id;

		return checkUrl(veryfy_url);
	}

	/**
	 * 获取远程服务器ATN结果
	 * 
	 * @param urlvalue
	 *            指定URL路径地址
	 * @return 服务器ATN结果 验证结果集： invalid命令参数不对 出现这个错误，请检测返回处理中partner和key是否为空 true
	 *         返回正确信息 false 请检查防火墙或者是服务器阻止端口问题以及验证时间是否超过一分钟
	 */
	private static String checkUrl(String urlvalue) {
		String inputLine = "";

		try {
			URL url = new URL(urlvalue);
			HttpURLConnection urlConnection = (HttpURLConnection) url
					.openConnection();
			BufferedReader in = new BufferedReader(new InputStreamReader(
					urlConnection.getInputStream()));
			inputLine = in.readLine().toString();
		} catch (Exception e) {
			e.printStackTrace();
			inputLine = "";
		}

		return inputLine;
	}

}
