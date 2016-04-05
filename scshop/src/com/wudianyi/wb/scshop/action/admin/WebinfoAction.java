package com.wudianyi.wb.scshop.action.admin;

import java.util.Date;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.ParentPackage;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.entity.Coupon;
import com.wudianyi.wb.scshop.entity.WebInfo;
import com.wudianyi.wb.scshop.service.CouponService;
import com.wudianyi.wb.scshop.service.WebInfoService;

@ParentPackage("admin")
public class WebinfoAction extends BaseAction {

	@Resource
	private WebInfoService webInfoService;

	@Resource
	private CouponService couponService;

	@Override
	public String execute() throws Exception {

		WebInfo info = webInfoService.get(Const.WEBINFO_ID);
		setAttribute("info", info);
		list = couponService.getStaticsLikeList(null, null, new QueryParam(3)
				.add("tt", 1).add("stat", 1).add("del", 0), "endDate",
				new Date().getTime(), null, null, null, "createDate", "desc");
		// TODO Auto-generated method stub
		return "webinfo";
	}
}
