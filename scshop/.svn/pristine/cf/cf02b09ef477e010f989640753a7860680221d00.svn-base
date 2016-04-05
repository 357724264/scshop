package com.wudianyi.wb.scshop.dao;

import java.io.Serializable;
import java.util.List;

import com.wudianyi.wb.scshop.common.QueryParam;



/**
 * Dao接口 - Dao基接
 */

public interface BaseDao<T, PK extends Serializable> {

	/**
	 * 根据ID获取实体对象.
	 * 
	 * @param id
	 *            记录ID
	 * @return 实体对象
	 */
	public T get(PK id);

	/**
	 * 根据ID获取实体对象.
	 * 
	 * @param id
	 *            记录ID
	 * @return 实体对象
	 */
	public T load(PK id);
//
//	/**
//	 * 根据属�?名和属�?值获取实体对�?
//	 * 
//	 * @param propertyName
//	 *            属�?名称
//	 * @param value
//	 *            属�?�?
//	 * @return 实体对象
//	 */
//	public T get(String propertyName, Object value, boolean cache);
	
	/**
	 * 根据属�?名和属�?值获取实体对�?
	 * 
	 * @param param
	 *            属�?�?
	 * @return 实体对象
	 */
	public T get(QueryParam params,boolean cache);

	/**
	 * 
	 * @param params
	 *            参数对，String，Object
	 * @param start
	 *            分页�?��
	 * @param limit
	 *            分页长度
	 * @param orderbyparam
	 *            排序参数
	 * @param orderby
	 *            排序类型，desc，asc
	 * @param cache
	 *            是否加缓�?
	 * @return
	 */
	public List<T> getList(QueryParam params, int start, int limit,
			String orderbyparam, String orderby, boolean cache);

	/**
	 * 
	 * @param params
	 *            参数对，String，Object
	 * @param cache
	 *            是否使用缓存
	 * @return
	 */
	public int getTotalCount(QueryParam params, boolean cache);

	/**
	 * 
	 * @param orderbyparam
	 * @param orderby
	 * @return 实体对象集合
	 */
	public List<T> getAll(String orderbyparam, String orderby, boolean cache);


	/**
	 * 保存实体对象.
	 * 
	 * @param entity
	 *            对象
	 * @return ID
	 */
	public PK save(T entity);

	/**
	 * 更新实体对象.
	 * 
	 * @param entity
	 *            对象
	 */
	public void update(T entity);

	/**
	 * 删除实体对象.
	 * 
	 * @param entity
	 *            对象
	 * @return
	 */
	
	
	public void delete(T entity);

	/**
	 * 根据ID删除实体对象.
	 * 
	 * @param id
	 *            记录ID
	 */
	public void delete(PK id);

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
			Integer start, Integer limit, String order, String orderby);

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
			String timecheck, Object begin, Object end);

	/**
	 * 根据参数得到模糊查询total
	 * 
	 * @param propertyName
	 * @param value
	 * @return 实体对象总数
	 */
	public Integer getLikeTotalCount(String propertyName, String value,
			String dataOwner, QueryParam queryParam, boolean cache);

	/**
	 * 模糊查询List
	 * 
	 * @param propertyName
	 *            属�?参数
	 * @param value
	 *            属�?�?必须为：'%?%')
	 * @param dataOwner
	 *            �?��者，可以为空
	 * @param start
	 *            分页参数
	 * @param limit
	 *            分页参数
	 * @param oderbyparam
	 *            根据哪个参数排序
	 * @param orderby
	 *            排序顺序 desc倒序 asc顺序
	 * @return �?��list
	 */
	public List<T> getLikeList(String propertyName, String value,
			String dataOwner, QueryParam param, int start, int limit,
			String orderbyparam, String orderby, boolean cache);

}