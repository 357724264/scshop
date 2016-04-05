package com.wudianyi.wb.scshop.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import com.wudianyi.wb.scshop.action.BaseAction;

/*
 * 代理申请、审核
 */
@Entity
@Table(name = "scshop_agentbill")
public class AgentBill implements Serializable {

	private static final long serialVersionUID = 1L;

	private int id;
	private int userid;// 用户id
	private String name;// 用户真实姓名
	private String phone;// 用户手机
	private String pic;// 头像
	private String idnum;// 身份证号码
	private String idpic;// 身份证照片
	private String nowaddress;// 现住址
	private String idaddress;// 身份证住址
	private int applystate;// 申请进度 0申请中 1通过 -1不通过
	private int agentid;// 通过后的代理等级id
	private String agentname;// 通过后的代理等中文
	private Long createDate;// 申请时间
	private Long modifyDate;// 审核日期
	private int del;// 是否删除 0正常，1删除,-1未创建

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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public String getIdpic() {
		return idpic;
	}

	public void setIdpic(String idpic) {
		this.idpic = idpic;
	}

	public String getNowaddress() {
		return nowaddress;
	}

	public void setNowaddress(String nowaddress) {
		this.nowaddress = nowaddress;
	}

	public String getIdaddress() {
		return idaddress;
	}

	public void setIdaddress(String idaddress) {
		this.idaddress = idaddress;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public int getApplystate() {
		return applystate;
	}

	public void setApplystate(int applystate) {
		this.applystate = applystate;
	}

	public int getAgentid() {
		return agentid;
	}

	public void setAgentid(int agentid) {
		this.agentid = agentid;
	}

	public Long getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Long createDate) {
		this.createDate = createDate;
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

	public String getAgentname() {
		return agentname;
	}

	public void setAgentname(String agentname) {
		this.agentname = agentname;
	}

	public String getIdnum() {
		return idnum;
	}

	public void setIdnum(String idnum) {
		this.idnum = idnum;
	}

}
