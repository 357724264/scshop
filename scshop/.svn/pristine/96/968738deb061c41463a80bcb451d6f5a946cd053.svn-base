package com.wudianyi.wb.scshop.action;

import java.io.IOException;
import java.util.Date;
import java.util.Random;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;

import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.entity.Customer;
import com.wudianyi.wb.scshop.entity.WebInfo;
//import com.wudianyi.wb.scshop.entity.SystemClass;
import com.wudianyi.wb.scshop.service.CustomerService;
import com.wudianyi.wb.scshop.service.WebInfoService;
//import com.wudianyi.wb.scshop.util.NumberUtil;
//import com.wudianyi.wb.scshop.util.StringUtils;
import com.wudianyi.wb.scshop.util.SmsUtil;

/*@ParentPackage("front")*/
public class RegisterAction extends BaseAction {

	private String phone;
	private String pwd;
	private String code;
	private String name;
	@Resource
	private CustomerService customerService;
	@Resource
	private WebInfoService webInfoService;

	@Override
	public String execute() throws Exception {
			
		WebInfo info = webInfoService.get(Const.WEBINFO_ID);
		setAttribute("info", info);
		return "register";
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
