package com.wudianyi.wb.scshop.common;

import java.io.Serializable;

public class QueryParam implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -6401893603325942443L;

	private String[] keys;
	private Object[] values;
	private int length;

	public QueryParam(int initSize) {
		keys = new String[initSize];
		values = new Object[initSize];
		length = 0;
	}

	public QueryParam() {
		// TODO Auto-generated constructor stub
	}

	public void setSize(int size) {
		keys = new String[size];
		values = new Object[size];
		length = 0;
	}

	public QueryParam add(String key, Object value) {

		if (value == null || value.equals(""))
		{// 如果什么值都没有，那么不增加
			return this;
		}
		if (key == null)
		{
			return this;
		}
		if (key.equals("_admin_"))
		{
			return this;
		}
		// 如果长度大于原始长度
		if (null == keys)
		{
			keys = new String[1];
			values = new Object[1];
		}
		if (null != keys[keys.length - 1])
		{
			String[] keys2 = new String[this.getLength()+1];
			Object[] values2 = new Object[this.getLength()+1];
			System.arraycopy(keys, 0, keys2, 0, keys.length);
			System.arraycopy(values, 0, values2, 0, values.length);
			keys = new String[keys2.length];
			values = new Object[values2.length];
			System.arraycopy(keys2, 0, keys, 0, keys.length);
			System.arraycopy(values2, 0, values, 0, values.length);
		}
		keys[length] = key;
		values[length] = value;
		++length;
		return this;
	}

	public Object getValue(int index) {
		return values[index];
	}

	public String getKey(int index) {
		return keys[index];
	}

	public int getLength() {
		return length;
	}
}
