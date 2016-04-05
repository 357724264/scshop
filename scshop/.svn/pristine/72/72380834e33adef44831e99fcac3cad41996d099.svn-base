package com.wudianyi.wb.scshop.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.wudianyi.wb.scshop.util.StringUtils;

@Entity
@Table(name = "scshop_product")
public class Product implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private String name;
	private int stat; // 0表示上架 1表示草稿 -1表示下架
	private int del; // 0表示正常 1表示删除
	private String pics; // 图片集
	private String cover; // 封面
	private Integer shopid;
	@Column(name = "shopname")
	private String shopName; // 商家名称
	private Integer brandid;
	@Column(name = "brandname")
	private String brandName; // 品牌名字
	private String intro;// 简介
	@Column(name = "htmldesc")
	private String htmlDesc; // 详细描述
	private String weight; // 重量
	private String volumn; // 体积
	@Column(name = "displayorder")
	private Integer displayOrder; // 用于排序
	private Double freight; // 运费
	private Integer flevel; // 一级分类id
	private Integer slevel; // 二级分类id
	@Column(name = "hotsale")
	private int hotSale; // 0为一般商品 1为热销商品(显示在首页)
	private Integer countryid;// 国家ID
	private String country; // 国家名字
	@Column(name = "countryicon")
	private String countryIcon; // 国家图标
	private String unit; // 单位
	private Double score; // 评分
	private Integer count;// 总销售量
	@Column(name = "topprice")
	private Double topPrice;// 最高价格
	@Column(name = "bottomprice")
	private Double bottomPrice;// 最低价格
	@Column(name = "firstspecname")
	private String firstSpecName;// 一级规格名称，如颜色,型号等
	@Column(name = "secondspecname")
	private String secondSpecName;// 二级规格名称
	@Column(name = "indicativeprice")
	private Double indicativePrice;// 参考价格;
	private Long modifydate;// 修改时间
	private String skus;// 所有产品下面的产品的sku集合，用逗号隔开
	@Column(name = "shopflevel")
	private Integer shopFlevel;// 商家一级分类
	@Column(name = "shopslevel")
	private Integer shopSlevel;// 商家二级分类
	private int goodnum;// 5分
	private int middlenum;// 3分或者4分
	private int badnum;// 1分或者两分
	@Column(name = "shophotsale")
	private Integer shopHotSale;// 店内热销商品
	@Column(name = "producttype")
	private Integer productType;// 商品类型：空或0是普通商品,1是秒杀商品，为2是限时购商品
	private Double postage;// 邮费
	@Column(name = "begintime")
	private Long beginTime;// 秒杀(限时购)开始时间
	@Column(name = "endtime")
	private Long endTime;// 限时购结束时间
	@Column(name = "seckillbottomprice")
	private Double seckillBottomPrice;// 秒杀最低价
	private String promotionsjson;//促销信息json {subproductid:seckillnum}
	private Integer seckillnum;//秒杀产品剩余总数量
	private Integer prolimintnum;//促销限购数量
	
	/*
	  * 初始化为没有促销活动时的状态
	 */
	public Product init() {
		this.setSeckillBottomPrice(null);
		this.setBeginTime(null);
		this.setEndTime(null);
		this.setSeckillnum(null);
		this.setProlimintnum(null);
		this.setPromotionsjson(null);
		this.setProductType(0);
		this.setPostage(null);
		return this;
	}

	@Transient
	public List<String> getImageList() {

		if (StringUtils.isEmpty(pics)) {

			return null;
		}
		// 去除空的照片地址，保持前端页面整洁
		List<String> imageList = new ArrayList<String>();
		String[] strList = pics.split(",");
		for (int i = 0; i < strList.length; i++) {
			if (!"".equals(strList[i].trim())) {
				imageList.add(strList[i]);
			}
		}
		return imageList;
	}
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getStat() {
		return stat;
	}

	public void setStat(int stat) {
		this.stat = stat;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	public String getPics() {
		return pics;
	}

	public void setPics(String pics) {
		this.pics = pics;
	}

	public String getCover() {
		return cover;
	}

	public void setCover(String cover) {
		this.cover = cover;
	}

	public Integer getShopid() {
		return shopid;
	}

	public void setShopid(Integer shopid) {
		this.shopid = shopid;
	}

	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public Integer getBrandid() {
		return brandid;
	}

	public void setBrandid(Integer brandid) {
		this.brandid = brandid;
	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getHtmlDesc() {
		return htmlDesc;
	}

	public void setHtmlDesc(String htmlDesc) {
		this.htmlDesc = htmlDesc;
	}

	public String getWeight() {
		return weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}

	public String getVolumn() {
		return volumn;
	}

	public void setVolumn(String volumn) {
		this.volumn = volumn;
	}

	public Integer getDisplayOrder() {
		return displayOrder;
	}

	public void setDisplayOrder(Integer displayOrder) {
		this.displayOrder = displayOrder;
	}

	public Double getFreight() {
		return freight;
	}

	public void setFreight(Double freight) {
		this.freight = freight;
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

	public int getHotSale() {
		return hotSale;
	}

	public void setHotSale(int hotSale) {
		this.hotSale = hotSale;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getCountryIcon() {
		return countryIcon;
	}

	public void setCountryIcon(String countryIcon) {
		this.countryIcon = countryIcon;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public Double getScore() {
		return score;
	}

	public void setScore(Double score) {
		this.score = score;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public Double getTopPrice() {
		return topPrice;
	}

	public void setTopPrice(Double topPrice) {
		this.topPrice = topPrice;
	}

	public Double getBottomPrice() {
		return bottomPrice;
	}

	public void setBottomPrice(Double bottomPrice) {
		this.bottomPrice = bottomPrice;
	}

	public String getFirstSpecName() {
		return firstSpecName;
	}

	public void setFirstSpecName(String firstSpecName) {
		this.firstSpecName = firstSpecName;
	}

	public String getSecondSpecName() {
		return secondSpecName;
	}

	public void setSecondSpecName(String secondSpecName) {
		this.secondSpecName = secondSpecName;
	}

	public Double getIndicativePrice() {
		return indicativePrice;
	}

	public void setIndicativePrice(Double indicativePrice) {
		this.indicativePrice = indicativePrice;
	}

	public String getSkus() {
		return skus;
	}

	public void setSkus(String skus) {
		this.skus = skus;
	}

	public Long getModifydate() {
		return modifydate;
	}

	public void setModifydate(Long modifydate) {
		this.modifydate = modifydate;
	}

	public Integer getShopFlevel() {
		return shopFlevel;
	}

	public void setShopFlevel(Integer shopFlevel) {
		this.shopFlevel = shopFlevel;
	}

	public Integer getShopSlevel() {
		return shopSlevel;
	}

	public void setShopSlevel(Integer shopSlevel) {
		this.shopSlevel = shopSlevel;
	}

	public int getGoodnum() {
		return goodnum;
	}

	public void setGoodnum(int goodnum) {
		this.goodnum = goodnum;
	}

	public int getMiddlenum() {
		return middlenum;
	}

	public void setMiddlenum(int middlenum) {
		this.middlenum = middlenum;
	}

	public int getBadnum() {
		return badnum;
	}

	public void setBadnum(int badnum) {
		this.badnum = badnum;
	}

	public Integer getProductType() {
		return productType;
	}

	public void setProductType(Integer productType) {
		this.productType = productType;
	}

	public Integer getShopHotSale() {
		return shopHotSale;
	}

	public void setShopHotSale(Integer shopHotSale) {
		this.shopHotSale = shopHotSale;
	}

	public Double getPostage() {
		return postage;
	}

	public void setPostage(Double postage) {
		this.postage = postage;
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

	public Double getSeckillBottomPrice() {
		return seckillBottomPrice;
	}

	public void setSeckillBottomPrice(Double seckillBottomPrice) {
		this.seckillBottomPrice = seckillBottomPrice;
	}

	public Integer getCountryid() {
		return countryid;
	}

	public void setCountryid(Integer countryid) {
		this.countryid = countryid;
	}

	public String getPromotionsjson() {
		return promotionsjson;
	}

	public void setPromotionsjson(String promotionsjson) {
		this.promotionsjson = promotionsjson;
	}

	public Integer getSeckillnum() {
		return seckillnum;
	}

	public void setSeckillnum(Integer seckillnum) {
		this.seckillnum = seckillnum;
	}

	public Integer getProlimintnum() {
		return prolimintnum;
	}

	public void setProlimintnum(Integer prolimintnum) {
		this.prolimintnum = prolimintnum;
	}

}
