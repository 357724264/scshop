package com.wudianyi.wb.scshop.dao;

import com.wudianyi.wb.scshop.entity.Category;

public interface CategoryDao extends BaseDao<Category, Integer>{
	
	public void delCategory(int id);
	
}
