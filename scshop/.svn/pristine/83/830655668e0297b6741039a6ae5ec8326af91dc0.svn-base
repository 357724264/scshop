package com.wudianyi.wb.scshop.action.admin;

import javax.annotation.Resource;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.entity.Agent;
import com.wudianyi.wb.scshop.service.AgentService;

public class AgentAction extends BaseAction {

	@Resource
	private AgentService agentService;

	private Integer id;
	private String name;

	public String list() {
		list = agentService.getList(null, 0, 0, "id", "ace", false);
		return LIST;
	}

	public String edit() {
		boolean has = true;
		Agent agent = null;
		if(id!=null&&id.intValue()!=0){
			agent = agentService.get(id);
		}
		
		if(agent==null){
			has = false;
			agent = new Agent();
		}
		
		agent.setName(name);
		if (has) {
			agentService.update(agent);
		} else {
			agentService.save(agent);
		}
		return ajaxHtml("success");
	}

	public String delete() {
		agentService.delete(id);
		return ajaxHtml("success");
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
