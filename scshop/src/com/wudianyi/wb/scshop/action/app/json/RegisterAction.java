package com.wudianyi.wb.scshop.action.app.json;

import java.util.Date;
import java.util.Random;

import javax.annotation.Resource;
import javax.xml.registry.infomodel.User;

import org.springframework.security.authentication.encoding.Md5PasswordEncoder;

import net.sf.json.JSONObject;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.entity.Coupon;
import com.wudianyi.wb.scshop.entity.Customer;
import com.wudianyi.wb.scshop.entity.UserCoupon;
import com.wudianyi.wb.scshop.entity.WebInfo;
import com.wudianyi.wb.scshop.service.CouponService;
import com.wudianyi.wb.scshop.service.CustomerService;
import com.wudianyi.wb.scshop.service.WebInfoService;
import com.wudianyi.wb.scshop.util.SmsUtil;
import com.wudianyi.wb.scshop.util.StringUtils;

public class RegisterAction extends BaseAction {

	private String phone;
	private String pwd;
	private String code;
	@Resource
	private CouponService couponService;

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	@Resource
	private CustomerService customerService;

	@Override
	public String execute() throws Exception {
		return null;

	}

	public String checkPhone() throws Exception {
		System.out.println("进入checkphone");
		Customer customer = customerService.get(
				new QueryParam(1).add("phone", phone), false);
		// 判断用户是否存在
		if (customer != null) {
			return ajaxJson("{\"error\":'-1'}");
		}
		// 生成6位随机数
		Random random = new Random();
		String codeT = random.nextInt(9) + "" + random.nextInt(9)
				+ random.nextInt(9) + random.nextInt(9) + random.nextInt(9)
				+ random.nextInt(9);
		String content = "卖疯乐会员注册，动态验证码："+codeT + "（十分钟内有效）";
		System.out.println(content);
		System.out.println(phone);
		// 发送验证码
		String res = SmsUtil.sendSms(content, phone);
		setSession(phone + "user_phoneCode", codeT);
		return ajaxJson("{\"success\":true,\"code\":\"" + codeT + "\"}");
	}

	public String in() throws Exception {

		// 先判断验证码是否正确
		if (getSession(phone + "user_phoneCode") == null) {
			return ajaxJson("error");
		}
		String sessioncode = getSession(phone + "user_phoneCode").toString();
		if (!sessioncode.equals(code)) {
			return ajaxJson("error");
		}
		// 判断用户是否已经存在
		Customer customer = customerService.get(
				new QueryParam(1).add("phone", phone), false);
		if (customer != null) {
			return ajaxJson("-1");
		}
		Md5PasswordEncoder md5PasswordEncoder = new Md5PasswordEncoder();
		customer = new Customer(phone, md5PasswordEncoder.encodePassword(pwd,
				null), "weixin");
		int cid = customerService.save(customer);
		setSession(Const.SESSION_CUSTOMER_ID, cid);

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

}
