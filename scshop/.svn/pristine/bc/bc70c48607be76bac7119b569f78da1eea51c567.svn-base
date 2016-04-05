package com.wudianyi.wb.scshop.action.json;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.entity.Customer;
import com.wudianyi.wb.scshop.entity.Order;
import com.wudianyi.wb.scshop.entity.OrderItem;
import com.wudianyi.wb.scshop.entity.Product;
import com.wudianyi.wb.scshop.entity.Shop;
import com.wudianyi.wb.scshop.entity.SubProduct;
import com.wudianyi.wb.scshop.entity.WebInfo;
import com.wudianyi.wb.scshop.service.CustomerService;
import com.wudianyi.wb.scshop.service.OrderItemService;
import com.wudianyi.wb.scshop.service.OrderService;
import com.wudianyi.wb.scshop.service.ProductService;
import com.wudianyi.wb.scshop.service.ShopService;
import com.wudianyi.wb.scshop.service.SubProductService;
import com.wudianyi.wb.scshop.service.WebInfoService;
import com.wudianyi.wb.scshop.util.NumberUtil;
import com.wudianyi.wb.scshop.util.StringUtils;

public class SeckillAction extends BaseAction {

	@Resource
	private SubProductService subProductService;
	@Resource
	private ProductService productService;
	@Resource
	private ShopService shopService;
	@Resource
	private OrderItemService orderItemService;
	@Resource
	private CustomerService customerService;
	@Resource
	private OrderService orderService;
	@Resource
	private WebInfoService webInfoService;
	private int id;
	private int state;// 0现场 1预告
	private int pt;// 1秒杀2限时
	private int pn;
	private int num;

	public static void main(String[] args) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = sdf.parse("2016-1-25 00:00:00");
		System.err.println(date.getTime());
	}

	public String order() {
		System.err.println("=============jinrule");
		SubProduct subProduct = subProductService.get(id);
		WebInfo webInfo = webInfoService.get(Const.WEBINFO_ID);
		Product product = productService.get(subProduct.getProductid());
		boolean isactive = false;
		int realnum = 1;

		Integer userid = (Integer) getSession(Const.SESSION_CUSTOMER_ID);
		Customer customer = customerService.get(userid);
		// 看是否已经有未支付的订单
		List<Order> checkorders = orderService.getList(
				new QueryParam(5).add("userid", userid).add("del", 0)
						.add("promotions", 1).add("payStat", 0)
						.add("subpromotionproductid", id), 0, 0, null, null,
				false);
		if (checkorders != null && !checkorders.isEmpty()) {
			if (product.getProductType().equals(1)) {
				Order checkorder = checkorders.get(0);
				return ajaxJsonSuccessMessage(checkorder.getId());

			} else if (product.getProductType().equals(2)) {
				for (Order order : checkorders) {
					orderService.delete(order);
				}
			}
		}

		// 看有没有在促销活动的
		if (product.getProductType() != null
				&& !product.getProductType().equals(0)) {
			Date now = new Date();
			if (product.getProductType().equals(1)) {
				if (product.getBeginTime() <= now.getTime()) {
					isactive = true;
				}
			} else if (product.getProductType().equals(2)) {
				if (product.getBeginTime() <= now.getTime()
						&& product.getEndTime() > now.getTime()) {
					isactive = true;
					realnum = num;
				}
			}
		}
		System.err.println("===========" + realnum);
		if (isactive && subProduct.getSeckillNum() != null
				&& subProduct.getSeckillNum() > 0) {// 产品正在秒杀

		
			String orderid = NumberUtil.creatUUID();
			String orderSn = NumberUtil.creatSn(userid + "");
			OrderItem item = new OrderItem();
			item.setCreatedate(new Date().getTime());

			item.setNum(realnum);
			item.setOrderid(orderid);
			item.setPrice(subProduct.getSeckillPrice() == null ? 0 : subProduct
					.getSeckillPrice());
			// 他的上级商品的ID
			item.setProductid(product.getId());
			// 准确商品的ID
			item.setSubproductid(id);
			// 准确商品的sku
			item.setSku(subProduct.getSku());
			String model = "";
			// 处理产品类型，图片
			JSONObject productinfo = new JSONObject();
			if (subProduct.getSubProduct() != null) {
				SubProduct upProduct = subProductService.get(subProduct
						.getSubProduct().getId());
				productinfo.put("pic", upProduct.getLogo());
				model = "[" + upProduct.getName() + "]";
			} else {
				productinfo.put("pic", product.getCover());
			}
			model = model
					+ (StringUtils.isEmpty(subProduct.getName()) ? "" : ("["
							+ subProduct.getName() + "]"));
			item.setModel(StringUtils.isEmpty(model) ? null : model);

			productinfo.put("name", product.getName());
			item.setProductinfo(productinfo.toString());
			item.setShopid(product.getShopid());
			// 保存分类以及品牌信息
			item.setFlevel(product.getFlevel());
			item.setSlevel(product.getSlevel());
			item.setShopFlevel(product.getShopFlevel());
			item.setShopSlevel(product.getShopSlevel());
			item.setBrandid(product.getBrandid());
			// 保存分类以及品牌信息完毕
			orderItemService.save(item);
			// 用来保存订单里面的类别的json
			JSONArray itemArrayjson = new JSONArray();
			// 单独的json用来保存在订单里面的
			JSONObject itemjson = new JSONObject();
			itemjson.put("productid", subProduct.getId());
			itemjson.put("name", product.getName());
			itemjson.put("pic", product.getCover());
			itemjson.put("num", realnum);
			itemjson.put("price", subProduct.getSeckillPrice());
			itemArrayjson.add(itemjson);

			Shop shop = shopService.get(product.getShopid());
			Calendar calendar = Calendar.getInstance();
			Order order = new Order();
			order.setId(orderid);
			order.setDel(0);
			order.setPayStat(0);
			order.setShopname(shop.getName());
			order.setCreateDate(calendar.getTimeInMillis());
			calendar.add(Calendar.MINUTE, webInfo.getSeckillminuteNoPayDelete());
			// 规定时间内没有支付自动取消订单
			order.setStatOverdueTime(calendar.getTimeInMillis());
			order.setOrderSn(orderSn);
			order.setShopid(shop.getId());
			order.setUserid(userid);
			order.setMoney(subProduct.getSeckillPrice() == null ? 0
					: (subProduct.getSeckillPrice() * realnum));
			order.setItemjson(itemArrayjson.toString());
			order.setResource("weixin");
			order.setPaytype(0);
			order.setPoint(0);
			order.setPointMoney(0.00);
			order.setPostage(product.getPostage() == null ? 0.00 : product
					.getPostage());
			order.setPronum(realnum);
			order.setPromotions(1);
			order.setPromotionproductid(product.getId());
			order.setSubpromotionproductid(subProduct.getId());
			if (order.getRealmoney() <= 0) {
				order.setRealmoney(order.getMoney() + order.getPostage());
			}
			if (customer.getDefaultAddressid() != null
					&& !StringUtils.isEmpty(customer.getDefaultAddressInfo())) {
				JSONObject addressjson = JSONObject.fromObject(customer
						.getDefaultAddressInfo());
				order.setAddress(addressjson.getString("address"));
				order.setPhone(addressjson.getString("phone"));
				order.setName(addressjson.getString("name"));
				order.setAddressid(customer.getDefaultAddressid());
			}

			orderService.save(order);
			
			// 更新数量
			subProduct.setSeckillNum(subProduct.getSeckillNum() - realnum);
			subProductService.update(subProduct);
			productService.updateProductPromotionsInfo(
					subProduct.getProductid(), subProduct,realnum);
			// 更新描述数量完毕

			
			return ajaxJsonSuccessMessage(order.getId());
		} else {// 产品没有秒杀或者已经卖完了
			return ajaxJsonErrorMessage(null);
		}

	}

	public String list() {
		String orderby = "beginTime";
		String sx = "asc";
		QueryParam param = new QueryParam().add("productType", pt + 1)
				.add("del", 0).add("stat", 0);
		long date = new Date().getTime();
		// 限时购
		if (pt == 1 && state == 0) {
			// 现场
			sx = "desc";
			param.add("<=beginTime", date).add(">endTime", date);
			list = productService.getStaticsLikeList(null, null, param, null,
					null, null, Const.FRONT_PAGE_SIZE * (pn - 1),
					Const.FRONT_PAGE_SIZE, orderby, sx);

			// 预告
		} else if (pt == 1 && state == 1) {
			param.add(">beginTime", date);
			list = productService.getStaticsLikeList(null, null, param, "null",
					null, null, Const.FRONT_PAGE_SIZE * (pn - 1),
					Const.FRONT_PAGE_SIZE, orderby, sx);
			// 秒杀
		} else {
			list = productService.getStaticsLikeList(null, null, param, null,
					null, null, Const.FRONT_PAGE_SIZE * (pn - 1),
					Const.FRONT_PAGE_SIZE, orderby, sx);
		}

		return LIST;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public int getPt() {
		return pt;
	}

	public void setPt(int pt) {
		this.pt = pt;
	}

	public int getPn() {
		return pn;
	}

	public void setPn(int pn) {
		this.pn = pn;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

}
