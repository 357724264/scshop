package com.wudianyi.wb.scshop.action.admin.json;

import java.util.Random;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.security.authentication.encoding.Md5PasswordEncoder;

import net.sf.json.JSONObject;
import antlr.StringUtils;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Admin;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.entity.Customer;
import com.wudianyi.wb.scshop.service.AdminService;
import com.wudianyi.wb.scshop.service.MailService;
import com.wudianyi.wb.scshop.util.SmsUtil;

public class LoginAction extends BaseAction {
    
	private String phone;
	private String phone_mail;
	private String phonenew;
	private String pwd;
	private String code;
	private String name ;
	

	@Resource
	 private AdminService adminService;
	@Resource
	private MailService mailService;
	@Override
	public String execute() throws Exception {
		return null;

		
	}
    
	public String checkPhone() throws Exception{
		System.out.println("进入admin checkphone");
		System.out.println(phone_mail);
		Admin admin = adminService.get(
				new QueryParam(1).add("phone", phone_mail), false);
		//判断用户是否存在
		if (admin == null) {
			return ajaxJson("-1");
		}
        //生成6位随机数
		Random random = new Random();
		String codeT = random.nextInt(9) + "" + random.nextInt(9)
		   + random.nextInt(9) + random.nextInt(9)+ random.nextInt(9)+ random.nextInt(9);
		String content ="卖疯了动态验证码为："+ codeT + "";
		System.out.println(content);
		//发送验证码
		SmsUtil.sendSms(content, phone_mail);
		setSession(phone_mail + "user_phoneCode", codeT);
		return ajaxJson("{\"success\":true,\"code\":\"" + codeT + "\"}");
	}
	
	public String checkemail() {

		Admin admin = adminService.get(
				new QueryParam(1).add("email", phone_mail), false);
		//判断用户是否存在
		if (admin == null) {
			return ajaxJson("-1");
		}
		name = "卖疯乐";
		//生成6位随机数
		Random random = new Random();
		String codeT = random.nextInt(9) + "" + random.nextInt(9)
				   + random.nextInt(9) + random.nextInt(9)+ random.nextInt(9)+ random.nextInt(9);
		String subject = "卖疯乐邮箱验证";
		// /邮件的内容
		
		String content = "邮箱动态密码为："+codeT;
		String toMail = phone_mail;
		// 发送邮件
		mailService.sendMail(name, subject, content, toMail);
		setSession( phone_mail+ "user_phoneCode", codeT);
		System.out.println(content);
		return ajaxJson("{\"success\":true,\"code\":\"" + codeT + "\"}");
	}
	
	public String alterpassby_p() {
	    //判断手机是否存在
		System.out.println("alterpassby_p:"+phone_mail);
		Admin admin = adminService.get(
				new QueryParam(1).add("phone", phone_mail), false);
		if (admin == null) {
			return ajaxJson("-1");
		}
		
       System.out.println("开始判断验证码");
		// 先判断验证码是否正确
	  if (getSession(phone_mail + "user_phoneCode") == null) {
			return ajaxJson("error");
			}
	  
		String sessioncode = getSession(phone_mail + "user_phoneCode").toString();
		if (!sessioncode.equals(code)) {
			return ajaxJson("error");
		}
		Md5PasswordEncoder md5PasswordEncoder = new Md5PasswordEncoder();		
		admin.setPassword(md5PasswordEncoder.encodePassword(pwd, null));
		adminService.update(admin);
		return ajaxJson("success");
	}
	
	public String alterpassby_e() {
	    //判断email是否存在
		System.out.println(phone_mail);
		Admin admin = adminService.get(
				new QueryParam(1).add("email", phone_mail), false);
		if (admin == null) {
			return ajaxJson("-1");
		}
		
       System.out.println("开始判断验证码");
		// 先判断验证码是否正确
	  if (getSession(phone_mail + "user_phoneCode") == null) {
			return ajaxJson("error");
			}
	  
		String sessioncode = getSession(phone_mail + "user_phoneCode").toString();
		if (!sessioncode.equals(code)) {
			return ajaxJson("error");
		}
		Md5PasswordEncoder md5PasswordEncoder = new Md5PasswordEncoder();		
		admin.setPassword(md5PasswordEncoder.encodePassword(pwd, null));
		adminService.update(admin);
		return ajaxJson("success");
	}
	
	
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	 public String getCode() {
			return code;
		}

	public void setCode(String code) {
			this.code = code;
	}

	public String getPhonenew() {
		return phonenew;
	}

	public void setPhonenew(String phonenew) {
		this.phonenew = phonenew;
	}
	
	public String getPhone_mail() {
		return phone_mail;
	}

	public void setPhone_mail(String phone_mail) {
		this.phone_mail = phone_mail;
	}
	

}
