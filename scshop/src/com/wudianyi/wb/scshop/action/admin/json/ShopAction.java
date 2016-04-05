package com.wudianyi.wb.scshop.action.admin.json;

import javax.annotation.Resource;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.entity.Shop;
import com.wudianyi.wb.scshop.service.PushService;
import com.wudianyi.wb.scshop.service.ShopService;

public class ShopAction extends BaseAction {

	@Resource
	private ShopService shopService;
	@Resource
	private PushService pushService;
	
	private String name;
	private String description;
	private String phone;
	private String logo;
	private String companyName;
	private String bground;
	private String userid;
	private String title;
	private String content;

	public String pushmessage(){
		System.out.println("pushmessage userid:"+userid+title+content);
		pushService.toAccount(userid, title, content);
		return ajaxJson("{'success':true}");
	}

	public String update() {
		int shopid = (Integer) getSession(
				Const.SESSION_ADMIN_SHOPID);
		Shop shop = shopService.get(shopid);

		shop.setName(name);
		shop.setDescription(description);
		shop.setPhone(phone);
		shop.setLogo(logo);
	    shop.setBground(bground);
		shop.setCompanyname(companyName);

		shopService.update(shop);
		return ajaxJson("success");
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	
	public String getBground() {
		return bground;
	}

	public void setBground(String bground) {
		this.bground = bground;
	}
	
	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	
}