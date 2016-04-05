package com.wudianyi.wb.scshop.action.ry;

import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

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
	private CustomerService customerService;
	@Resource
	private AdminService adminService;

	private String ids;

	private Integer shopid;

	public static void main(String[] args) {
		for (int i = 0; i < 20; i++) {
			System.err.println(i % 1);
		}
	}

	public String kf() {

		Integer userid = (Integer) getSession(Const.SESSION_CUSTOMER_ID);

		List<Admin> kfs = adminService.getLikeList("functionitems", ",kefuim,",
				null, new QueryParam(1).add("shopId", shopid), 0, 0, null,
				null, false);
		System.err.println("21212");
		JSONObject retJson = new JSONObject();
		if (kfs.isEmpty() || (kfs.size() == 0)) {
			retJson.put("targetId", 0);
		}
		int size = kfs.size();
		int index = userid % size;
		Admin admin = kfs.get(index);
		retJson.put("targetId", Const.PUSH_ADMIN_FORNT + admin.getId());
		return ajaxJson(retJson.toString());

	}

	public String listbyids() {
		List<Admin> users = adminService.getbyids(ids.replaceAll(
				Const.PUSH_ADMIN_FORNT, ""));
		JSONArray retJson = new JSONArray();
		for (Admin admin : users) {
			JSONObject userJson = new JSONObject();
			userJson.put("userid", Const.PUSH_ADMIN_FORNT + admin.getId());
			userJson.put(
					"username",
					admin.getName() == null ? "客服" + admin.getId() : admin
							.getName());
			userJson.put(
					"userphoto",
					StringUtils.isEmpty(admin.getPic()) ? Const.DEFAULT_KEFU_PHOTO
							: admin.getPic());
			retJson.add(userJson);
		}
		System.err.println(retJson.toString());
		return ajaxJson(retJson.toString());
	}

	public String token() throws Exception {
		JSONObject retJson = new JSONObject();
		if (getSession(Const.SESSION_CUSTOMER_ID) == null) {
			retJson.put("status", -1);
			return ajaxJson(retJson.toString());
		}
		Integer userid = (Integer) getSession(Const.SESSION_CUSTOMER_ID);
		System.err.println(userid);
		Customer customer = customerService.get(userid);
		SdkHttpResult result = null;
		// 获取token
		result = ApiHttpClient
				.getToken(
						Const.RONGCLOUD_KEY,
						Const.RONGCLOUD_SECRET,
						Const.PUSH_USER_FORNT + customer.getId(),
						StringUtils.isEmpty(customer.getName()) ? "用户"
								+ customer.getId() : customer.getName(),
						StringUtils.isEmpty(customer.getPic()) ? Const.DEFAULT_CUSTOMER_PHOTO
								: customer.getPic(), FormatType.json);
		JSONObject tokenObject = JSONObject.fromObject(result.getResult());

		JSONObject userinfoJson = new JSONObject();
		retJson.put("code", 200);

		retJson.put("status", 1);
		userinfoJson.put("id", Const.PUSH_USER_FORNT + customer.getId());
		userinfoJson.put(
				"username",
				StringUtils.isEmpty(customer.getName()) ? "用户"
						+ customer.getId() : customer.getName());
		userinfoJson
				.put("portrait",
						StringUtils.isEmpty(customer.getPic()) ? Const.DEFAULT_CUSTOMER_PHOTO
								: customer.getPic());
		userinfoJson.put("token", tokenObject.get("token"));
		retJson.put("userinfo", userinfoJson);
		System.err.println("====" + retJson.toString());
		return ajaxJson(retJson.toString());
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public Integer getShopid() {
		return shopid;
	}

	public void setShopid(Integer shopid) {
		this.shopid = shopid;
	}

}
