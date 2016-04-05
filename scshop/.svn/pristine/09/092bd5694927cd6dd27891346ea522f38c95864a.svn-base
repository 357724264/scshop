package com.wudianyi.wb.scshop.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import net.sf.json.JSONArray;

import com.wudianyi.wb.scshop.util.StringUtils;
import com.wudianyi.wb.scshop.vo.OrderItemVo;

/*
 * 订单
 */
@Entity
@Table(name = "scshop_order")
public class Order implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	private String id;
	private int del;// 是否删除 0正常，1删除,-1未创建
	private int payStat;// 支付状态 0未支付，1已支付，2已发货，3已收货，4已评论，5取消，6退款中，7已退款，-1秒杀不成功
	private long createDate;// 创建时间
	private long statOverdueTime;// 状态过期时间（当未支付时，订单取消时间。当已发货时，自动确认时间）
	private String orderSn;// 订单号
	private int shopid;
	private String shopname;// 店铺名字
	private int userid;// 购买用户ID
	private String phone;
	private String name;
	private String address;
	private String identity;// 身份证
	private double money;// 总共需要支付的金额
	private double realmoney;// 实际支付的金额
	private String itemjson;// 把order里面的item用json形式保存[{productid,name,pic,num,price}]
	private String resource;// 来自什么客户端的，微信端，app，pc端
	private int paytype;// 支付方式，微信支付，支付宝支付，银联支付等
	private String payret;// 支付后，第三方支付返回的内容
	private Long payDate;// 支付时间，可以为空
	private int point;// 使用的积分
	private double pointMoney;// 积分抵扣的金额
	private String couponid;// 使用的优惠券ID
	private double postage;// 邮费
	private String postCompany;// 快递公司
	private String carrcompanykey;// 快递公司编号
	private String postNum;// 快递编号
	private String postjson;// 快递流程，接收快递公司返回的json
	private String leavemessage;// 留言
	private String addressid;// 关联的地址id
	// 价格修改
	private Integer adminid;// 修改员id
	private Double oldmoney;// 旧价格
	private Long moneyDate;// 修改价格时间
	@Column(columnDefinition = "INTEGER default 0")
	private Integer edittime;// 修改次数
	private Integer promotions;// 是否促销单，1为促销
	private Integer pronum;// 促销数量
	private Integer promotionproductid;// 促销产品ID product
	private Integer subpromotionproductid;// 促销产品ID subproduct

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(name = "paystat")
	public int getPayStat() {
		return payStat;
	}

	public void setPayStat(int payStat) {
		this.payStat = payStat;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	@Column(name = "createdate")
	public long getCreateDate() {
		return createDate;
	}

	public void setCreateDate(long createDate) {
		this.createDate = createDate;
	}

	@Column(name = "statoverduetime")
	public long getStatOverdueTime() {
		return statOverdueTime;
	}

	public void setStatOverdueTime(long statOverdueTime) {
		this.statOverdueTime = statOverdueTime;
	}

	@Column(name = "ordersn")
	public String getOrderSn() {
		return orderSn;
	}

	public void setOrderSn(String orderSn) {
		this.orderSn = orderSn;
	}

	@Column(scale = 2)
	public double getMoney() {
		return money;
	}

	public void setMoney(double money) {
		this.money = money;
	}

	public String getItemjson() {
		return itemjson;
	}

	public void setItemjson(String itemjson) {
		this.itemjson = itemjson;
	}

	public String getResource() {
		return resource;
	}

	public void setResource(String resource) {
		this.resource = resource;
	}

	public int getPaytype() {
		return paytype;
	}

	public void setPaytype(int paytype) {
		this.paytype = paytype;
	}

	public String getPayret() {
		return payret;
	}

	public void setPayret(String payret) {
		this.payret = payret;
	}

	@Column(name = "paydate")
	public Long getPayDate() {
		return payDate;
	}

	public void setPayDate(Long payDate) {
		this.payDate = payDate;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	@Column(scale = 2, name = "pointmoney")
	public double getPointMoney() {
		return pointMoney;
	}

	public void setPointMoney(double pointMoney) {
		this.pointMoney = pointMoney;
	}

	public String getCouponid() {
		return couponid;
	}

	public void setCouponid(String couponid) {
		this.couponid = couponid;
	}

	@Column(scale = 2)
	public double getPostage() {
		return postage;
	}

	public void setPostage(double postage) {
		this.postage = postage;
	}

	@Column(name = "postcompany")
	public String getPostCompany() {
		return postCompany;
	}

	public void setPostCompany(String postCompany) {
		this.postCompany = postCompany;
	}

	@Column(name = "postnum")
	public String getPostNum() {
		return postNum;
	}

	public void setPostNum(String postNum) {
		this.postNum = postNum;
	}

	public String getPostjson() {
		return postjson;
	}

	public void setPostjson(String postjson) {
		this.postjson = postjson;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public int getShopid() {
		return shopid;
	}

	public void setShopid(int shopid) {
		this.shopid = shopid;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getLeavemessage() {
		return leavemessage;
	}

	public void setLeavemessage(String leavemessage) {
		this.leavemessage = leavemessage;
	}

	@Column(scale = 2)
	public double getRealmoney() {
		return realmoney;
	}

	public void setRealmoney(double realmoney) {
		this.realmoney = realmoney;
	}

	public String getAddressid() {
		return addressid;
	}

	public void setAddressid(String addressid) {
		this.addressid = addressid;
	}

	public String getShopname() {
		return shopname;
	}

	public void setShopname(String shopname) {
		this.shopname = shopname;
	}

	public Integer getAdminid() {
		return adminid;
	}

	public void setAdminid(Integer adminid) {
		this.adminid = adminid;
	}

	public double getOldmoney() {
		return oldmoney;
	}

	public void setOldmoney(double oldmoney) {
		this.oldmoney = oldmoney;
	}

	public Long getMoneyDate() {
		return moneyDate;
	}

	public void setMoneyDate(Long moneyDate) {
		this.moneyDate = moneyDate;
	}

	public void setOldmoney(Double oldmoney) {
		this.oldmoney = oldmoney;
	}

	public Integer getEdittime() {
		return edittime;
	}

	public void setEdittime(Integer edittime) {
		this.edittime = edittime;
	}

	public String getCarrcompanykey() {
		return carrcompanykey;
	}

	public void setCarrcompanykey(String carrcompanykey) {
		this.carrcompanykey = carrcompanykey;
	}

	public Integer getPromotions() {
		return promotions;
	}

	public void setPromotions(Integer promotions) {
		this.promotions = promotions;
	}

	public Integer getPromotionproductid() {
		return promotionproductid;
	}

	public void setPromotionproductid(Integer promotionproductid) {
		this.promotionproductid = promotionproductid;
	}

	public String getIdentity() {
		return identity;
	}

	public void setIdentity(String identity) {
		this.identity = identity;
	}

	@Transient
	public List<OrderItemVo> getOrderItems() {
		if (StringUtils.isEmpty(itemjson)) {
			return null;
		}
		return JSONArray.toList(JSONArray.fromObject(itemjson),
				OrderItemVo.class);

	}

	public Integer getSubpromotionproductid() {
		return subpromotionproductid;
	}

	public void setSubpromotionproductid(Integer subpromotionproductid) {
		this.subpromotionproductid = subpromotionproductid;
	}

	public Integer getPronum() {
		return pronum;
	}

	public void setPronum(Integer pronum) {
		this.pronum = pronum;
	}

}
