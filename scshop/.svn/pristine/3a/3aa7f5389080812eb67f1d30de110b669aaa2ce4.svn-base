package com.wudianyi.wb.scshop.action.app;

import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.convention.annotation.ParentPackage;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Cart;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.service.CartService;
import com.wudianyi.wb.scshop.vo.CartItemVo;
@ParentPackage("front")
public class CartAction extends BaseAction {

	private String id;

	@Resource
	private CartService cartService;

	@Override
	public String execute() throws Exception {
		JSONObject retObject = new JSONObject();
		QueryParam param = new QueryParam(1);
		Object useridobj = getSession(Const.SESSION_CUSTOMER_ID);
		if (useridobj != null) {
			param.add("userid", (Integer) useridobj);
			retObject.put("useridobj", useridobj);
		} else {
			param.add("sessionid", getStatusid());
		}
		List<Cart> cartlist = cartService.getList(param, 0, 0, null, null, false);
		
	
		JSONArray cartArray = new JSONArray();
		double total = 0;
		for(Cart cart:cartlist){
			JSONObject cartObject = new JSONObject();
			cartObject.put("shopid", cart.getShopid());
			cartObject.put("shopname", cart.getShopname());
			cartObject.put("id", cart.getId());
			cartObject.put("itemjson", cart.getItemjson());
			for(CartItemVo vo :cart.getItemlist()){
				total += vo.getNum()*vo.getPrice();
			}
			cartArray.add(cartObject);
		}
		retObject.put("total", total);
		retObject.put("cartArray", cartArray);
		System.out.println(retObject.toString());
		return ajaxJson(retObject.toString());
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

}
