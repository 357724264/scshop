package com.wudianyi.wb.scshop.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wudianyi.wb.scshop.dao.AdminDao;
import com.wudianyi.wb.scshop.entity.Admin;
import com.wudianyi.wb.scshop.service.AdminService;
import com.wudianyi.wb.scshop.util.StringUtils;

@Service
public class AdminServiceImpl extends BaseServiceImpl<Admin, Integer> implements
		AdminService {
	@Resource
	private AdminDao adminDao;

	@Resource
	public void setBaseDao(AdminDao adminDao) {

		super.setBaseDao(adminDao);
	}

	@Override
	public List<Admin> getbyids(String ids) {
		if (StringUtils.isEmpty(ids)) {
			return null;
		}
		String[] idarray = ids.split(",");
		if (idarray == null) {
			return null;
		}
		return adminDao.getbyids(StringUtils.arrayToInteger(idarray));
	}

}
