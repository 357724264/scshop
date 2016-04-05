package com.wudianyi.wb.scshop.action.app;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.apache.struts2.convention.annotation.ParentPackage;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.entity.Customer;
import com.wudianyi.wb.scshop.service.CustomerService;
@ParentPackage("appUser")
public class PointAction extends BaseAction {
	@Resource
	private CustomerService customerService;

	public String list() {
		JSONObject custmObject = new JSONObject();
		Integer userid = (Integer) getSession(Const.SESSION_CUSTOMER_ID);
		if(userid != null) {
			custmObject.put("userid", userid);
		}
		Customer customer = customerService.get(userid);
		//setAttribute("customer", customer);
		custmObject.put("point", customer.getPoint());
	
		return ajaxJson(custmObject.toString());
	}

}
