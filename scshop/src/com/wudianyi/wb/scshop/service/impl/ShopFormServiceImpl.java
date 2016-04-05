package com.wudianyi.wb.scshop.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wudianyi.wb.scshop.dao.ShopFormDao;
import com.wudianyi.wb.scshop.entity.ShopForm;
import com.wudianyi.wb.scshop.service.ShopFormService;

@Service
public class ShopFormServiceImpl extends BaseServiceImpl<ShopForm, Integer> implements ShopFormService{

	@Resource
	public void setBaseDao(ShopFormDao shopFormDao) {
		
		super.setBaseDao(shopFormDao);
	}
	
	
	
}
