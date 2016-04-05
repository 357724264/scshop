package com.wudianyi.wb.scshop.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/*
 * 会员等级
 */
@Entity
@Table(name = "scshop_member")
public class Member implements Serializable  {

	private int id;
	private String name;//等级名称
	private Integer orderbyid; // 用于排序(按顺序排123456)
	private int mixpoint;//这个范围最低
	private int maxpoint;//这个范围最高
	private int del; // 0表示正常 1表示删除
	private String note;//等级说明
	private int createid;//创建人员id
	@Column(name = "createdate")
	private Long  createDate;// 新建日期
	private int modifyid;//修改人员id
	@Column(name = "modifydate")
	private Long modifyDate;//修改日期
	private String note2;//无用
	
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
	public int getMixpoint() {
		return mixpoint;
	}
	public void setMixpoint(int mixpoint) {
		this.mixpoint = mixpoint;
	}
	public int getMaxpoint() {
		return maxpoint;
	}
	public void setMaxpoint(int maxpoint) {
		this.maxpoint = maxpoint;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public int getCreateid() {
		return createid;
	}
	public void setCreateid(int createid) {
		this.createid = createid;
	}
	public Long getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Long createDate) {
		this.createDate = createDate;
	}
	public Integer getOrderbyid() {
		return orderbyid;
	}
	public void setOrderbyid(Integer orderbyid) {
		this.orderbyid = orderbyid;
	}
	public int getModifyid() {
		return modifyid;
	}
	public void setModifyid(int modifyid) {
		this.modifyid = modifyid;
	}
	public Long getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(Long modifyDate) {
		this.modifyDate = modifyDate;
	}
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
	public String getNote2() {
		return note2;
	}
	public void setNote2(String note2) {
		this.note2 = note2;
	}
	
	
	
	
	
}
