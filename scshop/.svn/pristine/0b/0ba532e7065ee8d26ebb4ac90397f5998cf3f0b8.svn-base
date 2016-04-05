package com.wudianyi.wb.scshop.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "scshop_jflog")
public class Jflog implements Serializable {

	private static final long serialVersionUID = 1L;
	private String id;
	private int userid;// 用户ID
	private int point;// 积分
	private int thein;// 0支出，1收入
	private int ptype;// 积分类型 -1商城积分支出,1，评论收入2,每天登录所得 3操作员增加的积分 -3操作员减少的积分
	private String linkid;// 关联的id
	private long createdate;// service中自动保存
	private Integer adminid;//操作修改积分的管理员
	private String adminame;//管理员姓名
	private String username;//用户名

	public Jflog() {

	}

	public Jflog(int userid, int point, int thein, int ptype, String linkid) {
		super();
		this.userid = userid;
		this.point = point;
		this.thein = thein;
		this.ptype = ptype;
		this.linkid = linkid;
		this.createdate = new Date().getTime();
	}

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

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getThein() {
		return thein;
	}

	public void setThein(int thein) {
		this.thein = thein;
	}

	public int getPtype() {
		return ptype;
	}

	public void setPtype(int ptype) {
		this.ptype = ptype;
	}

	public String getLinkid() {
		return linkid;
	}

	public void setLinkid(String linkid) {
		this.linkid = linkid;
	}

	public long getCreatedate() {
		return createdate;
	}

	public void setCreatedate(long createdate) {
		this.createdate = createdate;
	}

	public Integer getAdminid() {
		return adminid;
	}

	public void setAdminid(Integer adminid) {
		this.adminid = adminid;
	}

	public String getAdminame() {
		return adminame;
	}

	public void setAdminame(String adminame) {
		this.adminame = adminame;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	

}
