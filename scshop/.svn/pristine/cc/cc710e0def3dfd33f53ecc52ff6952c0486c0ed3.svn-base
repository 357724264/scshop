package com.wudianyi.wb.scshop.action.ry;

import net.sf.json.JSONObject;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.ry.models.FormatType;
import com.wudianyi.wb.scshop.ry.models.SdkHttpResult;
import com.wudianyi.wb.scshop.ry.rong.ApiHttpClient;

public class UserAction extends BaseAction {

	public String token() throws Exception {
		String userAgent = getRequest().getHeader("user-agent");
		String userid = "1";
		String username = "aa";
		if (userAgent.indexOf("nobleltezc") > 0) {
			userid = "2";
			username = "bb";
		}
		SdkHttpResult result = null;
		// 获取token
		result = ApiHttpClient.getToken(Const.RONGCLOUD_KEY,
				Const.RONGCLOUD_SECRET, userid, username,
				"http://aa.com/a.png", FormatType.json);
		System.err.println(result.getResult());
		JSONObject retJson = JSONObject.fromObject(result.getResult());
		return ajaxJson(retJson.toString());
	}

}
