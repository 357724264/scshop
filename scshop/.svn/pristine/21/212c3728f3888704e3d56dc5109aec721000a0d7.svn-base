package com.wudianyi.wb.scshop.action.json;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.entity.Product;
import com.wudianyi.wb.scshop.service.CouponService;
import com.wudianyi.wb.scshop.service.ProductService;
import com.wudianyi.wb.scshop.util.StringUtils;

public class ShopAction extends BaseAction {

	@Resource
	private ProductService productService;
	private int id;//店铺id
	private String orderField;
	private String orderType;
	private Integer fl;
	private Integer sl;
	private int pn;
	private String tt;

	@Resource
	private CouponService couponService;

	public String coupons() {
		QueryParam param = new QueryParam(4).add("shopid", id).add("tt", 0)
				.add("del", 0).add("stat", 0);
		list = couponService.getStaticsLikeList(null, null, param, "endDate",
				new Date().getTime(), null, Const.FRONT_PAGE_SIZE * (pn - 1),
				Const.FRONT_PAGE_SIZE, "createDate", "desc");
		return "coupons";
	}

	public String product() {
		// 如果查询关键字为空，则不设置查询字段，否则默认为name
		String fieldName = "name";
		if (keyword == null) {
			fieldName = null;
		}

		// 默认的排序方式
		if (orderField == null || "".equals(orderField)) {
			orderField = "displayOrder";
		}
		// 除了价格有升序外，其他字段都以降序查询
//		if (!"bottomPrice".equals(orderField)) {
//			orderType = "desc";
//		}
		System.out.println(keyword);
		System.out.println(orderType + "," + orderField);
		if (StringUtils.isEmpty(tt)) {
			QueryParam params = new QueryParam(5).add("shopid",id).add("del", 0)
					.add("shopFlevel", fl).add("shopSlevel", sl).add("stat", 0);
			list = productService.getStaticsLikeList(fieldName, keyword,
					params, null, null, null, Const.FRONT_PAGE_SIZE * (pn - 1),
					Const.FRONT_PAGE_SIZE, orderField, orderType);
		} else if (tt.equals("new")) {
			System.err.println("orderField=="+orderField);
			Calendar calendar = Calendar.getInstance();
			calendar.add(Calendar.DATE, -7);
			list = productService.getStaticsLikeList(
					fieldName,
					keyword,
					new QueryParam(4).add("shopid",id).add("shopid", id).add("del", 0)
							.add("stat", 0), "modifydate",
					calendar.getTimeInMillis(), null, Const.FRONT_PAGE_SIZE
							* (pn - 1), Const.FRONT_PAGE_SIZE, orderField,
					orderType);
		} else if (tt.equals("pro")) {
			list = productService.getPromotionalList(id, Const.FRONT_PAGE_SIZE
					* (pn - 1), Const.FRONT_PAGE_SIZE);
		}

		return "product";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getOrderField() {
		return orderField;
	}

	public void setOrderField(String orderField) {
		this.orderField = orderField;
	}

	public String getOrderType() {
		return orderType;
	}

	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}

	public Integer getFl() {
		return fl;
	}

	public void setFl(Integer fl) {
		this.fl = fl;
	}

	public Integer getSl() {
		return sl;
	}

	public void setSl(Integer sl) {
		this.sl = sl;
	}

	public int getPn() {
		return pn;
	}

	public void setPn(int pn) {
		this.pn = pn;
	}

	public String getTt() {
		return tt;
	}

	public void setTt(String tt) {
		this.tt = tt;
	}

}
