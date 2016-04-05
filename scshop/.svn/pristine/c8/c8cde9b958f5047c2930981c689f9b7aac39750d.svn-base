package com.wudianyi.wb.scshop.dao.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.wudianyi.wb.scshop.dao.ProductDao;
import com.wudianyi.wb.scshop.entity.Product;

@Repository
public class ProductDaoImpl extends BaseDaoImpl<Product, Integer> implements
		ProductDao {

	@Override
	public int getPromotionalCount(int shopid) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(Product.class);
		Criteria criteria = detachedCriteria
				.getExecutableCriteria(getSession());

		criteria.add(Restrictions.eq("shopid", shopid));
		criteria.add(Restrictions.eq("del", 0));
		criteria.add(Restrictions.ne("productType", 0));
		criteria.add(Restrictions.gt("endTime", new Date().getTime()));
		Object count = criteria.setProjection(Projections.rowCount())
				.uniqueResult();
		return count == null ? 0 : (Integer) count;
	}

	@Override
	public List<Product> getPromotionalList(int shopid, Integer start,
			Integer limit) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(Product.class);
		Criteria criteria = detachedCriteria
				.getExecutableCriteria(getSession());

		criteria.add(Restrictions.eq("shopid", shopid));
		criteria.add(Restrictions.eq("del", 0));
		criteria.add(Restrictions.ne("productType", 0));
		criteria.add(Restrictions.gt("endTime", new Date().getTime()));
		if (start != null && limit != null) {
			criteria.setFirstResult(start);
			criteria.setMaxResults(limit);
		}
		return criteria.list();
	}

}
