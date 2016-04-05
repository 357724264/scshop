package com.wudianyi.wb.scshop.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wudianyi.wb.scshop.dao.KuaidiDao;
import com.wudianyi.wb.scshop.entity.Kuaidi;
import com.wudianyi.wb.scshop.service.KuaidiService;


@Service
public class KuaidiServiceImpl extends BaseServiceImpl<Kuaidi,String>
					implements KuaidiService {

	@Resource
	public void setBaseDao(KuaidiDao kuaidiDao){
		super.setBaseDao(kuaidiDao);
	}
	
}
