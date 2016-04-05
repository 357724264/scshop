package com.wudianyi.wb.scshop.service;

import com.wudianyi.wb.scshop.entity.Order;

public interface OrderService extends BaseService<Order, String> {
	/**
	 * 用户是否已经参与过该促销活动
	 * 
	 * @param userid
	 * @return
	 */
	public int isUserJoinPromotions(Integer userid, Integer productid);
}
