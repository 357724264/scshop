package com.wudianyi.wb.scshop.action.admin.json;

import java.util.Date;

import javax.annotation.Resource;

import org.omg.CORBA.TCKind;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Admin;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.entity.Customer;
import com.wudianyi.wb.scshop.entity.Order;
import com.wudianyi.wb.scshop.entity.Refund;
import com.wudianyi.wb.scshop.entity.Refund.RefundStatus;
import com.wudianyi.wb.scshop.service.AdminService;
import com.wudianyi.wb.scshop.service.CustomerService;
import com.wudianyi.wb.scshop.service.OrderService;
import com.wudianyi.wb.scshop.service.ProductService;
import com.wudianyi.wb.scshop.service.RefundService;

public class RefundAction extends BaseAction{
	
	@Resource
	private RefundService refundService;
	@Resource
	private ProductService productService;
	@Resource
	private AdminService adminService; 
	@Resource
	private OrderService orderService;
	@Resource
	private CustomerService customerService;
	
	private Integer stat;
	private Integer id;
	private String reason;
	private boolean bl = true;
	
	public String List() {
		Integer premission = (Integer)getSession(Const.SESSION_ADMIN_PERMISSION);
		QueryParam params = new QueryParam();
		if(premission==1) {
			Integer shopid = (Integer)getSession(Const.SESSION_ADMIN_SHOPID);
			params = new QueryParam().add("shopid", shopid);
		}
		if(stat!=null) {
			params.add("refundStatus", RefundStatus.values()[stat]);
		}
		list = refundService.getList(params, (pn-1)*Const.BACK_PAGE_SIZE, Const.BACK_PAGE_SIZE, "createDate", "desc", false);
		setAttribute("premission", premission);
		return "list";
	}
	
	
	public String TotalNum() {
		
		Integer shopid = (Integer)getSession(Const.SESSION_ADMIN_SHOPID);
		QueryParam params = new QueryParam().add("shopid", shopid);
		if(stat!=null) {
			
			params.add("refundStatus", RefundStatus.values()[stat]);
			
		}
		tn = refundService.getTotalCount(params, false);
		
		return ajaxJson("{\"total\":\"" + tn + "\",\"size\":\"" + Const.BACK_PAGE_SIZE + "\"}");
	}
	
	public String statchange(){
		int adminid = (Integer)getSession(Const.SESSION_ADMIN_NAME);
		Admin admin = adminService.get(adminid);
		Refund refund = refundService.get(id);
		if(stat==1){
			refund.setRefundStatus(RefundStatus.success);
			refund.setOperator(admin.getName());
			Order order = orderService.get(refund.getOrderid());
			order.setPayStat(7);
			bl = true;
			//退货成功返回积分
			Customer customer = customerService.get(order.getUserid());
			customer.setPoint(customer.getPoint() + order.getPoint());
			customerService.update(customer);
		}else{
			refund.setRefundStatus(RefundStatus.refuse);
			refund.setRefuseReason(reason);
			refund.setOperator(admin.getName());
			bl= false;
		}
		refundService.update(refund);
		return ajaxJson("{\"success\":\"" + bl + "\"}");
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


	public String getReason() {
		return reason;
	}


	public void setReason(String reason) {
		this.reason = reason;
	}


	public boolean isBl() {
		return bl;
	}


	public void setBl(boolean bl) {
		this.bl = bl;
	}
	
	
	
}
