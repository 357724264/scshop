package com.wudianyi.wb.scshop.quart.service;

import java.util.Date;

public interface OrderQuartService {

	public void deleteOrderWhenExpire(String orderid, Date expireTine);
	/**
	 * 当订单已经发货了，用户还没有确认，到时间自动确认
	 * @param orderid
	 * @param expireTine
	 */
	public void updateOrderWhenUnSureExpire(String orderid, Date expireTine);

}
