package com.wudianyi.wb.scshop.action.admin.json;



import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.ParentPackage;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.entity.Member;
import com.wudianyi.wb.scshop.service.AdminService;
import com.wudianyi.wb.scshop.service.MemberService;

@ParentPackage("admin")
public class MemberAction extends BaseAction{

	@Resource
	private MemberService memberService;
	private int id;
	private String name;//等级名称
	private Integer orderbyid; // 用于排序(按顺序排123456)
	private int mixpoint;//这个范围最低
	private int maxpoint;//这个范围最高
	private String note;//等级说明
	private String note1;//无用
	
	public String save(){
		Member member = new Member();
			System.err.println("name:"+name);
			System.err.println("orderbyid:"+orderbyid);
			System.err.println("mixpoint:"+mixpoint);
			System.err.println("maxpoint:"+maxpoint);
			System.err.println("note:"+note);
		Date date = new Date();
		member.setCreateDate(date.getTime());
		member.setName(name);
		member.setOrderbyid(orderbyid);
		member.setNote(note);
		member.setMixpoint(mixpoint);
		member.setMaxpoint(maxpoint);
		member.setDel(0);
		member.setCreateid((Integer)getSession(Const.SESSION_ADMIN_NAME));
		member.setModifyid(0);
		memberService.save(member);
		return null;
	}
	
	
	public String edit(){
		System.out.println("id:"+id);
		Member member =memberService.get(id);
		Date date = new Date();
		member.setModifyDate(date.getTime());
		member.setName(name);	
		member.setOrderbyid(orderbyid);
		member.setNote(note);
		member.setMixpoint(mixpoint);
		member.setMaxpoint(maxpoint);
		member.setModifyid((Integer)getSession(Const.SESSION_ADMIN_NAME));
		memberService.update(member);
		return null;
	}
	
	
	
	public String delete() {
		Member member =memberService.get(id);
		Date date = new Date();
		member.setDel(1);
		member.setModifyDate(date.getTime());
		member.setModifyid((Integer)getSession(Const.SESSION_ADMIN_NAME));
		memberService.update(member);
		return ajaxHtml("success");
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getOrderbyid() {
		return orderbyid;
	}

	public void setOrderbyid(Integer orderbyid) {
		this.orderbyid = orderbyid;
	}

	public int getMixpoint() {
		return mixpoint;
	}

	public void setMixpoint(int mixpoint) {
		this.mixpoint = mixpoint;
	}

	public int getMaxpoint() {
		return maxpoint;
	}

	public void setMaxpoint(int maxpoint) {
		this.maxpoint = maxpoint;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getNote1() {
		return note1;
	}

	public void setNote1(String note1) {
		this.note1 = note1;
	}
	
	
}
