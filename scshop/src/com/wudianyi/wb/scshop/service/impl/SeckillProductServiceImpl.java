package com.wudianyi.wb.scshop.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wudianyi.wb.scshop.dao.SeckillProductDao;
import com.wudianyi.wb.scshop.entity.SeckillProduct;
import com.wudianyi.wb.scshop.service.SeckillProductService;

@Service
public class SeckillProductServiceImpl extends BaseServiceImpl<SeckillProduct, Integer>
									implements SeckillProductService{

	@Resource
	public void setBaseDao(SeckillProductDao seckillproductDao){
		super.setBaseDao(seckillproductDao);
	}
}
