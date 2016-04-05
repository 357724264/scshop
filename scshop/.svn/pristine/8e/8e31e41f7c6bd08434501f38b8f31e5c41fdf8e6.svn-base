package com.wudianyi.wb.scshop.action.admin.json;



import java.util.Date;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Admin;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.service.AdminService;
@ParentPackage("admin")
public class AdminAction extends BaseAction {

	@Resource
	private AdminService adminService;
	
	private int id;
	private String username;//账号
	private String password;//密码
	private Integer shopId;//对应商店的id
	private String company;//对应公司名字
	private String name;//姓名
	private String phone;
	private String email;
	private String position;//职位
	private long createDate;//注册/创建时间
	private long modifyDate;//若为商家申请，这里有通过/未通过 审核审核时间
	private String functionitems;// 可享有的功能列表，用双逗号隔开，例如：（,user,order,）;


	//创建新员工2
	public String save(){
		Md5PasswordEncoder md5PasswordEncoder = new Md5PasswordEncoder();
		System.out.println(phone);
		System.out.println(username);
		int phone_exist = adminService.getTotalCount(new QueryParam(1).add("phone", phone), false);
		int name_exist = adminService.getTotalCount(new QueryParam(1).add("userName", username), false);
		if(phone_exist != 0 ){ //后台账户中木有这个手机号就可以创建
			return ajaxJson("{'error':1}");//返回失败，显示该手机已注册过
		}
		if(name_exist != 0){
			return ajaxJson("{'error2':2}");
		}
		Date date = new Date();
		Admin admin = new Admin();
		int upaid = (Integer) getSession(Const.SESSION_ADMIN_NAME);//创建者id
		admin.setUpid(upaid);//保存创建者id
		Admin upAdmin = adminService.get(upaid);
		admin.setPermission(upAdmin.getPermission());//属性 商家还是平台管理
		admin.setCompany(upAdmin.getCompany());//
		admin.setShopId(upAdmin.getShopId());//对应店铺id
		admin.setUserName(username);
		admin.setPassword(md5PasswordEncoder.encodePassword(password, null));
		admin.setName(name);
		admin.setPhone(phone);
		admin.setEmail(email);
		admin.setPosition(position);
		admin.setFunctionitems(functionitems);
		admin.setCreateDate(date.getTime());
		admin.setState(0);
		adminService.save(admin);
		return ajaxJson("{'success' : true}");
		
	}
	
	public String update(){
		Md5PasswordEncoder md5PasswordEncoder = new Md5PasswordEncoder();
		Date date = new Date();
		Admin admin = adminService.get(id);
		int upaid = (Integer)getSession(Const.SESSION_ADMIN_NAME);//创建者id
		admin.setUpid(upaid);//保存创建者id
		Admin upAdmin = adminService.get(upaid);
		admin.setPermission(upAdmin.getPermission());//属性 商家还是平台管理
		admin.setCompany(upAdmin.getCompany());//
		admin.setShopId(upAdmin.getShopId());//对应店铺id
		admin.setUserName(username);
		System.out.println("password:"+password);
		System.out.println(md5PasswordEncoder.encodePassword(password, null));
		String passworden = md5PasswordEncoder.encodePassword(password, null);
		if(!passworden.equals("d41d8cd98f00b204e9800998ecf8427e")){
			admin.setPassword(md5PasswordEncoder.encodePassword(password, null));
		}
		admin.setName(name);
		admin.setPhone(phone);
		admin.setEmail(email);
		admin.setPosition(position);
		admin.setFunctionitems(functionitems);
		admin.setCreateDate(date.getTime());
		adminService.update(admin);
		return ajaxJson("{'success' : true}");
		
	}
	
	public String delete(){
		
	   adminService.delete(id);
	   return ajaxJson("success");
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getShopId() {
		return shopId;
	}

	public void setShopId(Integer shopId) {
		this.shopId = shopId;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
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

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
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

	public String getFunctionitems() {
		return functionitems;
	}

	public void setFunctionitems(String functionitems) {
		this.functionitems = functionitems;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	
	
	
	
}
