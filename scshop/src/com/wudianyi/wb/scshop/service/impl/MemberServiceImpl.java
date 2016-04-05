package com.wudianyi.wb.scshop.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wudianyi.wb.scshop.dao.MemberDao;
import com.wudianyi.wb.scshop.entity.Member;
import com.wudianyi.wb.scshop.service.MemberService;

@Service
public class MemberServiceImpl extends BaseServiceImpl<Member,Integer>
				implements MemberService{

		@Resource
		public void setBaseDao(MemberDao memberDao){
			super.setBaseDao(memberDao);
		}
}
