package com.wudianyi.wb.scshop.service;

import java.util.List;

import com.wudianyi.wb.scshop.entity.OrderItem;
import com.wudianyi.wb.scshop.entity.UserCoupon;

public interface UserCouponService extends BaseService<UserCoupon, String> {

	/**
	 * 用户支付后，是否满足赠送优惠券的条件
	 * 
	 * @param items
	 * @param shopid
	 */
	public void saveCouponToUser(List<OrderItem> items, int shopid,
			Integer userid, String orderid, String shopname);

	/**
	 * 得到用户可以用的优惠券
	 * 
	 * @param items
	 *            订单项
	 * @param shopid
	 *            商店ID
	 * @param userid
	 *            用户id
	 * @return 返回可用的所有优惠券根据优惠的价格排序，越大的价格越靠前
	 */
	public List<UserCoupon> getUserAvailableCoupon(List<OrderItem> items,
			int shopid, Integer userid, double allmoney);

}
