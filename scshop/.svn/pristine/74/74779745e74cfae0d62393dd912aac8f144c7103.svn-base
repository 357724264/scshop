package com.wudianyi.wb.scshop.action.admin;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.apache.struts2.convention.annotation.ParentPackage;

import antlr.collections.impl.LList;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Address;
import com.wudianyi.wb.scshop.entity.Agent;
import com.wudianyi.wb.scshop.entity.Customer;
import com.wudianyi.wb.scshop.service.AddressService;
import com.wudianyi.wb.scshop.service.AgentService;
import com.wudianyi.wb.scshop.service.CustomerService;

@ParentPackage("admin")
public class CustomerAction extends BaseAction {

	@Resource
	private CustomerService customerService;
	@Resource
	private AgentService agentService;
	@Resource
	private AddressService addressService;

	private Customer customer;
	private int id;
	private String weixinnum;// 微信号
	private String phonr;// 用户手机号
	private String name;// 姓名
	private int sex;// 0女，1男
	private double point = 0.00;
	private Date createDate;// 注册日期
	private Integer hasnote;

	public String list() {

		return LIST;
	}

	public String execute() throws Exception {

		// 用户地址
		QueryParam addParam = new QueryParam(1).add("userid", id);
		List<Address> addslist = addressService.getList(addParam, 0, 0,
				"createDate", "desc", false);
		setAttribute("addslist", addslist);
		// 代理等级
		List<Agent> alist = agentService
				.getList(null, 0, 0, "id", "ace", false);
		setAttribute("alist", alist);
		// 用户信息
		customer = customerService.get(id);
		setAttribute("customer", customer);

		// 后台积分操作记录

		return "show";
	}

	public String alterpass() {
		return "alterpass";
	}

	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getWeixinnum() {
		return weixinnum;
	}

	public void setWeixinnum(String weixinnum) {
		this.weixinnum = weixinnum;
	}

	public String getPhonr() {
		return phonr;
	}

	public void setPhonr(String phonr) {
		this.phonr = phonr;
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

	public double getPoint() {
		return point;
	}

	public void setPoint(double point) {
		this.point = point;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Integer getHasnote() {
		return hasnote;
	}

	public void setHasnote(Integer hasnote) {
		this.hasnote = hasnote;
	}

}
