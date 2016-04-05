package com.wudianyi.wb.scshop.action.admin;

import javax.annotation.Resource;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.entity.Product;
import com.wudianyi.wb.scshop.service.InventoryService;
import com.wudianyi.wb.scshop.service.ProductService;

public class InventoryAction extends BaseAction {

	private Integer pid;
	@Resource
	private ProductService productService;

	public String list() {
		if (pid != null) {
			Product product = productService.get(pid);
			Integer shopid = (Integer) getSession(Const.SESSION_ADMIN_SHOPID);
			if (product.getShopid().equals(shopid)) {
				setAttribute("product", product);
			}
		}
		return LIST;
	}

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

}
