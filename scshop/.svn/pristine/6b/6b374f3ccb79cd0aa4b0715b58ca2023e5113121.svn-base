package com.wudianyi.wb.scshop.action.ry.admin;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.springframework.security.authentication.encoding.Md5PasswordEncoder;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Admin;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.ry.models.FormatType;
import com.wudianyi.wb.scshop.ry.models.SdkHttpResult;
import com.wudianyi.wb.scshop.ry.rong.ApiHttpClient;
import com.wudianyi.wb.scshop.service.AdminService;
import com.wudianyi.wb.scshop.util.StringUtils;

public class LoginAction extends BaseAction {

	@Resource
	private AdminService adminService;

	private String username;
	private String password;

	public String in() throws Exception {
		Md5PasswordEncoder md5PasswordEncoder = new Md5PasswordEncoder();
		Admin admin = adminService.get(
				new QueryParam(3)
						.add("userName", username)
						.add("password",
								md5PasswordEncoder.encodePassword(password,
										null)).add("state", 0), false);
		JSONObject retJson = new JSONObject();
		JSONObject userinfoJson = new JSONObject();
		if (admin != null) {

			setSession(Const.SESSION_ADMIN_NAME, admin.getId());
			SdkHttpResult result = null;
			// 获取token
			result = ApiHttpClient.getToken(Const.RONGCLOUD_KEY,
					Const.RONGCLOUD_SECRET, "A00000000" + admin.getId(),
					admin.getUserName(), admin.getPic(), FormatType.json);
			JSONObject tokenObject = JSONObject.fromObject(result.getResult());
			retJson.put("code", 200);

			retJson.put("status", 1);
			userinfoJson.put("userid", "A00000000" + admin.getId());
			userinfoJson.put(
					"username",
					StringUtils.isEmpty(admin.getName()) ? ("客服" + admin
							.getId()) : admin.getName());
			userinfoJson
					.put("userphoto",
							StringUtils.isEmpty(admin.getPic()) ? Const.DEFAULT_KEFU_PHOTO
									: admin.getPic());
			userinfoJson.put("token", tokenObject.get("token"));
			retJson.put("userinfo", userinfoJson);
		} else {
			retJson.put("status", -1);
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
