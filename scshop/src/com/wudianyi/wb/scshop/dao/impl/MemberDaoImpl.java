package com.wudianyi.wb.scshop.dao.impl;

import org.springframework.stereotype.Repository;

import com.wudianyi.wb.scshop.dao.MemberDao;
import com.wudianyi.wb.scshop.entity.Member;

@Repository
public class MemberDaoImpl extends BaseDaoImpl<Member ,Integer>
								implements MemberDao{

}
