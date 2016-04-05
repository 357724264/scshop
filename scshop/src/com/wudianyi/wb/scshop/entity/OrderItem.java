package com.wudianyi.wb.scshop.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import net.sf.json.JSONObject;

import org.hibernate.annotations.GenericGenerator;

import com.wudianyi.wb.scshop.util.StringUtils;

/*
 * 订单下各商品
 */
@Entity
@Table(name = "scshop_orderitem")
public class OrderItem implements Serializable {
	private static final long serialVersionUID = 1L;
	private String id;
	private String orderid;// 对应的订单id
	private int productid;// 对应的产品编号
	private String sku;
	private String productinfo;// 对应的产品信息{pic,name}
	private long createdate;// 创建时间
	private double price;// 价格
	private int num;// 数量
	private String model;// 规格
	private int shopid;// 商店id
	private int subproductid;// 准确的产品id
	private Integer flevel;// 网站一级分类
	private Integer slevel;// 网站二级分类
	private Integer brandid;// 网站品牌
	private Integer shopFlevel;// 店铺一级
	private Integer shopSlevel;// 店铺二级分类

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

	public String getOrderid() {
		return orderid;
	}

	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}

	public int getProductid() {
		return productid;
	}

	public void setProductid(int productid) {
		this.productid = productid;
	}

	public String getProductinfo() {
		return productinfo;
	}

	public void setProductinfo(String productinfo) {
		this.productinfo = productinfo;
	}

	public long getCreatedate() {
		return createdate;
	}

	public void setCreatedate(long createdate) {
		this.createdate = createdate;
	}

	@Column(scale = 2)
	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public int getShopid() {
		return shopid;
	}

	public void setShopid(int shopid) {
		this.shopid = shopid;
	}

	@Transient
	public String getPic() {
		if (StringUtils.isEmpty(productinfo)) {
			return null;
		}
		JSONObject jsonObject = JSONObject.fromObject(productinfo);
		return jsonObject.getString("pic");
	}

	public int getSubproductid() {
		return subproductid;
	}

	public void setSubproductid(int subproductid) {
		this.subproductid = subproductid;
	}

	public String getSku() {
		return sku;
	}

	public void setSku(String sku) {
		this.sku = sku;
	}

	@Transient
	public String getName() {
		if (StringUtils.isEmpty(productinfo)) {
			return null;
		}
		JSONObject jsonObject = JSONObject.fromObject(productinfo);
		return jsonObject.getString("name");
	}

	public Integer getFlevel() {
		return flevel;
	}

	public void setFlevel(Integer flevel) {
		this.flevel = flevel;
	}

	public Integer getSlevel() {
		return slevel;
	}

	public void setSlevel(Integer slevel) {
		this.slevel = slevel;
	}

	public Integer getBrandid() {
		return brandid;
	}

	public void setBrandid(Integer brandid) {
		this.brandid = brandid;
	}

	@Column(name = "shopflevel")
	public Integer getShopFlevel() {
		return shopFlevel;
	}

	public void setShopFlevel(Integer shopFlevel) {
		this.shopFlevel = shopFlevel;
	}

	@Column(name = "shopslevel")
	public Integer getShopSlevel() {
		return shopSlevel;
	}

	public void setShopSlevel(Integer shopSlevel) {
		this.shopSlevel = shopSlevel;
	}

}
