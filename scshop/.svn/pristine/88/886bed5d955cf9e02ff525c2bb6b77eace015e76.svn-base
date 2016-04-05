package com.wudianyi.wb.scshop.dao.impl;

import org.springframework.stereotype.Repository;

import com.wudianyi.wb.scshop.dao.OrderDao;
import com.wudianyi.wb.scshop.entity.Order;

@Repository
public class OrderDaoImpl extends BaseDaoImpl<Order, String> implements
		OrderDao {

	@Override
	public int isUserJoinPromotions(Integer userid, Integer productid) {
		String hql = "select sum(o.pronum) from Order as o where o.userid="
				+ userid
				+ " and o.payStat>0 and o.promotions=1 and o.promotionproductid="
				+ productid;
		Object sumObj = this.getSession().createQuery(hql).uniqueResult();
		return (sumObj == null ? 0 : ((Long) sumObj).intValue());
	}

}
