package com.wudianyi.wb.scshop.action.admin;


import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.ParentPackage;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.entity.Shop;
import com.wudianyi.wb.scshop.service.ShopService;


@ParentPackage("admin")
public class ShopAction extends BaseAction{
	

	@Resource
	private ShopService shopService;
	
	public String list(){
		int shopid= (Integer) getSession(
				Const.SESSION_ADMIN_SHOPID);
		Shop shop = shopService.get(shopid); 
		setAttribute("shop", shop);
		return LIST;
	}

}