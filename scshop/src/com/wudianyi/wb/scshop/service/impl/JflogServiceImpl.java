package com.wudianyi.wb.scshop.service.impl;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wudianyi.wb.scshop.dao.JflogDao;
import com.wudianyi.wb.scshop.entity.Jflog;
import com.wudianyi.wb.scshop.service.JflogService;

@Service
public class JflogServiceImpl extends BaseServiceImpl<Jflog, String> implements
		JflogService {

	@Resource
	public void setBaseDao(JflogDao jflogDao) {
		super.setBaseDao(jflogDao);
	}

	@Override
	public String save(Jflog entity) {
		if (entity.getPoint() > 0) {
			entity.setCreatedate(new Date().getTime());
			return super.save(entity);
		}
		return null;
	}

}
