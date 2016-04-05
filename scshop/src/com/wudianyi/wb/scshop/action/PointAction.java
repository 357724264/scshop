package com.wudianyi.wb.scshop.action;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.ParentPackage;

import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.entity.Customer;
import com.wudianyi.wb.scshop.service.CustomerService;
@ParentPackage("user")
public class PointAction extends BaseAction {
	@Resource
	private CustomerService customerService;

	public String list() {
		Integer userid = (Integer) getSession(Const.SESSION_CUSTOMER_ID);
		Customer customer = customerService.get(userid);
		setAttribute("customer", customer);
		return LIST;
	}

}
