package com.wudianyi.wb.scshop.action.admin;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.apache.struts2.convention.annotation.ParentPackage;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.bean.NoticeRequest;
import com.wudianyi.wb.scshop.bean.ResultItem;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Admin;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.entity.Customer;
import com.wudianyi.wb.scshop.entity.Kuaidi;
import com.wudianyi.wb.scshop.entity.Order;
import com.wudianyi.wb.scshop.entity.OrderItem;
import com.wudianyi.wb.scshop.entity.Shop;
import com.wudianyi.wb.scshop.service.AdminService;
import com.wudianyi.wb.scshop.service.CustomerService;
import com.wudianyi.wb.scshop.service.KuaidiService;
import com.wudianyi.wb.scshop.service.OrderItemService;
import com.wudianyi.wb.scshop.service.OrderService;
import com.wudianyi.wb.scshop.service.ShopService;
import com.wudianyi.wb.scshop.util.JacksonHelper;
import com.wudianyi.wb.scshop.util.StringUtils;

@ParentPackage("admin")
public class OrderAction extends BaseAction {

	@Resource
	private OrderService orderService;
	@Resource
	private OrderItemService orderItemService;
	@Resource
	private KuaidiService kuaidiService;
	@Resource
	private CustomerService customerService;
	@Resource
	private ShopService shopService;
	@Resource
	private AdminService adminService;

	private String intxt;// 搜索的词汇
	private String id;
	private Integer tt;// 获取想看的支付状态

	public String list() {
		return LIST;
	}

	// 对应订单列表
	public String jsonlist() {
		Admin admin = adminService.get( (Integer)getSession(Const.SESSION_ADMIN_NAME));
		QueryParam params = new QueryParam(3);
		if(admin.getPermission()==0){//0是管理人员 1是普通商户
			params  = new  QueryParam(3).add("del", 0).add("payStat>", -1).add("payStat", tt);
		}else if(admin.getPermission()==1){
			params = new QueryParam(4).add("del", 0).add("payStat>", -1).add("payStat", tt).add("shopid", admin.getShopId()); 
		}
		list = orderService.getLikeList("phone,orderSn", keyword, null, params,
				ADMIN_PAGE_SIZE * (pn - 1), ADMIN_PAGE_SIZE, "createDate",
				"desc", false);

		Integer permission = (Integer)getSession(Const.SESSION_ADMIN_PERMISSION);
		setAttribute("permission", permission);
		return "jsonlist";
	}

	/*
	 * 获取数量
	 */
	public String totalNum() {
		QueryParam param = new QueryParam(3).add("payStat>", -1).add("payStat", tt).add("del", 0);
		tn = orderService.getLikeTotalCount("phone,orderSn", keyword, null, param, false);
		System.out.println("size:"+size);
		return ajaxJson("{\"total\":\"" + tn + "\",\"size\":\"" + Const.BACK_PAGE_SIZE + "\"}");
	}

	/*
	 * 单笔订单下的所有信息
	 */
	public String execute() throws Exception {
		Order order = orderService.get(id);
		setAttribute("order", order);
		QueryParam param = new QueryParam(2).add("orderid", order.getId());
		List<OrderItem> items = orderItemService.getList(
					param, 0, 0, null,null, false);

		setAttribute("items", items);
		List<Kuaidi> kuaidis = kuaidiService.getList(null, 0, 0, null, null,
				false);
		setAttribute("kuaidis", kuaidis);
		//详细的物流信息
		String postjson = order.getPostjson();
		if (!StringUtils.isEmpty(postjson)) {
			NoticeRequest notice = JacksonHelper.fromJSON(postjson,
					NoticeRequest.class);
			ArrayList<ResultItem> resultList = notice.getLastResult().getData();
			setAttribute("resultList", resultList);
		}
		return "order";
	}

	/*
	 * 打印
	 */
	public String print()  throws Exception{
		System.err.println("222");
		Order order = orderService.get(id);
		setAttribute("order", order);
		QueryParam param = new QueryParam(2).add("orderid", order.getId());
		List<OrderItem> items = orderItemService.getList(
					param, 0, 0, null,null, false);
		setAttribute("items", items);
		Customer customer = customerService.get(order.getUserid());
		setAttribute("customer", customer);
		Date date1 = new Date();
		long date = date1.getTime();//当前打印时间
		setAttribute("date", date);
		Shop shop = shopService.get(order.getShopid());//店铺信息
		
		System.err.println(shop);
		setAttribute("shop", shop);
		return "print";
	}
	
	
	
	/*
	 * 删除订单
	 */
	public String deleteOrder() {
		Order order = orderService.get(id);
		order.setDel(1);
		orderService.update(order);
		return ajaxHtml("success");
	}

	/*
	 * 取消订单
	 */
	public String cancelOrder(){
		Order order = orderService.get(id);
		order.setPayStat(5);
		orderService.update(order);
		return ajaxHtml("success");
	}
	
	// /*
	// * 订单搜索
	// */
	// public String seek(){
	// QueryParam param = new QueryParam(1).add("del", 0);
	// //缺少对应的管理员.add("shopid",*);
	// List<Order>list1 = orderService.getli
	// getLikeList("orderSn", , null, param, start, limit, orderbyparam,
	// orderby, cache);
	// List<Order>list = orderService.getList(param, 10 * (pn - 1), 10,
	// "createDate", "desc", false);
	//
	// list.addAll(list1);
	//
	// return "jsonlist";
	//
	// }

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Integer getTt() {
		return tt;
	}

	public void setTt(Integer tt) {
		this.tt = tt;
	}

	public String getIntxt() {
		return intxt;
	}

	public void setIntxt(String intxt) {
		this.intxt = intxt;
	}

}
