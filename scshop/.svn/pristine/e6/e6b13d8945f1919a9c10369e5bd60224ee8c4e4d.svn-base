package com.wudianyi.wb.scshop.service;

import java.util.List;

import com.wudianyi.wb.scshop.entity.Customer;
import com.wudianyi.wb.scshop.entity.Product;
import com.wudianyi.wb.scshop.entity.SubProduct;

public interface ProductService extends BaseService<Product, Integer> {
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

	/**
	 * 更新产品内促销信息
	 * @param productid
	 * @param subProduct 已经修正过数量的产品
	 */
	public void updateProductPromotionsInfo(int productid, SubProduct subProductid);
	
	/**
	 * 查看商品是否在促销中
	 * @return
	 */
	public boolean checkProductStatus(int productid);
	
	/**
	 * 查看商品是否在促销中
	 * @return
	 */
	public boolean checkProductStatus(Product product);
	
	/**
	 * 查看具体规格的商品是否在促销中
	 * @param subProductid
	 * @return
	 */
	public boolean checkSubProductStatus(int productid,int subProductid);
	
}
