package com.wudianyi.wb.scshop.action.admin;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.convention.annotation.ParentPackage;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Admin;
import com.wudianyi.wb.scshop.entity.Agent;
import com.wudianyi.wb.scshop.entity.Brand;
import com.wudianyi.wb.scshop.entity.Category;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.entity.Country;
import com.wudianyi.wb.scshop.entity.Inventory;
import com.wudianyi.wb.scshop.entity.Product;
import com.wudianyi.wb.scshop.entity.SeckillProduct;
import com.wudianyi.wb.scshop.entity.Shop;
import com.wudianyi.wb.scshop.entity.SubProduct;
import com.wudianyi.wb.scshop.service.AdminService;
import com.wudianyi.wb.scshop.service.AgentService;
import com.wudianyi.wb.scshop.service.BrandService;
import com.wudianyi.wb.scshop.service.CategoryService;
import com.wudianyi.wb.scshop.service.CountryService;
import com.wudianyi.wb.scshop.service.InventoryService;
import com.wudianyi.wb.scshop.service.ProductService;
import com.wudianyi.wb.scshop.service.SeckillProductService;
import com.wudianyi.wb.scshop.service.ShopService;
import com.wudianyi.wb.scshop.service.SubProductService;
import com.wudianyi.wb.scshop.util.StringUtils;

@ParentPackage("admin")
public class ProductAction extends BaseAction {

	@Resource
	private ProductService productService;
	@Resource
	private CategoryService categoryService;
	@Resource
	private BrandService brandService;
	@Resource
	private AgentService agentService;
	@Resource
	private CountryService countryService;
	@Resource
	private ShopService shopService;
	@Resource
	private SubProductService subProductService;
	@Resource
	private InventoryService inventoryService;
	@Resource
	private AdminService adminService;

	private Integer cid;
	private Integer nodeId;
	private String name;
	private Integer stat; // 0表示上架 1表示下架
	private String pic; // 图片集
	private String cover; // 封面
	private Integer brandid; // 品牌id
	private String brandName; // 品牌名字
	private String intro;// 简介
	private String content; // 详细描述
	private String weight; // 重量
	private String volumn; // 体积
	private Integer displayOrder; // 用于排序
	private Double freight; // 运费
	private Integer hotSale; // 是否热销 0否 1是
	private Integer countryid;// 国家id
	private String unit; // 单位
	private Double indicativePrice; // 参考价格
	private String firstSpecName; // 一级规格名称
	private String secondSpecName; // 二级规格名称
	private String firstSpecStr;// 一级规格商品的json字符串
	private String secondSpecStr;// 二级规格商品的json字符串
	private Integer flevel;// 一级分类id
	private Integer slevel;// 二级分类id
	private Integer shopFlevel;// 商家一级分类id
	private Integer shopSlevel;// 商家二级分类id
	private Integer shopHotSale;// 是否店内热销

	public String list() {

		QueryParam params = new QueryParam(1).add("del", 0);
		List<Country> countryList = countryService.getList(params, 0, 0,
				"displayOrder", "desc", false);
		List<Brand> brandList = brandService.getList(params, 0, 0, "pinyin",
				"asc", true);

		params = new QueryParam().add("del", 0).add("nodeid", 0);
		Integer permission = (Integer) getSession(Const.SESSION_ADMIN_PERMISSION);
		// 如果为管理员
		if (permission != null && permission == 0) {
			params.add("categoryType", 0);
		} else {
			Integer shopid = (Integer) getSession(Const.SESSION_ADMIN_SHOPID);
			params.add("shopid", shopid);
			params.add("categoryType", 1);
		}

		List<Category> flevelList = categoryService.getList(params, 0, 0,
				"displayOrder", "desc", false);
		// 查询出一级分类
		setAttribute("flevelList", flevelList);
		setAttribute("countryList", countryList);
		setAttribute("brandList", brandList);
		setAttribute("permission", permission);
		return LIST;
	}

	// 创建或编辑商品
	public String contentProduct() {
		// 如果有cid，则说明是编辑，取出对应的商品数据
		Product product = new Product();
		if (cid != null) {
			product = productService.get(cid);
		}
		// //解析agentPriceTable字符串，并显示在页面
		List<Agent> agentList = agentService.getAll(null, null, false);

		QueryParam params = new QueryParam(3).add("productid", product.getId())
				.add("nodeid", 0).add("del", 0);
		List<SubProduct> subProductList = subProductService.getList(params, 0,
				0, null, null, false);

		Integer shopid = (Integer) getSession(Const.SESSION_ADMIN_SHOPID);
		Integer permission = (Integer) getSession(Const.SESSION_ADMIN_PERMISSION);

		// 查询出所有一级分类
		params = new QueryParam(3).add("del", 0).add("nodeid", 0)
				.add("categoryType", 0);
		List<Category> flevelList = categoryService.getList(params, 0, 0,
				"displayOrder", "desc", false);
		if (permission == 1) {
			params = new QueryParam(4).add("del", 0).add("nodeid", 0)
					.add("shopid", shopid).add("categoryType", 1);
			List<Category> shopFlevelList = categoryService.getList(params, 0,
					0, "displayOrder", "desc", false);
			setAttribute("shopFlevelList", shopFlevelList);
		}

		// 查询出所有未被删除的品牌
		params = new QueryParam(1).add("del", 0);
		List<Brand> brandList = brandService.getList(params, 0, 0, "pinyin",
				"asc", false);
		List<Country> countryList = countryService.getList(params, 0, 0,
				"displayOrder", "desc", false);
		setAttribute("countryList", countryList);
		setAttribute("agentList", agentList);
		setAttribute("brandList", brandList);
		setAttribute("product", product);
		setAttribute("subProductList", subProductList);
		setAttribute("flevelList", flevelList);
		setAttribute("permission", permission);
		return INPUT;
	}

	// 插入或更新
	public String addContent() {

		Double topPrice = null;
		Double bottomPrice = null;
		double price = 0;
		Product product = new Product();
		boolean isUpdate = false;
		if (cid != null && cid != 0) {
			product = productService.get(cid);
			isUpdate = true;
			product.setShopid(product.getShopid());
			product.setShopName(product.getShopName());
		}else {
			int shopid = (Integer) getSession(Const.SESSION_ADMIN_SHOPID);
			Shop shop = shopService.get(shopid);
			product.setShopid(shopid);
			product.setShopName(shop.getName());
		}
		product.setFlevel(flevel);
		product.setSlevel(slevel);
		Integer permission = (Integer) getSession(Const.SESSION_ADMIN_PERMISSION);
		if (permission == 1) {
			product.setShopFlevel(shopFlevel);
			product.setShopSlevel(shopSlevel);
		}
		product.setName(name);
		product.setVolumn(volumn);
		product.setWeight(weight);
		product.setStat(stat);
		product.setDisplayOrder(displayOrder);
		product.setCover(cover);
		product.setPics(pic);
		product.setHtmlDesc(content);
		product.setIntro(intro);
		product.setDel(0);
		product.setFreight(freight);
		if(permission == 0) {
			product.setHotSale(hotSale == null ? 0 : hotSale);
		}else {
			product.setShopHotSale(shopHotSale == null ? 0 : shopHotSale);
		}
		product.setUnit(unit);
		product.setFirstSpecName(firstSpecName);
		product.setSecondSpecName(secondSpecName);
		product.setIndicativePrice(indicativePrice);
		product.setBrandid(brandid);
		if (brandid != null && brandid > 0) {
			product.setBrandName(brandName);
		} else {
			product.setBrandName(null);
		}
		System.out.println("countryid == " + countryid);

		if (countryid != null) {
			Country country = countryService.get(countryid);
			product.setCountryid(country.getId());
			product.setCountryIcon(country.getFlagIcon());
			product.setCountry(country.getName());
		}
		if (isUpdate) {
			productService.update(product);
		} else {
			cid = productService.save(product);
		}
		String skus = "";
		int inventory = 0;
		// 用于判定是否需要更新库存
		if (!StringUtils.isEmpty(firstSpecStr)) {

			JSONObject obj = null;
			SubProduct subProduct = null;
			String fid = "";

			Map<String, SubProduct> entityMap = new HashMap<String, SubProduct>();
			JSONArray ary = JSONArray.fromObject(firstSpecStr);
			for (Object object : ary) {
				isUpdate = false;
				obj = JSONObject.fromObject(object);
				fid = obj.getString("id");
				if (fid.startsWith("new")) {
					subProduct = new SubProduct();
					subProduct.setNodeid(0);
					subProduct.setDel(0);
					subProduct.setProductid(cid);
				} else {
					subProduct = subProductService.get(Integer.parseInt(fid));
					isUpdate = true;
				}

				price = obj.getDouble("price");
				subProduct.setPrice(price);
				// 设置最高与最低价格
				if (topPrice == null || price > topPrice) {
					topPrice = price;
				}
				if (bottomPrice == null || price < bottomPrice) {
					bottomPrice = price;
				}
				subProduct.setLogo(isEmpty(obj.get("pic")) ? "" : obj
						.getString("pic"));
				if (!isEmpty(obj.get("sku"))) {
					subProduct.setSku(obj.getString("sku"));
					skus += obj.getString("sku");
				}
				subProduct.setAgentPriceTable(isEmpty(obj.get("agentStr")) ? ""
						: obj.getString("agentStr"));
				subProduct.setName(isEmpty(obj.get("name")) ? "" : obj
						.getString("name"));
				subProduct.setFullName(product.getName() + " "
						+ subProduct.getName());
				subProduct.setMinPurchaseQuantity(isEmpty(obj
						.get("minPurchaseQuantity")) ? 0 : obj
						.getInt("minPurchaseQuantity"));
				subProduct.setMaxPurchaseQuantity(isEmpty(obj
						.get("maxPurchaseQuantity")) ? 0 : obj
						.getInt("maxPurchaseQuantity"));
				
				if (isUpdate) {
					subProduct.setShopid(subProduct.getShopid());
					subProductService.update(subProduct);
				} else {
					product.setModifydate(new Date().getTime());
					int shopid = (Integer) getSession(Const.SESSION_ADMIN_SHOPID);
					subProduct.setShopid(shopid);
					// 如果初始库存不为空，则新增库存记录
					inventory = isEmpty(obj.get("inventory")) ? 0 : obj
							.getInt("inventory");
					subProduct.setInventory(inventory);
					subProductService.save(subProduct);
					if (inventory != 0) {
						createInventory(subProduct, inventory, shopid);
					}
				}

				entityMap.put(fid, subProduct);
			}
			// 设置二级规格产品的信息
			if (!StringUtils.isEmpty(secondSpecStr)) {
				ary = JSONArray.fromObject(secondSpecStr);
				String sid = "";
				String pid = "";
				for (Object object : ary) {
					isUpdate = false;
					obj = JSONObject.fromObject(object);
					sid = obj.getString("id");
					pid = obj.getString("parentid");
					if (sid.startsWith("new")) {
						subProduct = new SubProduct();
						subProduct.setNodeid(1);
						subProduct.setDel(0);
						subProduct.setProductid(cid);
						SubProduct parentProduct = entityMap.get(pid);
						subProduct.setSubProduct(parentProduct);
					} else {
						subProduct = subProductService.get(Integer
								.parseInt(sid));
						isUpdate = true;
					}

					subProduct.setPrice(price);
					price = isEmpty(obj.get("price")) ? 0.00 : obj
							.getDouble("price");
					subProduct.setPrice(price);
					if (topPrice == null || price > topPrice) {
						topPrice = price;
					}
					if (bottomPrice == null || price < bottomPrice) {
						bottomPrice = price;
					}

					subProduct.setLogo(isEmpty(obj.get("pic")) ? "" : obj
							.getString("pic"));
					if (!isEmpty(obj.get("sku"))) {
						subProduct.setSku(obj.getString("sku"));
						skus += obj.getString("sku");
					}

					subProduct
							.setAgentPriceTable(isEmpty(obj.get("agentStr")) ? ""
									: obj.getString("agentStr"));
					subProduct.setName(isEmpty(obj.get("name")) ? "" : obj
							.getString("name"));
					subProduct.setFullName(subProduct.getSubProduct()
							.getFullName() + " " + subProduct.getName());
					subProduct.setMinPurchaseQuantity(isEmpty(obj
							.get("minPurchaseQuantity")) ? 0 : obj
							.getInt("minPurchaseQuantity"));
					subProduct.setMaxPurchaseQuantity(isEmpty(obj
							.get("maxPurchaseQuantity")) ? 0 : obj
							.getInt("maxPurchaseQuantity"));
					if (isUpdate) {
						subProduct.setShopid(subProduct.getShopid());
						subProductService.update(subProduct);
					} else {
						int shopid = (Integer) getSession(Const.SESSION_ADMIN_SHOPID);
						subProduct.setShopid(shopid);
						// 如果初始库存不为空，则新增库存记录
						inventory = isEmpty(obj.get("inventory")) ? 0 : obj
								.getInt("inventory");
						subProduct.setInventory(inventory);
						subProductService.save(subProduct);
						if (inventory != 0) {
							createInventory(subProduct, inventory, shopid);
						}
					}
				}

			}
		}

		product.setTopPrice(topPrice);
		product.setBottomPrice(bottomPrice);
		product.setSkus(skus);
		productService.update(product);
		return ajaxJson("{\"success\":true,\"url\":\"product!list.action\"}");
	}

	// 设置库存
	private void createInventory(SubProduct subProduct, Integer increment,
			Integer shopid) {
		if (StringUtils.isEmpty(subProduct.getSku())) {
			return;
		}
		Integer adminid = (Integer) getSession(Const.SESSION_ADMIN_NAME);
		Admin admin = adminService.get(adminid);
		Inventory inventory = new Inventory();
		inventory.setProductid(subProduct.getId());
		inventory.setProductName(subProduct.getFullName());
		inventory.setAdmin(adminid);
		inventory.setAdminName(admin == null ? "" : admin.getName());
		inventory.setIncrement(increment);
		inventory.setShopid(shopid);
		inventory.setSku(subProduct.getSku());
		inventory.setStorageType(0);
		inventory.setUpproductid(subProduct.getProductid());
		inventory.setSurplus(increment);
		inventory.setRemark("创建产品");
		inventory.setCreateDate(new Date().getTime());
		inventoryService.save(inventory);
	}

	private boolean isEmpty(Object obj) {
		if (obj == null || "".equals(obj)) {
			return true;
		} else {
			return false;
		}
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Double getIndicativePrice() {
		return indicativePrice;
	}

	public void setIndicativePrice(Double indicativePrice) {
		this.indicativePrice = indicativePrice;
	}

	public Integer getStat() {
		return stat;
	}

	public void setStat(Integer stat) {
		this.stat = stat;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public String getCover() {
		return cover;
	}

	public void setCover(String cover) {
		this.cover = cover;
	}

	public Integer getBrandid() {
		return brandid;
	}

	public void setBrandid(Integer brandid) {
		this.brandid = brandid;
	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWeight() {
		return weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}

	public String getVolumn() {
		return volumn;
	}

	public void setVolumn(String volumn) {
		this.volumn = volumn;
	}

	public Integer getDisplayOrder() {
		return displayOrder;
	}

	public void setDisplayOrder(Integer displayOrder) {
		this.displayOrder = displayOrder;
	}

	public Double getFreight() {
		return freight;
	}

	public void setFreight(Double freight) {
		this.freight = freight;
	}

	public Integer getHotSale() {
		return hotSale;
	}

	public void setHotSale(Integer hotSale) {
		this.hotSale = hotSale;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public String getFirstSpecName() {
		return firstSpecName;
	}

	public void setFirstSpecName(String firstSpecName) {
		this.firstSpecName = firstSpecName;
	}

	public String getSecondSpecName() {
		return secondSpecName;
	}

	public void setSecondSpecName(String secondSpecName) {
		this.secondSpecName = secondSpecName;
	}

	public String getFirstSpecStr() {
		return firstSpecStr;
	}

	public void setFirstSpecStr(String firstSpecStr) {
		this.firstSpecStr = firstSpecStr;
	}

	public String getSecondSpecStr() {
		return secondSpecStr;
	}

	public void setSecondSpecStr(String secondSpecStr) {
		this.secondSpecStr = secondSpecStr;
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

	public Integer getShopFlevel() {
		return shopFlevel;
	}

	public void setShopFlevel(Integer shopFlevel) {
		this.shopFlevel = shopFlevel;
	}

	public Integer getShopSlevel() {
		return shopSlevel;
	}

	public void setShopSlevel(Integer shopSlevel) {
		this.shopSlevel = shopSlevel;
	}

	public Integer getShopHotSale() {
		return shopHotSale;
	}

	public void setShopHotSale(Integer shopHotSale) {
		this.shopHotSale = shopHotSale;
	}

	public Integer getCountryid() {
		return countryid;
	}

	public void setCountryid(Integer countryid) {
		this.countryid = countryid;
	}

}
