package com.wudianyi.wb.scshop.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/*
 * 快递公司
 */
@Entity
@Table(name = "scshop_kuaidi")
public class Kuaidi implements Serializable {

	private static final long serialVersionUID = 1L;

	private String keyid;// id
	private String name;// 快递名
	private String website;// 官网
	private String phone;// 电话

	@Id
	public String getKeyid() {
		return keyid;
	}

	public void setKeyid(String keyid) {
		this.keyid = keyid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

}
