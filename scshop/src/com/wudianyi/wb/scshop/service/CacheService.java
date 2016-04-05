package com.wudianyi.wb.scshop.service;

public interface CacheService {

	public static final String CACHE_SESSION = "cache_session_";
	public static final String APP_SESSION = "app_session_";
	public static final int CACHE_SESSION_TIME = 3600 * 24 * 2;

	public void set(String key, Object object, int time);

	public Object get(String key);

	public void remove(String key);

	/**
	 * 得到缓存的数据
	 */
	public Object getData(String name);

	/**
	 * 得到缓存的数据
	 */
	public void setData(String name, Object value, int time);

}
