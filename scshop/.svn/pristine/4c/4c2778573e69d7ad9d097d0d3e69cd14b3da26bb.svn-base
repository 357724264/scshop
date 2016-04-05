package com.wudianyi.wb.scshop.action;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.ParentPackage;

import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.service.CartService;
@ParentPackage("front")
public class CartAction extends BaseAction {

	private String id;

	@Resource
	private CartService cartService;

	@Override
	public String execute() throws Exception {

		QueryParam param = new QueryParam(1);
		Object useridobj = getSession(Const.SESSION_CUSTOMER_ID);
		if (useridobj != null) {
			param.add("userid", (Integer) useridobj);
			setAttribute("useridobj", useridobj);
		} else {
			param.add("sessionid", getStatusid());
		}
		list = cartService.getList(param, 0, 0, null, null, false);
		return "cart";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

}
