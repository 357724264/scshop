package com.wudianyi.wb.scshop.action;

import javax.annotation.Resource;

import com.wudianyi.wb.scshop.entity.Product;
import com.wudianyi.wb.scshop.service.ProductService;

public class CommentAction extends BaseAction {

	private int id;

	@Resource
	private ProductService productService;

	public String list() {
		Product product = productService.get(id);
		if (product.getDel() == 1) {
			return "nopage";
		}
		setAttribute("product", product);
		return LIST;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

}
