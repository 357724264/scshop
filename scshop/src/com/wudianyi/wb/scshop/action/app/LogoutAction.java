package com.wudianyi.wb.scshop.action.app;

import org.apache.struts2.convention.annotation.ParentPackage;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.entity.Const;

@ParentPackage("front")
public class LogoutAction extends BaseAction {
	@Override
	public String execute() throws Exception {
		Integer userid = (Integer) getSession(Const.SESSION_CUSTOMER_ID);

		removeSession(Const.SESSION_CUSTOMER_ID);

		return ajaxJson("{'success':true,'userid':" + userid + "}");
	}

}
