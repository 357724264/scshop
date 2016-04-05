package com.wudianyi.wb.scshop.common;

import java.net.URLEncoder;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.StrutsStatics;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.entity.WebInfo;
import com.wudianyi.wb.scshop.service.CacheService;
import com.wudianyi.wb.scshop.service.WebInfoService;
import com.wudianyi.wb.scshop.util.StringUtils;
import com.wudianyi.wb.scshop.util.WxMenuUtils;

public class AdminVerifyIntercetor extends AbstractInterceptor {

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
				}
			}
		}
		System.err.println("1statusid===" + statusid);
		if (statusid == null) {
			statusid = UUID.randomUUID().toString();
			request.setAttribute(Const.STATAID_COOKE, statusid);
			// 保存cookie
			Cookie cookie = new Cookie(Const.STATAID_COOKE, statusid);
			cookie.setPath("/");
			// cookie.setDomain(Const.BASE_WEB_SITE);
			cookie.setMaxAge(3600 * 24 * 2);
			response.addCookie(cookie);
			response.sendRedirect("login.action");
			return null;
		} else {
			System.err.println("else");
			System.err.println("===1+" + CacheService.CACHE_SESSION + statusid
					+ "_" + Const.SESSION_ADMIN_NAME);
			if (cacheService.get(CacheService.CACHE_SESSION + statusid + "_"
					+ Const.SESSION_ADMIN_NAME) == null) {
				response.sendRedirect("login.action");
				return null;
			}
		}

		return invocation.invoke();
	}
}
