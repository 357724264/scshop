package com.wudianyi.wb.scshop.action.admin;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.ParentPackage;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.service.CountryService;
@ParentPackage("admin")
public class CountryAction extends BaseAction{
	
	@Resource
	private CountryService countryService;
	
	public String list() {
		QueryParam params = new QueryParam(1).add("del", 0);
		list = countryService.getList(params, 0, 0, "displayOrder", "desc", false);
		
		return LIST;
	}
}
