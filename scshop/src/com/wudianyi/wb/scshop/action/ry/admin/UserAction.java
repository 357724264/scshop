package com.wudianyi.wb.scshop.action.ry.admin;

import java.util.List;

import javax.annotation.Resource;
import javax.xml.registry.infomodel.User;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.alibaba.dubbo.common.json.JSON;
import com.google.gson.JsonObject;
import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Admin;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.entity.Customer;
import com.wudianyi.wb.scshop.ry.models.FormatType;
import com.wudianyi.wb.scshop.ry.models.SdkHttpResult;
import com.wudianyi.wb.scshop.ry.rong.ApiHttpClient;
import com.wudianyi.wb.scshop.service.AdminService;
import com.wudianyi.wb.scshop.service.CustomerService;
import com.wudianyi.wb.scshop.util.StringUtils;

public class UserAction extends BaseAction {

	@Resource
	private AdminService adminService;
	@Resource
	private CustomerService customerService;
	private int pn;

	private String ids;

	private String id;

	@Override
	public String execute() throws Exception {
		String idnumber = id.replace(Const.PUSH_USER_FORNT, "");
		Customer customer = customerService.get(Integer.parseInt(idnumber));
		JSONObject userJson = new JSONObject();
		userJson.put("userid", Const.PUSH_USER_FORNT + customer.getId());
		userJson.put(
				"username",
				customer.getName() == null ? "用户" + customer.getId() : customer
						.getName());
		userJson.put(
				"userphoto",
				StringUtils.isEmpty(customer.getPic()) ? Const.DEFAULT_CUSTOMER_PHOTO
						: customer.getPic());
		return ajaxJson(userJson.toString());
	}

	public String token() throws Exception {
		Integer adminid = (Integer) getSession(Const.SESSION_ADMIN_NAME);
		Admin admin = adminService.get(adminid);
		SdkHttpResult result = null;
		// 获取token
		result = ApiHttpClient.getToken(Const.RONGCLOUD_KEY,
				Const.RONGCLOUD_SECRET, Const.PUSH_USER_FORNT + admin.getId(),
				admin.getName(), admin.getPic(), FormatType.json);
		JSONObject tokenObject = JSONObject.fromObject(result.getResult());
		JSONObject retJson = new JSONObject();
		JSONObject userinfoJson = new JSONObject();
		retJson.put("code", 200);

		retJson.put("status", 1);
		userinfoJson.put("userid", Const.PUSH_ADMIN_FORNT + admin.getId());
		userinfoJson.put(
				"username",
				admin.getName() == null ? "客服" + admin.getId() : admin
						.getName());
		userinfoJson.put("portrait",
				StringUtils.isEmpty(admin.getPic()) ? Const.DEFAULT_KEFU_PHOTO
						: admin.getPic());
		userinfoJson.put("token", tokenObject.get("token"));
		retJson.put("userinfo", userinfoJson);
		System.err.println(retJson.toString());
		return ajaxJson(retJson.toString());
	}

	public String listbyids() {
		List<Customer> users = customerService.getbyids(ids.replaceAll(
				Const.PUSH_USER_FORNT, ""));
		JSONArray retJson = new JSONArray();
		for (Customer customer : users) {
			JSONObject userJson = new JSONObject();
			userJson.put("userid", Const.PUSH_USER_FORNT + customer.getId());
			userJson.put("username", customer.getName() == null ? "用户"
					+ customer.getId() : customer.getName());
			userJson.put("userphoto", customer.getPic());
			retJson.add(userJson);
		}
		return ajaxJson(retJson.toString());
	}

	public int getPn() {
		return pn;
	}

	public void setPn(int pn) {
		this.pn = pn;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

}
