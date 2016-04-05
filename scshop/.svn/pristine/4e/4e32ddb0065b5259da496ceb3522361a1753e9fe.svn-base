package com.wudianyi.wb.scshop.service.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.dao.UserCouponDao;
import com.wudianyi.wb.scshop.entity.Coupon;
import com.wudianyi.wb.scshop.entity.OrderItem;
import com.wudianyi.wb.scshop.entity.UserCoupon;
import com.wudianyi.wb.scshop.service.CouponService;
import com.wudianyi.wb.scshop.service.UserCouponService;
import com.wudianyi.wb.scshop.util.StringUtils;

@Service
public class UserCouponServiceImpl extends BaseServiceImpl<UserCoupon, String>
		implements UserCouponService {

	@Resource
	private CouponService couponService;
	@Resource
	private UserCouponDao userCouponDao;

	@Resource
	public void setBaseDao(UserCouponDao userCouponDao) {
		super.setBaseDao(userCouponDao);
	}

	@Override
	public void saveCouponToUser(List<OrderItem> items, int shopid,
			Integer userid, String orderid, String shopname) {
		// 找出所有没有下架切是满送的优惠券
		List<Coupon> coupons = couponService.getStaticsLikeList(
				null,
				null,
				new QueryParam(4).add("shopid", shopid).add("howtoget", 1)
						.add("del", 0).add("stat", 0), "endDate",
				new Date().getTime(), null, null, null, null, null);
		// 整理分类
		// 先整理出所有的分类(分类id，总金额)
		Map<Integer, Double> levelMap = new HashMap<Integer, Double>();
		Map<Integer, Double> brandMap = new HashMap<Integer, Double>();
		for (OrderItem item : items) {
			double nowmoney = item.getPrice() * item.getNum();
			double brandmoney = nowmoney;
			// 整理所有的品牌
			if (item.getBrandid() != null) {
				if (levelMap.get(item.getBrandid()) != null) {
					// 加上以前的金额
					brandmoney = nowmoney + levelMap.get(item.getBrandid());
				}
				brandMap.put(item.getBrandid(), brandmoney);
			}
			// 整理所有的品牌完毕

			// 整理所有的分类
			Integer[] levelArr = new Integer[4];
			levelArr[0] = item.getFlevel();
			levelArr[1] = item.getSlevel();
			levelArr[2] = item.getShopFlevel();
			levelArr[3] = item.getShopSlevel();
			for (Integer level : levelArr) {
				double levelmoney = nowmoney;
				if (level == null) {
					continue;
				}
				if (levelMap.get(level) != null) {
					// 加上以前的金额
					nowmoney = nowmoney + levelMap.get(level);
				}
				levelMap.put(level, levelmoney);
			}
			// 整理所有的分类完毕
			// 开始对比所有的优惠券
			for (Coupon coupon : coupons) {
				if (coupon.getBrandorclass() == null) {
					continue;
				}
				double money = 0.00;
				// 判断价格
				if (coupon.getBrandorclass().equals(0)) {
					if (StringUtils.isNumeric(coupon.getWhichEnoughid())
							&& brandMap.get(Integer.parseInt(coupon
									.getWhichEnoughid())) != null) {
						money = brandMap.get(Integer.parseInt(coupon
								.getWhichEnoughid()));
					}
				} else if (coupon.getBrandorclass().equals(1)) {
					if (StringUtils.isNumeric(coupon.getWhichEnoughid())
							&& levelMap.get(Integer.parseInt(coupon
									.getWhichEnoughid())) != null) {
						money = levelMap.get(Integer.parseInt(coupon
								.getWhichEnoughid()));
					}
				}
				if (money >= coupon.getEnoughMoney()) {
					// 判断是否已经购买足够的金额
					Long endDate = null;
					Calendar calendar = Calendar.getInstance();
					if (coupon.getEndDate() == Coupon.FOREVERY_TIME) {
						if (coupon.getDay() != -1) {
							calendar.add(Calendar.DATE, coupon.getDay());
							endDate = calendar.getTimeInMillis();
						}
					} else {
						if (coupon.getDay() != -1) {
							calendar.add(Calendar.DATE, coupon.getDay());
							endDate = calendar.getTimeInMillis();
							if (endDate > coupon.getEndDate()) {
								endDate = coupon.getEndDate();
							}
						} else {
							endDate = coupon.getEndDate();
						}

					}
					UserCoupon userCoupon = new UserCoupon(coupon.getMoney(),
							coupon.getLimitmoney(), coupon.getUserange(),
							coupon.getFavourableid(),
							coupon.getFavourablename(), endDate,
							coupon.getId(), userid, coupon.getTitle(), 0,
							orderid, shopid, shopname);
					coupon.setLeftnum(coupon.getLeftnum() > 0 ? coupon
							.getLeftnum() - 1 : 0);
					couponService.update(coupon);
					userCouponDao.save(userCoupon);
				}

			}

		}

	}

	@Override
	public List<UserCoupon> getUserAvailableCoupon(List<OrderItem> items,
			int shopid, Integer userid, double allmoney) {

		// 找出所有用户的未过期优惠券优惠券
		List<UserCoupon> coupons = userCouponDao.getStaticsLikeList(null, null,
				new QueryParam(2).add("userid", userid).add("stat", 0),
				"endDate", new Date().getTime(), null, null, null, null, null);
		System.err.println("coupons==" + coupons.size());
		List<UserCoupon> availableCoupons = new ArrayList<UserCoupon>();
		// 整理分类
		// 先整理出所有的分类(分类id，总金额)
		Map<Integer, Double> levelMap = new HashMap<Integer, Double>();
		Map<Integer, Double> brandMap = new HashMap<Integer, Double>();
		for (OrderItem item : items) {
			double nowmoney = item.getPrice() * item.getNum();
			double brandmoney = nowmoney;
			// 整理所有的品牌
			if (item.getBrandid() != null) {
				if (levelMap.get(item.getBrandid()) != null) {
					// 加上以前的金额
					brandmoney = nowmoney + levelMap.get(item.getBrandid());
				}
				System.err.println("item.getBrandid()==" + item.getBrandid());
				brandMap.put(item.getBrandid(), brandmoney);
			}
			System.err.println(brandMap.get(122));
			// 整理所有的品牌完毕

			// 整理所有的分类
			Integer[] levelArr = new Integer[4];
			levelArr[0] = item.getFlevel();
			levelArr[1] = item.getSlevel();
			levelArr[2] = item.getShopFlevel();
			levelArr[3] = item.getShopSlevel();
			for (Integer level : levelArr) {
				double levelmoney = nowmoney;
				if (level == null) {
					continue;
				}
				if (levelMap.get(level) != null) {
					// 加上以前的金额
					nowmoney = nowmoney + levelMap.get(level);
				}
				levelMap.put(level, levelmoney);
			}
		}
		for (UserCoupon userCoupon : coupons) {
			if (userCoupon.getTt() == 0 && userCoupon.getShopid() != shopid) {
				continue;
			}
			if (userCoupon.getTt() == 0) {
				if (userCoupon.getUserange() == 2) {// 分类
					if (levelMap.get(Integer.parseInt(userCoupon
							.getFavourableid())) != null) {// 判断这个分类有没有
						if (levelMap.get(Integer.parseInt(userCoupon
								.getFavourableid())) >= userCoupon
								.getLimitmoney()) {// 如果符合使用条件
							availableCoupons.add(userCoupon);
						}
					}
				} else if (userCoupon.getUserange() == 1) {
					if (brandMap.get(Integer.parseInt(userCoupon
							.getFavourableid())) != null) {// 判断这个品牌有没有
						System.err.println("you");
						if (brandMap.get(Integer.parseInt(userCoupon
								.getFavourableid())) >= userCoupon
								.getLimitmoney()) {// 如果符合使用条件
							availableCoupons.add(userCoupon);
						}
					}

				} else if (userCoupon.getUserange() == 0) {
					if (allmoney > userCoupon.getLimitmoney()) {
						availableCoupons.add(userCoupon);
					}
				}

			} else if (userCoupon.getTt() == 1) {
				if (allmoney > userCoupon.getLimitmoney()) {
					availableCoupons.add(userCoupon);
				}
			}

		}
		Collections.sort(availableCoupons, new Comparator<UserCoupon>() {
			public int compare(UserCoupon arg0, UserCoupon arg1) {
				return new Double(arg0.getMoney()).compareTo(new Double(arg1
						.getMoney()));
			}
		});
		return availableCoupons;

	}
}
