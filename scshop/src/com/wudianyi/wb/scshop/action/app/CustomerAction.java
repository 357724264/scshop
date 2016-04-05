package com.wudianyi.wb.scshop.action.app;

import java.io.IOException;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.apache.struts2.convention.annotation.ParentPackage;

import com.google.gson.JsonObject;
import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.entity.Customer;
import com.wudianyi.wb.scshop.service.CustomerService;
import com.wudianyi.wb.scshop.service.OrderService;

public class CustomerAction extends BaseAction{

	@Resource
	private CustomerService customerService;
	@Resource
	private OrderService orderService;
	private int id;
	private String phone;
	public String getValidateCode() {
		return validateCode;
	}


	public void setValidateCode(String validateCode) {
		this.validateCode = validateCode;
	}


	private String validateCode;
	
	
	public String forgetpass() throws Exception{
         
    	return "forgetpass";
    }
	
	public String alterpass() throws Exception{
    	
    	return "alterpass";
    }
	
    public String changephone(){
    	Customer customer = customerService.get((Integer)getSession(
				Const.SESSION_CUSTOMER_ID));
    	//setPhone(customer.getPhone());
    	JSONObject phoneObject = new JSONObject();
    	phoneObject.put("phone", customer.getPhone());
    	return ajaxJson(phoneObject.toString());
    }
    
    public String  nickname() {
    	Customer customer = customerService.get((Integer)getSession(Const.SESSION_CUSTOMER_ID));
    	//setAttribute("name", customer.getName());
    	JSONObject nameObject = new JSONObject();
    	nameObject.put("name", customer.getName());
		return ajaxJson(nameObject.toString());
	}
    
	
	
	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	
	
}
