package com.wudianyi.wb.scshop.action.admin;

import com.wudianyi.wb.scshop.action.BaseAction;

public class CommentAction extends BaseAction{
	private String id;
	private Integer productid;
	
	public String list() {
		System.out.println("list,cid:"+productid);
		setAttribute("productid", productid); 
		return LIST;
	}
	public String listid() {
			System.out.println("listid,id:"+id);
			return ajaxJsonSuccessMessage("comment!list.action?productid="+productid);
		}
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	public Integer getProductid() {
		return productid;
	}
	public void setProductid(Integer productid) {
		this.productid = productid;
	}

	
}
