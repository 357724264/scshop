package com.wudianyi.wb.scshop.dao.impl;

import org.springframework.stereotype.Repository;

import com.wudianyi.wb.scshop.dao.CartDao;
import com.wudianyi.wb.scshop.entity.Cart;

@Repository
public class CartDaoImpl extends BaseDaoImpl<Cart, String> implements CartDao {

	public int getCartNum(Integer userid, String sessionid) {
		String hql = "select sum(c.num) from Cart c where";
		if (userid != null) {
			hql += " c.userid=" + userid.intValue();
		} else {
			hql += " c.sessionid='" + sessionid + "'";
		}
		Object obj = getSession().createQuery(hql).uniqueResult();
		return obj==null?0:((Long)obj).intValue();
	}
}
