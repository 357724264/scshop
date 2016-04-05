package com.wudianyi.wb.scshop.service;

public interface WeixinService {

	public String getAccessToken(String appId, String appSecret)
			throws Exception;

	public String getTicket(String appId, String appSecret) throws Exception;
}
