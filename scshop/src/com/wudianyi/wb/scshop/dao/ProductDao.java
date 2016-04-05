package com.wudianyi.wb.scshop.dao;

import java.util.List;

import com.wudianyi.wb.scshop.entity.Product;

public interface ProductDao extends BaseDao<Product, Integer> {

	/**
	 * 得到商铺所有促销的商品数量
	 * 
	 * @param shopid商店id
	 * @return
	 */
	public int getPromotionalCount(int shopid);

	/**
	 * 得到商铺所有促销的商品
	 * 
	 * @param shopid
	 *            商店id
	 * @return
	 */
	public List<Product> getPromotionalList(int shopid, Integer start,
			Integer limit);
}
