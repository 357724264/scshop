package com.wudianyi.wb.scshop.util;

import java.io.IOException;
import java.security.KeyManagementException;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.UnrecoverableKeyException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.xml.DomDriver;
import com.thoughtworks.xstream.io.xml.XmlFriendlyNameCoder;
import com.wudianyi.wb.scshop.common.WxPayReqData;

public class WxPayUtil {
	public static DefaultHttpClient httpclient;

	private static final SimpleDateFormat sdf = new SimpleDateFormat(
			"yyyyMMddHHmmss");
	static {
		httpclient = new DefaultHttpClient();
		httpclient = (DefaultHttpClient) HttpClientConnectionManager
				.getSSLInstance(httpclient); // 接受任何证书的浏览器客户端
	}

	/**
	 * 通过Https往API post xml数据
	 * 
	 * @param url
	 *            API地址
	 * @param xmlObj
	 *            要提交的XML数据对象
	 * @return API回包的实际数据
	 * @throws IOException
	 * @throws KeyStoreException
	 * @throws UnrecoverableKeyException
	 * @throws NoSuchAlgorithmException
	 * @throws KeyManagementException
	 */

	public static String sendPost(String url, Object xmlObj)
			throws IOException, KeyStoreException, UnrecoverableKeyException,
			NoSuchAlgorithmException, KeyManagementException {
		String classname = xmlObj.getClass().getName();
		String result = null;

		HttpPost httpPost = new HttpPost(url);

		// 解决XStream对出现双下划线的bug
		XStream xStreamForRequestPostData = new XStream(new DomDriver("UTF-8",
				new XmlFriendlyNameCoder("-_", "_")));

		// 将要提交给API的数据对象转换成XML格式数据Post给API
		String postDataXML = xStreamForRequestPostData.toXML(xmlObj);
		postDataXML = postDataXML.replaceAll(classname, "xml");

		postDataXML = postDataXML.substring(0, postDataXML.indexOf("<key>"));
		postDataXML = postDataXML + "</xml>";

		// 中文乱码问题
		postDataXML = new String(postDataXML.toString().getBytes(), "ISO8859-1");

		// 得指明使用UTF-8编码，否则到API服务器XML的中文不能被成功识别
		StringEntity postEntity = new StringEntity(postDataXML, "UTF-8");
		httpPost.addHeader("Content-Type", "text/xml");
		httpPost.setEntity(postEntity);

		// 设置请求器的配置
		// httpPost.setConfig(requestConfig);

		CloseableHttpClient httpClient = HttpClients.custom().build();
		// try {
		HttpResponse response = httpClient.execute(httpPost);

		HttpEntity entity = response.getEntity();

		result = EntityUtils.toString(entity, "UTF-8");
		System.err.println("result===" + result);

		// } catch (ConnectionPoolTimeoutException e) {
		// log.e("http get throw ConnectionPoolTimeoutException(wait time out)");
		//
		// } catch (ConnectTimeoutException e) {
		// log.e("http get throw ConnectTimeoutException");
		//
		// } catch (SocketTimeoutException e) {
		// log.e("http get throw SocketTimeoutException");
		//
		// } catch (Exception e) {
		// log.e("http get throw Exception");
		//
		// } finally {
		// httpPost.abort();
		// }

		return result;
	}

	public static String unifiedorder(WxPayReqData wxPayReqData)
			throws Exception {
		String res = sendPost("https://api.mch.weixin.qq.com/pay/unifiedorder",
				wxPayReqData);
		Map m = doXMLParse(res);
		return (String) m.get("prepay_id");
	}

	/**
	 * 解析xml,返回第一级元素键值对。如果第一级元素有子节点，则此节点的值是子节点的xml数据。
	 * 
	 * @param strxml
	 * @return
	 * @throws JDOMException
	 * @throws IOException
	 */
	public static Map doXMLParse(String strxml) throws Exception {
		if (null == strxml || "".equals(strxml)) {
			return null;
		}

		Map m = new HashMap();
		Document document = DocumentHelper.parseText(strxml);
		Element root = document.getRootElement();
		for (Iterator iter = root.elementIterator(); iter.hasNext();) {

			Element e = (Element) iter.next();
			String k = e.getName();
			String v = e.getText();
			m.put(k, v);
		}

		return m;
	}

	public static String paySign(String appId, String timestamp,
			String nonceStr, String pp, String signType, String key) {
		StringBuffer params = new StringBuffer();
		params.append("appId=");
		params.append(appId);
		params.append("&nonceStr=");
		params.append(nonceStr);
		params.append("&package=");
		params.append(pp);
		params.append("&signType=");
		params.append(signType);
		params.append("&timeStamp=");
		params.append(timestamp);

		System.err.println(params.toString());
		String tempsign = params.toString() + "&key=" + key;
		System.err.println(tempsign);
		return MD5.MD5Encode(tempsign).toUpperCase();

	}
}
