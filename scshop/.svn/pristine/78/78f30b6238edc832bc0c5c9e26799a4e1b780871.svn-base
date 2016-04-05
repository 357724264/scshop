package com.wudianyi.wb.scshop.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Table
@Entity(name = "scshop_shop_form")
public class ShopForm implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	@Column(name = "shopname")
	private String shopName; // 店名
	private String account; // 账号
	private String password;//密码
	@Column(name = "contactsname")
	private String contactsName;//联系人
	private String phone; // 手机号码
	private String email;//邮箱
	private String companyname;//公司名称
	private String registernum;//营业执照注册号
	private String commoditycatagory;//计划入驻商品类别
	private String agent;//是否有品牌代理  true/false
	private String link;//其他供应渠道连接
	private String postcode;//邮编
	@Column(name = "contactsphone")
	private String contactsPhone;//联系电话
	@Column(name = "contactspeople")
	private String contactsPeople;//联系人
	private String logo; // 商店图标
	private String license; // 营业执照(多张图片)
	private String idnum;//法人身份证
	private String description; // 店铺描述
	@Column(name = "idcardimages")
	private String idcardImages;//身份证图片
	@Column(name = "enterpriseimages")
	private String enterpriseImages;//企业证书图片
	@Column(name = "agentimages")
	private String agentImages;//相关资质证件
	private String assessor;//审核员
	private int stat; // -1为审核不通过 0为审核中 1为审核通过
	@Column(name = "rejectreason")
	private String rejectReason; // 审核不通过的原因
	@Column(name = "createtime")
	private Long createTime;//审核日期
	@Column(name = "inlandaddress")
	private String inlandAddress;//国内售后联系地址

	public String getAssessor() {
		return assessor;
	}

	public void setAssessor(String assessor) {
		this.assessor = assessor;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public String getLicense() {
		return license;
	}

	public void setLicense(String license) {
		this.license = license;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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

	public Long getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Long createTime) {
		this.createTime = createTime;
	}

	public String getRegisternum() {
		return registernum;
	}

	public void setRegisternum(String registernum2) {
		this.registernum = registernum2;
	}

	public String getCompanyname() {
		return companyname;
	}

	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}

	public String getIdnum() {
		return idnum;
	}

	public void setIdnum(String idnum) {
		this.idnum = idnum;
	}
    
	public String getIdcardImages() {
		return idcardImages;
	}

	public void setIdcardImages(String idcardImages) {
		this.idcardImages = idcardImages;
	}

	public String getEnterpriseImages() {
		return enterpriseImages;
	}

	public void setEnterpriseImages(String enterpriseImages) {
		this.enterpriseImages = enterpriseImages;
	}
	
	public String getEmail() {
	return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getContactsName() {
		return contactsName;
	}

	public void setContactsName(String contactsName) {
		this.contactsName = contactsName;
	}

	public String getCommoditycatagory() {
		return commoditycatagory;
	}

	public void setCommoditycatagory(String commoditycatagory) {
		this.commoditycatagory = commoditycatagory;
	}

	public String getAgent() {
		return agent;
	}

	public void setAgent(String agent) {
		this.agent = agent;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getContactsPhone() {
		return contactsPhone;
	}

	public void setContactsPhone(String contactsPhone) {
		this.contactsPhone = contactsPhone;
	}

	public String getContactsPeople() {
		return contactsPeople;
	}

	public void setContactsPeople(String contactsPeople) {
		this.contactsPeople = contactsPeople;
	}

	public String getAgentImages() {
		return agentImages;
	}

	public void setAgentImages(String agentImages) {
		this.agentImages = agentImages;
	}

	public String getInlandAddress() {
		return inlandAddress;
	}

	public void setInlandAddress(String inlandAddress) {
		this.inlandAddress = inlandAddress;
	}

}
