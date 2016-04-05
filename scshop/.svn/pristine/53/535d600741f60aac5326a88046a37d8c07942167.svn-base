package com.wudianyi.wb.scshop.action.app.json;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Cart;
import com.wudianyi.wb.scshop.entity.Comment;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.entity.Customer;
import com.wudianyi.wb.scshop.entity.Order;
import com.wudianyi.wb.scshop.entity.OrderItem;
import com.wudianyi.wb.scshop.entity.Product;
import com.wudianyi.wb.scshop.entity.Shop;
import com.wudianyi.wb.scshop.entity.SubProduct;
import com.wudianyi.wb.scshop.entity.WebInfo;
import com.wudianyi.wb.scshop.quart.service.OrderQuartService;
import com.wudianyi.wb.scshop.service.AddressService;
import com.wudianyi.wb.scshop.service.CartService;
import com.wudianyi.wb.scshop.service.CommentService;
import com.wudianyi.wb.scshop.service.CustomerService;
import com.wudianyi.wb.scshop.service.OrderItemService;
import com.wudianyi.wb.scshop.service.OrderService;
import com.wudianyi.wb.scshop.service.ProductService;
import com.wudianyi.wb.scshop.service.ShopService;
import com.wudianyi.wb.scshop.service.SubProductService;
import com.wudianyi.wb.scshop.util.NumberUtil;
import com.wudianyi.wb.scshop.util.StringUtils;

public class OrderAction extends BaseAction {

	private Integer tt;

	private String id;
	private String pics;
	private int point;
	private String content;
	private int pn;
	private String items;
	private int shopid;
	private String commentjson;// {"ITEMID":{point,content,pic},"ITEMID":{itemid,point,content,pic}}
	@Resource
	private OrderService orderService;
//	@Resource(name = "orderQuartService")
//	private OrderQuartService orderQuartService;
	@Resource
	private ProductService productService;
	@Resource
	private SubProductService subProductService;


	@Resource
	private OrderItemService orderItemService;
	@Resource
	private CustomerService customerService;

	@Resource
	private CommentService commentService;
	@Resource
	private AddressService addressService;

	@Resource
	private CartService cartService;

	@Resource
	private ShopService shopService;

	public String list() {
		System.err.println(tt);
		Integer userid = (Integer) getSession(Const.SESSION_CUSTOMER_ID);
		List<Order> orderlist = orderService.getList(new QueryParam(3).add("userid", userid)
				.add("del", 0).add("payStat", tt), Const.FRONT_PAGE_SIZE
				* (pn - 1), Const.FRONT_PAGE_SIZE, "createDate", "desc", false);
		
		JSONObject retObject = new JSONObject();
		JSONArray orderArray = new JSONArray();
		for(Order order:orderlist){
			JSONObject orderObject = new JSONObject();
			orderObject.put("statOverdueTime", order.getStatOverdueTime());
			orderObject.put("createDate", order.getCreateDate());
			orderObject.put("realmoney", order.getRealmoney());
			orderObject.put("pointMoney", order.getPointMoney());
			orderArray.add(orderObject);
		}
		retObject.put("order", orderArray);
		
		return ajaxJson(retObject.toString());
	}
	
	

	public String sure() {
		Integer userid = (Integer) getSession(Const.SESSION_CUSTOMER_ID);
		Order order = orderService.get(id);
		if (order.getUserid() == userid.intValue() && order.getPayStat() == 2) {
			order.setPayStat(3);
			orderService.update(order);
		}
		return ajaxJsonSuccessMessage(null);
	}

	public String cancel() {
		Integer userid = (Integer) getSession(Const.SESSION_CUSTOMER_ID);
		Order order = orderService.get(id);
		if (order.getUserid() == userid.intValue() && order.getPayStat() == 0) {
			order.setDel(1);
			orderService.update(order);
		}
		return ajaxJsonSuccessMessage(null);
	}

	public String comment() {
		if (StringUtils.isEmpty(commentjson)) {
			return ajaxJsonErrorMessage("请对订单做出评价");
		}
		Order order = orderService.get(id);
		if (order == null || order.getPayStat() != 3) {
			return ajaxJsonErrorMessage("订单已经评论过！");
		}
		Integer userid = (Integer) getSession(Const.SESSION_CUSTOMER_ID);
		Customer customer = customerService.get(userid);
		JSONObject jsonObject = JSONObject.fromObject(commentjson);
		List<OrderItem> items = orderItemService.getList(
				new QueryParam(1).add("orderid", id), 0, 0, null, null, false);
		Date now = new Date();
		// 找出订单里面的所有订单项，根据订单项来对商品进行评论，以免用户随便上传一些数据
		for (OrderItem item : items) {

			JSONObject itemjson = new JSONObject();
			Object itemjsonObject = jsonObject.get(item.getId());
			if (itemjsonObject != null) {
				itemjson = (JSONObject) itemjsonObject;
				int point = itemjson.getInt("point");
				String content = itemjson.getString("content");
				String pic = "";
				if (itemjson.get("pic") != null) {
					pic = itemjson.getString("pic");
				}
				Comment comment = new Comment();
				comment.setContent(content);
				comment.setCreateDate(now.getTime());
				comment.setDel(0);
				comment.setOrderid(id);
				comment.setPics(pic);
				comment.setPoint(point);
				comment.setProductid(item.getProductid());
				comment.setResource("weixin");
				comment.setUserid(userid);
				JSONObject userinfo = new JSONObject();
				userinfo.put("name", customer.getName());
				userinfo.put("pic", customer.getPic());
				comment.setUserinfo(userinfo.toString());
				commentService.save(comment);
			}

		}
		order.setPayStat(4);
		// orderService.update(order);
		return ajaxJsonSuccessMessage(null);

	}

	// 返回值 1：至少选择一样商品
	// items {prodctid,model,num}
	public String create() {
		System.out.println(items);
		System.out.println(shopid);
		System.err.println("----");
		if (StringUtils.isEmpty(items)) {
			return ajaxJsonErrorMessage("-1");
		}
		WebInfo webInfo = getWebInfo();
		String orderid = NumberUtil.creatUUID();
		Integer userid = (Integer) getSession(Const.SESSION_CUSTOMER_ID);
		System.out.println(userid);
		String orderSn = NumberUtil.creatSn(userid + "");

		// Cart cart = cartService.get(new QueryParam(1).add("userid", userid),
		// false);
		Customer customer = customerService.get(userid);
		double money = 0.00;
		JSONArray jsonArray = JSONArray.fromObject(items);
		int size = jsonArray.size();
		String shopname = "";
		// 用来保存订单里面的类别的json
		JSONArray itemArrayjson = new JSONArray();
		for (int i = 0; i < size; i++) {
			JSONObject jsonObject = jsonArray.getJSONObject(i);
			Integer productid = jsonObject.getInt("productid");
			Integer num = jsonObject.getInt("num");
			SubProduct subProduct = subProductService.get(productid);

			Product product = productService.get(subProduct.getProductid());

			Shop shop = shopService.get(subProduct.getShopid());
			// 要判断商品是不是属于该商店
			if (subProduct.getShopid() != shopid) {
				continue;
			}
			shopname = shop.getName();

			// 算出产品价格
			double price = subProductService.getUserPriceByProduct(subProduct,
					customer);
			money += price * num;
			OrderItem item = new OrderItem();
			item.setCreatedate(new Date().getTime());

			item.setNum(num);
			item.setOrderid(orderid);
			item.setPrice(price);
			// 他的上级商品的ID
			item.setProductid(product.getId());
			// 准确商品的ID
			item.setSubproductid(productid);
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
			// 单独的json用来保存在订单里面的
			JSONObject itemjson = new JSONObject();
			itemjson.put("productid", subProduct.getId());
			itemjson.put("name", product.getName());
			itemjson.put("pic", product.getCover());
			itemjson.put("num", num);
			itemjson.put("price", price);
			itemArrayjson.add(itemjson);
			// 保存完成
		}

		// 生成订单
		Calendar calendar = Calendar.getInstance();
		Order order = new Order();
		order.setId(orderid);
		order.setDel(0);
		order.setPayStat(0);
		order.setShopname(shopname);
		order.setCreateDate(calendar.getTimeInMillis());
		calendar.add(Calendar.MINUTE, webInfo.getMinuteNoPayDelete());
		// 规定时间内没有支付自动取消订单
		order.setStatOverdueTime(calendar.getTimeInMillis());
		order.setOrderSn(orderSn);
		order.setShopid(shopid);
		order.setUserid(userid);
		order.setMoney(money);
		order.setItemjson(itemArrayjson.toString());
		order.setResource("weixin");
		order.setPaytype(0);
		order.setPoint(0);
		order.setPointMoney(0.00);
		order.setPostage(0.00);
		if (order.getRealmoney() <= 0) {
			order.setRealmoney(order.getMoney());
		}
		if (customer.getDefaultAddressid() != null
				&& !StringUtils.isEmpty(customer.getDefaultAddressInfo())) {
			JSONObject addressjson = JSONObject.fromObject(customer
					.getDefaultAddressInfo());
			order.setAddress(addressjson.getString("address"));
			order.setPhone(addressjson.getString("phone"));
			order.setName(addressjson.getString("name"));
			order.setIdentity(addressjson.getString("identity"));// 2long添加的，添加身份证信息？
			order.setAddressid(customer.getDefaultAddressid());
		}

		// 处理一下order的金额
		order.setRealmoney(Math.round(order.getRealmoney() * 100) * 0.01d);
		order.setMoney(Math.round(order.getMoney() * 100) * 0.01d);
		orderService.save(order);
//		// 发送一条定时项，用户在规定时间内未支付，则删除订单
//		System.err.println("orderQuartService=" + orderQuartService);
//		orderQuartService.deleteOrderWhenExpire(orderid, calendar.getTime());

		JSONObject retjson = new JSONObject();
		retjson.put("success", true);
		retjson.put("orderid", orderid);
		// 删除购物车里面的一些项目
		Cart cart = cartService.get(new QueryParam(2).add("userid", userid)
				.add("shopid", order.getShopid()), false);
		// 返回减少的数量
		int js = cartService.deletefromCart(cart, order);
		System.err.println(js);
		retjson.put("js", js);
		return ajaxJson(retjson.toString());
	}

	public String checkchange() {
		Order order = orderService.get(id);
		JSONObject jsonObject = new JSONObject();
		if (order != null) {
			jsonObject.put("edittime",
					order.getEdittime() == null ? 0 : order.getEdittime());
			jsonObject.put("money", order.getRealmoney());

		}
		return ajaxJson(jsonObject.toString());
	}

	public String getCommentjson() {
		return commentjson;
	}

	public void setCommentjson(String commentjson) {
		this.commentjson = commentjson;
	}

	public Integer getTt() {
		return tt;
	}

	public void setTt(Integer tt) {
		this.tt = tt;
	}

	public int getPn() {
		return pn;
	}

	public void setPn(int pn) {
		this.pn = pn;
	}

	public String getPics() {
		return pics;
	}

	public void setPics(String pics) {
		this.pics = pics;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getItems() {
		return items;
	}

	public void setItems(String items) {
		this.items = items;
	}

	public int getShopid() {
		return shopid;
	}

	public void setShopid(int shopid) {
		this.shopid = shopid;
	}

}
