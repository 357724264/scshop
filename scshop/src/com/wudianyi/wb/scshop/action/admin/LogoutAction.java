package com.wudianyi.wb.scshop.action.admin;

import org.apache.struts2.convention.annotation.ParentPackage;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.entity.Const;

@ParentPackage("admin")
public class LogoutAction extends BaseAction {

	public String execute() throws Exception {
		removeSession(Const.SESSION_ADMIN_NAME);
		removeSession(Const.SESSION_ADMIN_SHOPID);
		getResponse().sendRedirect("login.action");
		return null;
	}

}
