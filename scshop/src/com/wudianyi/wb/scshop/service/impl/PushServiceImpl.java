package com.wudianyi.wb.scshop.service.impl;

import org.springframework.stereotype.Service;

import com.tencent.xinge.XingeApp;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.service.PushService;

@Service
public class PushServiceImpl implements PushService {

	@Override
	public void toAccount(String userid, String title, String content) {
		XingeApp.pushAccountAndroid(Const.XG_APPID, Const.XG_SECRET_KEY,
				title,content, Const.PUSH_USER_FORNT + userid);

	}
}
