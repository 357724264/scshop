package com.wudianyi.wb.scshop.dao.impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.util.Assert;

import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.dao.BaseDao;
import com.wudianyi.wb.scshop.util.StringUtils;

public class BaseDaoImpl<T, PK extends Serializable> implements BaseDao<T, PK> {

	private Class<T> entityClass;
	protected SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	public BaseDaoImpl() {
		this.entityClass = null;
		Class c = getClass();
		Type type = c.getGenericSuperclass();
		if (type instanceof ParameterizedType) {
			Type[] parameterizedType = ((ParameterizedType) type)
					.getActualTypeArguments();
			this.entityClass = (Class<T>) parameterizedType[0];
		}
	}

	@Resource
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	protected Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@SuppressWarnings("unchecked")
	@Override
	public T get(PK id) {
		Assert.notNull(id, "id is required");
		return (T) getSession().get(entityClass, id);
	}

	@Override
	@SuppressWarnings("unchecked")
	public T load(PK id) {
		Assert.notNull(id, "id is required");
		return (T) getSession().load(entityClass, id);
	}

	/**
	 * 根据属�?名和属�?值获取实体对�?
	 * 
	 * @param param
	 *            属�?�?
	 * @return 实体对象
	 */
	public T get(QueryParam params, boolean cache) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(entityClass);
		Criteria criteria = detachedCriteria
				.getExecutableCriteria(getSession());
		if (params != null) {
			int length = params.getLength();

			for (int i = 0; i < length; i++) {

				criteria.add(Restrictions.eq(params.getKey(i),
						params.getValue(i)));
			}
		}

		return (T) criteria.setCacheable(cache).uniqueResult();

	}

	@Override
	@SuppressWarnings("unchecked")
	public List<T> getAll(String orderbyparam, String orderby, boolean cache) {
		String hql = "from " + entityClass.getName();
		if (orderbyparam != null) {
			hql += " order by " + orderbyparam + " " + orderby;
		}
		return getSession().createQuery(hql).setCacheable(cache).list();
	}

	@Override
	@SuppressWarnings("unchecked")
	public PK save(T entity) {
		Assert.notNull(entity, "entity is required");
		return (PK) getSession().save(entity);
	}

	@Override
	public void update(T entity) {
		Assert.notNull(entity, "entity is required");
		getSession().update(entity);
	}

	@Override
	public void delete(T entity) {
		Assert.notNull(entity, "entity is required");
		getSession().delete(entity);
	}

	@Override
	public void delete(PK id) {
		Assert.notNull(id, "id is required");
		T entity = load(id);
		getSession().delete(entity);
	}

	@Override
	public int getTotalCount(QueryParam params, boolean cache) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(entityClass);
		Criteria criteria = detachedCriteria
				.getExecutableCriteria(getSession());
		int length = params.getLength();

		for (int i = 0; i < length; i++) {
			if (params.getKey(i).indexOf(">=") > -1) {
				criteria.add(Restrictions.ge(
						params.getKey(i).replace(">=", ""), params.getValue(i)));
			} else if (params.getKey(i).indexOf(">") > -1) {
				criteria.add(Restrictions.gt(params.getKey(i).replace(">", ""),
						params.getValue(i)));
			} else if (params.getKey(i).indexOf("<=") > -1) {
				criteria.add(Restrictions.le(
						params.getKey(i).replace("<=", ""), params.getValue(i)));
			} else if (params.getKey(i).indexOf("<") > -1) {
				criteria.add(Restrictions.lt(params.getKey(i).replace("<", ""),
						params.getValue(i)));
			} else {
				criteria.add(Restrictions.eq(params.getKey(i),
						params.getValue(i)));
			}
		}
		Object count = criteria.setProjection(Projections.rowCount())
				.uniqueResult();
		return count == null ? 0 : (Integer) count;
	}

	@Override
	public List<T> getList(QueryParam params, int start, int limit,
			String orderbyparam, String orderby, boolean cache) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(entityClass);
		Criteria criteria = detachedCriteria
				.getExecutableCriteria(getSession());
		if (params != null) {
			int length = params.getLength();

			for (int i = 0; i < length; i++) {
				if (params.getKey(i).indexOf(">=") > -1) {
					criteria.add(Restrictions.ge(
							params.getKey(i).replace(">=", ""),
							params.getValue(i)));
				} else if (params.getKey(i).indexOf(">") > -1) {
					criteria.add(Restrictions.gt(
							params.getKey(i).replace(">", ""),
							params.getValue(i)));
				} else if (params.getKey(i).indexOf("<=") > -1) {
					criteria.add(Restrictions.le(
							params.getKey(i).replace("<=", ""),
							params.getValue(i)));
				} else if (params.getKey(i).indexOf("<") > -1) {
					criteria.add(Restrictions.lt(
							params.getKey(i).replace("<", ""),
							params.getValue(i)));
				} else {
					criteria.add(Restrictions.eq(params.getKey(i),
							params.getValue(i)));
				}

			}
		}
		if (!StringUtils.isEmpty(orderbyparam)) {
			if (orderby.equals("desc")) {
				criteria.addOrder(Order.desc(orderbyparam));
			} else {
				criteria.addOrder(Order.asc(orderbyparam));
			}
		}
		if (limit != 0) {
			criteria.setFirstResult(start);
			criteria.setMaxResults(limit);
		}
		return criteria.list();
	}

	/**
	 * 得到某个区间内查找的数据列表
	 * 
	 * @param key
	 *            要查找的键�?
	 * @param value要查找的
	 *            �?
	 * @param params
	 *            参数�?
	 * @param timecheck根据哪个时间参数做对
	 *            �?
	 * @param begin
	 *            �?��区间
	 * @param end结束区间
	 * @param start分页相关
	 * @param limit分页相关
	 * @return
	 */
	public List<T> getStaticsLikeList(String key, String value,
			QueryParam params, String timecheck, Object begin, Object end,
			Integer start, Integer limit, String order, String orderby) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(entityClass);
		Criteria criteria = detachedCriteria
				.getExecutableCriteria(getSession());

		if (!StringUtils.isEmpty(key) && !StringUtils.isEmpty(value)) {
			if (key.indexOf(",") > -1) {
				String[] keys = key.split(",");
				criteria.add(Restrictions.or(
						Restrictions.like(keys[0], "%" + value + "%"),
						Restrictions.like(keys[1], "%" + value + "%")));

			} else {
				criteria.add(Restrictions.like(key, "%" + value + "%"));
			}

		}
		if (params != null) {
			int length = params.getLength();
			for (int i = 0; i < length; i++) {
				if (params.getKey(i).indexOf(">=") > -1) {
					criteria.add(Restrictions.ge(
							params.getKey(i).replace(">=", ""),
							params.getValue(i)));
				} else if (params.getKey(i).indexOf(">") > -1) {
					criteria.add(Restrictions.gt(
							params.getKey(i).replace(">", ""),
							params.getValue(i)));
				} else if (params.getKey(i).indexOf("<=") > -1) {
					criteria.add(Restrictions.le(
							params.getKey(i).replace("<=", ""),
							params.getValue(i)));
				} else if (params.getKey(i).indexOf("<") > -1) {
					criteria.add(Restrictions.lt(
							params.getKey(i).replace("<", ""),
							params.getValue(i)));
				} else {
					criteria.add(Restrictions.eq(params.getKey(i),
							params.getValue(i)));
				}
			}
		}
		if (begin != null) {
			criteria.add(Restrictions.ge(timecheck, begin));
		}
		if (end != null) {
			criteria.add(Restrictions.le(timecheck, end));
		}

		if (!StringUtils.isEmpty(order)) {
			if (orderby.equals("desc")) {
				criteria.addOrder(Order.desc(order));
			} else {
				criteria.addOrder(Order.asc(order));
			}
		}
		if (limit != null) {
			criteria.setFirstResult(start);
			criteria.setMaxResults(limit);
		}
		System.err.println(criteria.toString());
		return criteria.list();

	}

	/**
	 * 得到某个区间内的数据数量
	 * 
	 * @param keys
	 *            要查找的键�?
	 * @param value要查找的
	 *            �?
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
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(entityClass);
		Criteria criteria = detachedCriteria
				.getExecutableCriteria(getSession());

		if (!StringUtils.isEmpty(key)) {
			if (key.indexOf(",") > -1) {
				String[] keys = key.split(",");
				criteria.add(Restrictions.or(
						Restrictions.like(keys[0], "%" + value + "%"),
						Restrictions.like(keys[1], "%" + value + "%")));

			} else {
				criteria.add(Restrictions.like(key, "%" + value + "%"));
			}
		}

		if (params != null) {

			int length = params.getLength();

			for (int i = 0; i < length; i++) {
				if (params.getKey(i).indexOf(">=") > -1) {
					criteria.add(Restrictions.ge(
							params.getKey(i).replace(">=", ""),
							params.getValue(i)));
				} else if (params.getKey(i).indexOf(">") > -1) {
					criteria.add(Restrictions.gt(
							params.getKey(i).replace(">", ""),
							params.getValue(i)));
				} else if (params.getKey(i).indexOf("<=") > -1) {
					criteria.add(Restrictions.le(
							params.getKey(i).replace("<=", ""),
							params.getValue(i)));
				} else if (params.getKey(i).indexOf("<") > -1) {
					criteria.add(Restrictions.lt(
							params.getKey(i).replace("<", ""),
							params.getValue(i)));
				} else {
					criteria.add(Restrictions.eq(params.getKey(i),
							params.getValue(i)));
				}
			}
		}
		if (begin != null) {
			criteria.add(Restrictions.gt(timecheck, begin));
		}
		if (end != null) {
			criteria.add(Restrictions.lt(timecheck, end));
		}
		return (Integer) criteria.setProjection(Projections.rowCount())
				.uniqueResult();
	}

	/**
	 * 根据参数得到total
	 * 
	 * @param propertyName
	 * @param value
	 * @return 实体对象总数
	 */
	public Integer getLikeTotalCount(String propertyName, String value,
			String dataOwner, QueryParam queryParam, boolean cache) {

		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(entityClass);
		Criteria criteria = detachedCriteria
				.getExecutableCriteria(getSession());

		if (queryParam != null) {
			int length = queryParam.getLength();

			for (int i = 0; i < length; i++) {
				if (queryParam.getKey(i).indexOf(">=") > -1) {
					criteria.add(Restrictions.ge(
							queryParam.getKey(i).replace(">=", ""),
							queryParam.getValue(i)));
				} else if (queryParam.getKey(i).indexOf(">") > -1) {
					criteria.add(Restrictions.gt(
							queryParam.getKey(i).replace(">", ""),
							queryParam.getValue(i)));
				} else if (queryParam.getKey(i).indexOf("<=") > -1) {
					criteria.add(Restrictions.le(
							queryParam.getKey(i).replace("<=", ""),
							queryParam.getValue(i)));
				} else if (queryParam.getKey(i).indexOf("<") > -1) {
					criteria.add(Restrictions.lt(
							queryParam.getKey(i).replace("<", ""),
							queryParam.getValue(i)));
				} else {
					criteria.add(Restrictions.eq(queryParam.getKey(i),
							queryParam.getValue(i)));
				}
			}
		}
		if (!StringUtils.isEmpty(propertyName) && !StringUtils.isEmpty(value)) {
			if (propertyName.indexOf(",") > -1) {
				String[] keys = propertyName.split(",");
				criteria.add(Restrictions.or(
						Restrictions.like(keys[0], "%" + value + "%"),
						Restrictions.like(keys[1], "%" + value + "%")));

			} else {
				criteria.add(Restrictions.like(propertyName, "%" + value + "%"));
			}

		}
		if (!StringUtils.isEmpty(dataOwner)) {
			criteria.add(Restrictions.eq("dataOwner", dataOwner));
		}
		Object count = criteria.setCacheable(cache)
				.setProjection(Projections.rowCount()).uniqueResult();
		if (count == null) {
			return 0;
		}
		return (Integer) count;
	}

	public List<T> getLikeList(String propertyName, String value,
			String dataOwner, QueryParam queryParam, int start, int limit,
			String orderbyparam, String orderby, boolean cache) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(entityClass);
		Criteria criteria = detachedCriteria
				.getExecutableCriteria(getSession());

		if (queryParam != null) {
			int length = queryParam.getLength();

			for (int i = 0; i < length; i++) {
				if (queryParam.getKey(i).indexOf(">=") > -1) {
					criteria.add(Restrictions.ge(
							queryParam.getKey(i).replace(">=", ""),
							queryParam.getValue(i)));
				} else if (queryParam.getKey(i).indexOf(">") > -1) {
					criteria.add(Restrictions.gt(
							queryParam.getKey(i).replace(">", ""),
							queryParam.getValue(i)));
				} else if (queryParam.getKey(i).indexOf("<=") > -1) {
					criteria.add(Restrictions.le(
							queryParam.getKey(i).replace("<=", ""),
							queryParam.getValue(i)));
				} else if (queryParam.getKey(i).indexOf("<") > -1) {
					criteria.add(Restrictions.lt(
							queryParam.getKey(i).replace("<", ""),
							queryParam.getValue(i)));
				} else {
					criteria.add(Restrictions.eq(queryParam.getKey(i),
							queryParam.getValue(i)));
				}
			}
		}
		if (!StringUtils.isEmpty(propertyName) && !StringUtils.isEmpty(value)) {
			if (propertyName.indexOf(",") > -1) {
				String[] keys = propertyName.split(",");
				criteria.add(Restrictions.or(
						Restrictions.like(keys[0], "%" + value + "%"),
						Restrictions.like(keys[1], "%" + value + "%")));

			} else {
				criteria.add(Restrictions.like(propertyName, "%" + value + "%"));
			}

		}
		if (!StringUtils.isEmpty(dataOwner)) {
			criteria.add(Restrictions.eq("dataOwner", dataOwner));
		}
		if (!StringUtils.isEmpty(orderbyparam)) {
			if (orderbyparam.indexOf(",") > 0) {
				String[] orderbyparams = orderbyparam.split(",");
				String[] orderbys = orderby.split(",");
				if (orderbys[0].equals("desc")) {
					criteria.addOrder(Order.desc(orderbyparams[0]));
				} else {
					criteria.addOrder(Order.asc(orderbyparams[0]));
				}
				if (orderbys[1].equals("desc")) {
					criteria.addOrder(Order.desc(orderbyparams[1]));
				} else {
					criteria.addOrder(Order.asc(orderbyparams[1]));
				}

				System.err.println(orderbyparams[0] + " " + orderbys[0] + ","
						+ orderbyparams[1] + " " + orderbys[1]);

			} else {

				if (orderby.equals("desc")) {
					criteria.addOrder(Order.desc(orderbyparam));
				} else {
					criteria.addOrder(Order.asc(orderbyparam));
				}
			}

		}
		if (limit != 0) {
			criteria.setFirstResult(start);
			criteria.setMaxResults(limit);
		}
		return criteria.setCacheable(cache).list();

	}

}
