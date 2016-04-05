package com.wudianyi.wb.scshop.action.json;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.entity.Customer;
import com.wudianyi.wb.scshop.entity.Product;
import com.wudianyi.wb.scshop.entity.SubProduct;
import com.wudianyi.wb.scshop.service.CustomerService;
import com.wudianyi.wb.scshop.service.OrderService;
import com.wudianyi.wb.scshop.service.ProductService;
import com.wudianyi.wb.scshop.service.SubProductService;

public class ProductAction extends BaseAction {

	@Resource
	private ProductService productService;
	@Resource
	private CustomerService customerService;
	@Resource
	private SubProductService subProductService;
	@Resource
	private OrderService orderService;

	private String orderField;
	private String orderType;
	private Integer brandid;
	private Integer countryid;
	private Integer categoryid;
	private Integer id;// 一级规格id
	private Integer productid;// 商品id

	public String list() {

		// 如果查询关键字为空，则不设置查询字段，否则默认为name,,skus
		String fieldName = "name,skus";
		if (keyword == null) {
			fieldName = null;
		}

		// 默认的排序方式
		if (orderField == null || "".equals(orderField)) {
			orderField = "displayOrder";
		}
		// 除了价格有升序外，其他字段都以降序查询
		if (!"bottomPrice".equals(orderField)) {
			orderType = "desc";
		}

		QueryParam params = new QueryParam(5).add("del", 0)
				.add("brandid", brandid).add("slevel", categoryid)
				.add("countryid", countryid).add("stat", 0);
		List<Product> list = productService.getStaticsLikeList(fieldName,
				keyword, params, null, null, null, Const.FRONT_PAGE_SIZE
						* (pn - 1), Const.FRONT_PAGE_SIZE, orderField,
				orderType);

		setAttribute("list", list);
		return LIST;
	}

	public String choice() {
		List<SubProduct> subList = null;
		Product product;
		if (productid != null) {
			QueryParam params = new QueryParam(3).add("productid", productid)
					.add("nodeid", 0).add("del",0);
			subList = subProductService
					.getList(params, 0, 0, null, null, false);
			product = productService.get(productid);
		} else {
			SubProduct subProduct = subProductService.get(id);
			Set<SubProduct> downList = subProduct.getDownList();
			subList = new ArrayList<SubProduct>(downList);
			product = productService.get(subProduct.getProductid());
		}

		Customer customer = null;
		Object session = getSession(Const.SESSION_CUSTOMER_ID);
		if (session != null) {
			customer = customerService.get((Integer) session);
		}

		JSONArray ary = new JSONArray();
		JSONObject obj = new JSONObject();
		boolean isactive = false;
		int beforenum = 0;
		int prolimitnum = 1;

		// 看有没有在促销活动的
		if (product.getProductType() != null
				&& !product.getProductType().equals(0)) {
			System.err.println("product.getProlimintnum()===="+product.getProlimintnum());
			Date now = new Date();
			if (product.getProductType().equals(1)) {
				if (product.getBeginTime() <= now.getTime()) {
					isactive = true;
				}
			} else if (product.getProductType().equals(2)) {
				if (product.getBeginTime() <= now.getTime()
						&& product.getEndTime() > now.getTime()) {
					isactive = true;
				}
			}

			if (isactive && customer != null) {// 登录的要看是不是已经购买过了
				beforenum = orderService.isUserJoinPromotions(customer.getId(),
						product.getId());
				System.err.println("beforenumbeforenum++++"+beforenum);
				prolimitnum = (product.getProlimintnum() == null ? 1 : product
						.getProlimintnum());
				System.err.println("prolimitnum==========+"+prolimitnum);
				if (beforenum < prolimitnum) {
					isactive = true;
				}else {
					isactive = false;
				}
			}
		}
		for (SubProduct sub : subList) {
			obj.put("id", sub.getId());
			obj.put("name", sub.getName());
			obj.put("pic", sub.getLogo());
			System.err.println("+==================prolimitnum=="+prolimitnum);

			if (isactive && sub.getSeckillNum() != null
					&& sub.getSeckillNum() > 0) {
				obj.put("active", product.getProductType());
				obj.put("inventory", sub.getSeckillNum());
				obj.put("price",
						sub.getSeckillPrice() == null ? 0 : sub
								.getSeckillPrice());
				obj.put("min", 1);
				obj.put("max", prolimitnum - beforenum);
			} else {
				boolean hasActiveDown = false;
				if (isactive && sub.getNodeid() == 0) {
					Set<SubProduct> downList = sub.getDownList();
					for (SubProduct down : downList) {
						if (down.getSeckillNum() != null
								&& down.getSeckillNum() > 0) {
							hasActiveDown = true;
							break;
						}
					}
					if (hasActiveDown) {
						obj.put("active", product.getProductType());
						obj.put("inventory", sub.getSeckillNum());
						obj.put("price", sub.getSeckillPrice() == null ? 0
								: sub.getSeckillPrice());
						obj.put("min", 1);
						obj.put("max", 1);
					}
				}
				if (!hasActiveDown) {
					obj.put("active", 0);
					obj.put("inventory", sub.getInventory());
					obj.put("min",
							sub.getMinPurchaseQuantity() > 0 ? sub
									.getMinPurchaseQuantity() : 1);
					obj.put("max",
							sub.getMaxPurchaseQuantity() > 0 ? sub
									.getMaxPurchaseQuantity() : sub
									.getInventory());
					if (customer == null) {
						obj.put("price", sub.getPrice());
					} else {
						double price = subProductService.getUserPriceByProduct(
								sub, customer);
						obj.put("price", price);
					}
				}

			}
			System.out.println("isactive=====>" + isactive);
			ary.add(obj);
		}
		return ajaxJson(ary.toString());
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

	public Integer getBrandid() {
		return brandid;
	}

	public void setBrandid(Integer brandid) {
		this.brandid = brandid;
	}

	public Integer getCategoryid() {
		return categoryid;
	}

	public void setCategoryid(Integer categoryid) {
		this.categoryid = categoryid;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getProductid() {
		return productid;
	}

	public void setProductid(Integer productid) {
		this.productid = productid;
	}

	public Integer getCountryid() {
		return countryid;
	}

	public void setCountryid(Integer countryid) {
		this.countryid = countryid;
	}

}
