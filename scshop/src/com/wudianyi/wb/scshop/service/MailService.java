package com.wudianyi.wb.scshop.service;

import java.io.File;

/**
 * Service接口 - 邮件服务
 */

public interface MailService {

	/**
	 * @param name
	 *           显示的“发件人”（注意，是发件人，而不是收件人）
	 * @param subject
	 *            主题
	 * 
	 * @param content
	 *            邮件内容
	 * 
	 * @param toMail
	 *            收件人邮箱
	 * 
	 */
	public void sendMail(String name, String subject, String content,
			String toMail);

}