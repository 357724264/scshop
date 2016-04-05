package com.wudianyi.wb.scshop.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.ParentPackage;

import com.wudianyi.wb.scshop.bean.NoticeRequest;
import com.wudianyi.wb.scshop.bean.Result;
import com.wudianyi.wb.scshop.bean.ResultItem;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.entity.Order;
import com.wudianyi.wb.scshop.entity.OrderItem;
import com.wudianyi.wb.scshop.service.OrderItemService;
import com.wudianyi.wb.scshop.service.OrderService;
import com.wudianyi.wb.scshop.util.JacksonHelper;
import com.wudianyi.wb.scshop.util.StringUtils;

@ParentPackage("user")
public class OrderAction extends BaseAction {

	@Resource
	private OrderService orderService;
	@Resource
	private OrderItemService orderItemService;

	private Integer tt;
	private String id;

	public String list() {
		return LIST;
	}
	
	public String refund(){
		
		return "refund";
	}
	
	public String comment() {
		Integer userid = (Integer) getSession(Const.SESSION_CUSTOMER_ID);
		Order order = orderService.get(id);
		if (order.getUserid() == userid.intValue() && order.getPayStat() == 3) {
			setAttribute("order", order);
		} else {
			return "nopage";
		}
		List<OrderItem> list = orderItemService.getList(
				new QueryParam(1).add("orderid", id), 0, 0, null, null, false);
		setAttribute("list", list);
		return "comment";
	}

	@Override
	public String execute() throws Exception {
		Order order = orderService.get(id);
		setAttribute("order", order);
		list = orderItemService.getList(new QueryParam(1).add("orderid", id),
				0, 0, null, null, false);
		return "order";
	}

	// 查看快递信息
	public String checkExpressage() {

		Order order = orderService.get(id);
		String postjson = order.getPostjson();
		if (!StringUtils.isEmpty(postjson)) {
			NoticeRequest notice = JacksonHelper.fromJSON(postjson,
					NoticeRequest.class);
			ArrayList<ResultItem> resultList = notice.getLastResult().getData();
			setAttribute("resultList", resultList);
		}

		setAttribute("companyName", order.getPostCompany());
		setAttribute("expressageNum", order.getPostNum());

		return "expressage";
	}

	public Integer getTt() {
		return tt;
	}

	public void setTt(Integer tt) {
		this.tt = tt;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

}
