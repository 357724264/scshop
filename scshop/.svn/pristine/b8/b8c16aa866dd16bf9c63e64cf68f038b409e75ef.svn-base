package com.wudianyi.wb.scshop.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.ParentPackage;

import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Agent;
import com.wudianyi.wb.scshop.entity.AgentBill;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.entity.Customer;
import com.wudianyi.wb.scshop.service.AgentBillService;
import com.wudianyi.wb.scshop.service.AgentService;
import com.wudianyi.wb.scshop.service.CustomerService;
import com.wudianyi.wb.scshop.service.OrderService;
@ParentPackage("user")
public class CenterAction extends BaseAction {
	@Resource
	private CustomerService customerService;
	@Resource
	private OrderService orderService;
	@Resource
	private AgentBillService agentBillService;
	@Resource
	private AgentService agentService;
	

	@Override
	public String execute() throws Exception {

		Integer userid = (Integer) getSession(Const.SESSION_CUSTOMER_ID);

		Customer customer = customerService.get(userid);
		setAttribute("customer", customer);
		
		//判断有没代理
		if(customer.getAgentid()!=null){
			List<Agent>agentlist= agentService.getAll("id", "desc", false);
			Agent agent = new Agent();
			for(Agent a : agentlist ){
				if (customer.getAgentid() == a.getId()){
					agent=a;
					break;
				}
			}
			setAttribute("agent", agent);
		}
		
		QueryParam param = new QueryParam(1).add("userid", userid);
		List<AgentBill> agentBills = agentBillService.getList(param, 0, 1, "createDate", "desc", false);
		for(AgentBill agentBill : agentBills){
			setAttribute("agentBill", agentBill);
		}
		
		int unpay = orderService.getTotalCount(
				new QueryParam(2).add("userid", userid).add("del", 0)
						.add("payStat", 0), false);
		setAttribute("unpay", unpay);

		int paid = orderService.getTotalCount(
				new QueryParam(2).add("userid", userid).add("del", 0)
						.add("payStat", 1), false);
		setAttribute("paid", paid);

		int send = orderService.getTotalCount(
				new QueryParam(2).add("userid", userid).add("del", 0)
						.add("payStat", 2), false);
		setAttribute("send", send);

		int deal = orderService.getTotalCount(
				new QueryParam(2).add("userid", userid).add("del", 0)
						.add("payStat", 3), false);
		setAttribute("deal", deal);

		return "center";
	}
}
