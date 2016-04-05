package com.wudianyi.wb.scshop.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.wudianyi.wb.scshop.dao.CustomerDao;
import com.wudianyi.wb.scshop.entity.Customer;

@Repository
public class CustomerDaoImpl extends BaseDaoImpl<Customer, Integer> implements
		CustomerDao {

	@Override
	public List<Customer> getbyids(Integer[] ids) {
		String hql = "from Customer c where c.id in (:ids)";
		return this.getSession().createQuery(hql).setParameterList("ids", ids)
				.list();
	}
}
