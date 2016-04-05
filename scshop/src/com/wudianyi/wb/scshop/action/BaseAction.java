package com.wudianyi.wb.scshop.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.wudianyi.wb.scshop.entity.Admin;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.entity.WebInfo;
import com.wudianyi.wb.scshop.service.AdminService;
import com.wudianyi.wb.scshop.service.CacheService;
import com.wudianyi.wb.scshop.service.WebInfoService;
import com.wudianyi.wb.scshop.service.WeixinService;
import com.wudianyi.wb.scshop.util.StringUtils;

public class BaseAction extends ActionSupport {

	private static final long serialVersionUID = 6718838811223344556L;

	protected static final String FONT_SYSTEM_KEY = "systemClass.cid";

	public static final String VIEW = "view";
	public static final String LIST = "list";
	public static final String STATUS = "status";
	public static final String WARN = "warn";
	public static final String SUCCESS = "success";
	public static final String ERROR = "error";
	public static final String MESSAGE = "message";
	public static final String CONTENT = "content";
	protected static int ADMIN_PAGE_SIZE = 10;
	protected int pn = 1;
	protected int ps;
	protected String keyword;
	protected String temptoken;
	protected String token;
	protected String pro;
	protected String msg;
	protected List list;
	protected int size;
	protected int tn; // 总条�?
	protected String ids;
	protected String logInfo;// 日志记录信息
	@Resource
	private CacheService cacheService;
	@Resource
	private AdminService adminService;
	@Resource
	private WebInfoService webInfoService;
	@Resource
	private WeixinService weixinService;

	public String getTick() throws Exception {
		WebInfo webInfo = webInfoService.get(Const.WEBINFO_ID);
		return weixinService.getTicket(webInfo.getAppid(), webInfo.getAppkey());
	}

	public String input() {
		return null;
	}

	// 获取Attribute
	public Object getAttribute(String name) {
		return ServletActionContext.getRequest().getAttribute(name);
	}

	// 设置Attribute
	public void setAttribute(String name, Object value) {
		ServletActionContext.getRequest().setAttribute(name, value);
	}

	// 获取Parameter
	public String getParameter(String name) {
		return getRequest().getParameter(name);
	}

	// 获取Parameter数组
	public String[] getParameterValues(String name) {
		return getRequest().getParameterValues(name);
	}

	public WebInfo getWebInfo() {
		return webInfoService.get(Const.WEBINFO_ID);
	}

	// 获取Session
	public Object getSession(String name) {
		return cacheService.get(CacheService.CACHE_SESSION + getStatusid()
				+ "_" + name);
		// ActionContext actionContext = ActionContext.getContext();
		// Map<String, Object> session = actionContext.getSession();
		// return session.get(name);
	}

	// 获取Session
	// public Map<String, Object> getSession() {
	// ActionContext actionContext = ActionContext.getContext();
	// Map<String, Object> session = actionContext.getSession();
	// return session;
	// }

	// 设置Session
	public void setSession(String name, Object value) {
		if (value != null) {
			System.err.println("====2+" + CacheService.CACHE_SESSION
					+ getStatusid() + "_" + name);
			cacheService.set(CacheService.CACHE_SESSION + getStatusid() + "_"
					+ name, value, CacheService.CACHE_SESSION_TIME);
		}
	}

	// 清除session
	public void removeSession(String name) {
		cacheService.remove(CacheService.CACHE_SESSION + getStatusid() + "_"
				+ name);
	}

	// 获取Request
	public HttpServletRequest getRequest() {
		return ServletActionContext.getRequest();
	}

	// 获取Response
	public HttpServletResponse getResponse() {
		return ServletActionContext.getResponse();
	}

	// 获取Application
	public ServletContext getApplication() {
		return ServletActionContext.getServletContext();
	}

	protected String getStatusid() {
		String statusid = cookieGet(Const.STATAID_COOKE);
		if (statusid == null) {
			statusid = (String) getAttribute(Const.STATAID_COOKE);
		}
		return statusid;
	}

	protected String cookieGet(String key) {
		Cookie[] cookies = getRequest().getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals(key)) {
					return cookie.getValue();
				}
			}
		}
		return null;
	}

	protected void cookieSet(String key, String value) {
		Cookie cookie = new Cookie(key, value);
		getResponse().addCookie(cookie);
	}

	// AJAX输出，返回null
	public String ajax(String content, String type) {
		try {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType(type + ";charset=UTF-8");
			response.setHeader("Pragma", "No-cache");
			response.setHeader("Cache-Control", "no-cache");
			response.setDateHeader("Expires", 0);
			response.getWriter().write(content);
			response.getWriter().flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	// AJAX输出文本，返回null
	public String ajaxText(String text) {
		return ajax(text, "text/plain");
	}

	// AJAX输出HTML，返回null
	public String ajaxHtml(String html) {
		return ajax(html, "text/html");
	}

	// AJAX输出XML，返回null
	public String ajaxXml(String xml) {
		return ajax(xml, "text/xml");
	}

	// 根据字符串输出JSON，返回null
	public String ajaxJson(String jsonString) {
		return ajax(jsonString, "text/html");
	}

	// 根据Map输出JSON，返回null
	public String ajaxJson(Map<String, String> jsonMap) {
		JSONObject jsonObject = JSONObject.fromObject(jsonMap);
		return ajax(jsonObject.toString(), "text/html");
	}

	// 输出JSON警告消息，返回null
	public String ajaxJsonWarnMessage(String message) {
		Map<String, String> jsonMap = new HashMap<String, String>();
		jsonMap.put(STATUS, WARN);
		jsonMap.put(MESSAGE, message);
		JSONObject jsonObject = JSONObject.fromObject(jsonMap);
		return ajax(jsonObject.toString(), "text/html");
	}

	// 输出JSON成功消息，返回null
	public String ajaxJsonSuccessMessage(String url) {
		if (StringUtils.isEmpty(url)) {
			return ajaxJson("{\"success\":true}");
		}
		return ajaxJson("{\"success\":true,\"url\":\"" + url + "\"}");
	}

	// 输出JSON错误消息，返回null
	public String ajaxJsonErrorMessage(String message) {
		return ajaxJson("{\"success\":false,\"msg\":\"" + message + "\"}");
	}

	// 设置页面不缓�?
	public void setResponseNoCache() {
		getResponse().setHeader("progma", "no-cache");
		getResponse().setHeader("Cache-Control", "no-cache");
		getResponse().setHeader("Cache-Control", "no-store");
		getResponse().setDateHeader("Expires", 0);
	}

	public Admin getAdminScshop() {

		return adminService.get((Integer) getSession(Const.SESSION_ADMIN_NAME));

	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public String getLogInfo() {
		return logInfo;
	}

	public void setLogInfo(String logInfo) {
		this.logInfo = logInfo;
	}

	public List getList() {
		return list;
	}

	public int getPn() {
		return pn;
	}

	public void setPn(int pn) {
		this.pn = pn;
	}

	public int getPs() {
		return ps;
	}

	public void setPs(int ps) {
		this.ps = ps;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getPro() {
		return pro;
	}

	public void setPro(String pro) {
		this.pro = pro;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public int getTn() {
		return tn;
	}

	public void setTn(int tn) {
		this.tn = tn;
	}

	public String getTemptoken() {
		return temptoken;
	}

	public void setTemptoken(String temptoken) {
		this.temptoken = temptoken;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

}