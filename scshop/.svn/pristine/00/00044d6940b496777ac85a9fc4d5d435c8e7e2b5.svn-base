package com.wudianyi.wb.scshop.service.impl;

import java.util.concurrent.TimeoutException;

import javax.annotation.Resource;

import net.rubyeye.xmemcached.MemcachedClient;
import net.rubyeye.xmemcached.exception.MemcachedException;

import org.springframework.stereotype.Service;

import com.wudianyi.wb.scshop.service.CacheService;

@Service
public class CacheServiceImpl implements CacheService {

	/**
	 * 数据的缓存
	 */
	public static final String CACHE_DATA = "cache_data_";
	@Resource
	private MemcachedClient memcachedClient;

	public Object get(String key) {
		try {
			return memcachedClient.get(key);
		} catch (TimeoutException e) {
			return null;
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			return null;
		} catch (MemcachedException e) {
			// TODO Auto-generated catch block
			return null;
		}
	}

	public void set(String key, Object object, int time) {
		if (object != null) {
			try {
				memcachedClient.set(key, time, object);
			} catch (TimeoutException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (MemcachedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	public void remove(String key) {
		try {
			memcachedClient.delete(key);
		} catch (TimeoutException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MemcachedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public Object getData(String name) {
		return this.get(CACHE_DATA + name);
	}

	public void setData(String name, Object value, int time) {
		this.set(CACHE_DATA + name, value, time);
	}
}
