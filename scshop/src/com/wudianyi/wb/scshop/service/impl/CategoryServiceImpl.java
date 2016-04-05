package com.wudianyi.wb.scshop.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wudianyi.wb.scshop.dao.CategoryDao;
import com.wudianyi.wb.scshop.entity.Category;
import com.wudianyi.wb.scshop.service.CategoryService;

@Service
public class CategoryServiceImpl extends BaseServiceImpl<Category, Integer> implements CategoryService{

	@Resource
	public void setBaseDao(CategoryDao categoryDao) {
		
		super.setBaseDao(categoryDao);
	}
	
	
	
}
