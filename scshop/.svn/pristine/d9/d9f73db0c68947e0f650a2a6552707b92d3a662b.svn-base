package com.wudianyi.wb.scshop.action;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.ParentPackage;

import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Address;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.entity.Customer;
import com.wudianyi.wb.scshop.service.AddressService;
import com.wudianyi.wb.scshop.service.CustomerService;

/**
 * 个人用户地址管理
 * 
 * @author Administrator
 * 
 */
@ParentPackage("user")
public class AddressAction extends BaseAction {

	private String oid;
	
    
	private String aid;
	
	private String defaultid;//默认的地址id

	@Resource
	private AddressService addressService;
	@Resource
	private CustomerService customerService;
	

	/*
	 * 用户地址列表
	 */
	public String list() {
		Integer uid = (Integer) getSession(Const.SESSION_CUSTOMER_ID);
		defaultid = customerService.get(uid).getDefaultAddressid();
		QueryParam param = new QueryParam(1).add("userid", uid);
		list = addressService.getList(param, 0, 0, null, null, false);
		setAttribute("defaultid", defaultid);

		return LIST;
	}

	public String add() {
		
		return "add";
	}
	
	public String edit() {
		Integer uid = (Integer) getSession(Const.SESSION_CUSTOMER_ID);
		
	    QueryParam param = new QueryParam(1).add("userid", uid).add("id", aid);
	    Address address = addressService.get(param, false);
	    setAttribute("address", address);
		return "edit";
	}

	public String getOid() {
		return oid;
	}

	public void setOid(String oid) {
		this.oid = oid;
	}
	public String getAid() {
		return aid;
	}

	public void setAid(String aid) {
		this.aid = aid;
	}

	public String getDefaultid() {
		return defaultid;
	}

	public void setDefaultid(String defaultid) {
		this.defaultid = defaultid;
	}
	
	
}
