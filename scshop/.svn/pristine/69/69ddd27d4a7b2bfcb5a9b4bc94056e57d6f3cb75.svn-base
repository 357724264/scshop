package com.wudianyi.wb.scshop.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.xml.registry.infomodel.User;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Service;

import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.dao.CartDao;
import com.wudianyi.wb.scshop.dao.CustomerDao;
import com.wudianyi.wb.scshop.dao.SubProductDao;
import com.wudianyi.wb.scshop.entity.Cart;
import com.wudianyi.wb.scshop.entity.Customer;
import com.wudianyi.wb.scshop.entity.Order;
import com.wudianyi.wb.scshop.entity.SubProduct;
import com.wudianyi.wb.scshop.service.CartService;
import com.wudianyi.wb.scshop.service.SubProductService;
import com.wudianyi.wb.scshop.util.StringUtils;
import com.wudianyi.wb.scshop.vo.CartItemVo;
import com.wudianyi.wb.scshop.vo.OrderItemVo;

@Service
public class CartServiceImpl extends BaseServiceImpl<Cart, String> implements
		CartService {

	@Resource
	private CartDao cartDao;
	@Resource
	private SubProductService subProductService;
	@Resource
	private CustomerDao customerDao;

	@Resource
	public void setBaseDao(CartDao cartDao) {
		super.setBaseDao(cartDao);

	}

	@Override
	public int updateCart(Cart cart, String ppic, String name, double price,
			int productid, int num, String pmodel, Integer upproductid,
			int min, int max) {

		String model = "";// 产品的型号，如果购物车里面有了这个属性，则直接获取，没有的话就调用数据库的数据
		String pic = ppic;
		String cartjson = cart.getItemjson();// 原本购物车中有的商品
		JSONObject updateproducthjson = new JSONObject();
		updateproducthjson.put("name", name);
		// updateproducthjson.put("pic", pic);
		// updateproducthjson.put("model", model);
		updateproducthjson.put("price", price);// 换成新的价格
		updateproducthjson.put("id", productid);
		updateproducthjson.put("min", min);
		updateproducthjson.put("max", max);
		JSONArray array = new JSONArray();
		System.err.println(cartjson);
		int updateindex = -1;
		// 找出该原本商品购物车中是否存在
		if (!StringUtils.isEmpty(cartjson)) {
			array = JSONArray.fromObject(cartjson);
			for (int i = 0; i < array.size(); i++) {
				JSONObject incartobject = array.getJSONObject(i);
				if (incartobject.get("id").equals(productid)) {
					model = incartobject.get("model") == null ? null
							: incartobject.getString("model");
					pic = incartobject.get("pic") == null ? null : incartobject
							.getString("pic");
					// num = num + incartobject.getInt("num");
					updateindex = i;
					break;
				}
			}
			if (updateindex > -1) {
				array.remove(updateindex);
			} else {// 如果该产品是新添加的，需要把产品的规格从数据库拿出
				if (upproductid != null) {
					SubProduct upProduct = subProductService.get(upproductid);
					if (upProduct != null) {
						model = "(" + upProduct.getName() + ")";
						pic = upProduct.getLogo();
					}
				}
				if (!StringUtils.isEmpty(pmodel)) {
					model = model + "(" + pmodel + ")";
				}
			}
		}
		updateproducthjson.put("num", num);
		updateproducthjson.put("pic", pic);
		updateproducthjson.put("model", StringUtils.isEmpty(model) ? null
				: model);
		if (num > 0) {
			array.add(updateproducthjson);
		}
		cart.setItemjson(array.toString());
		cart.setNum(array.size());
		cartDao.update(cart);
		return updateindex > -1 ? 0 : 1;
	}

	@Override
	public Cart removefromCart(Cart cart, int productid, String model) {
		if (cart == null || StringUtils.isEmpty(cart.getItemjson())) {
			return null;
		}
		JSONArray jsonArray = JSONArray.fromObject(cart.getItemjson());
		int arraysize = jsonArray.size();
		int deleteindex = -1;
		for (int i = 0; i < arraysize; i++) {
			JSONObject incartobject = jsonArray.getJSONObject(i);
			if (incartobject.get("id").equals(productid)) {
				deleteindex = i;
				break;
			}
		}
		if (deleteindex > -1) {
			jsonArray.remove(deleteindex);
		}
		cart.setItemjson(jsonArray.toString());
		cart.setNum(jsonArray.size());
		return cart;

	}

	@Override
	public int getCartNum(Integer userid, String sessionid) {
		// TODO Auto-generated method stub
		return cartDao.getCartNum(userid, sessionid);
	}

	@Override
	public int updatecombineCart(String sessionid, Integer userid) {
		List<Cart> sessionCart = new ArrayList<Cart>();

		int num = 0;
		if (sessionid != null) {
			sessionCart = cartDao.getList(
					new QueryParam(1).add("sessionid", sessionid), 0, 0, null,
					null, false);
		}

		List<Cart> userCarts = cartDao.getList(
				new QueryParam(1).add("userid", userid), 0, 0, null, null,
				false);
		Customer user = customerDao.get(userid);
		Map<Integer, Cart> userCartMap = new HashMap<>();

		for (Cart cart : userCarts) {
			if (cart.getItemlist() != null && !cart.getItemlist().isEmpty()) {
				num = cart.getNum() + num;
			}
			userCartMap.put(new Integer(cart.getShopid()), cart);
		}

		if (sessionCart != null && !sessionCart.isEmpty()) {

			for (Cart cart : sessionCart) {// 找去用户已经有的商铺购物车
				int shopid = cart.getShopid();
				Cart userCart = userCartMap.get(new Integer(shopid));
				if (userCart == null) {// 如果在用户的购物车找不到，直接合并到用户购物车
					cart.setUserid(userid);
					cart.setSessionid(null);
					if (!StringUtils.isEmpty(cart.getItemjson())) {
						if (user.getAgentid() != null) {

							// 如果用户是代理的话，要把原购物车的价格改成对应的代理价格
							JSONArray newJsonArray = new JSONArray();
							JSONArray array = JSONArray.fromObject(cart
									.getItemjson());
							for (int i = 0; i < array.size(); i++) {
								JSONObject jsonObject = array.getJSONObject(i);
								Integer productid = jsonObject.getInt("id");
								SubProduct subProduct = subProductService
										.get(productid);
								double price = subProductService
										.getUserPriceByProduct(subProduct, user);
								jsonObject.put("price", price);
								newJsonArray.add(jsonObject);
							}
							cart.setItemjson(newJsonArray.toString());
						}
						cartDao.update(cart);
						num = num + cart.getNum();
					} else {
						cartDao.delete(cart);// 如果购物车里面是空的，直接删除
					}
				} else {// 如果都有这个店的购物车，则合并
					List<CartItemVo> sessionitems = cart.getItemlist();
					List<CartItemVo> useritems = userCart.getItemlist();
					List<CartItemVo> additems = new ArrayList<CartItemVo>();
					for (CartItemVo sessionitem : sessionitems) {// 如果session里面的购物车内容跟user里面的购物车有冲突，则以user的为准
						boolean has = false;
						for (CartItemVo useritem : useritems) {
							if (sessionitem.getId() == useritem.getId()) {
								has = true;
							}

						}
						if (!has) {// 如果sessionitem里面不能匹配useritem，则吧当前的sessionitem加到user里面
							additems.add(sessionitem);
							num++;
						}
					}
					useritems.addAll(additems);
					userCart.setItemjson(JSONArray.fromObject(useritems)
							.toString());
					cartDao.update(userCart);
					cartDao.delete(cart);
				}

			}
		}
		return num;

	}

	@Override
	public int deletefromCart(Cart cart, Order order) {
		List<OrderItemVo> items = order.getOrderItems();
		// 用来保存判断后，购物车里还有那些项目是没有下单的
		List<CartItemVo> afterCartItems = new ArrayList<CartItemVo>();
		if (items != null && cart != null && cart.getItemlist() != null) {
			List<CartItemVo> cartitems = cart.getItemlist();
			int length = items.size();
			int clength = cartitems.size();
			if (length > 0 && clength > 0) {
				for (CartItemVo cartItemVo : cartitems) {// 循环寻找购物车的产品和购物车的产品是否有一些一样的
					boolean has = false;
					for (OrderItemVo orderItemVo : items) {// 循环，如果购物车里面有order里面的产品项目。
						System.err.println("orderItemVo.getProductid() ==="
								+ orderItemVo.getProductid());
						System.err.println("cartItemVo.getId()=="
								+ cartItemVo.getId());
						if (orderItemVo.getProductid() == cartItemVo.getId()) {
							has = true;
							break;
						}
					}
					if (!has) {
						afterCartItems.add(cartItemVo);
					}
				}
				// 更新Cart
				if (afterCartItems != null && !afterCartItems.isEmpty()) {// 如果购物车里面有东西，则更新。如果没有则删除购物车
					String json = JSONArray.fromObject(afterCartItems)
							.toString();
					cart.setItemjson(json);
					cart.setNum(afterCartItems.size());
					System.err.println("==========================");
					cartDao.update(cart);
					System.err.println("=======update============");
					System.err.println(" afterCartItems.size()==="
							+ afterCartItems.size());
					// 返回减少的数量
					return clength - afterCartItems.size();
				} else {
					cartDao.delete(cart);
					// 全部减少了
					return length;
				}
			}
		} else {
			return 0;
		}
		return 0;
	}
}
