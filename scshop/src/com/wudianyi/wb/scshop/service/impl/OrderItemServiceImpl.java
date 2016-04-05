package com.wudianyi.wb.scshop.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wudianyi.wb.scshop.dao.OrderItemDao;
import com.wudianyi.wb.scshop.entity.OrderItem;
import com.wudianyi.wb.scshop.service.OrderItemService;

@Service
public class OrderItemServiceImpl extends BaseServiceImpl<OrderItem, String>
		implements OrderItemService {

	@Resource
	public void setBaseDao(OrderItemDao orderItemDao) {
		super.setBaseDao(orderItemDao);
	}

}
