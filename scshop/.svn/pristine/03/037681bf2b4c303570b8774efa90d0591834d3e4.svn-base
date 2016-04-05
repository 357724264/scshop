package com.wudianyi.wb.scshop.action.admin;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.ParentPackage;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.entity.Kuaidi;
import com.wudianyi.wb.scshop.service.KuaidiService;
@ParentPackage("admin")
public class KuaidiAction extends BaseAction{

	@Resource
	private KuaidiService kuaidiService;
	
	private String key;
	private String name;
	private String url;
	private String phone;
	
	public String list() {
		list = kuaidiService.getAll(null, null, true);
		return LIST;
	}

	public String edit() {
		boolean has = true;
		Kuaidi kuaidi = kuaidiService.get(key);
		if (kuaidi == null) {
			has = false;
			kuaidi = new Kuaidi();
			kuaidi.setKeyid(key);
		}
		kuaidi.setName(name);
		kuaidi.setPhone(phone);
		kuaidi.setWebsite(url);
		if (has) {
			kuaidiService.update(kuaidi);
		} else {
			kuaidiService.save(kuaidi);
		}
		return ajaxHtml("success");
	}

	public String delete() {
		kuaidiService.delete(key);
		return ajaxHtml("success");
	}
	
	
	
	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	
	
}
