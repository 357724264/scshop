package com.wudianyi.wb.scshop.service.impl;

import java.util.Calendar;
import java.util.Date;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.http.client.utils.DateUtils;
import org.springframework.stereotype.Service;
import sun.awt.geom.AreaOp.CAGOp;

import com.wudianyi.wb.scshop.dao.CustomerDao;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.entity.Coupon;
import com.wudianyi.wb.scshop.entity.Customer;
import com.wudianyi.wb.scshop.entity.Jflog;
import com.wudianyi.wb.scshop.entity.UserCoupon;
import com.wudianyi.wb.scshop.entity.WebInfo;
import com.wudianyi.wb.scshop.service.CacheService;
import com.wudianyi.wb.scshop.service.CouponService;
import com.wudianyi.wb.scshop.service.CustomerService;
import com.wudianyi.wb.scshop.service.JflogService;
import com.wudianyi.wb.scshop.service.UserCouponService;
import com.wudianyi.wb.scshop.service.WebInfoService;
import com.wudianyi.wb.scshop.util.DateUtil;
import com.wudianyi.wb.scshop.util.StringUtils;

@Service
public class CustomerServiceImpl extends BaseServiceImpl<Customer, Integer>
		implements CustomerService {
	@Resource
	private WebInfoService webInfoService;
	@Resource
	private CouponService couponService;
	@Resource
	private UserCouponService userCouponService;
	@Resource
	private CustomerDao customerDao;
	@Resource
	private JflogService jflogService;
	@Resource
	private CacheService cacheService;

	@Resource
	public void setBaseDao(CustomerDao customerDao) {
		super.setBaseDao(customerDao);
	}

	public String setUserAppToken(Integer userid) {
		String token = UUID.randomUUID().toString();
		if (userid == null) {
			return null;
		}
		cacheService.set(CacheService.APP_SESSION + token, userid,
				CacheService.CACHE_SESSION_TIME);
		return token;

	}

	public Integer getUserIdByAppToken(String token) {
		if (StringUtils.isEmpty(token)) {
			return null;
		}
		Object useridObj = cacheService.get(CacheService.APP_SESSION + token);
		if (useridObj != null) {
			return (Integer) useridObj;
		}
		return null;
	}

	@Override
	public Integer save(Customer entity) {
		int id = super.save(entity);
		// 判断要不要送优惠券
		WebInfo info = webInfoService.get(Const.WEBINFO_ID);
		if (!StringUtils.isEmpty(info.getRegistrcouponid())) {
			Coupon coupon = couponService.get(info.getRegistrcouponid());
			long endDate = Coupon.FOREVERY_TIME;
			if (coupon.getEndDate() != Coupon.FOREVERY_TIME) {
				Calendar calendar = Calendar.getInstance();
				if (coupon.getDay() > 0) {
					calendar.add(Calendar.DATE, coupon.getDay());
					if (calendar.getTimeInMillis() > coupon.getEndDate()) {
						endDate = coupon.getEndDate();
					} else {
						endDate = calendar.getTimeInMillis();
					}
				}
			}

			UserCoupon userCoupon = new UserCoupon(coupon.getMoney(),
					coupon.getLimitmoney(), coupon.getUserange(),
					coupon.getFavourableid(), coupon.getFavourablename(),
					endDate, coupon.getId(), id, coupon.getTitle(),
					coupon.getTt(), null, coupon.getShopid(),
					coupon.getShopname());
			userCouponService.save(userCoupon);
		}
		return id;
	}

	public static void main(String[] args) {
		Calendar calendar = Calendar.getInstance();
		calendar.add(Calendar.DATE, -1);
		System.err.println(calendar.getTimeInMillis());
		// long now = calendar.getTimeInMillis();
		// calendar.set(Calendar.HOUR, 5);
		// int day = DateUtil.getDateSpace(calendar.getTimeInMillis(), now);
	}

	@Override
	public Long updateUserPointForEveryDayLogin(Integer userid,
			Long lastLoginTime) {
		if (userid == null) {
			return null;
		}
		Customer customer = null;
		if (lastLoginTime == null) {
			customer = customerDao.get(userid);
			lastLoginTime = customer.getLastloginday();
		}
		long now = new Date().getTime();
		int day = DateUtil.getDateSpace(lastLoginTime, now);

		if (lastLoginTime != null && day > 0) {
			customer = customerDao.get(userid);
			lastLoginTime = customer.getLastloginday();
			day = DateUtil.getDateSpace(lastLoginTime, now);
		}

		if (day > 0) {
			int getpoint = 0;
			if (customer == null) {
				customer = customerDao.get(userid);
			}
			if (day == 1) {
				int last = customer.getLastdaynum();
				getpoint = WebInfo.DAY_POINTS[last % WebInfo.DAY_POINTS.length];
				customer.setLastdaynum(last + 1);
			} else {
				getpoint = WebInfo.DAY_POINTS[0];
				customer.setLastdaynum(1);
			}
			customer.setLastloginday(now);
			customer.setPoint(customer.getPoint() + getpoint);
			customerDao.update(customer);
			if (getpoint > 0) {
				System.err.println("gettt");
				Jflog jflog = new Jflog(userid, getpoint, 1, 2,
						((customer.getLastdaynum() - 1)
								% WebInfo.DAY_POINTS.length + 1)
								+ "");
				jflogService.save(jflog);
			}
			return now;
		}
		return now;
	}
}
