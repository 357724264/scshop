package com.wudianyi.wb.scshop.action.admin.json;

import javax.annotation.Resource;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.entity.Brand;
import com.wudianyi.wb.scshop.entity.Country;
import com.wudianyi.wb.scshop.service.CountryService;

public class CountryAction extends BaseAction{

	@Resource
	private CountryService countryService;
	
	private Integer cid;
	private String countryName;
	private String flagIcon;
	private Integer displayOrder;
	
	//添加品牌信息
	public String save() {
		
		Country country = new Country();
		country.setDisplayOrder(displayOrder);
		country.setName(countryName);
		country.setFlagIcon(flagIcon);
		country.setDel(0);
		
		countryService.save(country);
		
		return ajaxHtml("success");
	}
	
	public String update() {
		Country country = countryService.get(cid);
		country.setDisplayOrder(displayOrder);
		country.setFlagIcon(flagIcon);
		country.setName(countryName);
		
		
		countryService.update(country);
		
		return ajaxHtml("success");
		
	}
	
	
	public String delete() {
		
		Country country = countryService.get(cid);
		country.setDel(1);
		countryService.update(country);
		
		return ajaxHtml("success");
	}
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public String getCountryName() {
		return countryName;
	}

	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}

	public String getFlagIcon() {
		return flagIcon;
	}

	public void setFlagIcon(String flagIcon) {
		this.flagIcon = flagIcon;
	}

	public Integer getDisplayOrder() {
		return displayOrder;
	}

	public void setDisplayOrder(Integer displayOrder) {
		this.displayOrder = displayOrder;
	}

	
	
	
	
	
	
	
}
