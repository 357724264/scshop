package com.wudianyi.wb.scshop.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.wudianyi.wb.scshop.dao.AdminDao;
import com.wudianyi.wb.scshop.entity.Admin;
import com.wudianyi.wb.scshop.entity.Customer;

@Repository
public class AdminDaoImpl extends BaseDaoImpl<Admin, Integer> implements AdminDao{
	@Override
	public List<Admin> getbyids(Integer[] ids) {
		String hql = "from Admin a where a.id in (:ids)";
		return this.getSession().createQuery(hql).setParameterList("ids", ids)
				.list();
	}
}
