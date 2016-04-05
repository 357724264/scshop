package com.wudianyi.wb.scshop.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * 首页广告+导航栏
 * 
 * @author
 */
@Entity
@Table(name = "scshop_ad")
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class Ad implements Serializable {

	private static final long serialVersionUID = 1L;

	private int id;

	private String name;// 广告名
	private String images;// 广告图片
	private String url;// url
	private int num;// 0上层(轮询) 1中层(单张) 2下层(4宫格)   3导航栏
	private int isshow;// 首页是否显示 1显示 0不显
	private Integer orderbyid;// 排序
	private long createDate;// 创建日期
	private long modifyDate;// 修改日期

	@Id
	@GeneratedValue
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

	public String getImages() {
		return images;
	}

	public void setImages(String images) {
		this.images = images;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getIsshow() {
		return isshow;
	}

	public void setIsshow(int isshow) {
		this.isshow = isshow;
	}

	public Integer getOrderbyid() {
		return orderbyid;
	}

	public void setOrderbyid(Integer orderbyid) {
		this.orderbyid = orderbyid;
	}

	public long getCreateDate() {
		return createDate;
	}

	public void setCreateDate(long createDate) {
		this.createDate = createDate;
	}

	public long getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(long modifyDate) {
		this.modifyDate = modifyDate;
	}

}
