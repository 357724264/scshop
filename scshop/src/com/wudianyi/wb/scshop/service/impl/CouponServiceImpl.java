package com.wudianyi.wb.scshop.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wudianyi.wb.scshop.dao.CouponDao;
import com.wudianyi.wb.scshop.entity.Coupon;
import com.wudianyi.wb.scshop.service.CouponService;

@Service
public class CouponServiceImpl extends BaseServiceImpl<Coupon, String>
		implements CouponService {

	@Resource
	public void setBaseDao(CouponDao couponDao) {
		super.setBaseDao(couponDao);
	}
}
