package com.wudianyi.wb.scshop.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;

import com.wudianyi.wb.scshop.util.StringUtils;

@Entity
@Table(name = "scshop_coupon")
public class Coupon implements Serializable {

	public static final long FOREVERY_TIME = 9999999999999l;

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private int num;// 发放数量
	private int leftnum;// 剩余数量
	private String name;// 优惠券名字
	private String title;// 标题
	private String content;// 优惠券详情
	private String pic;// 优惠券图片
	private int day;// 最长有效期时间
	private long createDate;
	private long endDate;// 优惠券有效期,如果是无限时间的话默认FOREVERY_TIME
	private int tt;// 优惠券类型0：商店型 1:通用券,
	private double limitmoney;// 最低消费
	private double money;// 面值
	private Integer shopid;// 店铺id
	private String shopname;//店铺名字
	private int userange;// 可使用范围 0全场1品牌 2分类 
	private String favourableid;// 优惠对应的ID
	private String favourablename;// 对应优惠项的名字
	private int del;// 0没有删除，1删除
	private int stat;// 状态，0正常，1下架
	private int howtoget;// 0:自然获得，1：满送
	private String whichEnoughid;// 满那个分类或者那个品牌的id赠送
	private Integer brandorclass;// 满品牌（0）或者分类（1）
	private String whichEnoughName;// 名字
	private Double enoughMoney;

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

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getLeftnum() {
		return leftnum;
	}

	public void setLeftnum(int leftnum) {
		this.leftnum = leftnum;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}

	@Column(name = "createdate")
	public long getCreateDate() {
		return createDate;
	}

	public void setCreateDate(long createDate) {
		this.createDate = createDate;
	}

	@Column(name = "enddate")
	public long getEndDate() {
		return endDate;
	}

	public void setEndDate(long endDate) {
		this.endDate = endDate;
	}

	public int getTt() {
		return tt;
	}

	public void setTt(int tt) {
		this.tt = tt;
	}

	public double getLimitmoney() {
		return limitmoney;
	}

	public void setLimitmoney(double limitmoney) {
		this.limitmoney = limitmoney;
	}

	public double getMoney() {
		return money;
	}

	public void setMoney(double money) {
		this.money = money;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getUserange() {
		return userange;
	}

	public void setUserange(int userange) {
		this.userange = userange;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
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

	public int getStat() {
		return stat;
	}

	public void setStat(int stat) {
		this.stat = stat;
	}

	@Transient
	public String getFirstCategory() {
		if (StringUtils.isEmpty(favourablename)) {
			return "";
		}
		return favourablename.split("\\|")[0];
	}

	@Transient
	public String getSecondCategory() {
		if (StringUtils.isEmpty(favourablename)) {
			return "";
		}
		return favourablename.split("\\|")[1];
	}

	/**
	 * 购买哪个分类送这个优惠券的第一级分类
	 * 
	 * @return
	 */
	@Transient
	public String getEfirstCategory() {
		if (StringUtils.isEmpty(whichEnoughName)) {
			return "";
		}
		return whichEnoughName.split("\\|")[0];
	}

	/**
	 * 购买哪个分类送这个优惠券的第二级分类
	 * 
	 * @return
	 */
	@Transient
	public String getEsecondCategory() {
		if (StringUtils.isEmpty(whichEnoughName)) {
			return "";
		}
		return whichEnoughName.split("\\|")[1];
	}

	@Transient
	public String getDesc() {
		String desc = "";
		if (userange == 0) {
			desc = "全商店可用";
		} else if (userange == 1) {
			desc = "品牌" + favourablename + "可用";
		} else if (userange == 2) {
			desc = "类别" + favourablename + "可用";
		}
		if (limitmoney > 0) {
			desc = desc + "[满" + limitmoney + "抵用" + money + "]";
		} else {
			desc = desc + "[直抵" + money + "]";
		}
		return desc;

	}

	public int getHowtoget() {
		return howtoget;
	}

	public void setHowtoget(int howtoget) {
		this.howtoget = howtoget;
	}

	@Column(name = "whichenoughid")
	public String getWhichEnoughid() {
		return whichEnoughid;
	}

	public void setWhichEnoughid(String whichEnoughid) {
		this.whichEnoughid = whichEnoughid;
	}

	public Integer getBrandorclass() {
		return brandorclass;
	}

	public void setBrandorclass(Integer brandorclass) {
		this.brandorclass = brandorclass;
	}

	@Column(name = "whichenoughname")
	public String getWhichEnoughName() {
		return whichEnoughName;
	}

	public void setWhichEnoughName(String whichEnoughName) {
		this.whichEnoughName = whichEnoughName;
	}

	@Column(name = "enoughmoney")
	public Double getEnoughMoney() {
		return enoughMoney;
	}

	public void setEnoughMoney(Double enoughMoney) {
		this.enoughMoney = enoughMoney;
	}

	public Integer getShopid() {
		return shopid;
	}

	public void setShopid(Integer shopid) {
		this.shopid = shopid;
	}

	public String getShopname() {
		return shopname;
	}

	public void setShopname(String shopname) {
		this.shopname = shopname;
	}
	
	

}
