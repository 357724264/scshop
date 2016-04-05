package com.wudianyi.wb.scshop.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Address;
import com.wudianyi.wb.scshop.entity.Brand;
import com.wudianyi.wb.scshop.entity.Comment;
import com.wudianyi.wb.scshop.entity.Customer;
import com.wudianyi.wb.scshop.entity.Inventory;
import com.wudianyi.wb.scshop.entity.Jflog;
import com.wudianyi.wb.scshop.entity.Order;
import com.wudianyi.wb.scshop.entity.OrderItem;
import com.wudianyi.wb.scshop.entity.Product;
import com.wudianyi.wb.scshop.entity.SubProduct;
import com.wudianyi.wb.scshop.service.AddressService;
import com.wudianyi.wb.scshop.service.BrandService;
import com.wudianyi.wb.scshop.service.CommentService;
import com.wudianyi.wb.scshop.service.CustomerService;
import com.wudianyi.wb.scshop.service.InventoryService;
import com.wudianyi.wb.scshop.service.JflogService;
import com.wudianyi.wb.scshop.service.MailService;
import com.wudianyi.wb.scshop.service.OrderItemService;
import com.wudianyi.wb.scshop.service.OrderService;
import com.wudianyi.wb.scshop.service.ProductService;
import com.wudianyi.wb.scshop.service.SubProductService;
import com.wudianyi.wb.scshop.service.UserCouponService;
import com.wudianyi.wb.scshop.util.PinyinUtil;
import com.wudianyi.wb.scshop.util.StringUtils;

public class TestAction extends BaseAction {
	class PointAndNum {
		public int point;
		public int good;
		public int middle;
		public int bad;
	}

	@Resource
	private MailService mailService;
	@Resource
	private ProductService productService;
	private String hh;
	// @Resource
	// private TestService testService;

	@Resource
	private BrandService brandService;

	@Resource
	private OrderService orderService;

	@Resource
	private OrderItemService orderItemService;

	@Resource
	private UserCouponService userCouponService;
	@Resource
	private CommentService commentService;

	// @Resource(name = "orderQuartService")
	// private OrderQuartService orderQuartService;
	@Resource
	private CustomerService customerService;
	@Resource
	private AddressService addressService;
	@Resource
	private InventoryService inventoryService;
	@Resource
	private SubProductService subProductService;
	@Resource
	private JflogService jflogService;

	@Override
	public String execute() throws Exception {
		List<Customer> list = customerService.getAll(null, null, false);
		for (Customer customer : list) {
			List<Jflog> logs = jflogService.getList(
					new QueryParam(1).add("userid", customer.getId()), 0, 0,
					null, null, false);
			if (logs == null || logs.isEmpty()) {
				continue;
			}
			int point = 0;
			for (Jflog jflog : logs) {
				if (jflog.getThein() == 0) {
					point = point - jflog.getPoint();
				} else if (jflog.getThein() == 1) {
					point = point + jflog.getPoint();
				}
			}
			customer.setPoint(point);
			customerService.update(customer);
			System.err.println(customer.getId() + "  success!!");
		}
		System.err.println("all  success!!");
		return null;

	}

	public String getHh() {
		return hh;
	}

	public void setHh(String hh) {
		this.hh = hh;
	}

}
