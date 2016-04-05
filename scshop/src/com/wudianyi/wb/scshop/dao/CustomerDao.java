package com.wudianyi.wb.scshop.dao;

import java.util.List;

import com.wudianyi.wb.scshop.entity.Customer;

public interface CustomerDao extends BaseDao<Customer, Integer> {

	/**
	 * 根据一串ID号码找出所有的用户
	 * 
	 * @param ids
	 *            数组
	 * @return
	 */
	public List<Customer> getbyids(Integer[] ids);

}
