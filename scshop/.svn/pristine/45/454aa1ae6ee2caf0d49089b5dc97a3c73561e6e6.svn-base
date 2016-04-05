package com.wudianyi.wb.scshop.action.admin.json;

import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Admin;
import com.wudianyi.wb.scshop.entity.Brand;
import com.wudianyi.wb.scshop.entity.Category;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.entity.Coupon;
import com.wudianyi.wb.scshop.entity.Shop;
import com.wudianyi.wb.scshop.service.AdminService;
import com.wudianyi.wb.scshop.service.BrandService;
import com.wudianyi.wb.scshop.service.CategoryService;
import com.wudianyi.wb.scshop.service.CouponService;
import com.wudianyi.wb.scshop.service.ShopService;

public class CouponAction extends BaseAction {

	@Resource
	private CouponService couponService;
	@Resource
	private CategoryService categoryService;
	@Resource
	private BrandService brandService;
	@Resource
	private AdminService adminService;
	@Resource
	private ShopService shopService;

	private String batchCid;
	private String cover;
	private String name;
	private String title;
	private int num;
	private String endtime;
	private int day;
	private double limit;
	private double money;
	private int range;
	private Integer flevel;
	private Integer slevel;
	private Integer brandid;
	private String content;
	private int stat;
	private int tt;
	private int timeout;
	private String cid;
	private int full;
	private Integer erange;
	private Integer eslevel;
	private Integer eflevel;
	private Integer ebrandid;
	private Double elimit;

	private static SimpleDateFormat sdf = new SimpleDateFormat(
			"yyyy-MM-dd HH:mm:ss");

	// 商品列表
	public String list() {
		Integer shopid = (Integer) getSession(Const.SESSION_ADMIN_SHOPID);
		QueryParam params = new QueryParam(2).add("del", 0).add("shopid",
				shopid);
		List<Coupon> list = couponService
				.getStaticsLikeList("name,title", keyword, params, null, null,
						null, Const.FRONT_PAGE_SIZE * (pn - 1),
						Const.FRONT_PAGE_SIZE, "createDate", "desc");
		JSONArray jsonAry = new JSONArray();
		for (Coupon coupon : list) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("cid", coupon.getId());
			jsonObject.put("name", coupon.getName());
			jsonObject.put("num", coupon.getLeftnum() + "/" + coupon.getNum());
			jsonObject.put("stop", coupon.getTt() == 0 ? "正常" : "停止领取");
			jsonObject.put("desc", coupon.getDesc());
			jsonObject.put("createDate",
					sdf.format(new Date(coupon.getCreateDate())));
			jsonAry.add(jsonObject);
		}
		return ajaxJson(jsonAry.toString());

	}

	// 返回总条数
	public String totalNum() {
		Integer shopid = (Integer) getSession(Const.SESSION_ADMIN_SHOPID);
		QueryParam params = new QueryParam(2).add("del", 0).add("shopid",
				shopid);
		tn = couponService.getLikeTotalCount("name,title", keyword, null,
				params, false);

		return ajaxJson("{\"total\":\"" + tn + "\",\"size\":\""
				+ Const.FRONT_PAGE_SIZE + "\"}");
	}

	public String save() throws ParseException {
		Integer shopid = (Integer) getSession(Const.SESSION_ADMIN_SHOPID);
		Integer adminid = (Integer) getSession(Const.SESSION_ADMIN_NAME);
		Admin admin = adminService.get(adminid);
		Coupon coupon = new Coupon();
		coupon.setContent(content);
		coupon.setCreateDate(new Date().getTime());
		coupon.setDay(day);
		coupon.setDel(0);
		if (timeout == 1) {
			coupon.setEndDate(Coupon.FOREVERY_TIME);
		} else {
			coupon.setEndDate(sdf.parse(endtime).getTime());
		}

		String favourableid = "0";
		String favourablename = "";
		if (range == 2) {// 分类

			if (flevel != null) {
				Category category = categoryService.get(flevel);
				favourablename = category.getName();
				favourableid = flevel + "";
			}
			if (slevel != null && slevel.intValue() != 0) {
				Category category = categoryService.get(slevel);
				favourablename = favourablename + "|" + category.getName();
				favourableid = slevel + "";
			} else {
				favourablename = favourablename + "|全部";
			}
		} else if (range == 1) {
			if (brandid != null) {
				Brand brand = brandService.get(brandid);
				favourableid = brandid + "";
				favourablename = brand.getName();
			}
		}
		coupon.setFavourableid(favourableid);
		coupon.setFavourablename(favourablename);
		coupon.setLeftnum(num);
		coupon.setLimitmoney(limit);
		coupon.setMoney(money);
		coupon.setName(name);
		coupon.setNum(num);
		coupon.setPic(cover);

		coupon.setStat(stat);
		coupon.setTitle(title);
		if (admin.getPermission() == 0) {
			coupon.setTt(1);
		} else {
			coupon.setShopid(shopid);
			Shop shop = shopService.get(shopid);
			coupon.setShopname(shop.getName());
			coupon.setTt(0);
		}
		coupon.setUserange(range);
		coupon.setHowtoget(full);
		// 是否满送的
		if (full == 1 && erange != null) {
			coupon.setBrandorclass(erange);
			if (erange == 0) {
				Brand ebrand = brandService.get(ebrandid);
				coupon.setWhichEnoughid(ebrandid + "");
				coupon.setWhichEnoughName(ebrand.getName());
			} else if (erange == 1) {

				if (eflevel != null) {
					Category category = categoryService.get(eflevel);
					favourablename = category.getName();
					favourableid = eflevel + "";
				}
				if (eslevel != null && eslevel.intValue() != 0) {
					Category category = categoryService.get(eslevel);
					favourablename = favourablename + "|" + category.getName();
					favourableid = eslevel + "";
				} else {
					favourablename = favourablename + "|全部";
				}

				coupon.setWhichEnoughid(favourableid + "");
				coupon.setWhichEnoughName(favourablename);
			}
			coupon.setEnoughMoney(elimit);
		}

		couponService.save(coupon);

		return ajaxJsonSuccessMessage("coupon!list.action");
	}

	public String update() {
		Coupon coupon = couponService.get(cid);
		coupon.setContent(content);
		couponService.update(coupon);
		return ajaxJsonSuccessMessage("coupon!list.action");
	}

	public String stop() {
		Integer shopid = (Integer) getSession(Const.SESSION_ADMIN_SHOPID);
		Coupon coupon = couponService.get(cid);
		if (coupon != null && coupon.getShopid().equals(shopid)) {
			if (coupon.getTt() == 0) {
				coupon.setTt(1);
			} else {
				coupon.setTt(0);
			}
			couponService.update(coupon);
		}
		return ajaxJsonSuccessMessage(coupon.getTt() + "");
	}

	/*
	 * 批量删除品牌招商内容
	 */
	public String deleteAll() throws IllegalAccessException,
			InvocationTargetException, NoSuchMethodException {
		Integer shopid = (Integer) getSession(Const.SESSION_ADMIN_SHOPID);
		if (batchCid != null && batchCid != "") {
			batchCid = batchCid.substring(0, batchCid.length() - 1);
			String[] cidList = batchCid.split(",");
			for (String contentId : cidList) {
				System.err.println(contentId);
				Coupon coupon = couponService.get(contentId);
				if (coupon != null && coupon.getShopid() == shopid) {
					coupon.setDel(1);
					couponService.update(coupon);
				}
			}
		}
		return ajaxHtml("couponsuccess");
	}

	public String delete() {
		Integer shopid = (Integer) getSession(Const.SESSION_ADMIN_SHOPID);

		Coupon coupon = couponService.get(cid);
		System.err.println("coupon.getShopid()===" + coupon.getShopid());
		if (coupon != null && coupon.getShopid().equals(shopid)) {
			coupon.setDel(1);
			couponService.update(coupon);
		}
		return ajaxHtml("success");
	}

	public String changenum() {
		Integer shopid = (Integer) getSession(Const.SESSION_ADMIN_SHOPID);
		Coupon coupon = couponService.get(cid);
		if (coupon != null && coupon.getShopid().equals(shopid)) {
			int after = 0;
			int afterall = 0;
			if (tt == -1) {
				after = coupon.getLeftnum() - num;
				afterall = coupon.getNum() - num;
			} else if (tt == 1) {
				after = coupon.getLeftnum() + num;
				afterall = coupon.getNum() + num;
			}
			coupon.setLeftnum(after > 0 ? after : 0);
			coupon.setNum(afterall > 0 ? afterall : 0);
			couponService.update(coupon);
		}
		return ajaxJsonSuccessMessage(null);
	}

	public CouponService getCouponService() {
		return couponService;
	}

	public void setCouponService(CouponService couponService) {
		this.couponService = couponService;
	}

	public String getCover() {
		return cover;
	}

	public void setCover(String cover) {
		this.cover = cover;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getEndtime() {
		return endtime;
	}

	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}

	public double getLimit() {
		return limit;
	}

	public void setLimit(double limit) {
		this.limit = limit;
	}

	public double getMoney() {
		return money;
	}

	public void setMoney(double money) {
		this.money = money;
	}

	public int getRange() {
		return range;
	}

	public void setRange(int range) {
		this.range = range;
	}

	public Integer getFlevel() {
		return flevel;
	}

	public void setFlevel(Integer flevel) {
		this.flevel = flevel;
	}

	public Integer getSlevel() {
		return slevel;
	}

	public void setSlevel(Integer slevel) {
		this.slevel = slevel;
	}

	public Integer getBrandid() {
		return brandid;
	}

	public void setBrandid(Integer brandid) {
		this.brandid = brandid;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getStat() {
		return stat;
	}

	public void setStat(int stat) {
		this.stat = stat;
	}

	public int getTt() {
		return tt;
	}

	public void setTt(int tt) {
		this.tt = tt;
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public int getTimeout() {
		return timeout;
	}

	public void setTimeout(int timeout) {
		this.timeout = timeout;
	}

	public String getBatchCid() {
		return batchCid;
	}

	public void setBatchCid(String batchCid) {
		this.batchCid = batchCid;
	}

	public CategoryService getCategoryService() {
		return categoryService;
	}

	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}

	public BrandService getBrandService() {
		return brandService;
	}

	public void setBrandService(BrandService brandService) {
		this.brandService = brandService;
	}

	public AdminService getAdminService() {
		return adminService;
	}

	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}

	public int getFull() {
		return full;
	}

	public void setFull(int full) {
		this.full = full;
	}

	public Integer getErange() {
		return erange;
	}

	public void setErange(Integer erange) {
		this.erange = erange;
	}

	public Integer getEslevel() {
		return eslevel;
	}

	public void setEslevel(Integer eslevel) {
		this.eslevel = eslevel;
	}

	public Integer getEflevel() {
		return eflevel;
	}

	public void setEflevel(Integer eflevel) {
		this.eflevel = eflevel;
	}

	public Integer getEbrandid() {
		return ebrandid;
	}

	public void setEbrandid(Integer ebrandid) {
		this.ebrandid = ebrandid;
	}

	public Double getElimit() {
		return elimit;
	}

	public void setElimit(Double elimit) {
		this.elimit = elimit;
	}

}
