package com.wudianyi.wb.scshop.action.admin;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.ParentPackage;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Brand;
import com.wudianyi.wb.scshop.service.BrandService;
@ParentPackage("admin")
public class BrandAction extends BaseAction{
	
	@Resource
	private BrandService brandService;
	
	
	public String list() {
		QueryParam params = new QueryParam(1).add("del", 0);
		list = brandService.getList(params, 0, 0, "displayOrder", "desc", false);
		
		return LIST;
	}
	
}
