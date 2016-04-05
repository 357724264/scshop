package com.wudianyi.wb.scshop.action.admin.json;

import javax.annotation.Resource;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.entity.WebInfo;
import com.wudianyi.wb.scshop.service.WebInfoService;

public class WebinfoAction extends BaseAction {
	@Resource
	private WebInfoService webInfoService;

	private String appid;
	private String appkey;
	private String wxno;
	private String wxsecret;
	private int point;
	private int unpay;
	private int send;
	private String couponid;
	private String user_protocol;
	private String notice;
	private String privacy;
	private String clause;
	private String appimage;//APP启动页
	private String appimage2;//APP启动页2
	private String appimage3;//APP启动页3


	public String update() {
		WebInfo info = webInfoService.get(Const.WEBINFO_ID);
		info.setAppid(appid);
		info.setAppkey(appkey);
		info.setDayNoPaySure(send);
		info.setMinuteNoPayDelete(unpay);
		info.setPointperyuan(point);
		info.setRegistrcouponid(couponid);
		info.setWxpayno(wxno);
		info.setWxpaySecret(wxsecret);
		info.setUser_protocol(user_protocol);
		info.setNotice(notice);		
		info.setPrivacy(privacy);
		info.setClause(clause);
		info.setAppimage(appimage);
		info.setAppimage2(appimage2);
		info.setAppimage3(appimage3);
		webInfoService.update(info);
		return ajaxJsonSuccessMessage("webinfo.action");
	}

	public String getAppid() {
		return appid;
	}

	public void setAppid(String appid) {
		this.appid = appid;
	}

	public String getAppkey() {
		return appkey;
	}

	public void setAppkey(String appkey) {
		this.appkey = appkey;
	}

	public String getWxno() {
		return wxno;
	}

	public void setWxno(String wxno) {
		this.wxno = wxno;
	}

	public String getWxsecret() {
		return wxsecret;
	}

	public void setWxsecret(String wxsecret) {
		this.wxsecret = wxsecret;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getUnpay() {
		return unpay;
	}

	public void setUnpay(int unpay) {
		this.unpay = unpay;
	}

	public int getSend() {
		return send;
	}

	public void setSend(int send) {
		this.send = send;
	}

	public String getCouponid() {
		return couponid;
	}

	public void setCouponid(String couponid) {
		this.couponid = couponid;
	}
	
	public String getUser_protocol() {
		return user_protocol;
	}

	public void setUser_protocol(String user_protocol) {
		this.user_protocol = user_protocol;
	}

	public String getNotice() {
		return notice;
	}

	public void setNotice(String notice) {
		this.notice = notice;
	}
	
	public String getPrivacy() {
		return privacy;
	}

	public void setPrivacy(String privacy) {
		this.privacy = privacy;
	}

	public String getClause() {
		return clause;
	}

	public void setClause(String clause) {
		this.clause = clause;
	}

	public String getAppimage() {
		return appimage;
	}

	public void setAppimage(String appimage) {
		this.appimage = appimage;
	}

	public String getAppimage2() {
		return appimage2;
	}

	public void setAppimage2(String appimage2) {
		this.appimage2 = appimage2;
	}

	public String getAppimage3() {
		return appimage3;
	}

	public void setAppimage3(String appimage3) {
		this.appimage3 = appimage3;
	}


}
