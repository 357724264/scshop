package com.wudianyi.wb.scshop.action;

import java.io.IOException;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.ParentPackage;

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
	
	
	public String info(){
		Integer uid = (Integer)getSession(Const.SESSION_CUSTOMER_ID);
		Customer customer = customerService.get(uid);
		setAttribute("customer", customer);
		
		QueryParam  param = new QueryParam().add("del", 0).add("userid", id);
		
		int dfk = 0;
		int dfh = 0;
		int dsh = 0;
		int dpj = 0;
		//待付款
		dfk = orderService.getTotalCount(param.add("payStat", 0), false);
		//待发货
		dfh = orderService.getTotalCount(param.add("payStat", 1), false);
		//待收货
		dsh = orderService.getTotalCount(param.add("payStat", 2), false);
		//待评价
		dpj = orderService.getTotalCount(param.add("payStat", 3), false);
		
		setAttribute("dfk", dfk);
		setAttribute("dfh", dfh);
		setAttribute("dsh", dsh);
		setAttribute("dpj", dpj);
		return "info";
	}


	/*
	 * 申请为代理
	 */
	public String toagent(){
		Integer uid = (Integer)getSession(Const.SESSION_CUSTOMER_ID);
		Customer customer = customerService.get(uid);
		setAttribute("customer", customer);
		return "toagent";
	}
	
	public String data(){
		Integer uid = (Integer)getSession(Const.SESSION_CUSTOMER_ID);
		Customer customer = customerService.get(uid);
		setAttribute("customer", customer);
		return "data";
	}
	
	public String forgetpass() throws Exception{
 
    	return "forgetpass";
    }
	
	public String alterpass() throws Exception{
    	
    	return "alterpass";
    }
	
    public String changephone(){
    	Customer customer = customerService.get((Integer)getSession(
				Const.SESSION_CUSTOMER_ID));
    	setPhone(customer.getPhone());
    	return "changephone";
    }
    
    public String  nickname() {
    	Customer customer = customerService.get((Integer)getSession(Const.SESSION_CUSTOMER_ID));
    	setAttribute("name", customer.getName());
		return "nickname";
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
