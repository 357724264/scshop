package com.wudianyi.wb.scshop.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Service;

import com.wudianyi.wb.scshop.dao.ProductDao;
import com.wudianyi.wb.scshop.entity.Customer;
import com.wudianyi.wb.scshop.entity.Product;
import com.wudianyi.wb.scshop.entity.SubProduct;
import com.wudianyi.wb.scshop.service.ProductService;
import com.wudianyi.wb.scshop.util.StringUtils;

@Service
public class ProductServiceImpl extends BaseServiceImpl<Product, Integer>
		implements ProductService {
	@Resource
	private ProductDao productDao;

	@Resource
	public void setBaseDao(ProductDao productDao) {

		super.setBaseDao(productDao);
	}

	/**
	 * 得到商铺所有促销的商品数量
	 * 
	 * @param shopid商店id
	 * @return
	 */
	public int getPromotionalCount(int shopid) {
		return productDao.getPromotionalCount(shopid);
	}

	/**
	 * 得到商铺所有促销的商品
	 * 
	 * @param shopid
	 *            商店id
	 * @return
	 */
	public List<Product> getPromotionalList(int shopid, Integer start,
			Integer limit) {
		return productDao.getPromotionalList(shopid, start, limit);
	}

	@Override
	public void updateProductPromotionsInfo(int productid, SubProduct subProduct,int num) {
		Product product = productDao.get(productid);
		if (!StringUtils.isEmpty(product.getPromotionsjson())) {
			JSONObject jsonObject = JSONObject.fromObject(product
					.getPromotionsjson());
			jsonObject.put(subProduct.getId(), subProduct.getSeckillNum());
			Iterator<Integer> it = jsonObject.keys();
			boolean has = false;
			while (it.hasNext()) {
				Object numObj = jsonObject.get(it.next());
				if (numObj != null && (((int) numObj) > 0)) {
					has = true;
				}
			}
			//如果仍然有商品没有售完，则更新总商品购买数跟促销信息
			if (has) {
				product.setPromotionsjson(jsonObject.toString());
				product.setSeckillnum(product.getSeckillnum()-num);
			//如果全部可购买数都为0，则初始化商品促销信息
			}else {
				product.init();
			}
			productDao.update(product);
		}

	}
	
	@Override
	public boolean checkProductStatus(Product product) {
		
		if(product.getSeckillnum()!=null && product.getProductType()!=null) {
			//如果商品有秒杀数量或者活动结束时间大于当前时间,该商品状态为促销中
			if(product.getProductType()==1 || (product.getProductType()==2 && product.getEndTime()>=new Date().getTime())) {
				return true;
			}
		}
		
		
		return false;
	}
	
	@Override
	public boolean checkProductStatus(int productid) {
		Product product = productDao.get(productid);
		
		return checkProductStatus(product);
	}

	@Override
	public boolean checkSubProductStatus(int productid,int subProductid) {
		Product product = productDao.get(productid);
		String promotionsjson = product.getPromotionsjson();
		if(!StringUtils.isEmpty(promotionsjson)) {
			JSONObject obj = JSONObject.fromObject(promotionsjson);
			Integer seckillNum = obj.get(subProductid+"")==null?0:obj.getInt(subProductid+"");
			if(seckillNum>0) {
				return true;
			}
		}
		return false;
	}



}
