package com.wudianyi.wb.scshop.action.admin.json;

import java.util.Date;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Admin;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.entity.Inventory;
import com.wudianyi.wb.scshop.entity.Product;
import com.wudianyi.wb.scshop.entity.SubProduct;
import com.wudianyi.wb.scshop.service.AdminService;
import com.wudianyi.wb.scshop.service.InventoryService;
import com.wudianyi.wb.scshop.service.ProductService;
import com.wudianyi.wb.scshop.service.SubProductService;

public class InventoryAction extends BaseAction {

	private Integer productid;
	private String productName;
	private String sku;
	private String remark;
	private Integer num;
	private Integer surplus;
	private Integer pid;

	@Resource
	private InventoryService inventoryService;
	@Resource
	private SubProductService subProductService;
	@Resource
	private AdminService adminService;

	@Resource
	private ProductService productService;

	public String list() {
		Integer shopid = (Integer) getSession(Const.SESSION_ADMIN_SHOPID);
		QueryParam params = new QueryParam(2).add("shopid", shopid);
		if (pid != null) {
			Product product = productService.get(pid);
			if (product == null) {
				return LIST;
			}
			params.add("upproductid", pid);
			setAttribute("product", product);
		}

		list = inventoryService.getStaticsLikeList("productName,sku", keyword,
				params, null, null, null, Const.BACK_PAGE_SIZE * (pn - 1),
				Const.BACK_PAGE_SIZE, "createDate", "desc");

		return LIST;
	}

	public String totalNum() {

		Integer shopid = (Integer) getSession(Const.SESSION_ADMIN_SHOPID);
		QueryParam params = new QueryParam(2).add("shopid", shopid);
		if (pid != null) {
			Product product = productService.get(pid);
			if (product == null) {
				return LIST;
			}
			params.add("upproductid", pid);
			setAttribute("product", product);
		}
		tn = inventoryService.getLikeTotalCount("productName,sku", keyword,
				null, params, false);

		return ajaxJson("{\"total\":\"" + tn + "\",\"size\":\""
				+ Const.BACK_PAGE_SIZE + "\"}");
	}

	// 根据sku查询商品信息
	public String queryProduct() {
		QueryParam params = new QueryParam(2).add("sku", sku).add("del", 0);
		SubProduct subProduct = subProductService.get(params, false);
		if (subProduct == null) {
			return ajaxJsonErrorMessage("入库失败,没有该商品编号!");
		} else {
			JSONObject obj = new JSONObject();
			obj.put("success", true);
			obj.put("productName", subProduct.getFullName());
			obj.put("surplus", subProduct.getInventory() == null ? 0
					: subProduct.getInventory());
			obj.put("productid", subProduct.getId());
			return ajaxJson(obj.toString());
		}
	}

	// 入库
	public String increase() {
		Integer shopid = (Integer) getSession(Const.SESSION_ADMIN_SHOPID);
		Integer adminid = (Integer) getSession(Const.SESSION_ADMIN_NAME);
		Admin admin = adminService.get(adminid);
		SubProduct subProduct = subProductService.get(productid);
		Inventory inventory = new Inventory();
		inventory.setAdmin(adminid);
		inventory.setAdminName(admin.getName());
		inventory.setProductid(productid);
		inventory.setProductName(productName);
		inventory.setStorageType(0);
		inventory.setIncrement(num);
		inventory.setSku(sku);
		inventory.setUpproductid(subProduct.getProductid());
		inventory.setRemark(remark);
		inventory.setSurplus(surplus == null ? 0 : surplus
				+ (num == null ? 0 : num));
		inventory.setShopid(shopid);
		inventory.setCreateDate(new Date().getTime());
		inventoryService.save(inventory);

		subProduct.setInventory(inventory.getSurplus());
		subProductService.update(subProduct);

		return ajaxJsonSuccessMessage("inventory!list.action");
	}

	// 出库
	public String decrease() {

		if (surplus - num < 0) {
			return ajaxJsonErrorMessage("出库失败,库存不足！");
		}
		Integer shopid = (Integer) getSession(Const.SESSION_ADMIN_SHOPID);
		Integer adminid = (Integer) getSession(Const.SESSION_ADMIN_NAME);
		Admin admin = adminService.get(adminid);
		SubProduct subProduct = subProductService.get(productid);
		Inventory inventory = new Inventory();
		inventory.setAdmin(adminid);
		inventory.setAdminName(admin.getName());
		inventory.setProductid(productid);
		inventory.setProductName(productName);
		inventory.setStorageType(1);
		inventory.setUpproductid(subProduct.getProductid());
		inventory.setDecrement(num);
		inventory.setSku(sku);
		inventory.setRemark(remark);
		inventory.setSurplus(surplus == null ? 0 : surplus
				- (num == null ? 0 : num));
		inventory.setShopid(shopid);
		inventory.setCreateDate(new Date().getTime());
		inventoryService.save(inventory);

		subProduct.setInventory(inventory.getSurplus());
		subProductService.update(subProduct);

		return ajaxJsonSuccessMessage("inventory!list.action");
	}

	public String getSku() {
		return sku;
	}

	public void setSku(String sku) {
		this.sku = sku;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public InventoryService getInventoryService() {
		return inventoryService;
	}

	public void setInventoryService(InventoryService inventoryService) {
		this.inventoryService = inventoryService;
	}

	public Integer getSurplus() {
		return surplus;
	}

	public void setSurplus(Integer surplus) {
		this.surplus = surplus;
	}

	public Integer getProductid() {
		return productid;
	}

	public void setProductid(Integer productid) {
		this.productid = productid;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

}
