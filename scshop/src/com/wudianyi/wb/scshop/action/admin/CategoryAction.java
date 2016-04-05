package com.wudianyi.wb.scshop.action.admin;

import javax.annotation.Resource;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.service.CategoryService;

public class CategoryAction extends BaseAction{
	
	@Resource
	private CategoryService categoryService;
	
	private Integer index;
	
	//显示一级分类
	public String list() {
		QueryParam params = new QueryParam().add("del", 0).add("nodeid", 0);
		Integer permission = (Integer)getSession(Const.SESSION_ADMIN_PERMISSION);
		//如果为管理员
		if(permission!=null && permission==0) {
			params.add("categoryType", 0);
		}else {
			Integer shopid = (Integer)getSession(Const.SESSION_ADMIN_SHOPID);
			params.add("shopid", shopid);
			params.add("categoryType", 1);
		}
		
		
		list = categoryService.getList(params, 0, 0, "displayOrder", "desc", true);
		
		return LIST;
	}

	public Integer getIndex() {
		return index;
	}

	public void setIndex(Integer index) {
		this.index = index;
	}
	
	

}
