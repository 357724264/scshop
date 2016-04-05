package com.wudianyi.wb.scshop.action.app;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.springframework.security.authentication.encoding.Md5PasswordEncoder;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.entity.Customer;
import com.wudianyi.wb.scshop.service.CartService;
import com.wudianyi.wb.scshop.service.CustomerService;

public class LoginAction extends BaseAction {

	private String phone;
	private String pwd;
	@Resource
	private CustomerService customerService;

	@Resource
	private CartService cartService;

	public String in() {
		System.err.println(phone);

		Md5PasswordEncoder md5PasswordEncoder = new Md5PasswordEncoder();
		String password = md5PasswordEncoder.encodePassword(pwd, null);
		Customer customer = customerService
				.get(new QueryParam(2).add("phone", phone).add("password",
						password), false);

		if (customer == null) {
			return ajaxJson("error");
		}

		int num = cartService.updatecombineCart(getStatusid(), customer.getId());
		
		cookieSet(Const.COOKIE_CARTNUM, num + "");

		setSession(Const.SESSION_CUSTOMER_ID, customer.getId());
		String token = customerService.setUserAppToken(customer.getId());
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("success", true);
		jsonObject.put("cartnum", num);
		jsonObject.put("token", token);
		jsonObject.put("userid", customer.getId());
		return ajaxJson(jsonObject.toString());
	}
	
	public String email() {
		Customer customer = customerService.get(new QueryParam(2).add("id",
				getSession(Const.SESSION_CUSTOMER_ID)), false);
		//setAttribute("emailtest", customer.getEmailtest());
		//setAttribute("email", customer.getEmail());
		JSONObject retObject = new JSONObject();
		retObject.put("emailtest", customer.getEmailtest());
		retObject.put("email", customer.getEmail());
		return ajaxJson(retObject.toString());
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
