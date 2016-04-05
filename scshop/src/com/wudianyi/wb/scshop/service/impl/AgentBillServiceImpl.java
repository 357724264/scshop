package com.wudianyi.wb.scshop.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wudianyi.wb.scshop.dao.AgentBillDao;
import com.wudianyi.wb.scshop.entity.AgentBill;
import com.wudianyi.wb.scshop.service.AgentBillService;

@Service
public class AgentBillServiceImpl extends BaseServiceImpl<AgentBill,Integer> implements
			AgentBillService{
	
		@Resource
		public void setBaseDao(AgentBillDao agentBillDao){
			super.setBaseDao(agentBillDao);
		}
	

}
