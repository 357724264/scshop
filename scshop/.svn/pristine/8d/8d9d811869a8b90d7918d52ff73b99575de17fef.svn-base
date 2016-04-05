package com.wudianyi.wb.scshop.action.json;

import java.util.Random;

import javax.annotation.Resource;

import org.springframework.security.authentication.encoding.Md5PasswordEncoder;

import net.sf.json.JSONObject;
import antlr.StringUtils;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Customer;
import com.wudianyi.wb.scshop.service.CustomerService;
import com.wudianyi.wb.scshop.util.SmsUtil;

public class UserAction extends BaseAction {
    
	private String phone;
    private String phonenew;
	private String pwd;
	private String code;
	

	

	public CustomerService getCustomerService() {
		return customerService;
	}

	public void setCustomerService(CustomerService customerService) {
		this.customerService = customerService;
	}

	@Resource
	 private CustomerService customerService;

	@Override
	public String execute() throws Exception {
		return null;

		
	}
    
	public String checkPhone() throws Exception{
		System.out.println("进入checkphone");
		Customer customer = customerService.get(
				new QueryParam(1).add("phone", phone), false);
		//判断用户是否存在
		if (customer == null) {
			return ajaxJson("-1");
		}
        //生成6位随机数
		Random random = new Random();
		String codeT = random.nextInt(9) + "" + random.nextInt(9)
		   + random.nextInt(9) + random.nextInt(9)+ random.nextInt(9)+ random.nextInt(9);
		String content = codeT + "（精英服务验证码，十分钟内有效）";
		System.out.println(content);
		//发送验证码
		String res = SmsUtil.sendSms(content, phone);
		setSession(phone + "user_phoneCode", codeT);
		return ajaxJson("{\"success\":true,\"code\":\"" + codeT + "\"}");
	}
	
	public String createcode() throws Exception{
		System.out.println("进入createcode");
		
        //生成6位随机数
		Random random = new Random();
		String codeT = random.nextInt(9) + "" + random.nextInt(9)
		   + random.nextInt(9) + random.nextInt(9)+ random.nextInt(9)+ random.nextInt(9);
		String content = codeT + "（精英服务验证码，十分钟内有效）";
		System.out.println(content);
		//发送验证码
		String res = SmsUtil.sendSms(content, phone);
		setSession(phone + "user_phoneCode", codeT);
		return ajaxJson("{\"success\":true,\"code\":\"" + codeT + "\"}");
	}
	
	public String alterpass() {
	    //判断手机是否存在
		Customer customer = customerService.get(
				new QueryParam(1).add("phone", phone), false);
		if (customer == null) {
			return ajaxJson("-1");
		}
		
       System.out.println("开始判断验证码");
		// 先判断验证码是否正确
	   
	  if (getSession(phone + "user_phoneCode") == null) {
			return ajaxJson("error");
			}
		String sessioncode = getSession(phone + "user_phoneCode")
					.toString();
		if (!sessioncode.equals(code)) {
			return ajaxJson("error");
		}
		Md5PasswordEncoder md5PasswordEncoder = new Md5PasswordEncoder();		
		customer.setPassword(md5PasswordEncoder.encodePassword(pwd, null));
		customerService.update(customer);
		return ajaxJson("success");
	}
	
	public String changephone() {
		Customer customer = customerService.get(
				new QueryParam(1).add("phone", phone), false);
		
		// 先判断验证码是否正确
	    if (getSession(phone + "user_phoneCode") == null) {
			return ajaxJson("error");
			}
		String sessioncode = getSession(phone + "user_phoneCode")
					.toString();
		if (!sessioncode.equals(code)) {
			return ajaxJson("error");
		}
		customer.setPhone(phonenew);
		customerService.update(customer);
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
	

}
