package com.wudianyi.wb.scshop.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;



/*
 * 秒杀申请表
 */
@Table
@Entity(name="scshop_seckill_product")
public class SeckillProduct {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private int shopid;//店铺id
	@Column(name = "shopname")
	private String shopName;//店铺名称
	@Column(name = "productname")
	private String productName;
	private Double postage;//邮费
	private int productid;// Proudct的id，标识该商品是什么
	@Column(name = "subproductjson")
	private String subProductJson;//一个json数组，记录具体商品的一些秒杀信息
								//格式为[{'id','1','sku':'A123','name':'XL','seckillNum':'100','flashSalePrice','50'},..]
	@Column(name = "producttype")
	private Integer productType;//1为秒杀 2为限时购 
	@Column(name = "begintime")
	private Long beginTime;//促销开始时间
	@Column(name = "endtime")
	private Long endTime;//促销结束时间
	private String remark;//备注，申请简述
	@Column(name = "createtime")
	private Long createTime;//申请时间
	private int stat; // -1为审核不通过 0为审核中 1为审核通过 2为取消
	@Column(name = "rejectreason")
	private String rejectReason; // 审核不通过的原因
	@Column(name = "audittime")
	private Long auditTime;//审核时间
	@Column(name = "cancelreason")
	private String cancelReason; //取消理由
	@Column(name = "canceltime")
	private Long cancelTime; //取消的时间
	private Integer num;//限购数量
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getShopid() {
		return shopid;
	}
	public void setShopid(int shopid) {
		this.shopid = shopid;
	}
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	public int getProductid() {
		return productid;
	}
	public void setProductid(int productid) {
		this.productid = productid;
	}
	public String getSubProductJson() {
		return subProductJson;
	}
	public void setSubProductJson(String subProductJson) {
		this.subProductJson = subProductJson;
	}
	public Long getBeginTime() {
		return beginTime;
	}
	public void setBeginTime(Long beginTime) {
		this.beginTime = beginTime;
	}
	public Long getEndTime() {
		return endTime;
	}
	public void setEndTime(Long endTime) {
		this.endTime = endTime;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Long getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Long createTime) {
		this.createTime = createTime;
	}
	public int getStat() {
		return stat;
	}
	public void setStat(int stat) {
		this.stat = stat;
	}
	public String getRejectReason() {
		return rejectReason;
	}
	public void setRejectReason(String rejectReason) {
		this.rejectReason = rejectReason;
	}
	public Long getAuditTime() {
		return auditTime;
	}
	public void setAuditTime(Long auditTime) {
		this.auditTime = auditTime;
	}
	public Integer getProductType() {
		return productType;
	}
	public void setProductType(Integer productType) {
		this.productType = productType;
	}
	public Double getPostage() {
		return postage;
	}
	public void setPostage(Double postage) {
		this.postage = postage;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getCancelReason() {
		return cancelReason;
	}
	public void setCancelReason(String cancelReason) {
		this.cancelReason = cancelReason;
	}
	public Long getCancelTime() {
		return cancelTime;
	}
	public void setCancelTime(Long cancelTime) {
		this.cancelTime = cancelTime;
	}
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	
	
}
