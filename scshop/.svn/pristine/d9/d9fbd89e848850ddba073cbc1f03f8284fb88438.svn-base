package com.wudianyi.wb.scshop.action;


import org.apache.struts2.convention.annotation.ParentPackage;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.entity.Const;

@ParentPackage("front")
public class LogoutAction extends BaseAction{
	@Override
	public String execute() throws Exception {
		
		removeSession(Const.SESSION_CUSTOMER_ID);
		         System.out.println("前台退出");
		         System.out.println(Const.SESSION_CUSTOMER_ID);
		         System.out.println("session的值"+getSession(Const.SESSION_CUSTOMER_ID));
		
		return ajaxJson("{'success':true}");
	}

	
}
