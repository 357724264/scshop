package com.wudianyi.wb.scshop.service;

import java.util.List;

import com.wudianyi.wb.scshop.entity.Customer;

public interface CustomerService extends BaseService<Customer, Integer> {

	/**
	 * 保存app的token
	 * 
	 * @param userid
	 * @return 返回新的token
	 */
	public String setUserAppToken(Integer userid);

	/**
	 * 根据app传过来的token值获取用户ID
	 * 
	 * @param token
	 * @return
	 */
	public Integer getUserIdByAppToken(String token);

	/**
	 * 更新用户每天登陆所获得的积分
	 * 
	 * @param userid
	 * @param lastLoginTime
	 */
	public Long updateUserPointForEveryDayLogin(Integer userid,
			Long lastLoginTime);

	/**
	 * 根据一串ID号码找出所有的用户
	 * 
	 * @param ids
	 *            用逗号隔开的ID号
	 * @return
	 */
	public List<Customer> getbyids(String ids);
}
