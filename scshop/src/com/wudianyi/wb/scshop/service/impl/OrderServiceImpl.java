package com.wudianyi.wb.scshop.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wudianyi.wb.scshop.dao.OrderDao;
import com.wudianyi.wb.scshop.entity.Order;
import com.wudianyi.wb.scshop.service.OrderService;

@Service
public class OrderServiceImpl extends BaseServiceImpl<Order, String> implements
		OrderService {
	@Resource
	private OrderDao orderDao;

	@Resource
	public void setBaseDao(OrderDao orderDao) {
		super.setBaseDao(orderDao);
	}

	@Override
	public int isUserJoinPromotions(Integer userid, Integer productid) {
		// TODO Auto-generated method stub
		return orderDao.isUserJoinPromotions(userid, productid);
	}

}
