package com.wudianyi.wb.scshop.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wudianyi.wb.scshop.dao.WebInfoDao;
import com.wudianyi.wb.scshop.entity.WebInfo;
import com.wudianyi.wb.scshop.service.WebInfoService;

@Service
public class WebInfoServiceImpl extends BaseServiceImpl<WebInfo, String>
		implements WebInfoService {

	@Resource
	public void setBaseDao(WebInfoDao webInfoDao) {
		super.setBaseDao(webInfoDao);
	}
}
