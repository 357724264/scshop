package com.wudianyi.wb.scshop.action.app;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.entity.Product;
import com.wudianyi.wb.scshop.service.ProductService;

public class CommentAction extends BaseAction {

	private int id;

	@Resource
	private ProductService productService;

	public String list() {
		Product product = productService.get(id);
		JSONObject retObj = new JSONObject();
		retObj.put("goodnum", product.getGoodnum());
		retObj.put("middlenum", product.getMiddlenum());
		retObj.put("badnum", product.getBadnum());
//		if (product.getDel() == 1) {
//			return "nopage";
//		}
		return ajaxJson(retObj.toString());
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

}
