package com.wudianyi.wb.scshop.service.impl;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import org.springframework.core.task.TaskExecutor;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.wudianyi.wb.scshop.service.MailService;

@Service
public class MailServiceImpl implements MailService {

	@Resource
	private JavaMailSender javaMailSender;
	@Resource
	private TaskExecutor taskExecutor;

	public void setJavaMailSender(JavaMailSender javaMailSender) {
		this.javaMailSender = javaMailSender;
	}

	public void setTaskExecutor(TaskExecutor taskExecutor) {
		this.taskExecutor = taskExecutor;
	}

	// 增加邮件发送任务
	public void addSendMailTask(final MimeMessage mimeMessage) {
		try {
			taskExecutor.execute(new Runnable() {
				public void run() {
					javaMailSender.send(mimeMessage);
				}
			});
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void sendMail(String name, String subject, String content,String toMail) {
		try {
			JavaMailSenderImpl javaMailSenderImpl = (JavaMailSenderImpl) javaMailSender;
			javaMailSenderImpl.setHost("mail.123mfl.com");
			javaMailSenderImpl.setPort(25);
			javaMailSenderImpl.setUsername("service@123mfl.com");
			javaMailSenderImpl.setPassword("Aa123123");
			MimeMessage mimeMessage = javaMailSenderImpl.createMimeMessage();
			MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(
					mimeMessage, false, "utf-8");
			mimeMessageHelper.setFrom(MimeUtility.encodeWord(name)
					+ "<service@123mfl.com>");
			mimeMessageHelper.setTo(toMail);
			mimeMessageHelper.setSubject(subject);
			mimeMessageHelper.setText(content, true);
			addSendMailTask(mimeMessage);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
