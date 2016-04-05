package com.wudianyi.wb.scshop.service.impl;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wudianyi.wb.scshop.dao.CommentDao;
import com.wudianyi.wb.scshop.entity.Comment;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.entity.Customer;
import com.wudianyi.wb.scshop.entity.Jflog;
import com.wudianyi.wb.scshop.entity.WebInfo;
import com.wudianyi.wb.scshop.service.CommentService;
import com.wudianyi.wb.scshop.service.CustomerService;
import com.wudianyi.wb.scshop.service.JflogService;
import com.wudianyi.wb.scshop.service.WebInfoService;

@Service
public class CommentServiceImpl extends BaseServiceImpl<Comment, String>
		implements CommentService {

	@Resource
	private WebInfoService webInfoService;
	@Resource
	private CustomerService customerService;
	@Resource
	private JflogService jflogService;

	@Resource
	public void setBaseDao(CommentDao commentDao) {
		super.setBaseDao(commentDao);
	}

	/**
	 * 评价完成后赠送积分
	 */
	@Override
	public String save(Comment comment) {
		WebInfo info = webInfoService.get(Const.WEBINFO_ID);
		String id = super.save(comment);
		if (info.getCommentjf() > 0) {
			Customer customer = customerService.get(comment.getUserid());
			customer.setPoint(customer.getPoint() + info.getCommentjf());
			customerService.update(customer);
			Jflog jflog = new Jflog(comment.getUserid(), info.getCommentjf(),
					1, 1, id);
			jflogService.save(jflog);
		}
		return id;

	}

}
