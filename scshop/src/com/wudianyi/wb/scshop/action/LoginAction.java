package com.wudianyi.wb.scshop.action;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;

import com.wudianyi.wb.scshop.entity.Cart;
import com.wudianyi.wb.scshop.entity.Const;
//import com.sun.xml.internal.bind.v2.runtime.reflect.opt.Const;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Customer;
import com.wudianyi.wb.scshop.service.CartService;
import com.wudianyi.wb.scshop.service.CustomerService;
import com.wudianyi.wb.scshop.util.StringUtils;

@ParentPackage("front")
public class LoginAction extends BaseAction {

	@Resource
	private CustomerService customerService;

	@Resource
	private CartService cartService;

	private String phone;// 用户 的手机号，也是注册的手机号
	private String pwd;// 登陆密码
	private String redirecturl;
	private String validateCode;// 邮箱验证码
	private Integer uu;

	public String execute() throws Exception {
		return "login";
	}

	public String email() {
		Customer customer = customerService.get(new QueryParam(2).add("id",
				getSession(Const.SESSION_CUSTOMER_ID)), false);
		setAttribute("emailtest", customer.getEmailtest());
		setAttribute("email", customer.getEmail());
		return "emailtest";
	}

	public String emailtest() throws IOException {
		Customer customer = customerService.get(new QueryParam(1).add("id",
				getSession(Const.SESSION_CUSTOMER_ID)), false);
		System.out.println(getSession(Const.SESSION_CUSTOMER_ID));
		System.out.println(validateCode);
		System.out.println(getSession("validateCode2"));
		if (getSession("validateCode2").equals(validateCode)) {
			customer.setEmailtest(1);
			customerService.update(customer);
			setAttribute("yiyanz", "1");
		} else {
			setAttribute("yiyanz", "2");
			return "emailtest";
		}
		return "emailtest";
	}

	public String veriryemail() {
		if (StringUtils.isEmpty(validateCode)) {
			return ajaxHtml("验证码已经过期!");
		}
		try {
			Customer customer = customerService.get(
					new QueryParam(1).add("vericode", validateCode), false);
			if (customer != null) {
				customer.setEmailtest(1);
				customer.setVericode(null);
				customerService.update(customer);
				return ajaxHtml("验证成功!");
			}
		} catch (Exception e) {
			return ajaxHtml("验证码已经过期!");
		}
		return ajaxHtml("验证码已经过期!");
	}

	public String getValidateCode() {
		return validateCode;
	}

	public void setValidateCode(String validateCode) {
		this.validateCode = validateCode;
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

	public String getRedirecturl() {
		return redirecturl;
	}

	public void setRedirecturl(String redirecturl) {
		this.redirecturl = redirecturl;
	}

	public Integer getUu() {
		return uu;
	}

	public void setUu(Integer uu) {
		this.uu = uu;
	}

}
