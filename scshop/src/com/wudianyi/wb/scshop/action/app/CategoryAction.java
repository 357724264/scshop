package com.wudianyi.wb.scshop.action.app;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.convention.annotation.ParentPackage;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Brand;
import com.wudianyi.wb.scshop.entity.Category;
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
		JSONObject retObject = new JSONObject();
		JSONArray categoryJsonArray = new JSONArray();
		JSONArray downListJsonArray = new JSONArray();
		String currentName = "";
		Set<Category> downList = null;
		QueryParam params;
		if (index == 0) {
			params = new QueryParam(2).add("del", 0).add("nodeid", 0)
					.add("categoryType", 0);
			List<Category> categorylist = categoryService.getList(params, 0, 0,
					"displayOrder", "desc", true);
			for (int i = 0; i < categorylist.size(); i++) {
				JSONObject categoryobject = new JSONObject();
				categoryobject.put("id", categorylist.get(i).getId());
				categoryobject.put("name", categorylist.get(i).getName());
				categoryJsonArray.add(categoryobject);
				if(i==0) {
					currentName = categorylist.get(i).getName();
					downList = categorylist.get(i).getDownList();
				}
			}
			
		} else {
			Category category = categoryService.get(index);
			downList = category.getDownList();
			currentName = category.getName();
		}
		retObject.put("currentName", currentName);
	
		Iterator<Category> iterator = downList.iterator();
		Category next;
		while (iterator.hasNext()) {
			JSONObject categoryobject = new JSONObject();
			next = iterator.next();
			categoryobject.put("id", next.getId());
			categoryobject.put("name", next.getName());
			categoryobject.put("logo", next.getLogo());
			downListJsonArray.add(categoryobject);
		}
		retObject.put("downList", downListJsonArray);
		retObject.put("categorylist", categoryJsonArray);
		
		params = new QueryParam(1).add("del", 0);
		if (index == null || index == 0) {
			JSONArray brandJsonArray = new JSONArray();
			JSONArray countryJsonArray = new JSONArray();
			List<Brand> brandList = brandService.getList(params, 0, 0,
					"displayOrder", "desc", true);
			List<Country> countrylist = countryService.getList(params, 0, 0,
					"displayOrder", "desc", true);
			for (Brand brand : brandList) {
				JSONObject brandObject = new JSONObject();
				brandObject.put("id", brand.getId());
				brandObject.put("log", brand.getLogo());
				brandJsonArray.add(brandObject);
			}
			for (Country country : countrylist) {
				JSONObject countryObject = new JSONObject();
				countryObject.put("id", country.getId());
				countryObject.put("flagIcon", country.getFlagIcon());
				countryJsonArray.add(countryObject);
			}
			retObject.put("brandlist", brandJsonArray);
			retObject.put("countryList", countryJsonArray);
		}
		retObject.put("index", index);
		return ajaxJson(retObject.toString());
	}

	public Integer getIndex() {
		return index;
	}

	public void setIndex(Integer index) {
		this.index = index;
	}

}
