package com.wudianyi.wb.scshop.dao;

import com.wudianyi.wb.scshop.entity.Cart;

public interface CartDao extends BaseDao<Cart, String> {

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
}
