package com.wudianyi.wb.scshop.action.admin.json;

import java.util.Date;

import javax.annotation.Resource;

import org.omg.CORBA.TCKind;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.entity.Product;
import com.wudianyi.wb.scshop.service.ProductService;
import com.wudianyi.wb.scshop.service.SeckillProductService;

public class SeckillAction extends BaseAction{
	
	@Resource
	private SeckillProductService seckillProductService;
	
	@Resource
	private ProductService productService;
	
	private Integer stat;
	
	private Integer id;
	
	public String auditList() {
		
		QueryParam params = new QueryParam();
		if(stat!=null) {
			params.add("stat", stat);
		}
		list = seckillProductService.getList(params, (pn-1)*Const.BACK_PAGE_SIZE, Const.BACK_PAGE_SIZE, "createTime", "desc", false);
		
		return "audit_list";
	}
	
	public String auditTotalNum() {
		
		QueryParam params = new QueryParam();
		if(stat!=null) {
			params.add("stat", stat);
		}
		tn = seckillProductService.getTotalCount(params, false);
		
		return ajaxJson("{\"total\":\"" + tn + "\",\"size\":\"" + Const.BACK_PAGE_SIZE + "\"}");
	}
	
	public String applyList() {
		Integer shopid = (Integer)getSession(Const.SESSION_ADMIN_SHOPID);
		QueryParam params = new QueryParam().add("shopid", shopid);
		if(stat!=null) {
			params.add("stat", stat);
		}
		list = seckillProductService.getList(params, (pn-1)*Const.BACK_PAGE_SIZE, Const.BACK_PAGE_SIZE, "createTime", "desc", false);
		
		return "apply_list";
	}
	
	
	public String applyTotalNum() {
		
		Integer shopid = (Integer)getSession(Const.SESSION_ADMIN_SHOPID);
		QueryParam params = new QueryParam().add("shopid", shopid);
		if(stat!=null) {
			params.add("stat", stat);
		}
		tn = seckillProductService.getTotalCount(params, false);
		
		return ajaxJson("{\"total\":\"" + tn + "\",\"size\":\"" + Const.BACK_PAGE_SIZE + "\"}");
	}
	
	//查询商品是否已经申请促销活动或活动正在进行中
	public String checkStatus() {
		//查询是否有在审核中的
		QueryParam params = new QueryParam(2).add("productid", id).add("stat", 0);
		tn = seckillProductService.getTotalCount(params, false);
		if(tn > 0) {
			return ajaxJsonErrorMessage("申请正在审核中..");
		}
		
		if(productService.checkProductStatus(id)) {
			return ajaxJsonErrorMessage("促销正在进行中..");
		}
		//查询是否下架，下架的不给申请
		QueryParam param2 = new QueryParam(3).add("id", id).add("stat", 0).add("del", 0);
		Integer tc=productService.getTotalCount(param2, false);
		if(tc == null || tc==0){
			return ajaxJsonErrorMessage("产品已下架，不可申请秒杀活动..");
		}
		return ajaxJsonSuccessMessage("seckill!apply.action?cid="+id);
	}
	
	public Integer getStat() {
		return stat;
	}

	public void setStat(Integer stat) {
		this.stat = stat;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	
	
}
