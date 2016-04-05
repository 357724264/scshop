package com.wudianyi.wb.scshop.action.admin;



import java.util.Date;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.ParentPackage;

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
	private String userName;//账号
	private String password;//密码
	private Integer shopId;//对应商店的id
	private String company;//对应公司名字
	private String name;//姓名
	private String phone;
	private String position;//职位
	private long createDate;//注册/创建时间
	private long modifyDate;//若为商家申请，这里有通过/未通过 审核审核时间
	private String functionitems;// 可享有的功能列表，用双逗号隔开，例如：（,user,order,）;

	
	/*
	 * 旗下多少员工
	 */
	public String list(){
			if((Integer)getSession(Const.SESSION_ADMIN_SHOPID) == null){
				return LIST;
			}else{
				QueryParam param = new QueryParam(1).add("shopId", (Integer)getSession(Const.SESSION_ADMIN_SHOPID));
				list = adminService.getList(param, 0, 0, "createDate", "desc", false);
				return LIST;
			}
	}
	
	/*
	 *创建新员工1
	 */
	public String input(){	
		return "input";
	}
	
	
	public String edit(){
		Admin admin = adminService.get(id);
		setAttribute("admin", admin);
		setAttribute("functionitem", admin.getFunctionitems());
		
		return "edit";
	}
	
	public String update(){
		
		return ajaxJson("{\"success\":true,\"url\":\"admin!list.action\"}");
	}
	
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
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
	
	
	
	
}
