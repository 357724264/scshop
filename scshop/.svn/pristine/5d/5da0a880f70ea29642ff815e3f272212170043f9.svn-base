package com.wudianyi.wb.scshop.action.admin.json;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import com.joyoos.util.MD5;
import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.entity.ShopForm;
import com.wudianyi.wb.scshop.service.ShopFormService;

public class ShopformAction extends BaseAction{

	@Resource
	private ShopFormService shopFormService;

	private String shopName;
	private String account ;
	private String password;
	private String contactsName;
	private String phone;
	private String email;
	private String companyname;
	private String registernum;
	private String commoditycatagory;
	private String agent;
	private String link ;
	private String postcode;
	private String contactsPhone;
	private String contactsPeople;
	private String license;
	private String logo;
	private String enterpriseImages;
	private String agentImages;
	private String inlandAddress;
	private Integer tt;
	
	
	public String list() {
		
		/*System.out.println(tt);
		System.out.println("进入json/shopform");
		QueryParam params = new QueryParam(1).add("stat", tt);
		System.out.println("params:"+params);
		list = (List) shopFormService.get(params, false);*/
		
		QueryParam params = new QueryParam().add("stat", tt);
		
		
		list = shopFormService.getList(params, (pn-1)*Const.BACK_PAGE_SIZE, Const.BACK_PAGE_SIZE, "createTime", "desc", false);
		System.out.println(list);
		return LIST;
	}
	
public String totalNum() {
		
	    QueryParam params = new QueryParam(1).add("stat", tt);
		tn = shopFormService.getLikeTotalCount(null, null, null, params, false);
		
					System.out.println("tn========" + tn);
		return ajaxJson("{\"total\":\"" + tn + "\",\"size\":\"" + Const.BACK_PAGE_SIZE + "\"}");
	}

	//商家注册申请(保存)
	public String save() {

		//已经申请过的手机号码，无法重复申请
		QueryParam paramp = new QueryParam(1).add("phone", phone);
		int totalP = shopFormService.getTotalCount(paramp, false);
		
		if(phone.length() > 0){
				if(totalP != 0 ) {
				return ajaxHtml("该手机号已申请过，请使用其他手机号申请，谢谢。");
			}
		}
		//已经申请过的营业执照注册号，无法重复申请
		QueryParam paramr  =  new QueryParam(1).add("registernum", registernum);
		int totalR = shopFormService.getTotalCount(paramr, false);
		if(totalR != 0) {
			return ajaxHtml("该营业执照注册号已申请过，请确认后再申请，谢谢。");
		}
		//该账号已有，换一个注册
		QueryParam paramra =  new QueryParam(1).add("account", account);
		int totalA = shopFormService.getTotalCount(paramra, false);
		if(totalA != 0) {
			return ajaxHtml("该账号已被注册，请使用其他账号注册，谢谢。");
		}
		
		ShopForm shopForm = new ShopForm();
		shopForm.setShopName(shopName);//店名
		shopForm.setAccount(account);//申请人名称
		shopForm.setPassword(MD5.MD5Encode(password));//密码保存
		shopForm.setContactsName(contactsName);
		shopForm.setPhone(phone);//手机号码
		shopForm.setEmail(email);
		shopForm.setCompanyname(companyname);//公司名称
		shopForm.setRegisternum(registernum);//营业执照注册号
		shopForm.setEnterpriseImages(enterpriseImages);
		shopForm.setCommoditycatagory(commoditycatagory);
		shopForm.setAgent(agent);
		shopForm.setAgentImages(agentImages);
		shopForm.setLink(link);
		shopForm.setPostcode(postcode);
		shopForm.setContactsPhone(contactsPhone);
		shopForm.setContactsPeople(contactsPeople);
		shopForm.setStat(0);// 0为审核中 
		shopForm.setCreateTime(new Date().getTime());//申请时间

		shopFormService.save(shopForm);
		return ajaxHtml("success");
	}
	public String getAccount() {
		return account;
	}


	public void setAccount(String account) {
		this.account = account;
	}


	public String getPhone() {
		return phone;
	}



	public void setPhone(String phone) {
		this.phone = phone;
	}



	public String getShopName() {
		return shopName;
	}



	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public String getLogo() {
		return logo;
	}



	public void setLogo(String logo) {
		this.logo = logo;
	}



	public String getLicense() {
		return license;
	}



	public void setLicense(String license) {
		this.license = license;
	}



	public String getRegisternum() {
		return registernum;
	}



	public void setRegisternum(String registernum) {
		this.registernum = registernum;
	}



	public String getCompanyname() {
		return companyname;
	}



	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}






	


	



	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
	}

	
	
	
	
	public Integer getTt() {
		return tt;
	}

	public void setTt(Integer tt) {
		this.tt = tt;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getContactsName() {
		return contactsName;
	}

	public void setContactsName(String contactsName) {
		this.contactsName = contactsName;
	}

	public String getCommoditycatagory() {
		return commoditycatagory;
	}

	public void setCommoditycatagory(String commoditycatagory) {
		this.commoditycatagory = commoditycatagory;
	}

	public String getAgent() {
		return agent;
	}

	public void setAgent(String agent) {
		this.agent = agent;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getContactsPhone() {
		return contactsPhone;
	}

	public void setContactsPhone(String contactsPhone) {
		this.contactsPhone = contactsPhone;
	}

	public String getContactsPeople() {
		return contactsPeople;
	}

	public void setContactsPeople(String contactsPeople) {
		this.contactsPeople = contactsPeople;
	}
	
	public String getEnterpriseImages() {
		return enterpriseImages;
	}

	public void setEnterpriseImages(String enterpriseImages) {
		this.enterpriseImages = enterpriseImages;
	}

	public String getAgentImages() {
		return agentImages;
	}

	public void setAgentImages(String agentImages) {
		this.agentImages = agentImages;
	}

	public String getInlandAddress() {
		return inlandAddress;
	}

	public void setInlandAddress(String inlandAddress) {
		this.inlandAddress = inlandAddress;
	}




}
