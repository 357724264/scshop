package com.wudianyi.wb.scshop.action.admin.json;

import java.util.Date;

import javax.annotation.Resource;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.springframework.security.authentication.encoding.Md5PasswordEncoder;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Admin;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.entity.Customer;
import com.wudianyi.wb.scshop.entity.Jflog;
import com.wudianyi.wb.scshop.service.AdminService;
import com.wudianyi.wb.scshop.service.CustomerService;
import com.wudianyi.wb.scshop.service.JflogService;

public class CustomerAction extends BaseAction {

	private int id;
	private int agentid = 0;
	private String note;
	private String password2;// 新密码
	private String password_now;// 当前密码
	private int point;
	private int intpoint;// 修改的积分
	private int oldpoint;// 修改前积分
	private int pointtype;// 操作类型 1加 -1 减
	private Integer hasnote;

	@Resource
	private CustomerService customerService;
	@Resource
	private AdminService adminService;
	@Resource
	private JflogService jflogService;

	public String list() {

		QueryParam params = new QueryParam();
		System.err.println("hasnote:" + hasnote);
		params.add("hasnote", hasnote);
		list = customerService.getLikeList("phone", keyword, null, params,
				(pn - 1) * Const.BACK_PAGE_SIZE, Const.BACK_PAGE_SIZE,
				"createDate", "desc", false);
		System.err.println("list:" + list);
		return LIST;
	}

	public String totalNum() {
		QueryParam params = new QueryParam();
		System.err.println("hasnote:" + hasnote);
		params.add("hasnote", hasnote);
		tn = customerService.getLikeTotalCount("phone", keyword, null, params,
				false);

		System.out.println("tn========" + tn);
		return ajaxJson("{\"total\":\"" + tn + "\",\"size\":\""
				+ Const.BACK_PAGE_SIZE + "\"}");
	}

	public String update() {
		Customer customer = customerService.get(id);

		customer.setAgentid(agentid);
		customer.setNote(note);
		customerService.update(customer);

		return ajaxHtml("success");
	}

	public String agent() {
		Customer customer = customerService.get(id);
		customer.setAgentid(agentid);
		customerService.update(customer);
		return ajaxJsonSuccessMessage(null);
	}

	public String alterpass() {
		Md5PasswordEncoder md5PasswordEncoder = new Md5PasswordEncoder();
		Integer adminId = (Integer) getSession(Const.SESSION_ADMIN_NAME);

		Admin admin1 = adminService.get(
				new QueryParam(2).add("id", adminId).add("password",
						md5PasswordEncoder.encodePassword(password_now, null)),
				false);
		if (admin1 == null) {
			return ajaxJson("{'error':1}");
		}

		Admin admin = adminService.get(new QueryParam(1).add("id", adminId),
				false);
		admin.setPassword(md5PasswordEncoder.encodePassword(password2, null));
		adminService.update(admin);
		return ajaxJson("{'success':true}");
	}

	/*
	 * 加减用户积分
	 */
	public String alterpoint() {
		Customer customer = customerService.get(id);
		customer.setPoint(point);
		customerService.update(customer);
		Integer adminid = (Integer) getSession(Const.SESSION_ADMIN_NAME);
		Admin admin = adminService.get(adminid);
		Date date = new Date();
		Jflog jflog = new Jflog();
		jflog.setUserid(id);
		jflog.setPoint(intpoint);
		jflog.setThein(pointtype);
		if (pointtype == 0) {
			jflog.setPtype(-3);
		}
		if (pointtype == 1) {
			jflog.setPtype(3);
		}
		jflog.setLinkid(null);
		jflog.setUsername(customer.getName());
		jflog.setAdminid(adminid);
		jflog.setAdminame(admin.getName());
		jflog.setCreatedate(date.getTime());
		jflogService.save(jflog);

		return ajaxJson("{'success':true}");
	}

	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getAgentid() {
		return agentid;
	}

	public void setAgentid(int agentid) {
		this.agentid = agentid;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getPassword2() {
		return password2;
	}

	public void setPassword2(String password2) {
		this.password2 = password2;
	}

	public String getPassword_now() {
		return password_now;
	}

	public void setPassword_now(String password_now) {
		this.password_now = password_now;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getIntpoint() {
		return intpoint;
	}

	public void setIntpoint(int intpoint) {
		this.intpoint = intpoint;
	}

	public int getOldpoint() {
		return oldpoint;
	}

	public void setOldpoint(int oldpoint) {
		this.oldpoint = oldpoint;
	}

	public int getPointtype() {
		return pointtype;
	}

	public void setPointtype(int pointtype) {
		this.pointtype = pointtype;
	}

	public Integer getHasnote() {
		return hasnote;
	}

	public void setHasnote(Integer hasnote) {
		this.hasnote = hasnote;
	}

}
