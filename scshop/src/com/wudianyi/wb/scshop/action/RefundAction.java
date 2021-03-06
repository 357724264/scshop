package com.wudianyi.wb.scshop.action;

import javax.annotation.Resource;

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
		setAttribute("bankcard", bankcard);
		
		return "apply";
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
			setAttribute("bankcardid", bankcardid);
		}
		setAttribute("refund", refund);
	
		
		
		return "edit";
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
