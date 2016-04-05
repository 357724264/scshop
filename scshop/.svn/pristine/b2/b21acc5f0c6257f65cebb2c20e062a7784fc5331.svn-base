package com.wudianyi.wb.scshop.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**
 * 用户优惠券
 * 
 * @author rhett
 * 
 */
@Entity
@Table(name = "scshop_usercoupon")
public class UserCoupon implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private double money;// 面值
	private double limitmoney;// 多少可用
	private int userange;// 可使用范围 0分类 1品牌 2全场
	private String favourableid;// 优惠对应的ID
	private String favourablename;// 对应优惠项的名字
	private long endDate;// 使用有效期
	private String couponid;// 优惠券id
	private int userid;// 用户id
	private String title;// 优惠券标题
	private Long useDate;// 使用日期
	private int tt;// 优惠券类型0：商店型 1:通用券
	private String orderid;// 使用对应的订单ID
	private int stat;// 使用状态-1:锁定 0:没使用。1使用了
	private long createDate;// 领取时间
	private String shopname;// 店名
	private int shopid;// 店ID

	public UserCoupon() {
		// TODO Auto-generated constructor stub
	}

	public UserCoupon(double money, double limitmoney, int userange,
			String favourableid, String favourablename, long endDate,
			String couponid, int userid, String title, int tt, String orderid,
			int shopid, String shopname) {
		super();
		this.money = money;
		this.limitmoney = limitmoney;
		this.userange = userange;
		this.favourableid = favourableid;
		this.favourablename = favourablename;
		this.endDate = endDate;
		this.couponid = couponid;
		this.userid = userid;
		this.title = title;
		this.orderid = orderid;
		this.shopid = shopid;
		this.shopname = shopname;
		this.tt = tt;
		this.stat = 0;
		this.createDate = new Date().getTime();
	}

	@Id
	@Column(length = 32, nullable = true)
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public double getMoney() {
		return money;
	}

	public void setMoney(double money) {
		this.money = money;
	}

	public double getLimitmoney() {
		return limitmoney;
	}

	public void setLimitmoney(double limitmoney) {
		this.limitmoney = limitmoney;
	}

	public int getUserange() {
		return userange;
	}

	public void setUserange(int userange) {
		this.userange = userange;
	}

	public String getFavourableid() {
		return favourableid;
	}

	public void setFavourableid(String favourableid) {
		this.favourableid = favourableid;
	}

	public String getFavourablename() {
		return favourablename;
	}

	public void setFavourablename(String favourablename) {
		this.favourablename = favourablename;
	}

	@Column(name = "enddate")
	public long getEndDate() {
		return endDate;
	}

	public void setEndDate(long endDate) {
		this.endDate = endDate;
	}

	public String getCouponid() {
		return couponid;
	}

	public void setCouponid(String couponid) {
		this.couponid = couponid;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "usedate")
	public Long getUseDate() {
		return useDate;
	}

	public void setUseDate(Long useDate) {
		this.useDate = useDate;
	}

	public String getOrderid() {
		return orderid;
	}

	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}

	public int getStat() {
		return stat;
	}

	public void setStat(int stat) {
		this.stat = stat;
	}

	@Column(name = "createdate")
	public long getCreateDate() {
		return createDate;
	}

	public void setCreateDate(long createDate) {
		this.createDate = createDate;
	}

	public String getShopname() {
		return shopname;
	}

	public void setShopname(String shopname) {
		this.shopname = shopname;
	}

	public int getShopid() {
		return shopid;
	}

	public void setShopid(int shopid) {
		this.shopid = shopid;
	}

	public int getTt() {
		return tt;
	}

	public void setTt(int tt) {
		this.tt = tt;
	}

}
