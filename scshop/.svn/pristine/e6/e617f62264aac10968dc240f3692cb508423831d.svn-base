package com.wudianyi.wb.scshop.action.app;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.convention.annotation.ParentPackage;

import com.wudianyi.wb.scshop.action.BaseAction;
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
@ParentPackage("appUser")
public class OrderAction extends BaseAction {

	@Resource
	private OrderService orderService;
	@Resource
	private OrderItemService orderItemService;

	private Integer tt;
	private String id;

	public String list() {
		
		Integer userid = (Integer) getSession(Const.SESSION_CUSTOMER_ID);
		QueryParam param = new QueryParam(3);
		if (tt == null) {
			param.add("userid", userid).add("del", 0).add("payStat>", -1);
		} else {
			param.add("userid", userid).add("del", 0).add("payStat", tt);
		}

		list = orderService.getList(param, Const.FRONT_PAGE_SIZE * (pn - 1),
				Const.FRONT_PAGE_SIZE, "createDate", "desc", false);
		return LIST;
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
		//setAttribute("order", order);
		List<OrderItem> orderItemlist = orderItemService.getList(new QueryParam(1).add("orderid", id),
				0, 0, null, null, false);
		JSONObject retObject = new JSONObject();
		JSONObject orderObject = new JSONObject();
		orderObject.put("name", order.getName());
		orderObject.put("phone", order.getPhone());
		orderObject.put("address", order.getAddress());
		orderObject.put("orderSn", order.getOrderSn());
		orderObject.put("money", order.getMoney());
		orderObject.put("id", order.getId());
		orderObject.put("pointMoney", order.getPointMoney());
		orderObject.put("realmoney", order.getRealmoney());
		
		retObject.put(order,orderObject);
		
		JSONArray oritemArray = new JSONArray();
		for(OrderItem orderItem:orderItemlist){
			JSONObject oritemObject = new JSONObject();
			oritemObject.put("pic", orderItem.getPic());
			oritemObject.put("name", orderItem.getName());
			oritemObject.put("model", orderItem.getModel());
			oritemObject.put("price", orderItem.getPrice());
			oritemObject.put("num", orderItem.getNum());
			oritemArray.add(oritemObject);
		}
		retObject.put("orderItem",oritemArray);
		return ajaxJson(retObject.toString());
	}
	//查看快递信息
	public String checkExpressage() {
		
		Order order = orderService.get(id);
		String postjson = order.getPostjson();
		NoticeRequest notice = JacksonHelper.fromJSON(postjson, NoticeRequest.class);
		ArrayList<ResultItem> resultList = notice.getLastResult().getData();
		setAttribute("resultList", resultList);
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
