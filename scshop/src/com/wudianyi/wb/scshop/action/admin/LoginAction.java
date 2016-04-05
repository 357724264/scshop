package com.wudianyi.wb.scshop.action.admin;

import java.io.IOException;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Admin;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.service.AdminService;

public class LoginAction extends BaseAction {

	@Resource
	private AdminService adminService;
	private String username;// 账号
	private String password;// 密码

	@Override
	public String execute() throws Exception {
		String statusid = null;
		Cookie[] cookies = getRequest().getCookies();
		System.err.println(Const.STATAID_COOKE);
		if (cookies != null) {
			for (Cookie c : cookies) {
				if (c.getName().equals(Const.STATAID_COOKE)) {
					statusid = c.getValue();
				}
			}
		}
		if (statusid == null) {
			statusid = UUID.randomUUID().toString();
			getRequest().setAttribute(Const.STATAID_COOKE, statusid);
			// 保存cookie
			Cookie cookie = new Cookie(Const.STATAID_COOKE, statusid);
			cookie.setPath("/");
			// cookie.setDomain(Const.BASE_WEB_SITE);
			cookie.setMaxAge(3600 * 24 * 2);
			getResponse().addCookie(cookie);
		}
		return "login";
	}

	// 进来后判断是都有这个商户/管理员，有的话对应跳转，没的话null
	public String in() throws IOException {
		Md5PasswordEncoder md5PasswordEncoder = new Md5PasswordEncoder();
		Admin admin = null;
		
		Admin admin1 = adminService.get(
				new QueryParam(3).add("userName", username).add("password",
						md5PasswordEncoder.encodePassword(password, null)).add("state", 0),
				false);
		Admin admin2 = adminService.get(
					new QueryParam(2).add("phone", username).add("password",
							md5PasswordEncoder.encodePassword(password, null)).add("state", 0),
					false);
		Admin admin3 = adminService.get(
				new QueryParam(2).add("email", username).add("password",
						md5PasswordEncoder.encodePassword(password, null)).add("state", 0),
				false);
		if(admin1!=null){
			admin=admin1;
		}else if(admin2!=null){
			admin=admin2;
		}else if(admin3!=null){
			admin=admin3;
		}
		
		System.out.println(admin);
		if (admin != null) {
			System.err.println("adminn oee");
			setSession(Const.SESSION_ADMIN_NAME, admin.getId());
			setSession(Const.SESSION_ADMIN_SHOPID, admin.getShopId());
			setSession(Const.SESSION_ADMIN_PERMISSION, admin.getPermission());
			return ajaxJson("success");
		} else {
			return ajaxJson("error");
		}

	}

	public String forgetpass() throws Exception {

		return "forgetpass";
	}

	public String getUserName() {
		return username;
	}

	public void setUserName(String userName) {
		this.username = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}