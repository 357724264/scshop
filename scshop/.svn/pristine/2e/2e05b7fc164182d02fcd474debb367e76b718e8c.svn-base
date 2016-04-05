package com.wudianyi.wb.scshop.action.admin.json;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.ParentPackage;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.bean.TaskRequest;
import com.wudianyi.wb.scshop.bean.TaskResponse;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Admin;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.entity.Inventory;
import com.wudianyi.wb.scshop.entity.Kuaidi;
import com.wudianyi.wb.scshop.entity.Order;
import com.wudianyi.wb.scshop.entity.OrderItem;
import com.wudianyi.wb.scshop.entity.SubProduct;
import com.wudianyi.wb.scshop.entity.WebInfo;
import com.wudianyi.wb.scshop.quart.service.OrderQuartService;
import com.wudianyi.wb.scshop.service.AdminService;
import com.wudianyi.wb.scshop.service.InventoryService;
import com.wudianyi.wb.scshop.service.KuaidiService;
import com.wudianyi.wb.scshop.service.OrderItemService;
import com.wudianyi.wb.scshop.service.OrderService;
import com.wudianyi.wb.scshop.service.SubProductService;
import com.wudianyi.wb.scshop.util.HttpRequest;
import com.wudianyi.wb.scshop.util.JacksonHelper;
import com.wudianyi.wb.scshop.util.StringUtils;

@ParentPackage("adminjson")
public class OrderAction extends BaseAction {

	@Resource
	private OrderService orderService;
	@Resource
	private OrderItemService orderItemService;
	@Resource
	private KuaidiService kuaidiService;
	@Resource
	private OrderQuartService orderQuartService;
	@Resource
	private SubProductService subProductService;
	@Resource
	private InventoryService inventoryService;
	@Resource
	private AdminService adminService;
	private String id;
	private String tt;
	private String cc;// 快递公司
	private String no;// 快递单号
	private double newmoney;// 旧价格

	/*
	 * 修改订单状态
	 */
	public String orderupdate() {

		return null;
	}

	/*
	 * 确认发货并添加物流信息
	 */
	public String send() throws Exception {
		Integer adminid = (Integer) getSession(Const.SESSION_ADMIN_NAME);
		Admin admin = adminService.get(adminid);
		Order order = orderService.get(id);
		WebInfo webInfo = getWebInfo();
		int prestat = order.getPayStat();
		Calendar calendar = Calendar.getInstance();
		if (prestat == 1) {
			order.setPayStat(2);

			calendar.add(Calendar.DATE, webInfo.getDayNoPaySure());
			order.setStatOverdueTime(calendar.getTimeInMillis());
		}
		String bs = "";
		if (!StringUtils.isEmpty(cc)) {
			Kuaidi kuaidi = kuaidiService.get(cc);
			order.setPostCompany(kuaidi.getName());
			order.setCarrcompanykey(kuaidi.getKeyid());
			bs = kuaidi.getKeyid();
			order.setPostNum(no);
		}
		

		// 执行订阅请求
		TaskRequest req = new TaskRequest();
		req.setCompany(bs); // 设置公司代码
		req.setNumber(no); // 设置快递单号
		// 设置回调URL
		req.getParameters().put("callbackurl", Const.EXPRESSAGE_CALLBACK_URL);
		// 设置授权码
		req.setKey(Const.EXPRESSAGE_KEY);
		HashMap<String, String> paramMap = new HashMap<String, String>();
		// 标示为以json格式进行数据传输
		paramMap.put("schema", "json");
		paramMap.put("param", JacksonHelper.toJSON(req));
		String ret = HttpRequest.postData(Const.EXPRESSAGE_REQUEST_URL,
				paramMap, "UTF-8");
		TaskResponse resp = JacksonHelper.fromJSON(ret, TaskResponse.class);
		if (resp.getResult() == false) {
			String errorMsg = "";
			if("701".equals(resp.getReturnCode())) {
				errorMsg = "不支持订阅该快递公司!";
			}else if("501".equals(resp.getReturnCode())) {
				errorMsg = "重复订阅!";
			}else if("700".equals(resp.getReturnCode())) {
				errorMsg = "订阅数据有误!";
			}else {
				errorMsg =  "快递100服务器异常,请稍后再订阅!";
			}
			return ajaxJsonErrorMessage("订阅失败,"+errorMsg);
		}
		orderService.update(order);

		if (prestat == 1) {// 如果之前是已支付状态，现在要改成已发货状态，规定时间内自确认订单

			// 库存的减少
			List<OrderItem> items = orderItemService.getList(
					new QueryParam(1).add("orderid", order.getId()), 0, 0,
					null, null, false);
			if (items != null && !items.isEmpty()) {
				for (OrderItem item : items) {
					SubProduct subProduct = subProductService.get(item
							.getSubproductid());
					if (subProduct == null) {
						continue;
					}
					Inventory inventory = new Inventory();
					inventory.setAdmin(admin.getId());
					inventory.setAdminName(admin.getName());
					inventory.setProductid(item.getSubproductid());
					inventory.setProductName(item.getName() + " "
							+ item.getModel());
					inventory.setUpproductid(subProduct.getProductid());
					inventory.setStorageType(1);
					inventory.setDecrement(item.getNum());
					inventory.setSku(item.getSku());
					inventory.setRemark("订单发货");
					inventory.setSurplus(subProduct.getInventory());
					inventory.setShopid(order.getShopid());
					inventory.setCreateDate(new Date().getTime());
					inventoryService.save(inventory);
				}
			}

			orderQuartService.updateOrderWhenUnSureExpire(order.getId(),
					calendar.getTime());
		}
		return ajaxJsonSuccessMessage("order.action?id="+id);
	}

	/*
	 * 修改价格
	 */
	public String changemoney() throws Exception {
		System.err.println("1111111111");
		System.err.println("新价格：" + newmoney);
		System.err.println("id=" + id);
		Order order = orderService.get(id);
		Date date = new Date();
		order.setAdminid((Integer) getSession(Const.SESSION_ADMIN_NAME));// 保存修改员id
		order.setOldmoney(order.getRealmoney());// 把原本的价格存入旧价格里
		order.setRealmoney(newmoney);// 将新价格存入实际支付价格里
		order.setMoneyDate(date.getTime());
		order.setEdittime(order.getEdittime() == null ? 1 : (order
				.getEdittime() + 1));
		orderService.update(order);
		return ajaxHtml("success");
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTt() {
		return tt;
	}

	public void setTt(String tt) {
		this.tt = tt;
	}

	public String getCc() {
		return cc;
	}

	public void setCc(String cc) {
		this.cc = cc;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public double getNewmoney() {
		return newmoney;
	}

	public void setNewmoney(double newmoney) {
		this.newmoney = newmoney;
	}

}
