package com.wudianyi.wb.scshop.action;

import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;

import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Category;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.entity.Product;
import com.wudianyi.wb.scshop.entity.Shop;
import com.wudianyi.wb.scshop.service.CategoryService;
import com.wudianyi.wb.scshop.service.ProductService;
import com.wudianyi.wb.scshop.service.ShopService;

public class ShopAction extends BaseAction {

	private int id;//店铺id
	private Integer fl;
	private Integer sl;
	private String tt;
	@Resource
	private ProductService productService;
	@Resource
	private ShopService shopService;
	@Resource
	private CategoryService categoryService;

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
		setAttribute("categorylist", categorylist);
		setAttribute("newProducts", newProducts);
		setAttribute("hots", hots);
		Shop shop = shopService.get(id);
		setAttribute("shop", shop);
		setAttribute("newcount", newcount);
		setAttribute("pcount", pcount);
		setAttribute("promotionalcount", promotionalcount);

		// TODO Auto-generated method stub
		return "shop";
	}

	public String category() {

		list = categoryService.getList(
				new QueryParam(4).add("shopid", id).add("categoryType", 1)
						.add("del", 0).add("nodeid", 0), 0, 0, "displayOrder",
				"desc", false);
		return "category";
	}

	public String product() {
		System.out.println("keyword===="+keyword);
		String cname = "";
		if (fl != null) {
			Category category = categoryService.get(fl);
			cname = category.getName();
		}
		if (sl != null) {
			Category category = categoryService.get(sl);
			cname = category.getName();
		}
		setAttribute("cname", cname);
		return "product";
	}

	public String coupons() {
		Object useridobj = getSession(Const.SESSION_CUSTOMER_ID);
		setAttribute("useridobj", useridobj);
		return "coupons";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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
