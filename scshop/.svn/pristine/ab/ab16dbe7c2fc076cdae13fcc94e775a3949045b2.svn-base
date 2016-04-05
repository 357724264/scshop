package com.wudianyi.wb.scshop.action.admin.json;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.google.gson.JsonObject;
import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Admin;
import com.wudianyi.wb.scshop.entity.Brand;
import com.wudianyi.wb.scshop.entity.Category;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.service.AdminService;
import com.wudianyi.wb.scshop.service.CategoryService;
import com.wudianyi.wb.scshop.util.StringUtils;

public class CategoryAction extends BaseAction {

	private String displayName;
	private int orderById;
	private String picUrl;
	private String addOrEdit;
	private Integer cid; // 分类id
	private Integer nodeId;// 分类id
	private Integer index;
	private String rettype;

	@Resource
	private CategoryService categoryService;

	private Integer id;

	// 根据一级分类id获取二级分类的信息
	public String getChildLevel() {
		QueryParam params = new QueryParam(2).add("del", 0).add("category.id",
				id);
		List<Category> categoryList = categoryService.getList(params, 0, 0,
				"displayOrder", "desc", false);
		JSONArray ary = new JSONArray();
		JSONObject obj = null;
		for (Category category : categoryList) {
			obj = new JSONObject();
			obj.put("id", category.getId());
			obj.put("name", category.getName());
			ary.add(obj);
		}
		return ajaxJson(ary.toString());
	}

	// 根据点击的id查询分类的具体信息
	public String classView() {

		if (cid != null) {

			Category category = categoryService.get(cid);
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("cid", category.getId());
			jsonObj.put("displayName", category.getName());
			jsonObj.put("picUrl", category.getLogo());
			jsonObj.put("orderById", category.getDisplayOrder());
			return ajaxJson(jsonObj.toString());
		}
		return ajaxJson("noCid");
	}

	// 删除指定的分类
	public String deleteCoumn() {
		Category category = categoryService.get(cid);
		category.setDel(1);
		categoryService.update(category);
		String url = "category!list.action";
		if (index != null)
			url += "?index=" + index;
		return ajaxJsonSuccessMessage(url);
	}

	// 添加或更新分类信息
	public String saveProductClass() {
		Category category = new Category();
		boolean isUpdate = false;
		if ("edit1".equals(addOrEdit) || "edit2".equals(addOrEdit)) {
			isUpdate = true;
			category = categoryService.get(cid);
		} else {
			Integer shopid = (Integer) getSession(Const.SESSION_ADMIN_SHOPID);
			Integer permission = (Integer) getSession(Const.SESSION_ADMIN_PERMISSION);
			category.setShopid(shopid);
			// 如果为管理人员，分类类型为前端分类
			if (permission == 0) {
				category.setCategoryType(0);
			} else {
				category.setCategoryType(1);
			}
			// 添加一级分类
			if ("add1".equals(addOrEdit)) {
				category.setNodeid(0);
			}
			// 添加二级分类
			if ("add2".equals(addOrEdit)) {
				category.setNodeid(1);
				Category cat = categoryService.get(cid);
				category.setCategory(cat);
			}
		}

		category.setName(displayName);
		category.setLogo(picUrl);
		category.setDisplayOrder(orderById);
		category.setDel(0);

		if (isUpdate) {
			categoryService.update(category);
		} else {
			categoryService.save(category);
		}
		String url = "category!list.action";
		// index是页面中被选择的分类的id，用于ajax获取数据后进行定位
		if (index != null)
			url += "?index=" + index;
		return ajaxJsonSuccessMessage(url);
	}

	public String list() {

		QueryParam param = new QueryParam(4);

		if (StringUtils.isEmpty(rettype)) {
			return ajaxJsonErrorMessage("请选择返回类型");
		}
		if (nodeId != null && nodeId.equals(0)) {
			nodeId = null;
		}
		int categoryType = 1;
		if (getSession(Const.SESSION_ADMIN_PERMISSION).equals(0)) {
			categoryType = 0;
			param.add("del", 0).add("categoryType", categoryType)
					.add("nodeid", nodeId);
		} else {
			Integer shopid = (Integer) getSession(Const.SESSION_ADMIN_SHOPID);
			param.add("del", 0).add("categoryType", categoryType)
					.add("category.id", nodeId).add("shopid", shopid);
		}
		list = categoryService.getList(
				new QueryParam(3).add("del", 0)
						.add("categoryType", categoryType)
						.add("category.id", nodeId), 0, 0, "displayOrder",
				"desc", true);
		if (rettype.equals("select")) {
			return "select";
		}
		return null;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDisplayName() {
		return displayName;
	}

	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}

	public int getOrderById() {
		return orderById;
	}

	public void setOrderById(int orderById) {
		this.orderById = orderById;
	}

	public String getPicUrl() {
		return picUrl;
	}

	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}

	public String getAddOrEdit() {
		return addOrEdit;
	}

	public void setAddOrEdit(String addOrEdit) {
		this.addOrEdit = addOrEdit;
	}

	public Integer getCid() {
		return cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public Integer getNodeId() {
		return nodeId;
	}

	public void setNodeId(Integer nodeId) {
		this.nodeId = nodeId;
	}

	public Integer getIndex() {
		return index;
	}

	public void setIndex(Integer index) {
		this.index = index;
	}

	public String getRettype() {
		return rettype;
	}

	public void setRettype(String rettype) {
		this.rettype = rettype;
	}

}
