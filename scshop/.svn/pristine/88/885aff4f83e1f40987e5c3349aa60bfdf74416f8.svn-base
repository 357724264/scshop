package com.wudianyi.wb.scshop.action.admin;

import javax.annotation.Resource;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.entity.Ad;
import com.wudianyi.wb.scshop.entity.Admin;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.entity.Coupon;
import com.wudianyi.wb.scshop.service.AdminService;
import com.wudianyi.wb.scshop.service.CouponService;
import com.wudianyi.wb.scshop.util.StringUtils;

public class CouponAction extends BaseAction {
	@Resource
	private CouponService couponService;
	@Resource
	private AdminService adminService;
	private String cid;

	public String list() {
		return LIST;
	}

	public String edit() {
		Integer adminid = (Integer) getSession(
				Const.SESSION_ADMIN_NAME);
		Admin admin = adminService.get(adminid);
		setAttribute("permission", admin.getPermission());
		if (!StringUtils.isEmpty(cid)) {
			Coupon coupon = couponService.get(cid);
			setAttribute("coupon", coupon);
		}
		return INPUT;
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

}
