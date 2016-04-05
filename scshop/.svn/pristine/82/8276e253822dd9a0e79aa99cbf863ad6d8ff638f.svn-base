package com.wudianyi.wb.scshop.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "scshop_customer")
public class Customer implements Serializable {

	private static final long serialVersionUID = 1L;

	private int id;
	private String weixinid;// 微信id
	private String weixinnum;// 微信号
	private String phone;// 用户 的手机号，也是注册的手机号
	private String password;// 登陆密码
	private String email;// 电子邮件
	private int emailtest = 0;// 邮箱验证 1验证 0未验证
	private String name;// 用户姓名
	private int sex;// 0女，1男
	private String pic;// 头像（小图）
	private int point = 0;// 剩余积分，现有积分多少
	private int hispoint = 0;// 已提现、已兑换积分（历史积分）
	private int issub;// 是否关注过公众号.1已关注
	private int del;// 是否删除（1删除，0不删除 , 不实际删除，用于是否显示）
	private Date createDate;// 注册日期
	private String note;// 备注
	private int istrader;// 是否注册为商家 0否1是
	private String traderid;// 若为商家，记录他的商家id
	private String resource;// 注册时来自什么客户端的，微信、APP、PC
	private Integer agentid;// 代理级别
	private Integer memberrank;//会员等级  初始级数为1级
	private String defaultAddressid;// 默认收货地址id
	private String defaultAddressInfo;// 默认地址信息{name,phone,address}
	private String vericode;// 邮箱验证code
	private long lastloginday;// 最近一天最早那个时间登录的时间
	private int lastdaynum;// 持续登录了多少天
	private String pushtoken;// 推送的token
	private String usernote;// 用户备注
	private int hasnote = 0;//用户是否有备注

	public Customer() {

	}

	public Customer(String phone, String password, String resource) {
		super();
		this.phone = phone;
		this.password = password;
		this.emailtest = 0;
		this.point = 0;
		this.hispoint = 0;
		this.del = 0;
		this.createDate = new Date();
		this.resource = resource;
		this.lastloginday = new Date().getTime();
		this.lastdaynum = 0;
	}

	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getWeixinid() {
		return weixinid;
	}

	public void setWeixinid(String weixinid) {
		this.weixinid = weixinid;
	}

	public String getWeixinnum() {
		return weixinnum;
	}

	public void setWeixinnum(String weixinnum) {
		this.weixinnum = weixinnum;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getSex() {
		return sex;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getHispoint() {
		return hispoint;
	}

	public void setHispoint(int hispoint) {
		this.hispoint = hispoint;
	}

	public int getIssub() {
		return issub;
	}

	public void setIssub(int issub) {
		this.issub = issub;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public int getIstrader() {
		return istrader;
	}

	public void setIstrader(int istrader) {
		this.istrader = istrader;
	}

	public String getTraderid() {
		return traderid;
	}

	public void setTraderid(String traderid) {
		this.traderid = traderid;
	}

	public String getResource() {
		return resource;
	}

	public void setResource(String resource) {
		this.resource = resource;
	}

	public Integer getAgentid() {
		return agentid;
	}

	public void setAgentid(Integer agentid) {
		this.agentid = agentid;
	}

	@Column(name = "defaultaddressid")
	public String getDefaultAddressid() {
		return defaultAddressid;
	}

	public void setDefaultAddressid(String defaultAddressid) {
		this.defaultAddressid = defaultAddressid;
	}

	@Column(name = "defaultaddressinfo")
	public String getDefaultAddressInfo() {
		return defaultAddressInfo;
	}

	public void setDefaultAddressInfo(String defaultAddressInfo) {
		this.defaultAddressInfo = defaultAddressInfo;
	}

	public int getEmailtest() {
		return emailtest;
	}

	public void setEmailtest(int emailtest) {
		this.emailtest = emailtest;
	}

	public String getVericode() {
		return vericode;
	}

	public void setVericode(String vericode) {
		this.vericode = vericode;
	}

	public long getLastloginday() {
		return lastloginday;
	}

	public void setLastloginday(long lastloginday) {
		this.lastloginday = lastloginday;
	}

	public int getLastdaynum() {
		return lastdaynum;
	}

	public void setLastdaynum(int lastdaynum) {
		this.lastdaynum = lastdaynum;
	}

	public String getPushtoken() {
		return pushtoken;
	}

	public void setPushtoken(String pushtoken) {
		this.pushtoken = pushtoken;
	}

	public String getUsernote() {
		return usernote;
	}

	public void setUsernote(String usernote) {
		this.usernote = usernote;
	}

	public int getHasnote() {
		return hasnote;
	}

	public void setHasnote(int hasnote) {
		this.hasnote = hasnote;
	}

	public Integer getMemberrank() {
		return memberrank;
	}

	public void setMemberrank(Integer memberrank) {
		this.memberrank = memberrank;
	}
	
	

}
