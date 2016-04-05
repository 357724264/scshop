package com.wudianyi.wb.scshop.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.ParentPackage;

import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Brand;
import com.wudianyi.wb.scshop.entity.Country;
import com.wudianyi.wb.scshop.service.BrandService;
import com.wudianyi.wb.scshop.service.CategoryService;
import com.wudianyi.wb.scshop.service.CountryService;

@ParentPackage("front")
public class CategoryAction extends BaseAction {

	@Resource
	private CategoryService categoryService;

	@Resource
	private BrandService brandService;
	@Resource
	private CountryService countryService;

	private Integer index;

	public String execute() {

		if (index == null) {
			index = 0;
		}
		// 查出所以一级的前端分类
		QueryParam params = new QueryParam(3).add("del", 0).add("nodeid", 0)
				.add("categoryType", 0);
		list = categoryService.getList(params, 0, 0, "displayOrder", "desc",
				true);
		params = new QueryParam(1).add("del", 0);
		List<Brand> brandList = brandService.getList(params, 0, 0,
				"displayOrder", "desc", true);

		setAttribute("brandList", brandList);

		List<Country> countrylist = countryService.getList(
				new QueryParam(1).add("del", 0), 0, 0, "displayOrder", "desc",
				true);
		setAttribute("countrylist", countrylist);
		return "category";
	}

	public Integer getIndex() {
		return index;
	}

	public void setIndex(Integer index) {
		this.index = index;
	}

}
