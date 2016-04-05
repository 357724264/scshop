package com.wudianyi.wb.scshop.util;

import net.sourceforge.pinyin4j.PinyinHelper;
import net.sourceforge.pinyin4j.format.HanyuPinyinCaseType;
import net.sourceforge.pinyin4j.format.HanyuPinyinOutputFormat;
import net.sourceforge.pinyin4j.format.HanyuPinyinToneType;
import net.sourceforge.pinyin4j.format.exception.BadHanyuPinyinOutputFormatCombination;

public class PinyinUtil {
	static HanyuPinyinOutputFormat format = new HanyuPinyinOutputFormat();
	static {
		format.setToneType(HanyuPinyinToneType.WITHOUT_TONE);
		format.setCaseType(HanyuPinyinCaseType.UPPERCASE);
	}

	/**
	 * 获取给定字符串的全拼
	 * 
	 * @param input
	 *            给定字符串
	 * @return 全拼
	 */
	public static String getAllLetter(String input) {
		StringBuffer sb = new StringBuffer();
		String tempPinyin = null;

		for (int i = 0; i < input.length(); ++i) {
			tempPinyin = getAllLetter(input.charAt(i));
			if (tempPinyin == null) {
				// 如果str.charAt(i)非汉字，则保持原样
				sb.append(input.charAt(i));
			} else {
				sb.append(tempPinyin);
			}
		}

		return sb.toString();
	}
	
	public static void main(String[] args) {
		System.err.println("".toUpperCase());
	}

	/**
	 * 获取给定字符的拼音
	 * 
	 * @param ch
	 *            给定字符
	 * @return 拼音
	 */
	public static String getAllLetter(char ch) {
		String[] pinyin = null;
		try {
			pinyin = PinyinHelper.toHanyuPinyinStringArray(ch, format);
		} catch (BadHanyuPinyinOutputFormatCombination e) {
		}
		// 如果c不是汉字，toHanyuPinyinStringArray会返回null
		if (pinyin == null) {
			return null;
		}
		// 只取一个发音，如果是多音字，仅取第一个发音
		return pinyin[0];
	}
}
