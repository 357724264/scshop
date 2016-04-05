package com.wudianyi.wb.scshop.action;

import java.io.IOException;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.ParentPackage;

import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Bankcard;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.service.BankcardService;
import com.wudianyi.wb.scshop.util.StringUtils;

@ParentPackage("user")
public class BankcardAction extends BaseAction{
	
	private Integer id;
	private String cardHolder;//持卡人
	private String cardNumber;//银行卡号码
	private String phone;//手机
	private int isDefault;//是否默认 0否 1是
	private String bankName;//银行支行信息
	private Integer bankcardid;
	private Integer refundid;
	private String orderid;
	private Double total;
	
	@Resource
	private BankcardService bankcardService;
	
	public String list() {
		
		Integer userid = (Integer)getSession(Const.SESSION_CUSTOMER_ID);
		
		QueryParam params = new QueryParam(1).add("userid", userid);
		
		list = bankcardService.getList(params, 0, 0, null, null, false);
		System.out.println("refundid======>" + refundid);
		
		return LIST;
	}
	
	public String edit() {
			Bankcard  bankcard = null;
			if(id != null) {
				bankcard = bankcardService.get(id);
			}else {
				bankcard = new Bankcard();
			}
		
		setAttribute("bankcard", bankcard);
		return "edit";
	}
	
	public String updateOrSave() throws IOException {
		Bankcard bankcard = null;
		Integer userid = (Integer)getSession(Const.SESSION_CUSTOMER_ID);
		boolean isUdpate = false;
		if(id==null || id==0) {
			bankcard = new Bankcard();
			bankcard.setUserid(userid);
		}else {
			bankcard = bankcardService.get(id);
			isUdpate = true;
		
		}
	
		if(isDefault==1) {
			QueryParam params = new QueryParam().add("isDefault", 1).add("userid", userid);
			//查看之前是否有默认银行卡
			Bankcard defaultCard = bankcardService.get(params, false);
			//如果之前有默认银行卡的话，解除其默认状态
			if(defaultCard != null) {
				defaultCard.setIsDefault(0);
				bankcardService.update(defaultCard);
			}
		}
		bankcard.setBankName(bankName);
		bankcard.setCardHolder(cardHolder);
		bankcard.setCardNumber(cardNumber);
		bankcard.setPhone(phone);
		bankcard.setIsDefault(isDefault);
		String url = "bankcard!list.action";
		
		
		if(isUdpate) {
			bankcardService.update(bankcard);
		}else {
			bankcardService.save(bankcard);
			
		}
		if((!StringUtils.isEmpty(orderid)&&total!=null) || refundid!=null) {
			url += "?orderid=" + orderid + "&total=" + (total==null?0.0:total) + "&bankcardid=" + (bankcardid==null?0:bankcardid) + "&refundid=" + (refundid==null?0:refundid);
		}
		return ajaxJsonSuccessMessage(url);
	}

	public String getCardHolder() {
		return cardHolder;
	}

	public void setCardHolder(String cardHolder) {
		this.cardHolder = cardHolder;
	}

	public String getCardNumber() {
		return cardNumber;
	}

	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getIsDefault() {
		return isDefault;
	}

	public void setIsDefault(int isDefault) {
		this.isDefault = isDefault;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
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
