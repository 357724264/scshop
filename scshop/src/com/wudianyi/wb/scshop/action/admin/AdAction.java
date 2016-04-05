package com.wudianyi.wb.scshop.action.admin;


import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.ParentPackage;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Ad;
import com.wudianyi.wb.scshop.service.AdService;

@ParentPackage("admin")
public class AdAction extends BaseAction {
	
	@Resource
	private AdService adService;
	
	private Integer id;
	private Integer nn;//num
	private Integer ii;//isshow
	
	public String list() {
		QueryParam params = new QueryParam(2);
		if(nn!=null){
			params = new QueryParam(2).add("num", nn).add("isshow", ii);
		}else{
			params = new QueryParam(2).add("num", 3).add("isshow", 1);
		}
		
		list = adService.getList(params, 0, 0,  "orderbyid", "desc", false);
		
		return LIST;
	}

	
	public String delete(){
		adService.delete(id);
		System.err.println("id:"+id);
		return ajaxHtml("success");
	}
	
	
	
	public String edit(){
		Ad ad = new Ad();
		if(id != null){
			ad = adService.get(id);
		}
		setAttribute("ad", ad);
		return INPUT;
	}

	
	
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getNn() {
		return nn;
	}

	public void setNn(Integer nn) {
		this.nn = nn;
	}

	public Integer getIi() {
		return ii;
	}

	public void setIi(Integer ii) {
		this.ii = ii;
	}

	
	
	
	
	
	
	
	
	
	
	
}
