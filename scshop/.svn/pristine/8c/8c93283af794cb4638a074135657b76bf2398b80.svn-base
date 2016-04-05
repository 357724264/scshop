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

public class AppVerifyInterceptor extends AbstractInterceptor {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Resource
	private CacheService cacheService;
	@Resource
	private WebInfoService webInfoService;

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		HttpServletRequest request = (HttpServletRequest) invocation
				.getInvocationContext().get(StrutsStatics.HTTP_REQUEST);
		HttpServletResponse response = (HttpServletResponse) invocation
				.getInvocationContext().get(StrutsStatics.HTTP_RESPONSE);
		String userAgent = request.getHeader("user-agent");
		String code = request.getParameter("code");
		String stat = request.getParameter("state");
		String weixinid = null;
		// System.err.println(userAgent);
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
			cookie.setMaxAge(3600 * 24 * 2);
			response.addCookie(cookie);
		}
		Object weixinidObj = cacheService.get(CacheService.CACHE_SESSION
				+ statusid + "_" + Const.SESSION_WEIXINID);
		if (weixinidObj != null) {
			weixinid = weixinidObj.toString();
		}

		WebInfo webInfo = webInfoService.get(Const.WEBINFO_ID);

		if (userAgent != null && userAgent.indexOf("MicroMessenger") > 0) {// 是微信浏览器
			if (!StringUtils.isEmpty(code)) {
				Object statObj = cacheService.get(CacheService.CACHE_SESSION
						+ statusid + "_" + Const.SESSION_WX_STAT);
				if (statObj != null) {// 判断这个code是不是用过了
					String sessionstat = statObj.toString();
					if (sessionstat.equals(stat)) {
						cacheService.remove(CacheService.CACHE_SESSION
								+ statusid + "_" + Const.SESSION_WX_STAT);
						if (!StringUtils.isEmpty(webInfo.getAppid())
								&& !StringUtils.isEmpty(webInfo.getAppkey())) {
							weixinid = WxMenuUtils.getOpenidByCode(
									webInfo.getAppid(), webInfo.getAppkey(),
									code);
							if (!StringUtils.isEmpty(weixinid)) {
								cacheService.set(CacheService.CACHE_SESSION
										+ statusid + "_"
										+ Const.SESSION_WEIXINID, weixinid,
										CacheService.CACHE_SESSION_TIME);
							}
						}
					}
				}
			}
		}

		System.err.println(userAgent);
		// 如果没有用户的微信id
		if (userAgent.indexOf("MicroMessenger") > 0) {
			if (weixinid == null) {
				if (!StringUtils.isEmpty(webInfo.getAppid())) {
					int rd = (int) (Math.random() * 99999);

					// 把stat放进session，使用过后就不要了
					cacheService.set(CacheService.CACHE_SESSION + statusid
							+ "_" + Const.SESSION_WX_STAT, rd, 60 * 3);

					
					System.err.println("http://" + Const.BASE_URL
									+ request.getRequestURI().toString());
					response.sendRedirect("https://open.weixin.qq.com/connect/oauth2/authorize?appid="
							+ webInfo.getAppid()
							+ "&redirect_uri="
							+ URLEncoder.encode("http://" + Const.BASE_URL
									+ request.getRequestURI().toString(),
									"UTF-8")
							+ "&response_type=code&scope=snsapi_base&state="
							+ rd + "#wechat_redirect");
					return null;
				}
			}

		}

		return invocation.invoke();
	}
}
