package com.wudianyi.wb.scshop.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.ParentPackage;

import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Ad;
import com.wudianyi.wb.scshop.entity.Category;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.entity.Customer;
import com.wudianyi.wb.scshop.entity.Product;
import com.wudianyi.wb.scshop.service.AdService;
import com.wudianyi.wb.scshop.service.CategoryService;
import com.wudianyi.wb.scshop.service.CustomerService;
import com.wudianyi.wb.scshop.service.ProductService;

@ParentPackage("front")
public class IndexAction extends BaseAction {

	@Resource
	private CategoryService categoryService;
	@Resource
	private ProductService productService;
	@Resource
	private AdService adService;

	public String execute() {
		// 查询出所有一级分类
		QueryParam params = new QueryParam(2).add("del", 0).add("nodeid", 0);
		List<Category> categoryList = categoryService.getList(params, 0, 0,
				"displayOrder", "desc", false);
		// 查询出所有热销商品
		params = new QueryParam(3).add("del", 0).add("hotSale", 1)
				.add("stat", 0);
		List<Product> hotSaleProducts = productService.getList(params, 0, 0,
				"displayOrder", "desc", false);

		//查出导航栏
		List<Ad> navigation = new ArrayList<Ad>();
		// 查出上层轮询广告
//		params = new QueryParam(2).add("num", 0).add("isshow", 1);
		List<Ad> topAd = new ArrayList<Ad>();
		// 查出中层单张广告
//		params = new QueryParam(2).add("num", 1).add("isshow", 1);
		List<Ad> midAd = new ArrayList<Ad>();
		// 查出下层4宫格广告
//		params = new QueryParam(2).add("num", 2).add("isshow", 1);
		List<Ad> undAd = new ArrayList<Ad>();


		List<Ad> ads = adService.getList(new QueryParam(1).add("isshow", 1), 0,
				0, "orderbyid", "desc", false);
		for (Ad ad : ads) {
			if (ad.getNum() == 0) {
				topAd.add(ad);
			} else if (ad.getNum() == 1) {
				midAd.add(ad);
			} else if (ad.getNum() == 2) {
				undAd.add(ad);
			} else if (ad.getNum() == 3) {
				navigation.add(ad);
			}
		}

		setAttribute("categoryList", categoryList);
		setAttribute("hotSaleProducts", hotSaleProducts);
		setAttribute("topAd", topAd);
		setAttribute("midAd", midAd);
		setAttribute("undAd", undAd);
		setAttribute("navigation", navigation);
		return "index";
	}

	public String search() {

		return "search";
	}

}
