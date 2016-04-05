package com.wudianyi.wb.scshop.util;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import sun.awt.geom.AreaOp.CAGOp;

/**
 * 时间工具类
 * 
 * @Author huanggh
 * @Date 15-9-28
 */
public class DateUtil {

	public static final String DATE_FORMAT_1 = "yyyy-MM-dd HH:mm:ss";

	public static final String DATE_FORMAT_2 = "yyyy-MM-dd";

	/**
	 * 获取指定时间的sql类型的yyyy-MM-dd HH:mm:ss格式Timestamp
	 * 
	 * @param date
	 * @return
	 */
	public static Timestamp getTimestamp(Date date) {
		DateFormat df = new SimpleDateFormat(DATE_FORMAT_1);
		String nowTime = df.format(date);
		return java.sql.Timestamp.valueOf(nowTime);
	}

	/**
	 * 格式化时间字符串到指定格式的date
	 * 
	 * @param dateStr
	 * @param dateFormat
	 * @return
	 */
	public static Date formatDateStr(String dateStr, String dateFormat) {
		SimpleDateFormat format = new SimpleDateFormat(dateFormat);
		Date date = null;
		try {
			date = format.parse(dateStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}

	/**
	 * 获取指定日期并以00:00:00时分秒date格式返回
	 * 
	 * @return
	 */
	public static Date getDateAtStartIndex(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.DAY_OF_MONTH, 0);
		Date nowDate = calendar.getTime();
		DateFormat df = new SimpleDateFormat(DATE_FORMAT_2);
		String nowDateStr = df.format(nowDate);
		String beginDateStr = nowDateStr + " 00:00:00";
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT_1);

		Date startDate = null;
		try {
			startDate = sdf.parse(beginDateStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return startDate;
	}

	/**
	 * 获取指定日期并以23:59:59时分秒date格式返回
	 * 
	 * @return
	 */
	public static Date getDateAtEndIndex(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.DAY_OF_MONTH, 0);
		Date nowDate = calendar.getTime();
		DateFormat df = new SimpleDateFormat(DATE_FORMAT_2);
		String nowDateStr = df.format(nowDate);
		String endDateStr = nowDateStr + " 23:59:59";
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT_1);

		Date endDate = null;
		try {
			endDate = sdf.parse(endDateStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return endDate;
	}

	/**
	 * 获取指定日期并以00:00:00时分秒String格式返回
	 * 
	 * @return
	 */
	public static String getDateStrAtStartIndex(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.DAY_OF_MONTH, 0);
		Date nowDate = calendar.getTime();
		DateFormat df = new SimpleDateFormat(DATE_FORMAT_2);
		String nowDateStr = df.format(nowDate);
		String beginDateStr = nowDateStr + " 00:00:00";
		return beginDateStr;
	}

	/**
	 * 获取指定日期并以23:59:59时分秒String格式返回
	 * 
	 * @return
	 */
	public static String getDateStrAtEndIndex(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.DAY_OF_MONTH, 0);
		Date nowDate = calendar.getTime();
		DateFormat df = new SimpleDateFormat(DATE_FORMAT_2);
		String nowDateStr = df.format(nowDate);
		String endDateStr = nowDateStr + " 23:59:59";
		return endDateStr;
	}

	public static boolean isSameDay(long day1, long day2) {
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT_2);
		return sdf.format(new Date(day1)).equals(sdf.format(new Date(day2)));
	}

	public static boolean isSameDay(Date day1, Date day2) {
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT_2);
		return sdf.format(day1).equals(sdf.format(day2));
	}

	/**
	 * 得到两个日期相差的天数
	 * 
	 * @param date1
	 * @param date2
	 * @return
	 * @throws ParseException
	 */
	public static int getDateSpace(Long date1, Long date2) {

		Calendar calst = Calendar.getInstance();
		Calendar caled = Calendar.getInstance();

		calst.setTime(new Date(date1));
		caled.setTime(new Date(date2));

		// 设置时间为0时
		calst.set(Calendar.HOUR_OF_DAY, 0);
		calst.set(Calendar.MINUTE, 0);
		calst.set(Calendar.SECOND, 0);
		caled.set(Calendar.HOUR_OF_DAY, 0);
		caled.set(Calendar.MINUTE, 0);
		caled.set(Calendar.SECOND, 0);
		// 得到两个日期相差的天数
		int days = ((int) (caled.getTime().getTime() / 1000) - (int) (calst
				.getTime().getTime() / 1000)) / 3600 / 24;

		return days;
	}
}
