package com.wudianyi.wb.scshop.action.admin;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.ParentPackage;

import java.util.Date;
import java.util.List;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Agent;
import com.wudianyi.wb.scshop.entity.AgentBill;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.entity.Customer;
import com.wudianyi.wb.scshop.service.AgentBillService;
import com.wudianyi.wb.scshop.service.AgentService;
import com.wudianyi.wb.scshop.service.CustomerService;
import com.wudianyi.wb.scshop.util.SmsUtil;

@ParentPackage("admin")
public class AgentbillAction extends BaseAction {

	@Resource
	private AgentBillService agentBillService;
	@Resource
	private AgentService agentService;
	@Resource
	private CustomerService customerService;

	private int id;
	private Integer tt;// 获取想看的状态
	private int userid;
	private int agentbillid;
	private int applystate;// 申请进度 0申请中 1通过 -1不通过
	private int agentid;// 通过后的代理等级id
	private String reason;//代理申请的反馈信息
	private String phone;


	public String list() {
		return LIST;
	}

	// 代理申请审核列表
	public String jsonlist() {
		QueryParam param = new QueryParam(2).add("del", 0)
				.add("applystate", tt);
		
		List<AgentBill> ablist = agentBillService.getList(param, 10 * (pn - 1),
				10, "createDate", "desc", false);

		setAttribute("ablist", ablist);

		return "jsonlist";
	}

	/*
	 * 获取总数量
	 */
	public String totalNum() {
		
		QueryParam param = new QueryParam(2).add("del", 0)
				.add("applystate", tt);
		tn = agentBillService.getLikeTotalCount(null, null, null, param, false);
		return ajaxJson("{\"total\":\"" + tn + "\",\"size\":\"" + Const.BACK_PAGE_SIZE + "\"}");
		
		 
	}

	/*
	 * 单条信息
	 */
	public String execute() throws Exception {
		// 详情
		AgentBill agentbill = agentBillService.get(id);
		setAttribute("agentbill", agentbill);

		List<Agent> agentlist = agentService.getList(null, 0, 0, "id", "ace",
				false);
		setAttribute("agentlist", agentlist);
		return "agentbill";
	}

	/*
	 * 审核后更新
	 */
	public String update()  throws Exception {

		Date date = new Date();
		AgentBill agentbill = agentBillService.get(agentbillid);//申请表
		System.out.println("applystate:"+applystate);
		
		agentbill.setApplystate(applystate);
		if(applystate==-1){
			agentbill.setAgentid(0);
		}else{
		agentbill.setAgentid(agentid);
		}
		agentbill.setModifyDate(date.getTime());
		Agent agent = agentService.get(agentid);
		System.err.println("agent:"+agent);
		agentbill.setAgentname(agent.getName());
		
		Customer customer = customerService.get(userid);//申请的用户
		System.out.println("userid:"+userid);
		if(applystate==-1){
			customer.setAgentid(0);
		}else{
			customer.setAgentid(agentid);
		}

		agentBillService.update(agentbill);
		customerService.update(customer);
		
		//发送手机信息
		String front ="";
		String content = front + reason;
		System.out.println(content);
		return SmsUtil.sendSms(content, phone);
	}

	public Integer getTt() {
		return tt;
	}

	public void setTt(Integer tt) {
		this.tt = tt;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getApplystate() {
		return applystate;
	}

	public void setApplystate(int applystate) {
		this.applystate = applystate;
	}

	public int getAgentid() {
		return agentid;
	}

	public void setAgentid(int agentid) {
		this.agentid = agentid;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public int getAgentbillid() {
		return agentbillid;
	}

	public void setAgentbillid(int agentbillid) {
		this.agentbillid = agentbillid;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}
	
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	
}
