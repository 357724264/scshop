package com.wudianyi.wb.scshop.action.ry.admin;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.entity.Admin;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.ry.models.FormatType;
import com.wudianyi.wb.scshop.ry.models.SdkHttpResult;
import com.wudianyi.wb.scshop.ry.rong.ApiHttpClient;
import com.wudianyi.wb.scshop.service.AdminService;

public class UserAction extends BaseAction {

	@Resource
	private AdminService adminService;

	public String token() throws Exception {
		Integer adminid = (Integer) getSession(Const.SESSION_ADMIN_NAME);
		Admin admin = adminService.get(adminid);
		SdkHttpResult result = null;
		// 获取token
		result = ApiHttpClient.getToken(Const.RONGCLOUD_KEY,
				Const.RONGCLOUD_SECRET, "A" + adminid, admin.getName(),
				admin.getPic(), FormatType.json);
		JSONObject retJson = JSONObject.fromObject(result.getResult());
		System.err.println(retJson.toString());
		return ajaxJson(retJson.toString());

	}
}
