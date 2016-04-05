package com.wudianyi.wb.scshop.action.json;

import java.util.Date;

import javax.annotation.Resource;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.entity.Order;
import com.wudianyi.wb.scshop.entity.Refund;
import com.wudianyi.wb.scshop.entity.Refund.RefundStatus;
import com.wudianyi.wb.scshop.service.OrderService;
import com.wudianyi.wb.scshop.service.RefundService;

public class RefundAction extends BaseAction{
	
	private Integer id;
	private String reason;//退款理由
	private int refundType;//退款类型 0为无需退货 1为需要退货
	private int refundWay;//退款途径  0为微信钱包 1为银行卡
	private String refuseReason;//拒绝的理由
	private String realName;//真实姓名
	private String wxAccount;//微信账号
	private String phone;//手机号码
	private String cardInfo;//银行卡信息
	private String orderid;
	private Double total;
	private Integer bankcardid;
	
	@Resource
	private RefundService refundService;
	@Resource
	private OrderService orderService;
	
	public String updateOrSave() {
		
		Refund refund = new Refund();
		boolean isUpdate = false;
		if(id!=null) {
			refund = refundService.get(id);
			isUpdate = true;
		}else {
			Integer userid = (Integer)getSession(Const.SESSION_CUSTOMER_ID);
			refund.setOrderid(orderid);
			refund.setUserid(userid);
		}
		refund.setRealName(realName);
		refund.setCardInfo(cardInfo);
		refund.setRefundWay(refundWay);
		refund.setRefundType(refundType);
		refund.setPhone(phone);
		refund.setReason(reason);
		refund.setTotal(total);
		refund.setWxAccount(wxAccount);
		refund.setRefundStatus(RefundStatus.apply);
		refund.setBankcardid(bankcardid);
		if(isUpdate) {
			refundService.update(refund);
		}else {
			Order order = orderService.get(orderid);
			refund.setShopid(order.getShopid());
			refund.setCreateDate(new Date().getTime());
			refund.setRealMoney(order.getRealmoney());
			refund.setPoint(order.getPoint());
			refundService.save(refund);
			//将订单改为退款中
			order.setPayStat(6);
			orderService.update(order);
		}
		
		return ajaxJsonSuccessMessage("order!refund.action?tt=6");
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public int getRefundType() {
		return refundType;
	}

	public void setRefundType(int refundType) {
		this.refundType = refundType;
	}

	public int getRefundWay() {
		return refundWay;
	}

	public void setRefundWay(int refundWay) {
		this.refundWay = refundWay;
	}

	public String getRefuseReason() {
		return refuseReason;
	}

	public void setRefuseReason(String refuseReason) {
		this.refuseReason = refuseReason;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getWxAccount() {
		return wxAccount;
	}

	public void setWxAccount(String wxAccount) {
		this.wxAccount = wxAccount;
	}

	public String getOrderid() {
		return orderid;
	}

	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}

	public Double getTotal() {
		return total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getCardInfo() {
		return cardInfo;
	}

	public void setCardInfo(String cardInfo) {
		this.cardInfo = cardInfo;
	}

	public Integer getBankcardid() {
		return bankcardid;
	}

	public void setBankcardid(Integer bankcardid) {
		this.bankcardid = bankcardid;
	}
	
	
}
