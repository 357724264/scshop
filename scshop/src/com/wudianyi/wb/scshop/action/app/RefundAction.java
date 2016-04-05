package com.wudianyi.wb.scshop.action.app;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Bankcard;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.entity.Refund;
import com.wudianyi.wb.scshop.service.BankcardService;
import com.wudianyi.wb.scshop.service.RefundService;

public class RefundAction extends BaseAction{
	
	private Double total;
	private String orderid;
	private Integer bankcardid;
	private Integer refundid;

	
	
	@Resource
	private BankcardService bankcardService;
	@Resource
	private RefundService refundService;
	
	
	public String apply() {
		Bankcard bankcard = null;
		if(bankcardid==null) {
			Integer userid = (Integer)getSession(Const.SESSION_CUSTOMER_ID);
			QueryParam params = new QueryParam(2).add("isDefault", 1).add("userid", userid);
			bankcard = bankcardService.get(params, false);
		}else {
			bankcard = bankcardService.get(bankcardid);
		}
		
		JSONObject bankcardObject = new JSONObject();
		bankcardObject.put("id", bankcard.getId());
		bankcardObject.put("displayName", bankcard.getDisplayName());
		
		JSONObject retObject = new JSONObject();
		retObject.put("bankcard", bankcardObject);
		retObject.put("orderid", orderid);
		retObject.put("total", total);
		
		return ajaxJson(retObject.toString()); 
	}
	
	public String edit() {
		Refund refund = null;
		if(refundid==null) {
			QueryParam params = new QueryParam(1).add("orderid", orderid);
			refund = refundService.get(params, false);
		}else {
			refund = refundService.get(refundid);
			Bankcard bankcard = bankcardService.get(bankcardid);
			refund.setCardInfo(bankcard.getDisplayName());
			refund.setBankcardid(bankcard.getId());
		}
		
		JSONObject refundObject = new JSONObject();
		refundObject.put("id", refund.getId());
		refundObject.put("phone", refund.getPhone());
		refundObject.put("realName", refund.getRealName());
		refundObject.put("wxAccount", refund.getWxAccount());
		refundObject.put("bankcardid", refund.getBankcardid());
		refundObject.put("cardInfo", refund.getCardInfo());
		refundObject.put("total", refund.getTotal());
		refundObject.put("reason", refund.getReason());
		refundObject.put("refundType", refund.getRefundType());
		refundObject.put("refundWay", refund.getRefundWay());
		
		return ajaxJson(refundObject.toString());
	}

	public Double getTotal() {
		return total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

	public String getOrderid() {
		return orderid;
	}

	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}

	public Integer getBankcardid() {
		return bankcardid;
	}

	public void setBankcardid(Integer bankcardid) {
		this.bankcardid = bankcardid;
	}

	public Integer getRefundid() {
		return refundid;
	}

	public void setRefundid(Integer refundid) {
		this.refundid = refundid;
	}
	

	
	
}
