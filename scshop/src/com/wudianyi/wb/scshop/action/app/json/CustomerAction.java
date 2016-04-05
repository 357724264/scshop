package com.wudianyi.wb.scshop.action.app.json;



import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;

import org.apache.struts2.components.Param;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.AgentBill;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.entity.Customer;
import com.wudianyi.wb.scshop.service.AgentBillService;
import com.wudianyi.wb.scshop.service.CustomerService;
import com.wudianyi.wb.scshop.service.MailService;
import com.wudianyi.wb.scshop.service.impl.MailServiceImpl;

public class CustomerAction extends BaseAction {

	@Resource
	private CustomerService customerService;
	@Resource
	private AgentBillService agentBillService;
	@Resource
	private MailService mailService;
	
	private String name;//用户真实姓名
	private String phone;//用户手机
	private String idnum;//身份证号码
	private String nowaddress;//现住址
	private String pwd;  //旧密码
	private String pwd2;//新密码
	private String img;//touxiang
	
	/*
	 * 提交代理申请
	 */
	public String submitagent(){
			Integer uid = (Integer)getSession(Const.SESSION_CUSTOMER_ID);
			List<AgentBill>abList = agentBillService.getList(null, 0, 0, "id", "desc", false);
			for(AgentBill agentb : abList){
				if(uid.equals(agentb.getUserid())){
					System.err.println("uid="+uid);
					System.err.println("userid="+agentb.getUserid());
					return ajaxJson("{'error':hava}");
				}
			}
			AgentBill ab = new AgentBill();
			Date da = new Date();
			long date = da.getTime();
			ab.setUserid(uid);
			ab.setCreateDate(date);
			ab.setPhone(phone);
			ab.setName(name);
			ab.setIdnum(idnum);
			ab.setNowaddress(nowaddress);
			
			agentBillService.save(ab);
		return ajaxJson("{'success':true}");
	}
	
	public String alterpass(){
		Integer uid = (Integer)getSession(Const.SESSION_CUSTOMER_ID);
		System.out.println(uid);
		Customer customer = customerService.get(
				new QueryParam(1).add("id", uid), false);
		//判断密码是否正确
		Md5PasswordEncoder md5PasswordEncoder = new Md5PasswordEncoder();
		if (!customer.getPassword().equals(md5PasswordEncoder.encodePassword(pwd, null))) {
			return ajaxJson("-1");
		}
		customer.setPassword(md5PasswordEncoder.encodePassword(pwd2, null));
		customerService.update(customer);
		return ajaxJson("success");
	}
    
	public String altername(){
		Integer uid = (Integer)getSession(Const.SESSION_CUSTOMER_ID);
		System.out.println(name);
		Customer customer = customerService.get(new QueryParam(1).add("id",uid), false);
		customer.setName(name);
		customerService.update(customer);
		
		return ajaxJson("success");
	}

	
	public String updateimg(){
			Integer userid = (Integer) getSession(Const.SESSION_CUSTOMER_ID);
			Customer customer = customerService.get(userid);
			System.err.println("保存路径是："+img);
			customer.setPic(img);
			customerService.save(customer);
			return ajaxJson("success");
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


	public String getIdnum() {
		return idnum;
	}


	public void setIdnum(String idnum) {
		this.idnum = idnum;
	}


	public String getNowaddress() {
		return nowaddress;
	}


	public void setNowaddress(String nowaddress) {
		this.nowaddress = nowaddress;
	}
	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getPwd2() {
		return pwd2;
	}

	public void setPwd2(String pwd2) {
		this.pwd2 = pwd2;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
	
	
}
