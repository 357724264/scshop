package com.wudianyi.wb.scshop.util;

import java.util.Date;
import java.util.UUID;

public class NumberUtil {

	public static String creatSn(String userid) {
		String timestamp = new Date().getTime() + "";
		return timestamp.substring(0, timestamp.length() - 2) + userid;
	}

	public static String creatUUID() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}

}
