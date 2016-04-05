package com.wudianyi.wb.scshop.action.admin;

import java.util.List;

import javax.annotation.Resource;

import org.tuckey.web.filters.urlrewrite.SetAttribute;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Bankcard;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.entity.Order;
import com.wudianyi.wb.scshop.entity.OrderItem;
import com.wudianyi.wb.scshop.entity.Refund;
import com.wudianyi.wb.scshop.service.BankcardService;
import com.wudianyi.wb.scshop.service.OrderItemService;
import com.wudianyi.wb.scshop.service.OrderService;
import com.wudianyi.wb.scshop.service.RefundService;

public class RefundAction extends BaseAction{
	
	@Resource
	private RefundService refundService;
	@Resource
	private OrderService orderService;
    @Resource
    private OrderItemService orderItemService;
	private int id;
	
	public String list(){
		return "list";
	}
	
	public String detail(){
		Refund refund = refundService.get(id);
		String orderid = refund.getOrderid();
		Order order = orderService.get(orderid);
		QueryParam param = new QueryParam(2).add("orderid", order.getId());
		List<OrderItem> items = orderItemService.getList(
					param, 0, 0, null,null, false);

		setAttribute("items", items);
		setAttribute("order", order);
		setAttribute("refund", refund);
		return "detail"; 
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
}
