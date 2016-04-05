package com.wudianyi.wb.scshop.action.json;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.thoughtworks.xstream.core.util.PrioritizedList;
import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Cart;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.entity.Customer;
import com.wudianyi.wb.scshop.entity.Product;
import com.wudianyi.wb.scshop.entity.Shop;
import com.wudianyi.wb.scshop.entity.SubProduct;
import com.wudianyi.wb.scshop.service.CartService;
import com.wudianyi.wb.scshop.service.CustomerService;
import com.wudianyi.wb.scshop.service.ProductService;
import com.wudianyi.wb.scshop.service.ShopService;
import com.wudianyi.wb.scshop.service.SubProductService;
import com.wudianyi.wb.scshop.util.StringUtils;

public class CartAction extends BaseAction {

	@Resource
	private ProductService productService;
	@Resource
	private SubProductService subProductService;
	@Resource
	private CustomerService customerService;
	@Resource
	private ShopService shopService;
	@Resource
	private CartService cartService;

	private int id;
	private int num;
	private String cid;
	private String model;
	private String batchitem;// {productid:xxx,model:xxx}

	public String edit() {
		JSONObject retjson = new JSONObject();
		SubProduct subProduct = subProductService.get(id);

		// 需要填充一些产品信息，或者商店信息
		Product product = productService.get(subProduct.getProductid());
		int shopid = product.getShopid();
		double price = subProduct.getPrice();
		int inventory = subProduct.getInventory();
		int min = subProduct.getMinPurchaseQuantity() > 0 ? subProduct
				.getMinPurchaseQuantity() : 1;
		int max = subProduct.getMaxPurchaseQuantity() > 0 ? subProduct
				.getMaxPurchaseQuantity() : inventory;

		if (max > inventory) {
			max = inventory;
		}
		if (num < min || num > max) {
			retjson.put("success", false);
			retjson.put("code", 2);
			retjson.put("msg", "选择数量出错");
			return ajaxJson(retjson.toString());
		}

		Cart cart = null;
		Object useridObj = getSession(Const.SESSION_CUSTOMER_ID);
		if (useridObj == null) {
			cart = cartService.get(
					new QueryParam(2).add("sessionid", getStatusid()).add(
							"shopid", shopid), false);
		} else {
			cart = cartService.get(
					new QueryParam(2).add("userid", (Integer) useridObj).add(
							"shopid", shopid), false);
			if (num > 0) {
				Customer user = customerService.get((Integer) useridObj);
				// 如果是代理的话，要给出代理价格
				price = subProductService.getUserPriceByProduct(subProduct,
						user);
			}
		}
		// 用来判断之前购物车是否存在该商品
		if (cart == null) {
			Shop shop = shopService.get(shopid);// 保证店铺名字可以最新的
			cart = new Cart(useridObj == null ? null : (Integer) useridObj,
					getStatusid(), shop.getId(), shop.getName(), min, max);
			cartService.save(cart);
		}

		int add = cartService.updateCart(cart, product.getCover(), product
				.getName(), price, subProduct.getId(), num, subProduct
				.getName(), subProduct.getSubProduct() == null ? null
				: subProduct.getSubProduct().getId(), min, max);

		retjson.put("success", true);
		retjson.put("shopid", shopid);
		retjson.put("add", add);
		return ajaxJson(retjson.toString());

	}

	// batchitem[{productid,model},{productid,model}]
	public String batchedit() {

		if (StringUtils.isEmpty(batchitem)) {
			return null;
		}
		JSONArray jsonArray = JSONArray.fromObject(batchitem);
		int size = jsonArray.size();
		Object useridObj = getSession(Const.SESSION_CUSTOMER_ID);
		Map<Integer, Cart> cartmap = new HashMap<Integer, Cart>();
		for (int i = 0; i < size; i++) {
			JSONObject object = jsonArray.getJSONObject(i);
			Integer productid = object.getInt("productid");
			SubProduct subProduct = subProductService.get(productid);
			Product product = productService.get(subProduct.getProductid());

			Cart shopCart = cartmap.get(new Integer(product.getShopid()));
			if (shopCart == null) {
				QueryParam param = new QueryParam(2);
				if (useridObj == null) {
					param.add("sessionid", getStatusid());
				} else {
					param.add("userid", (Integer) useridObj);
				}
				param.add("shopid", product.getShopid());
				shopCart = cartService.get(param, false);
				if (shopCart == null) {
					continue;
				}
				cartmap.put(new Integer(product.getShopid()), shopCart);
			}
			shopCart = cartService.removefromCart(shopCart, productid, object
					.get("model") == null ? null : object.getString("model"));

		}

		for (Cart afterCart : cartmap.values()) {
			if (afterCart.getItemlist() == null
					|| afterCart.getItemlist().isEmpty()) {
				cartService.delete(afterCart);
			} else {
				cartService.update(afterCart);
			}
		}

		return ajaxJsonSuccessMessage(null);

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {

		this.model = model;
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public String getBatchitem() {
		return batchitem;
	}

	public void setBatchitem(String batchitem) {
		this.batchitem = batchitem;
	}

}
