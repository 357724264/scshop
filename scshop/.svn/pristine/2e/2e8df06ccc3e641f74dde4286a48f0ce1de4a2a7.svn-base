package com.wudianyi.wb.scshop.action.json;

import java.io.IOException;
import java.util.Random;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.security.authentication.encoding.Md5PasswordEncoder;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.entity.Customer;
import com.wudianyi.wb.scshop.service.CartService;
import com.wudianyi.wb.scshop.service.CustomerService;
import com.wudianyi.wb.scshop.service.MailService;

public class LoginAction extends BaseAction {

	@Resource
	private MailService mailService;
	@Resource
	private CustomerService customerService;
	@Resource
	private CartService cartService;

	private String phone;// 用户 的手机号，也是注册的手机号
	private String pwd;// 登陆密码
	private String name;// 用户真实姓名
	private String email;// 邮箱
	private String validateCode;// 邮箱激活码

	public String in() throws IOException {

		Md5PasswordEncoder md5PasswordEncoder = new Md5PasswordEncoder();
		String password = md5PasswordEncoder.encodePassword(pwd, null);
		System.err.println(phone);
		System.err.println(pwd);
		System.err.println(password);
		Customer customer = customerService
				.get(new QueryParam(2).add("phone", phone).add("password",
						password), false);

		if (customer == null) {
			return ajaxJson("error");
		}

		int num = cartService
				.updatecombineCart(getStatusid(), customer.getId());
		cookieSet(Const.COOKIE_CARTNUM, num + "");

		setSession(Const.SESSION_CUSTOMER_ID, customer.getId());
		return ajaxJson("success");

	}

	public String sendemail() {

		Integer userid = (Integer) getSession(Const.SESSION_CUSTOMER_ID);
		Customer customer = customerService.get(userid);
		name = "卖疯乐";
		// 生成验证码
		validateCode = UUID.randomUUID().toString().replaceAll("-", "");
		customer.setVericode(validateCode);
		customerService.update(customer);
		String subject = "卖疯乐邮箱验证";
		// /邮件的内容
		StringBuffer sb = new StringBuffer("点击下面链接激活邮箱</br>");
		sb.append(" <a href='http://" + Const.BASE_URL
				+ "/login!veriryemail.action?validateCode=");
		sb.append(validateCode);
		sb.append("'>点击这里验证邮箱");
		sb.append("</a>");
		String content = sb.toString();
		String toMail = email;
		// 发送邮件
		mailService.sendMail(name, subject, content, toMail);
		System.out.println(content);
		return ajaxJson("success");
	}

	public String updateemail() {
		Integer uid = (Integer) getSession(Const.SESSION_CUSTOMER_ID);
		Customer customer = customerService.get(
				new QueryParam(1).add("id", uid), false);
		customer.setEmail(email);
		customer.setEmailtest(1);
		customerService.update(customer);

		return ajaxJson("success");
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

}
