package com.wudianyi.wb.scshop.util;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;

import net.sf.json.JSONObject;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.multipart.FilePart;
import org.apache.commons.httpclient.methods.multipart.MultipartRequestEntity;
import org.apache.commons.httpclient.methods.multipart.Part;
import org.apache.commons.httpclient.params.HttpMethodParams;
import org.apache.http.HttpResponse;
import org.apache.http.ParseException;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;

import com.wudianyi.wb.scshop.common.WxUser;

/**
 * 微信自定义菜单创建
 */
public class WxMenuUtils {
	// http客户端
	public static DefaultHttpClient httpclient;

	static final SimpleDateFormat sdf = new SimpleDateFormat(
			"yyyy-MM-dd HH:mm:ss");

	static {
		httpclient = new DefaultHttpClient();
		httpclient = (DefaultHttpClient) HttpClientConnectionManager
				.getSSLInstance(httpclient); // 接受任何证书的浏览器客户端
	}

	/**
	 * 创建菜单
	 */
	public static String createMenu(String params, String accessToken)
			throws Exception {
		HttpPost httpost = HttpClientConnectionManager
				.getPostMethod("https://api.weixin.qq.com/cgi-bin/menu/create?access_token="
						+ accessToken);
		httpost.setEntity(new StringEntity(params, "UTF-8"));
		HttpResponse response = httpclient.execute(httpost);
		String jsonStr = EntityUtils.toString(response.getEntity(), "utf-8");
		System.out.println(jsonStr);
		JSONObject object = JSONObject.fromObject(jsonStr);
		// JSONObject object = JSON.parseObject(jsonStr);
		return object.getString("errmsg");
	}

	/**
	 * 群发图文信息
	 * 
	 * @param openids
	 *            用户的openid
	 * @param media_id
	 *            媒体ID，图文消息
	 * @param accessToken
	 * @return msg_id
	 * @throws ClientProtocolException
	 * @throws IOException
	 */
	public static String sendMsgByOpenids(String[] openids, String media_id,
			String accessToken) throws ClientProtocolException, IOException {
		HttpPost httpost = HttpClientConnectionManager
				.getPostMethod("https://api.weixin.qq.com/cgi-bin/message/mass/send?access_token="
						+ accessToken);

		StringBuffer params = new StringBuffer("{\"touser\":[");
		int openidlength = openids.length;
		for (int i = 0; i < openidlength; i++) {
			params.append("\"");
			params.append(openids[i]);
			params.append("\"");
			if (i != (openidlength - 1)) {
				params.append(",");
			}
		}
		params.append("],");
		params.append("\"mpnews\":{\"media_id\":\"");
		params.append(media_id);
		params.append("\"},");
		params.append("\"msgtype\":\"mpnews\"}");

		System.err.println(params.toString());
		httpost.setEntity(new StringEntity(params.toString(), "UTF-8"));
		HttpResponse response = httpclient.execute(httpost);
		String jsonStr = EntityUtils.toString(response.getEntity(), "utf-8");
		System.out.println(jsonStr);
		JSONObject retobject = JSONObject.fromObject(jsonStr);
		// JSONObject object = JSON.parseObject(jsonStr);
		return retobject.getString("msg_id");

	}

	/**
	 * 群发文本信息
	 * 
	 * @param openids
	 *            用户的openid
	 * @param content
	 *            内容
	 * @param accessToken
	 * @return 消息ID
	 * @throws ClientProtocolException
	 * @throws IOException
	 */
	public static String sendTextMsgByOpenids(String[] openids, String content,
			String accessToken) throws ClientProtocolException, IOException {
		HttpPost httpost = HttpClientConnectionManager
				.getPostMethod("https://api.weixin.qq.com/cgi-bin/message/mass/send?access_token="
						+ accessToken);

		StringBuffer params = new StringBuffer("{\"touser\":[");
		int openidlength = openids.length;
		for (int i = 0; i < openidlength; i++) {
			params.append("\"");
			params.append(openids[i]);
			params.append("\"");
			if (i != (openidlength - 1)) {
				params.append(",");
			}
		}
		params.append("],");
		params.append("\"msgtype\":\"text\",");
		params.append("\"text\":{\"content\":\"");
		params.append(content + "[" + sdf.format(new Date()) + "]");
		params.append("\"}");
		System.err.println(params.toString());
		httpost.setEntity(new StringEntity(params.toString(), "UTF-8"));
		HttpResponse response = httpclient.execute(httpost);
		String jsonStr = EntityUtils.toString(response.getEntity(), "utf-8");
		System.out.println(jsonStr);
		JSONObject retobject = JSONObject.fromObject(jsonStr);
		// JSONObject object = JSON.parseObject(jsonStr);
		return retobject.getString("msg_id");

	}

	/**
	 * 发送文本客服消息
	 * 
	 * @param accessToken
	 * @param content
	 * @param openid
	 * @return
	 * @throws IOException
	 * @throws ClientProtocolException
	 */
	public static String sendText(String accessToken, String content,
			String openid) throws ClientProtocolException, IOException {
		HttpPost httpost = HttpClientConnectionManager
				.getPostMethod("https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token="
						+ accessToken);

		JSONObject object = new JSONObject();
		object.put("touser", openid);
		object.put("msgtype", "text");
		object.put("text",
				"{\"content\":\"" + content + "(" + sdf.format(new Date())
						+ ")\"}");
		System.err.println(object.toString());
		httpost.setEntity(new StringEntity(object.toString(), "UTF-8"));
		HttpResponse response = httpclient.execute(httpost);
		String jsonStr = EntityUtils.toString(response.getEntity(), "utf-8");
		System.out.println(jsonStr);
		// JSONObject retobject = JSONObject.fromObject(jsonStr);
		// // JSONObject object = JSON.parseObject(jsonStr);
		// return retobject.getString("msg_id");
		return null;
	}

	/**
	 * @param type
	 *            image(图片)、thumb(缩略图)
	 * @param filePath
	 * @param accessToken
	 * @return media_id 资源的ID
	 */
	public static String uploadImage(String type, String filePath,
			String accessToken) {
		File file = new File(filePath);
		if (!file.exists()) {
			return "fail";
		}
		PostMethod postMethod = new PostMethod(
				"http://file.api.weixin.qq.com/cgi-bin/media/upload?access_token="
						+ accessToken + "&type=thumb");
		try {
			// FilePart：用来上传文件的类
			FilePart fp = new FilePart("filedata", file);
			Part[] parts = { fp };

			// 对于MIME类型的请求，httpclient建议全用MulitPartRequestEntity进行包装
			MultipartRequestEntity mre = new MultipartRequestEntity(parts,
					postMethod.getParams());
			postMethod.setRequestEntity(mre);
			HttpClient client = new HttpClient();
			client.getHttpConnectionManager().getParams()
					.setConnectionTimeout(50000);// 设置连接时间
			int status = client.executeMethod(postMethod);
			if (status == HttpStatus.SC_OK) {
				String json = postMethod.getResponseBodyAsString();
				System.err.println(json);
				JSONObject object = JSONObject.fromObject(json);
				return object.getString(type.equals("thumb") ? "media_id"
						: "thumb_media_id");

			} else {
				return "fail";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 释放连接
			postMethod.releaseConnection();
		}
		return "fail";
	}

	/**
	 * 推送图文信息
	 * 
	 * @param params
	 * @param accessToken
	 * @return
	 * @throws Exception
	 */
	public static String putMpnews(String params, String accessToken)
			throws Exception {
		HttpPost httpost = HttpClientConnectionManager
				.getPostMethod("https://api.weixin.qq.com/cgi-bin/message/mass/send?access_token="
						+ accessToken);
		httpost.setEntity(new StringEntity(params, "UTF-8"));
		HttpResponse response = httpclient.execute(httpost);
		String jsonStr = EntityUtils.toString(response.getEntity(), "utf-8");
		System.out.println(jsonStr);
		JSONObject object = JSONObject.fromObject(jsonStr);
		// JSONObject object = JSON.parseObject(jsonStr);
		return object.getString("errmsg");
	}

	/**
	 * 获取accessToken
	 */
	public static String getAccessToken(String appid, String secret)
			throws Exception {
		System.err.println("appid====" + appid);
		System.err.println("secret===" + secret);
		URL url = new URL(
				"https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid="
						+ appid + "&secret=" + secret);
		HttpGet get = HttpClientConnectionManager.getGetMethod(url.toString());
		HttpResponse response = httpclient.execute(get);
		String jsonStr = EntityUtils.toString(response.getEntity(), "utf-8");
		System.err.println("==========================" + jsonStr + "");
		JSONObject object = JSONObject.fromObject(jsonStr);
		return object.getString("access_token");
	}

	/**
	 * 查询菜单
	 */
	public static String getMenuInfo(String accessToken) throws Exception {
		HttpGet get = HttpClientConnectionManager
				.getGetMethod("https://api.weixin.qq.com/cgi-bin/menu/get?access_token="
						+ accessToken);
		HttpResponse response = httpclient.execute(get);
		String jsonStr = EntityUtils.toString(response.getEntity(), "utf-8");
		return jsonStr;
	}

	/**
	 * 获取用户信息
	 * 
	 * @param accessToken
	 * @param openid
	 *            用户openid
	 * @return
	 * @throws ClientProtocolException
	 * @throws IOException
	 */
	public static WxUser getUserInfo(String accessToken, String openid)
			throws ClientProtocolException, IOException {

		System.err.println("openid===" + openid);
		HttpPost httpost = HttpClientConnectionManager
				.getPostMethod("https://api.weixin.qq.com/cgi-bin/user/info?access_token="
						+ accessToken + "&openid=" + openid + "&lang=zh_CN");
		HttpResponse response = httpclient.execute(httpost);
		String jsonStr = EntityUtils.toString(response.getEntity(), "utf-8");
		System.err.println("=====" + jsonStr + "================");
		JSONObject object = JSONObject.fromObject(jsonStr);
		if (object.get("errcode") != null) {
			return null;
		}

		if ((object.get("subscribe") + "").equals("0")) {
			WxUser user = new WxUser();
			user.setIsSubscribe(false);
			return user;
		}
		httpost.releaseConnection();
		// JSONObject object = JSONObject.fromObject(jsonStr);
		// JSONObject object = JSON.parseObject(jsonStr);
		return new WxUser(object);
	}

	/**
	 * 删除自定义菜单
	 */
	public static String getAccessToken(String accessToken) throws Exception {
		HttpGet get = HttpClientConnectionManager
				.getGetMethod("https://api.weixin.qq.com/cgi-bin/menu/delete?access_token="
						+ accessToken);
		HttpResponse response = httpclient.execute(get);
		String jsonStr = EntityUtils.toString(response.getEntity(), "utf-8");
		JSONObject object = JSONObject.fromObject(jsonStr);
		get.releaseConnection();
		return object.getString("errmsg");
	}

	/**
	 * 生成带参数的二维码
	 */
	public static String getParamQcode(String accessToken, String param,
			String id) throws Exception {
		HttpPost post = HttpClientConnectionManager
				.getPostMethod("https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token="
						+ accessToken);
		// HttpGet get = HttpClientConnectionManager
		// .getGetMethod("https://api.weixin.qq.com/cgi-bin/menu/delete?access_token="
		// + accessToken);
		StringEntity s = new StringEntity(
				"{\"action_name\": \"QR_LIMIT_STR_SCENE\", \"action_info\": {\"scene\": {\""
						+ param + "\": \"" + id + "\"}}}");
		System.err
				.println("{\"action_name\": \"QR_LIMIT_STR_SCENE\", \"action_info\": {\"scene\": {\""
						+ param + "\": \"" + id + "\"}}}");
		// StringEntity s = new StringEntity(
		// "{\"action_name\": \"QR_LIMIT_STR_SCENE\", \"action_info\": {\"scene\": {\""+param+"\":\""+id+"\"}}}");

		s.setContentEncoding("UTF-8");
		s.setContentType("application/json");
		post.setEntity(s);
		HttpResponse response = httpclient.execute(post);
		String jsonStr = EntityUtils.toString(response.getEntity(), "utf-8");
		System.err.println(jsonStr);
		JSONObject object = JSONObject.fromObject(jsonStr);
		return object.getString("ticket");
		// return object.getString("errmsg");
	}

	public static void setIndustry(String accessToken, String industry_id1,
			String industry_id2) throws ClientProtocolException, IOException {
		HttpPost post = HttpClientConnectionManager
				.getPostMethod("https://api.weixin.qq.com/cgi-bin/template/api_set_industry?access_token="
						+ accessToken);
		// HttpGet get = HttpClientConnectionManager
		// .getGetMethod("https://api.weixin.qq.com/cgi-bin/menu/delete?access_token="
		// + accessToken);
		StringEntity s = new StringEntity("{\"industry_id1\":\"" + industry_id1
				+ "\",\"industry_id2\":\"" + industry_id2 + "\"");
		s.setContentEncoding("UTF-8");
		s.setContentType("application/json");
		post.setEntity(s);
		HttpResponse response = httpclient.execute(post);
		String jsonStr = EntityUtils.toString(response.getEntity(), "utf-8");
		System.err.println(jsonStr);
	}

	public static String getTemplateId(String accessToken)
			throws ClientProtocolException, IOException {
		// HttpPost post = HttpClientConnectionManager
		// .getPostMethod("https://api.weixin.qq.com/cgi-bin/template/api_add_template?access_token="
		// + accessToken);
		// // HttpGet get = HttpClientConnectionManager
		// //
		// .getGetMethod("https://api.weixin.qq.com/cgi-bin/menu/delete?access_token="
		// // + accessToken);
		// s.setContentEncoding("UTF-8");
		// s.setContentType("application/json");
		// post.setEntity(s);
		// HttpResponse response = httpclient.execute(post);
		// String jsonStr = EntityUtils.toString(response.getEntity(), "utf-8");
		// System.err.println(jsonStr);
		return null;

	}

	public static String sendTemplate(String accessToken, String weixinid,
			String orderid, String servname, String time)
			throws ParseException, IOException {

		HttpPost post = HttpClientConnectionManager
				.getPostMethod("https://api.weixin.qq.com/cgi-bin/message/template/send?access_token="
						+ accessToken);
		// JSONObject object = JSONObject
		// .fromObject("{\"touser\":\"o3V_Tsgnu033EYHCu-8x_XK683yw\",\"template_id\":\"tYRDU2f4IQ59BimbOL9DEAiid4VT-Re2NrhObsZjHSA\",\"url\":\"http://weixin.qq.com/download\",\"topcolor\":\"#FF0000\",\"data\":{\"first\": {\"value\":\"您的预约已经确认\",\"color\":\"#173177\"},\"Apply_id\":{\"value\":\""
		// + orderid
		// + "\",\"color\":\"#173177\"},\"Apply_Type\":{\"value\":\""
		// + servname
		// +
		// "\",\"color\":\"#173177\"},\"Apply_State\":{\"value\":\"预约确认\",\"color\":\"#173177\"},\"Apply_CreateTime\":{\"value\":\""
		// + time
		// +
		// "\",\"color\":\"#173177\"},\"remark\":{\"value\":\"点击详情\",\"color\":\"#173177\"}}}");
		StringEntity s = new StringEntity(
				"{\"touser\":\""
						+ weixinid
						+ "\",\"template_id\":\"tYRDU2f4IQ59BimbOL9DEAiid4VT-Re2NrhObsZjHSA\",\"url\":\"http://weixin.qq.com/download\",\"topcolor\":\"#FF0000\",\"data\":{\"first\": {\"value\":\"您的预约已经确认\",\"color\":\"#173177\"},\"Apply_id\":{\"value\":\""
						+ orderid
						+ "\",\"color\":\"#173177\"},\"Apply_Type\":{\"value\":\""
						+ servname
						+ "\",\"color\":\"#173177\"},\"Apply_State\":{\"value\":\"预约确认\",\"color\":\"#173177\"},\"Apply_CreateTime\":{\"value\":\""
						+ time
						+ "\",\"color\":\"#173177\"},\"remark\":{\"value\":\"点击详情\",\"color\":\"#173177\"}}}",
				"UTF-8");
		s.setContentEncoding("UTF-8");
		s.setContentType("application/json");
		post.setEntity(s);
		post.getParams().setParameter(HttpMethodParams.HTTP_CONTENT_CHARSET,
				"UTF-8");
		HttpResponse response = httpclient.execute(post);
		String jsonStr = EntityUtils.toString(response.getEntity(), "utf-8");
		System.err.println(jsonStr);
		return null;

	}

	public static String OrderChangeNotify(String orderid, String name,
			String stat, String note, String accessToken, String weixinid,
			String url, String templateid) throws ClientProtocolException,
			IOException {
		if (accessToken == null) {
			return null;
		}

		HttpPost post = HttpClientConnectionManager
				.getPostMethod("https://api.weixin.qq.com/cgi-bin/message/template/send?access_token="
						+ accessToken);
		StringEntity s = new StringEntity(
				"{\"touser\":\""
						+ weixinid
						+ "\",\"template_id\":\""
						+ templateid
						+ "\",\"url\":\""
						+ url
						+ "\",\"topcolor\":\"#FF0000\",\"data\":{\"first\": {\"value\":\"尊敬的"
						+ name
						+ ":\",\"color\":\"#173177\"},\"OrderSn\":{\"value\":\""
						+ orderid
						+ "\",\"color\":\"#173177\"},\"OrderStatus\":{\"value\":\""
						+ stat
						+ "\",\"color\":\"#173177\"},\"remark\":{\"value\":\""
						+ note + "\",\"color\":\"#173177\"}}}", "UTF-8");
		s.setContentEncoding("UTF-8");
		s.setContentType("application/json");
		post.setEntity(s);
		post.getParams().setParameter(HttpMethodParams.HTTP_CONTENT_CHARSET,
				"UTF-8");
		HttpResponse response = httpclient.execute(post);
		String jsonStr = EntityUtils.toString(response.getEntity(), "utf-8");
		System.err.println(jsonStr);
		return null;
	}

	public static String OrderPaidNotify(double money, String name,
			String pageName, String accessToken, String weixinid,
			String templateid) throws ClientProtocolException, IOException {
		if (accessToken == null) {
			return null;
		}

		HttpPost post = HttpClientConnectionManager
				.getPostMethod("https://api.weixin.qq.com/cgi-bin/message/template/send?access_token="
						+ accessToken);
		StringEntity s = new StringEntity(
				"{\"touser\":\""
						+ weixinid
						+ "\",\"template_id\":\""
						+ templateid
						+ "\",\"url\":\"#\",\"topcolor\":\"#FF0000\",\"data\":{\"first\": {\"value\":\"用户"
						+ name
						+ "在您的商城付款了"
						+ ":\",\"color\":\"#173177\"},\"orderMoneySum\":{\"value\":\""
						+ money
						+ "\",\"color\":\"#173177\"},\"orderProductName\":{\"value\":\""
						+ pageName
						+ "等"
						+ "\",\"color\":\"#173177\"},\"Remark\":{\"value\":\"可登陆管理后台查看\",\"color\":\"#173177\"}}}",
				"UTF-8");
		s.setContentEncoding("UTF-8");
		s.setContentType("application/json");
		post.setEntity(s);
		post.getParams().setParameter(HttpMethodParams.HTTP_CONTENT_CHARSET,
				"UTF-8");
		HttpResponse response = httpclient.execute(post);
		String jsonStr = EntityUtils.toString(response.getEntity(), "utf-8");
		System.err.println(jsonStr);
		return null;
	}

	public static String lotteryWinNotify(String shopname, int money,
			Date createDate, String weixinid, String templateid,
			String accessToken) throws ClientProtocolException, IOException {
		if (accessToken == null) {
			return null;
		}

		HttpPost post = HttpClientConnectionManager
				.getPostMethod("https://api.weixin.qq.com/cgi-bin/message/template/send?access_token="
						+ accessToken);
		StringEntity s = new StringEntity(
				"{\"touser\":\""
						+ weixinid
						+ "\",\"template_id\":\""
						+ templateid
						+ "\",\"url\":\"http://www.yywill.com/user!win.action\",\"topcolor\":\"#FF0000\",\"data\":{\"result\": {\"value\":\"您在"
						+ shopname
						+ "中中奖了！运气杠杠的！"
						+ ":\",\"color\":\"#173177\"},\"totalWinMoney\":{\"value\":\"中奖\",\"color\":\"#173177\"},\"issueInfo\":{\"value\":\""
						+ shopname
						+ "\",\"color\":\"#173177\"},\"fee\":{\"value\":\""
						+ money
						+ "\",\"color\":\"#173177\"},\"betTime\":{\"value\":\""
						+ sdf.format(createDate)
						+ "\",\"color\":\"#173177\"},\"remark\":{\"value\":\"点击领奖哦\",\"color\":\"#173177\"}}}",
				"UTF-8");
		s.setContentEncoding("UTF-8");
		s.setContentType("application/json");
		post.setEntity(s);
		post.getParams().setParameter(HttpMethodParams.HTTP_CONTENT_CHARSET,
				"UTF-8");
		HttpResponse response = httpclient.execute(post);
		String jsonStr = EntityUtils.toString(response.getEntity(), "utf-8");
		System.err.println(jsonStr);
		return null;
	}

	/**
	 * 预约通知
	 * 
	 * @param accessToken
	 * @param username
	 * @param servname
	 * @throws IOException
	 * @throws ClientProtocolException
	 */
	public static String reservNotify(String accessToken, String username,
			String servname, String weixinid, String time, String templateid)
			throws ClientProtocolException, IOException {
		if (accessToken == null) {
			return null;
		}

		HttpPost post = HttpClientConnectionManager
				.getPostMethod("https://api.weixin.qq.com/cgi-bin/message/template/send?access_token="
						+ accessToken);
		StringEntity s = new StringEntity(
				"{\"touser\":\""
						+ weixinid
						+ "\",\"template_id\":\""
						+ templateid
						+ "\",\"url\":\"#\",\"topcolor\":\"#FF0000\",\"data\":{\"first\": {\"value\":\"您有一个来自客户"
						+ username
						+ "的新预约\",\"color\":\"#173177\"},\"keyword1\":{\"value\":\""
						+ servname
						+ "\",\"color\":\"#173177\"},\"keyword2\":{\"value\":\"预约\",\"color\":\"#173177\"},\"remark\":{\"value\":\"预约时间:"
						+ time + "\",\"color\":\"#173177\"}}}", "UTF-8");
		s.setContentEncoding("UTF-8");
		s.setContentType("application/json");
		post.setEntity(s);
		post.getParams().setParameter(HttpMethodParams.HTTP_CONTENT_CHARSET,
				"UTF-8");
		HttpResponse response = httpclient.execute(post);
		String jsonStr = EntityUtils.toString(response.getEntity(), "utf-8");
		System.err.println(jsonStr);
		return null;
	}

	/**
	 * 预约反馈通知
	 * 
	 * @param accessToken
	 * @param username
	 * @param servname
	 * @param stat
	 *            0:取消 1：成功
	 * @throws IOException
	 * @throws ClientProtocolException
	 */
	public static String reservbackNotify(String accessToken, String staffname,
			String servname, String weixinid, String time, int stat,
			String templateid) throws ClientProtocolException, IOException {
		if (accessToken == null) {
			return null;
		}
		String str = "成功";
		if (stat == 0) {
			str = "取消";
		}

		HttpPost post = HttpClientConnectionManager
				.getPostMethod("https://api.weixin.qq.com/cgi-bin/message/template/send?access_token="
						+ accessToken);
		StringEntity s = new StringEntity(
				"{\"touser\":\""
						+ weixinid
						+ "\",\"template_id\":\""
						+ templateid
						+ "\",\"url\":\"#\",\"topcolor\":\"#FF0000\",\"data\":{\"first\": {\"value\":\"您预约的"
						+ servname
						+ "已经预约"
						+ str
						+ "了\",\"color\":\"#173177\"},\"keyword1\":{\"value\":\""
						+ servname
						+ "("
						+ staffname
						+ ")"
						+ "\",\"color\":\"#173177\"},\"keyword2\":{\"value\":\"预约"
						+ str
						+ "\",\"color\":\"#173177\"},\"remark\":{\"value\":\"预约时间:"
						+ time + "\",\"color\":\"#173177\"}}}", "UTF-8");
		s.setContentEncoding("UTF-8");
		s.setContentType("application/json");
		post.setEntity(s);
		post.getParams().setParameter(HttpMethodParams.HTTP_CONTENT_CHARSET,
				"UTF-8");
		HttpResponse response = httpclient.execute(post);
		String jsonStr = EntityUtils.toString(response.getEntity(), "utf-8");
		System.err.println(jsonStr);
		return null;
	}

	public static String getJsapiTicket(String token)
			throws ClientProtocolException, IOException {
		System.err
				.println("https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token="
						+ token + "&type=jsapi");
		HttpGet get = HttpClientConnectionManager
				.getGetMethod("https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token="
						+ token + "&type=jsapi");
		HttpResponse response = httpclient.execute(get);
		String jsonStr = EntityUtils.toString(response.getEntity(), "utf-8");
		System.err.println(jsonStr);
		JSONObject object = JSONObject.fromObject(jsonStr);
		// 成功了
		if (object.get("errcode").toString().equals("0")) {
			return (String) object.get("ticket");
		}
		return null;
	}

	/**
	 * 根据授权CODE得到openid
	 * <p>
	 * 与基础支持中的access_token（该access_token用于调用其他接口）不同
	 * 
	 * @param appid
	 * @param appsecret
	 * @param code
	 *            授权页面返回的code
	 * @return 临时accessToken
	 * @throws IOException
	 * @throws ClientProtocolException
	 */
	public static String getOpenidByCode(String appid, String appsecret,
			String code) throws ClientProtocolException, IOException {
		HttpGet get = HttpClientConnectionManager
				.getGetMethod("https://api.weixin.qq.com/sns/oauth2/access_token?appid="
						+ appid
						+ "&secret="
						+ appsecret
						+ "&code="
						+ code
						+ "&grant_type=authorization_code");

		System.err
				.println("https://api.weixin.qq.com/sns/oauth2/access_token?appid="
						+ appid
						+ "&secret="
						+ appsecret
						+ "&code="
						+ code
						+ "&grant_type=authorization_code");
		HttpResponse response = httpclient.execute(get);
		String jsonStr = EntityUtils.toString(response.getEntity(), "utf-8");
		System.err.println("==============" + jsonStr);
		JSONObject object = JSONObject.fromObject(jsonStr);
		return object.get("openid") == null ? null : (String) object
				.get("openid");
	}

}