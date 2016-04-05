package com.wudianyi.wb.scshop.service;

import com.wudianyi.wb.scshop.entity.Cart;
import com.wudianyi.wb.scshop.entity.Order;

public interface CartService extends BaseService<Cart, String> {

	/**
	 * 
	 * @param cart
	 *            原始的购物车
	 * @param ppic
	 *            产品图片,对应的是Product，最原始的那个
	 * @param name
	 *            产品名字
	 * @param price
	 *            产品价格
	 * @param productid
	 *            产品id-》对应的类是SubProduct
	 * @param num
	 *            数量
	 * @param pmodel
	 *            产品的型号
	 * @param upproductid
	 *            产品的上一级产品的id，可以null-》对应的是SubProduct
	 * @return
	 */
	public int updateCart(Cart cart, String ppic, String name, double price,
			int productid, int num, String pmodel, Integer upproductid,int min,int max);

	public Cart removefromCart(Cart cart, int productid, String model);

	/**
	 * 得到购物车里面商品的数量
	 * 
	 * @param userid
	 *            用户id
	 * @param sessionid
	 *            cookieid，userid与sessionid必须有一个不能为空
	 * @return 购物车商品数量
	 */
	public int getCartNum(Integer userid, String sessionid);

	/**
	 * 把session里面的购物车放到用户里面的购物车
	 * 
	 * @param sessionid
	 * @param userid
	 * @return 返回购物车商品数量
	 */
	public int updatecombineCart(String sessionid, Integer userid);

	/**
	 * 根据订单内容删除购物车里面的商品，主要用于结算后，购物车结算的商品需要清空
	 * 
	 * @param cart
	 * @param order
	 * @return 返回减少的数量
	 */
	public int deletefromCart(Cart cart, Order order);

}
