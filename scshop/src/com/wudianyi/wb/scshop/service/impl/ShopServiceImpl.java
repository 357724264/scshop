package com.wudianyi.wb.scshop.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wudianyi.wb.scshop.dao.ShopDao;
import com.wudianyi.wb.scshop.entity.Shop;
import com.wudianyi.wb.scshop.service.ShopService;
@Service
public class ShopServiceImpl extends BaseServiceImpl<Shop, Integer> implements ShopService{

	@Resource
	public void setBaseDao(ShopDao shopDao) {
		
		super.setBaseDao(shopDao);
	}
	
	
}
