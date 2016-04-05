package com.wudianyi.wb.scshop.common;

import java.net.URLEncoder;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.StrutsStatics;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.service.CacheService;

public class APPUserVerifyIntercetor extends AbstractInterceptor {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Resource
	private CacheService cacheService;

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		HttpServletRequest request = (HttpServletRequest) invocation
				.getInvocationContext().get(StrutsStatics.HTTP_REQUEST);
		HttpServletResponse response = (HttpServletResponse) invocation
				.getInvocationContext().get(StrutsStatics.HTTP_RESPONSE);
		String statusid = null;
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie c : cookies) {
				if (c.getName().equals(Const.STATAID_COOKE)) {
					statusid = c.getValue();
					break;
				}

			}
		}
		if (statusid == null) {
			statusid = UUID.randomUUID().toString();
			request.setAttribute(Const.STATAID_COOKE, statusid);
			// 保存cookie
			Cookie cookie = new Cookie(Const.STATAID_COOKE, statusid);
			cookie.setPath("/");
			// cookie.setDomain(Const.BASE_WEB_SITE);
			cookie.setMaxAge(3600 * 24 * 365);
			response.addCookie(cookie);
		}

		Object userObject = cacheService.get(CacheService.CACHE_SESSION
				+ statusid + "_" + Const.SESSION_CUSTOMER_ID);
		if (userObject == null) {
			String uri = request.getRequestURI();
			String html = uri.substring(uri.lastIndexOf("/")+1, uri.lastIndexOf(".")).replace("!", "_");
			System.out.println(html);
			response = ServletActionContext.getResponse();
			response.setContentType("text/html;charset=UTF-8");
			response.setHeader("Pragma", "No-cache");
			response.setHeader("Cache-Control", "no-cache");
			response.setDateHeader("Expires", 0);
			response.getWriter().write("{redirectUrl:"+html+"}");
			response.getWriter().flush();
			return null;

		}
		return invocation.invoke();
	}

}
