package com.wudianyi.wb.scshop.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Where;

@Entity
@Table(name = "scshop_sub_product")
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class SubProduct implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private int productid;// Proudct的id，标识该商品是什么
	private String name;// 具体规格的名称，如:红色，绿色，39码等
	private Double price; // 原价
	private Integer count; // 销售量
	private Integer inventory; // 库存
	@Column(name = "agentpricetable")
	private String agentPriceTable; // 代理购买的价格列表，用Json字符串保存
									// {"agentid":"price",...}
	private String sku;// 商品编号
	private String logo;// 图片
	private int shopid;
	@Transient
	private Double displayPrice;
	@OneToMany(mappedBy = "subProduct", cascade = { CascadeType.REMOVE })
	@OrderBy(value = "id")
	@Where(clause = "del=0")
	private Set<SubProduct> downList = new HashSet<SubProduct>();
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "parentid")
	private SubProduct subProduct;
	private int nodeid;// 0为一级规格 1为二级规格
	@Column(name = "fullname")
	private String fullName; // 产品全名称，例如:苹果ip4 黑色 32G
	@Column(name = "maxpurchasequantity")
	private int maxPurchaseQuantity; // 最大购买量
	@Column(name = "minpurchasequantity")
	private int minPurchaseQuantity; // 最少购买量

	@Column(name = "seckillnum")
	private Integer seckillNum;//可秒杀(限时购)的数量
	@Column(name = "seckillprice")
	private Double seckillPrice; //限时购价格
	private Integer del;

	public Double getDisplayPrice() {
		if (displayPrice == null || displayPrice == 0) {
			return price;
		}
		return displayPrice;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public Integer getInventory() {
		return inventory;
	}

	public void setInventory(Integer inventory) {
		this.inventory = inventory;
	}

	public String getAgentPriceTable() {
		return agentPriceTable;
	}

	public void setAgentPriceTable(String agentPriceTable) {
		this.agentPriceTable = agentPriceTable;
	}

	public String getSku() {
		return sku;
	}

	public void setSku(String sku) {
		this.sku = sku;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public void setDisplayPrice(Double displayPrice) {
		this.displayPrice = displayPrice;
	}

	public int getProductid() {
		return productid;
	}

	public void setProductid(int productid) {
		this.productid = productid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getShopid() {
		return shopid;
	}

	public void setShopid(int shopid) {
		this.shopid = shopid;
	}

	public Set<SubProduct> getDownList() {
		return downList;
	}

	public void setDownList(Set<SubProduct> downList) {
		this.downList = downList;
	}

	public SubProduct getSubProduct() {
		return subProduct;
	}

	public void setSubProduct(SubProduct subProduct) {
		this.subProduct = subProduct;
	}

	public int getNodeid() {
		return nodeid;
	}

	public void setNodeid(int nodeid) {
		this.nodeid = nodeid;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public int getMaxPurchaseQuantity() {
		return maxPurchaseQuantity;
	}

	public void setMaxPurchaseQuantity(int maxPurchaseQuantity) {
		this.maxPurchaseQuantity = maxPurchaseQuantity;
	}

	public int getMinPurchaseQuantity() {
		return minPurchaseQuantity;
	}

	public void setMinPurchaseQuantity(int minPurchaseQuantity) {
		this.minPurchaseQuantity = minPurchaseQuantity;
	}

	public Integer getSeckillNum() {
		return seckillNum;
	}

	public void setSeckillNum(Integer seckillNum) {
		this.seckillNum = seckillNum;
	}

	public Double getSeckillPrice() {
		return seckillPrice;
	}

	public void setSeckillPrice(Double seckillPrice) {
		this.seckillPrice = seckillPrice;
	}

	public Integer getDel() {
		return del;
	}

	public void setDel(Integer del) {
		this.del = del;
	}
	
	
	
	
	
}
