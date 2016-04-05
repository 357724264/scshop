package com.wudianyi.wb.scshop.action.admin.json;

import java.util.Date;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import com.lulu.tool.DateUtil;
import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Comment;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.service.CommentService;

public class CommentAction extends BaseAction{
	
	private String id;
	private String reply;
	private Integer productid;
	
	

	@Resource
	private CommentService commentService;
	
	private final static String QUERRY_FIELD = "productName";
	
	public String list() {
		
		Integer shopid = (Integer)getSession(Const.SESSION_ADMIN_SHOPID);
		Integer permission = (Integer)getSession(Const.SESSION_ADMIN_PERMISSION);
		QueryParam params = new QueryParam().add("del",0);
		if(permission==null || permission==1) {
			params.add("shopid", shopid);
		}
		         System.out.println("productid:"+productid);
		if(productid!=null && productid!=0) {
			params.add("productid", productid);
			System.out.println("if里的productid:"+productid);
		}
		list = commentService.getStaticsLikeList(QUERRY_FIELD, keyword, params, null, null, null, Const.BACK_PAGE_SIZE*(pn -1), Const.BACK_PAGE_SIZE, "createDate", "desc");
		setAttribute("permission", permission);
		return LIST;
	}
	
	public String totalNum() {
		
		Integer shopid = (Integer)getSession(Const.SESSION_ADMIN_SHOPID);
		QueryParam params = new QueryParam().add("shopid", shopid).add("del",0);
		System.out.println("totalnumid:"+productid);
		if(productid!=null && productid!=0) {
			params.add("productid", productid);
		}
		tn = commentService.getLikeTotalCount(QUERRY_FIELD, keyword, null, params, false);
		System.out.println("tn========" + tn);
		return ajaxJson("{\"total\":\"" + tn + "\",\"size\":\"" + Const.BACK_PAGE_SIZE + "\"}");
	}
	
	public String deleteComment() {
		
		Comment comment = commentService.get(id);
		comment.setDel(1);
		commentService.update(comment);
		
		return ajaxHtml("success");
	}
	
	public String replyComment() {
		Integer adminid = (Integer)getSession(Const.SESSION_ADMIN_NAME);
		Comment comment = commentService.get(id);
		comment.setAdminid(adminid);
		comment.setReply(reply);
		comment.setReplydate(new Date().getTime());
		commentService.update(comment);
		JSONObject obj = new JSONObject();
		obj.put("success", true);
		obj.put("reply", reply);
		obj.put("replydate", DateUtil.getDate(new Date(comment.getReplydate()), "yyyy/MM/dd"));
		
		return ajaxJson(obj.toString());
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}
	
	public Integer getProductid() {
		return productid;
	}

	public void setProductid(Integer productid) {
		this.productid = productid;
	}

	
	
}
