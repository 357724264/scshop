package com.wudianyi.wb.scshop.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "scshop_webinfo")
public class WebInfo implements Serializable {

	private static final long serialVersionUID = 1L;

	public static int[] DAY_POINTS = new int[] { 5, 10, 15, 20, 30 };
	private String id;
	private String wxpayno;
	private String appid;
	private String appkey;
	private String wxpaySecret;
	private int pointperyuan;// 多少积分换一块钱
	private int minuteNoPayDelete;// 多少分钟不支付自动删除订单
	private Integer seckillminuteNoPayDelete;// 秒杀多少分钟不支付自动删除订单
	private int dayNoPaySure;// 多少个小时没有确认订单自动确认收货
	private int commentjf;// 评论后可以得到的积分
	private int earnestlycommentjf;// 认真评论后增加的积分
	private String registrcouponid;// 注册赠送的优惠券
	private String user_protocol;//用户协议
	private String notice;//供应商须知
	private String privacy;//客户隐私政策
	private String clause;//条款和条件
	

	public static void main(String[] args) {
		for (int last = 0; last < 20; last++) {
			int getpoint = WebInfo.DAY_POINTS[last % WebInfo.DAY_POINTS.length];
			System.err.println(last + ":" + getpoint);
		}

	}

	@Id
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getWxpayno() {
		return wxpayno;
	}

	public void setWxpayno(String wxpayno) {
		this.wxpayno = wxpayno;
	}

	@Column(name = "wxpaysecret")
	public String getWxpaySecret() {
		return wxpaySecret;
	}

	public void setWxpaySecret(String wxpaySecret) {
		this.wxpaySecret = wxpaySecret;
	}

	public String getAppid() {
		return appid;
	}

	public void setAppid(String appid) {
		this.appid = appid;
	}

	public int getPointperyuan() {
		return pointperyuan;
	}

	public void setPointperyuan(int pointperyuan) {
		this.pointperyuan = pointperyuan;
	}

	public String getAppkey() {
		return appkey;
	}

	public void setAppkey(String appkey) {
		this.appkey = appkey;
	}

	@Column(name = "minutnopaydelete")
	public int getMinuteNoPayDelete() {
		return minuteNoPayDelete;
	}

	public void setMinuteNoPayDelete(int minuteNoPayDelete) {
		this.minuteNoPayDelete = minuteNoPayDelete;
	}

	@Column(name = "daynosure")
	public int getDayNoPaySure() {
		return dayNoPaySure;
	}

	public void setDayNoPaySure(int dayNoPaySure) {
		this.dayNoPaySure = dayNoPaySure;
	}

	public int getCommentjf() {
		return commentjf;
	}

	public void setCommentjf(int commentjf) {
		this.commentjf = commentjf;
	}

	public int getEarnestlycommentjf() {
		return earnestlycommentjf;
	}

	public void setEarnestlycommentjf(int earnestlycommentjf) {
		this.earnestlycommentjf = earnestlycommentjf;
	}

	public String getRegistrcouponid() {
		return registrcouponid;
	}

	public void setRegistrcouponid(String registrcouponid) {
		this.registrcouponid = registrcouponid;
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

	public Integer getSeckillminuteNoPayDelete() {
		return seckillminuteNoPayDelete;
	}

	public void setSeckillminuteNoPayDelete(Integer seckillminuteNoPayDelete) {
		this.seckillminuteNoPayDelete = seckillminuteNoPayDelete;
	}

	
}
