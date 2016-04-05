package com.wudianyi.wb.scshop.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wudianyi.wb.scshop.dao.AddressDao;
import com.wudianyi.wb.scshop.entity.Address;
import com.wudianyi.wb.scshop.service.AddressService;

@Service
public class AddressServiceImpl extends BaseServiceImpl<Address, String>
				implements AddressService{
	
	@Resource
	public void setBaseDao(AddressDao addressDao){
		super.setBaseDao(addressDao);
	}
	

}
