package com.wudianyi.wb.scshop.action.app;

import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Category;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.entity.Product;
import com.wudianyi.wb.scshop.entity.Shop;
import com.wudianyi.wb.scshop.service.CategoryService;
import com.wudianyi.wb.scshop.service.ProductService;
import com.wudianyi.wb.scshop.service.ShopService;
import com.wudianyi.wb.scshop.util.StringUtils;

public class ShopAction extends BaseAction {
	private int id;// 店铺id
	@Resource
	private ShopService shopService;
	@Resource
	private ProductService productService;
	@Resource
	private CategoryService categoryService;
	
	private String orderField;
	private String orderType;
	private Integer fl;
	private Integer sl;
	private String tt;

	public String category() {

		List<Category> list = categoryService.getList(
				new QueryParam(4).add("shopid", id).add("categoryType", 1)
						.add("del", 0).add("nodeid", 0), 0, 0, "displayOrder",
				"desc", false);
		JSONObject retJson = new JSONObject();
		JSONArray categorylistJson = new JSONArray();

		for (Category category : list) {
			JSONObject categoryJson = new JSONObject();
			categoryJson.put("name", category.getName());
			categoryJson.put("id", category.getId());
			if (category.getDownList() != null
					&& !category.getDownList().isEmpty()) {
				categoryJson.put("hasdown", 1);
				JSONArray downlistJson = new JSONArray();
				for (Category down : category.getDownList()) {
					JSONObject downJson = new JSONObject();
					downJson.put("name", down.getName());
					downJson.put("id", down.getId());
					downlistJson.add(downJson);
				}
				categoryJson.put("downList", downlistJson);
			} else {
				categoryJson.put("hasdown", 0);
			}
			categorylistJson.add(categoryJson);
		}

		retJson.put("list", categorylistJson);
		retJson.put("shopid", id);
		return ajaxJson(retJson.toString());
	}

	@Override
	public String execute() throws Exception {

		int pcount = productService.getTotalCount(
				new QueryParam(3).add("shopid", id).add("del", 0)
						.add("stat", 0), false);

		Calendar calendar = Calendar.getInstance();
		calendar.add(Calendar.DATE, -7);

		int newcount = productService.getLikestatics(null, null,
				new QueryParam(3).add("shopid", id).add("del", 0)
						.add("stat", 0), "modifydate",
				calendar.getTimeInMillis(), null);

		int promotionalcount = productService.getPromotionalCount(id);
		calendar.add(Calendar.DATE, 7);
		List<Product> newProducts = productService.getList(new QueryParam(3)
				.add("shopid", id).add("del", 0).add("stat", 0), 0, 6,
				"modifydate", "desc", false);

		List<Product> hots = productService.getList(
				new QueryParam(4).add("shopid", id).add("del", 0)
						.add("shopHotSale", 1).add("stat", 0), 0, 6,
				"modifydate", "desc", false);
		List<Category> categorylist = categoryService.getList(
				new QueryParam(4).add("shopid", id).add("categoryType", 1)
						.add("del", 0).add("nodeid", 0), 0, 0, "displayOrder",
				"desc", false);
		Shop shop = shopService.get(id);
		// 返回的json
		JSONObject retJson = new JSONObject();
		retJson.put("newcount", newcount);
		retJson.put("pcount", pcount);
		retJson.put("promotionalcount", promotionalcount);
		// 商店菜单
		JSONArray categorylistJson = new JSONArray();
		for (Category category : categorylist) {
			JSONObject categoryJson = new JSONObject();
			categoryJson.put("name", category.getName());
			categoryJson.put("id", category.getId());
			if (category.getDownList() != null
					&& !category.getDownList().isEmpty()) {
				categoryJson.put("hasdown", 1);
				JSONArray downlistJson = new JSONArray();
				for (Category down : category.getDownList()) {
					JSONObject downJson = new JSONObject();
					downJson.put("name", down.getName());
					downJson.put("id", down.getId());
					downlistJson.add(downJson);
				}
				categoryJson.put("downList", downlistJson);
			} else {
				categoryJson.put("hasdown", 0);
			}
			categorylistJson.add(categoryJson);
		}
		retJson.put("categorylist", categorylistJson);
		// 商店内新品
		JSONArray newProductsJson = new JSONArray();
		for (Product product : newProducts) {
			JSONObject newProductJson = new JSONObject();
			newProductJson.put("cover", product.getCover());
			newProductJson.put("countryIcon", product.getCountryIcon());
			newProductJson.put("country", product.getCountry());
			newProductJson.put("id", product.getId());
			newProductJson.put("name", product.getName());
			newProductJson.put("bottomPrice", product.getBottomPrice());
			newProductJson.put("indicativePrice", product.getIndicativePrice());
			newProductsJson.add(newProductJson);
		}
		retJson.put("newProducts", newProductsJson);
		// 商店内热卖商品
		JSONArray hotsJson = new JSONArray();
		for (Product product : hots) {
			JSONObject hotProductJson = new JSONObject();
			hotProductJson.put("cover", product.getCover());
			hotProductJson.put("countryIcon", product.getCountryIcon());
			hotProductJson.put("country", product.getCountry());
			hotProductJson.put("id", product.getId());
			hotProductJson.put("name", product.getName());
			hotProductJson.put("bottomPrice", product.getBottomPrice());
			hotProductJson.put("indicativePrice", product.getIndicativePrice());
			hotsJson.add(hotProductJson);
		}
		retJson.put("hots", hotsJson);
		// 商店信息
		retJson.put("shoplogo", shop.getLogo());
		retJson.put("shopname", shop.getName());
		retJson.put("shopbg", shop.getBground());
		retJson.put("shopid", id);

		// TODO Auto-generated method stub
		return ajaxJson(retJson.toString());
	}
	
	public String product() {
		// 如果查询关键字为空，则不设置查询字段，否则默认为name
		String fieldName = "name";
		if (keyword == null) {
			fieldName = null;
		}

		// 默认的排序方式
		if (orderField == null || "".equals(orderField)) {
			orderField = "displayOrder";
		}
		// 除了价格有升序外，其他字段都以降序查询
//		if (!"bottomPrice".equals(orderField)) {
//			orderType = "desc";
//		}
		System.out.println(keyword);
		System.out.println(orderType + "," + orderField);
		if (StringUtils.isEmpty(tt)) {
			QueryParam params = new QueryParam(5).add("shopid",id).add("del", 0)
					.add("shopFlevel", fl).add("shopSlevel", sl).add("stat", 0);
			list = productService.getStaticsLikeList(fieldName, keyword,
					params, null, null, null, Const.FRONT_PAGE_SIZE * (pn - 1),
					Const.FRONT_PAGE_SIZE, orderField, orderType);
		} else if (tt.equals("new")) {
			System.err.println("orderField=="+orderField);
			Calendar calendar = Calendar.getInstance();
			calendar.add(Calendar.DATE, -7);
			list = productService.getStaticsLikeList(
					fieldName,
					keyword,
					new QueryParam(4).add("shopid",id).add("shopid", id).add("del", 0)
							.add("stat", 0), "modifydate",
					calendar.getTimeInMillis(), null, Const.FRONT_PAGE_SIZE
							* (pn - 1), Const.FRONT_PAGE_SIZE, orderField,
					orderType);
		} else if (tt.equals("pro")) {
			list = productService.getPromotionalList(id, Const.FRONT_PAGE_SIZE
					* (pn - 1), Const.FRONT_PAGE_SIZE);
		}

		return "product";
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getOrderField() {
		return orderField;
	}

	public void setOrderField(String orderField) {
		this.orderField = orderField;
	}

	public String getOrderType() {
		return orderType;
	}

	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}

	public Integer getFl() {
		return fl;
	}

	public void setFl(Integer fl) {
		this.fl = fl;
	}

	public Integer getSl() {
		return sl;
	}

	public void setSl(Integer sl) {
		this.sl = sl;
	}

	public String getTt() {
		return tt;
	}

	public void setTt(String tt) {
		this.tt = tt;
	}
	
}
