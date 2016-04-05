package com.wudianyi.wb.scshop.action.app;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.AgentBill;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.entity.Customer;
import com.wudianyi.wb.scshop.service.AgentBillService;
import com.wudianyi.wb.scshop.service.CustomerService;
import com.wudianyi.wb.scshop.service.MemberService;
import com.wudianyi.wb.scshop.service.OrderService;

public class CenterAction extends BaseAction {
	@Resource
	private CustomerService customerService;
	@Resource
	private OrderService orderService;
	@Resource
	private AgentBillService agentBillService;

	@Override
	public String execute() throws Exception {
		System.out.println("app center.....");
		JSONObject retObject = new JSONObject();
//		Integer userid = customerService.getUserIdByAppToken(temptoken);
		Integer userid = (Integer) getSession(Const.SESSION_CUSTOMER_ID);
		System.out.println("userid = " + userid);
		if(userid != null) {
			retObject.put("userid", userid);
		}else {
			retObject.put("redirectUrl","center");
			return ajaxJson(retObject.toString());
		}
		Customer customer = customerService.get(userid);
		// setAttribute("customer", customer);
		JSONObject customerObject = new JSONObject();

		customerObject.put("pic", customer.getPic()==null?"":customer.getPic());
		customerObject.put("name", customer.getName()==null?"":customer.getName());
		customerObject.put("point", customer.getPoint());
		customerObject.put("phone", customer.getPhone()==null?"":customer.getPhone());
		customerObject.put("email", customer.getEmail()==null?"":customer.getEmail());
		customerObject.put("memberrank", customer.getMemberrank()==null? 1:customer.getMemberrank()); 
		customerObject.put("emailtest", customer.getEmailtest());
		retObject.put("customer", customerObject);
		retObject.put("name", customer.getName());

		QueryParam param = new QueryParam(1).add("userid", userid);
		
		AgentBill agentBill = agentBillService.get(param, false);
		if(agentBill!=null){
			// setAttribute("agentBill", agentBill);
			JSONObject agentObject = new JSONObject();
			agentObject.put("agentname", agentBill.getAgentname());
			agentObject.put("phone", agentBill.getPhone());
			agentObject.put("name", agentBill.getName());
			agentObject.put("idnum", agentBill.getIdnum());
			agentObject.put("nowaddress", agentBill.getNowaddress());
			agentObject.put("applystate", agentBill.getApplystate());
			
		retObject.put("agentBill", agentObject);
		}
		

		int unpay = orderService.getTotalCount(
				new QueryParam(2).add("userid", userid).add("del", 0)
						.add("payStat", 0), false);
		// setAttribute("unpay", unpay);
		retObject.put("unpay", unpay);

		int paid = orderService.getTotalCount(
				new QueryParam(2).add("userid", userid).add("del", 0)
						.add("payStat", 1), false);
		// setAttribute("paid", paid);
		retObject.put("paid", paid);

		int send = orderService.getTotalCount(
				new QueryParam(2).add("userid", userid).add("del", 0)
						.add("payStat", 2), false);
		// setAttribute("send", send);
		retObject.put("send", send);

		int deal = orderService.getTotalCount(
				new QueryParam(2).add("userid", userid).add("del", 0)
						.add("payStat", 3), false);
		// setAttribute("deal", deal);
		retObject.put("deal", deal);
		System.out.println(retObject.toString());
		return ajaxJson(retObject.toString());
	}
}
