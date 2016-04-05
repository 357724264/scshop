package com.wudianyi.wb.scshop.action.json;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Node;

import com.unionpay.acp.sdk.LogUtil;
import com.unionpay.acp.sdk.SDKConstants;
import com.unionpay.acp.sdk.SDKUtil;
import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.entity.Jflog;
import com.wudianyi.wb.scshop.entity.Order;
import com.wudianyi.wb.scshop.entity.OrderItem;
import com.wudianyi.wb.scshop.entity.SubProduct;
import com.wudianyi.wb.scshop.entity.UserCoupon;
import com.wudianyi.wb.scshop.service.CacheService;
import com.wudianyi.wb.scshop.service.JflogService;
import com.wudianyi.wb.scshop.service.OrderItemService;
import com.wudianyi.wb.scshop.service.OrderService;
import com.wudianyi.wb.scshop.service.ProductService;
import com.wudianyi.wb.scshop.service.SubProductService;
import com.wudianyi.wb.scshop.service.UserCouponService;
import com.wudianyi.wb.scshop.util.NotifyDecoder;
import com.wudianyi.wb.scshop.util.StringUtils;
import com.wudianyi.wb.scshop.util.WxPayUtil;

public class PaynotifyAction extends BaseAction {

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
	@Resource
	private ProductService productService;

	public String wx() throws Exception {
		System.err.println("immimimi");
		String reqXml = "";
		Map<String, String> reqParam = new HashMap<String, String>();
		String encoding = getRequest().getParameter("utf-8");
		try {
			InputStream inputStream = getRequest().getInputStream();
			BufferedReader reader = new BufferedReader(new InputStreamReader(
					inputStream));
			// 获取请求参数中所有的信息
			String tempStr = "";
			while ((tempStr = reader.readLine()) != null) {
				reqXml += tempStr;
			}
			reader.close();
			inputStream.close();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		Map valideData = WxPayUtil.doXMLParse(reqXml);
		System.err.println("out_trade_no=" + valideData.get("out_trade_no"));
		String orderid = (String) valideData.get("out_trade_no");
		Order order = orderService.get(
				new QueryParam(1).add("orderSn", orderid), false);

		System.err.println("order.getPayStat()=-===" + order.getPayStat());
		if (order.getPayStat() < 1) {
			order.setPayStat(1);
			order.setPaytype(0);
			order.setPayret(valideData.toString());
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
					new QueryParam(1).add("orderid", order.getId()), 0, 0,
					null, null, false);
			for (OrderItem item : items) {
				int subproductid = item.getSubproductid();
				SubProduct subProduct = subProductService.get(subproductid);
				subProduct.setInventory(subProduct.getInventory()
						- item.getNum());
				// if (order.getPromotions() != null
				// && order.getPromotions().equals(1)) {// 促销活动
				// subProduct.setSeckillNum(subProduct.getSeckillNum() - 1);
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
				UserCoupon coupon = userCouponService.get(order.getCouponid());
				if (coupon != null && coupon.getStat() != 1) {
					coupon.setStat(1);
					coupon.setUseDate(new Date().getTime());
					userCouponService.update(coupon);
				}
			}

			// 赠送优惠券
			userCouponService.saveCouponToUser(items, order.getShopid(),
					order.getUserid(), order.getId(), order.getShopname());

			getResponse()
					.getWriter()
					.print("<xml><return_code><![CDATA[SUCCESS]]></return_code><return_msg><![CDATA[OK]]></return_msg></xml>");
		}
		return null;
	}

	public String unionpay() throws Exception {
		System.err.println("ininininin");
		getRequest().setCharacterEncoding("ISO-8859-1");
		String encoding = getRequest()
				.getParameter(SDKConstants.param_encoding);
		// 获取银联通知服务器发送的后台通知参数
		Map<String, String> reqParam = getAllRequestParam(getRequest());

		LogUtil.printRequestLog(reqParam);

		Map<String, String> valideData = null;
		if (null != reqParam && !reqParam.isEmpty()) {
			Iterator<Entry<String, String>> it = reqParam.entrySet().iterator();
			valideData = new HashMap<String, String>(reqParam.size());
			while (it.hasNext()) {
				Entry<String, String> e = it.next();
				String key = (String) e.getKey();
				String value = (String) e.getValue();
				value = new String(value.getBytes("ISO-8859-1"), encoding);
				valideData.put(key, value);
			}
		}

		// // 重要！验证签名前不要修改reqParam中的键值对的内容，否则会验签不过
		// if (!SDKUtil.validate(valideData, encoding)) {
		// LogUtil.writeLog("验证签名结果[失败].");
		// // 验签失败，需解决验签问题
		//
		// } else {
		LogUtil.writeLog("验证签名结果[成功].");
		// 【注：为了安全验签成功才应该写商户的成功处理逻辑】交易成功，更新商户订单状态

		String orderId = valideData.get("orderId"); // 获取后台通知的数据，其他字段也可用类似方式获取
		String respCode = valideData.get("respCode"); // 获取应答码，收到后台通知了respCode的值一般是00，可以不需要根据这个应答码判断。

		// }
		LogUtil.writeLog("BackRcvResponse接收后台通知结束");
		// 返回给银联服务器http 200 状态码
		Order order = orderService.get(
				new QueryParam(1).add("orderSn", orderId), false);
		if (order.getPayStat() == 0) {
			order.setPayStat(1);
			order.setPaytype(2);
			order.setPayret("");
			order.setPayDate(new Date().getTime());
			orderService.update(order);
			if (order.getPoint() > 0) {
				// 记录积分
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
					new QueryParam(1).add("orderid", order.getId()), 0, 0,
					null, null, false);
			for (OrderItem item : items) {
				int subproductid = item.getSubproductid();
				SubProduct subProduct = subProductService.get(subproductid);
				subProduct.setInventory(subProduct.getInventory()
						- item.getNum());
				// if (order.getPromotions() != null
				// && order.getPromotions().equals(1)) {// 促销活动
				// subProduct.setSeckillNum(subProduct.getSeckillNum() - 1);
				// productService.updateProductPromotionsInfo(
				// subProduct.getProductid(), subProduct);
				// }
				if (subProduct.getInventory() < 0) {
					subProduct.setInventory(0);
				}
				subProductService.update(subProduct);

			}
			// 赠送优惠券
			userCouponService.saveCouponToUser(items, order.getShopid(),
					order.getUserid(), order.getId(), order.getShopname());
			getResponse().getWriter().print("ok");
		}
		return null;
	}

	/**
	 * 获取请求参数中所有的信息
	 * 
	 * @param request
	 * @return
	 */
	public static Map<String, String> getAllRequestParam(
			final HttpServletRequest request) {
		Map<String, String> res = new HashMap<String, String>();
		Enumeration<?> temp = request.getParameterNames();
		if (null != temp) {
			while (temp.hasMoreElements()) {
				String en = (String) temp.nextElement();
				String value = request.getParameter(en);
				res.put(en, value);
				// 在报文上送时，如果字段的值为空，则不上送<下面的处理为在获取所有参数数据时，判断若值为空，则删除这个字段>
				// System.out.println("ServletUtil类247行  temp数据的键=="+en+"     值==="+value);
				if (null == res.get(en) || "".equals(res.get(en))) {
					res.remove(en);
				}
			}
		}
		return res;
	}
}
