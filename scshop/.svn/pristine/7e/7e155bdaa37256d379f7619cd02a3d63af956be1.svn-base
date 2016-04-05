package com.wudianyi.wb.scshop.action.json;

import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;
import javax.management.Query;

import org.hibernate.usertype.UserCollectionType;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.entity.Coupon;
import com.wudianyi.wb.scshop.entity.UserCoupon;
import com.wudianyi.wb.scshop.service.CouponService;
import com.wudianyi.wb.scshop.service.UserCouponService;

public class CouponAction extends BaseAction {
	@Resource
	private UserCouponService userCouponService;
	@Resource
	private CouponService couponService;

	private int tt;// 0:未使用，1：已使用，2：已过期
	private int pn;
	private String id;

	public String list() {
		Long begin = null;
		Long end = null;
		Date now = new Date();
		Integer uid = (Integer) getSession(Const.SESSION_CUSTOMER_ID);
		QueryParam params = new QueryParam();
		params.add("userid", uid);
		if (tt == 0) {
			params.add("stat", 0);
			begin = now.getTime();
		} else if (tt == 1) {
			params.add("stat", 1);
		} else if (tt == 2) {
			params.add("stat", 0);
			end = now.getTime();
		} else {
			return LIST;
		}
		list = userCouponService.getStaticsLikeList(null, null, params,
				"endDate", begin, end, Const.FRONT_PAGE_SIZE * (pn - 1),
				Const.FRONT_PAGE_SIZE, "createDate", "desc");
		return LIST;

	}

	public String receive() {
		Integer uid = (Integer) getSession(Const.SESSION_CUSTOMER_ID);
		Coupon coupon = couponService.get(id);
		if (coupon == null || coupon.getDel() != 0 || coupon.getStat() != 0
				|| coupon.getLeftnum() <= 0) {
			return ajaxJsonErrorMessage("优惠券已被领取完");
		}

		Calendar calendar = Calendar.getInstance();
		long endDate = Coupon.FOREVERY_TIME;
		if (coupon.getEndDate() != Coupon.FOREVERY_TIME) {
			if (coupon.getDay() > 0) {
				calendar.add(Calendar.DATE, coupon.getDay());
				if (calendar.getTimeInMillis() > coupon.getEndDate()) {
					endDate = coupon.getEndDate();
				}
			} else {
				endDate = coupon.getEndDate();
			}
		}
		// 判断是否已经有了这张优惠券
		int count = userCouponService.getTotalCount(
				new QueryParam(3).add("userid", uid).add("couponid", id)
						.add("stat", 0), false);
		if (count <= 0) {
			UserCoupon userCoupon = new UserCoupon(coupon.getMoney(),
					coupon.getLimitmoney(), coupon.getUserange(),
					coupon.getFavourableid(), coupon.getFavourablename(),
					endDate, coupon.getId(), uid, coupon.getName(),
					coupon.getTt(), null, coupon.getShopid(),
					coupon.getShopname());
			userCouponService.save(userCoupon);
			coupon.setLeftnum(coupon.getLeftnum() - 1);
			couponService.update(coupon);
		}

		return ajaxJsonSuccessMessage(null);
	}

	public int getTt() {
		return tt;
	}

	public void setTt(int tt) {
		this.tt = tt;
	}

	public int getPn() {
		return pn;
	}

	public void setPn(int pn) {
		this.pn = pn;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

}
