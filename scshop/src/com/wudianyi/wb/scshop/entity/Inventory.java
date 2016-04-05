package com.wudianyi.wb.scshop.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "scshop_inventory")
public class Inventory {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	private Integer upproductid;// productid
	private Integer productid;// SubProduct的id
	@Column(name = "productname")
	// SubProduct的fullName
	private String productName;
	private Integer surplus; // 剩余库存量
	@Column(name = "storagetype")
	private Integer storageType; // 出入库类型 0为入库 1为出库
	private Integer increment; // 入库数量
	private Integer decrement; // 出库数量
	@Column(name = "createdate")
	private Long createDate; // 操作的具体时间
	private Integer admin; // 操作员id
	@Column(name = "adminname")
	private String adminName; // 操作员姓名
	private String remark; // 备注
	private String sku; // 商品编号
	private Integer shopid;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getProductid() {
		return productid;
	}

	public void setProductid(Integer productid) {
		this.productid = productid;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Integer getSurplus() {
		return surplus;
	}

	public void setSurplus(Integer surplus) {
		this.surplus = surplus;
	}

	public Integer getStorageType() {
		return storageType;
	}

	public void setStorageType(Integer storageType) {
		this.storageType = storageType;
	}

	public Integer getIncrement() {
		return increment;
	}

	public void setIncrement(Integer increment) {
		this.increment = increment;
	}

	public Integer getDecrement() {
		return decrement;
	}

	public void setDecrement(Integer decrement) {
		this.decrement = decrement;
	}

	public Long getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Long createDate) {
		this.createDate = createDate;
	}

	public Integer getAdmin() {
		return admin;
	}

	public void setAdmin(Integer admin) {
		this.admin = admin;
	}

	public String getAdminName() {
		return adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getSku() {
		return sku;
	}

	public void setSku(String sku) {
		this.sku = sku;
	}

	public Integer getShopid() {
		return shopid;
	}

	public void setShopid(Integer shopid) {
		this.shopid = shopid;
	}

	public Integer getUpproductid() {
		return upproductid;
	}

	public void setUpproductid(Integer upproductid) {
		this.upproductid = upproductid;
	}

}
