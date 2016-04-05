package com.wudianyi.wb.scshop.service.impl;

import java.io.Serializable;
import java.util.List;

import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.dao.BaseDao;
import com.wudianyi.wb.scshop.service.BaseService;

public class BaseServiceImpl<T, PK extends Serializable> implements
		BaseService<T, PK> {

	private BaseDao<T, PK> baseDao;

	public BaseDao<T, PK> getBaseDao() {
		return baseDao;
	}

	public void setBaseDao(BaseDao<T, PK> baseDao) {
		this.baseDao = baseDao;
	}

	public T get(PK id) {
		return baseDao.get(id);
	}

	public T load(PK id) {
		return baseDao.load(id);
	}

	public T get(QueryParam params,boolean cache){
		return baseDao.get(params, cache);
	}
	public List<T> getAll(String orderbyparam, String orderby, boolean cache) {
		return baseDao.getAll(orderbyparam, orderby, cache);
	}


	public PK save(T entity) {
		return baseDao.save(entity);
	}

	public void update(T entity) {
		baseDao.update(entity);
	}

	
	public void delete(T entity) {
		baseDao.delete(entity);
	}

	public void delete(PK id) {
		baseDao.delete(id);
	}

	public List<T> getList(QueryParam params, int start, int limit,
			String orderbyparam, String orderby, boolean cache) {
		return baseDao.getList(params, start, limit, orderbyparam, orderby,
				cache);
	}

	public int getTotalCount(QueryParam params, boolean cache) {
		return baseDao.getTotalCount(params, cache);
	}

	/**
	 * 得到某个区间内查找的数据列表
	 * 
	 * @param key
	 *            要查找的键�?
	 * @param value要查找的�?
	 * @param params
	 *            参数�?
	 * @param timecheck根据哪个时间参数做对�?
	 * @param begin�?��区间
	 * @param end结束区间
	 * @param start分页相关
	 * @param limit分页相关
	 * @return
	 */
	public List<T> getStaticsLikeList(String key, String value,
			QueryParam params, String timecheck, Object begin, Object end,
			Integer start, Integer limit, String order, String orderby) {
		return baseDao.getStaticsLikeList(key, value, params, timecheck, begin,
				end, start, limit, order, orderby);
	}

	/**
	 * 得到某个区间内的数据数量
	 * 
	 * @param key
	 *            要查找的键�?
	 * @param value要查找的�?
	 * @param params
	 *            参数�?
	 * @param timecheck
	 *            根据哪个时间参数做对�?
	 * @param begin
	 *            �?��区间
	 * @param end
	 *            结束区间
	 * @return
	 */
	public int getLikestatics(String key, String value, QueryParam params,
			String timecheck, Object begin, Object end) {
		return baseDao
				.getLikestatics(key, value, params, timecheck, begin, end);
	}

	public int getLikeTotalCount(String propertyName, String value,
			String dataOwner, QueryParam queryParam, boolean cache) {
		// TODO Auto-generated method stub
		return baseDao.getLikeTotalCount(propertyName, value, dataOwner,
				queryParam, cache).intValue();
	}

	public List<T> getLikeList(String propertyName, String value,
			String dataOwner, QueryParam param, int start, int limit,
			String orderbyparam, String orderby, boolean cache) {
		// TODO Auto-generated method stub
		return baseDao.getLikeList(propertyName, value, dataOwner, param,
				start, limit, orderbyparam, orderby, cache);
	}

}
