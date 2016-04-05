package com.wudianyi.wb.scshop.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

public class SmsUtil {

	public static void main(String[] args) throws IOException {
		String ret = SmsUtil.sendSms("2415商城验证码，请注意保管", "13590334132");

		System.err.println(ret);
	}

	/**
	 * 短信发送
	 * 
	 * @param content
	 *            短信内容
	 * @param mobile
	 *            手机号码，多个号码用逗号隔开例如：13800138000,1371111111
	 * @return
	 * @throws IOException
	 */
	public static String sendSms(String content, String mobile)
			throws IOException {
		// 创建StringBuffer对象用来操作字符串
		StringBuffer sb = new StringBuffer("http://m.5c.com.cn/api/send/?");

		// APIKEY
		sb.append("apikey=6051110fd92557eba97fc72d489cbc65");

		// 用户名
		sb.append("&username=maifengle");

		// 向StringBuffer追加密码
		sb.append("&password=1234mfl");

		// 向StringBuffer追加手机号码
		sb.append("&mobile=" + mobile);

		// 向StringBuffer追加消息内容转URL标准码
		sb.append("&content=" + URLEncoder.encode(content, "GBK"));

		// 创建url对象
		URL url = new URL(sb.toString());

		// 打开url连接
		HttpURLConnection connection = (HttpURLConnection) url.openConnection();

		// 设置url请求方式 ‘get’ 或者 ‘post’
		connection.setRequestMethod("POST");

		// 发送
		BufferedReader in = new BufferedReader(new InputStreamReader(
				url.openStream()));

		// 返回发送结果
		String inputline = in.readLine();

		// 输出结果
		return inputline;
	}

}
