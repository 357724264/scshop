package com.wudianyi.wb.scshop.action.ry.admin;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.springframework.security.authentication.encoding.Md5PasswordEncoder;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Admin;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.service.AdminService;

public class LoginAction extends BaseAction {

	@Resource
	private AdminService adminService;

	private String username;
	private String password;

	public String in() {
		Md5PasswordEncoder md5PasswordEncoder = new Md5PasswordEncoder();
		Admin admin = null;

		Admin admin1 = adminService.get(
				new QueryParam(3)
						.add("userName", username)
						.add("password",
								md5PasswordEncoder.encodePassword(password,
										null)).add("state", 0), false);
		Admin admin2 = adminService.get(
				new QueryParam(2)
						.add("phone", username)
						.add("password",
								md5PasswordEncoder.encodePassword(password,
										null)).add("state", 0), false);
		Admin admin3 = adminService.get(
				new QueryParam(2)
						.add("email", username)
						.add("password",
								md5PasswordEncoder.encodePassword(password,
										null)).add("state", 0), false);
		System.out.println(username);
		if (admin1 != null) {
			admin = admin1;
		} else if (admin2 != null) {
			admin = admin2;
		} else if (admin3 != null) {
			admin = admin3;
		}

		System.out.println(admin);
		JSONObject retJson = new JSONObject();
		JSONObject resultJson = new JSONObject();
		if (admin != null) {
			System.err.println("adminn oee");
			setSession(Const.SESSION_ADMIN_NAME, admin.getId());
			setSession(Const.SESSION_ADMIN_SHOPID, admin.getShopId());
			setSession(Const.SESSION_ADMIN_PERMISSION, admin.getPermission());
			retJson.put("code", 200);
			resultJson.put("status", 1);
			resultJson.put("id", admin.getId());
			resultJson.put("username", admin.getName());
			resultJson.put("portrait",
					admin.getPic() == null ? " " : admin.getPic());
			retJson.put("result", resultJson);
		} else {
			retJson.put("code", 105);
		}
		return ajaxJson(retJson.toString());
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
