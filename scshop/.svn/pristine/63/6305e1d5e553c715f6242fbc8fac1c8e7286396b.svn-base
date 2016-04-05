package com.wudianyi.wb.scshop.action.app;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Brand;
import com.wudianyi.wb.scshop.entity.Category;
import com.wudianyi.wb.scshop.entity.Comment;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.entity.Country;
import com.wudianyi.wb.scshop.entity.Product;
import com.wudianyi.wb.scshop.entity.SubProduct;
import com.wudianyi.wb.scshop.entity.WebInfo;
import com.wudianyi.wb.scshop.service.BrandService;
import com.wudianyi.wb.scshop.service.CategoryService;
import com.wudianyi.wb.scshop.service.CommentService;
import com.wudianyi.wb.scshop.service.CountryService;
import com.wudianyi.wb.scshop.service.ProductService;
import com.wudianyi.wb.scshop.service.SubProductService;
import com.wudianyi.wb.scshop.service.WebInfoService;

public class ProductAction extends BaseAction {

	private int id;
	private String orderField;
	private String orderType;
	private Integer brandid;
	private Integer categoryid;
	private Integer countryid;

	@Resource
	private ProductService productService;
	@Resource
	private SubProductService subProductService;
	@Resource
	private CommentService commentService;
	@Resource
	private CategoryService categoryService;
	@Resource
	private BrandService brandService;
	@Resource
	private WebInfoService webInfoService;
	@Resource
	private CountryService countryService;

	@Override
	public String execute() throws Exception {
		JSONObject retObject = new JSONObject();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Product product = productService.get(id);
		QueryParam params = new QueryParam(2).add("productid", id).add(
				"nodeid", 0);
		// 获得用户评论,取前3条显示
		params = new QueryParam(1).add("productid", id);
		List<Comment> commentList = commentService.getList(params, 0, 3,
				"createDate", "desc", false);
		tn = commentService.getTotalCount(params, false);
		JSONArray commentListJson = new JSONArray();
		JSONObject productObject = JSONObject.fromObject(product);
		for (Comment comment : commentList) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("userPic", comment.getUserPic());
			jsonObject.put("userName", comment.getUserName());
			jsonObject.put("point", comment.getPoint());
			jsonObject.put("content", comment.getContent());
			jsonObject.put("createDate",
					sdf.format(new Date(comment.getCreateDate())));
			commentListJson.add(jsonObject);
		}

		double viewprice = 0.00;
		if (product.getProductType() == null
				||product.getProductType() == 0
				|| (product.getProductType() != 0 && (product.getBeginTime() > new Date()
						.getTime()))) {
			viewprice = product.getBottomPrice();
		} else {
			viewprice = product.getSeckillBottomPrice();
		}
		productObject.put("viewprice", viewprice);
//		productObject.put("id", product.getId());
//		productObject.put("cover", product.getCover());
//		productObject.put("countryIcon", product.getCountryIcon());
//		productObject.put("country", product.getCountry());
//		productObject.put("shopName", product.getShopName());
//		productObject.put("name", product.getName());
//		productObject.put("bottomPrice", product.getBottomPrice());
//		productObject.put("indicativePrice", product.getIndicativePrice());
//		productObject.put("score",
//				product.getScore() == null ? 80.00 : product.getScore());
//		productObject.put("brandName", product.getBrandName());
//		productObject.put("unit", product.getUnit());
//		productObject.put("weight", product.getWeight());
//		productObject.put("volumn", product.getVolumn());
//		productObject.put("topPrice", product.getTopPrice());
//		productObject.put("htmlDesc", product.getHtmlDesc());
//		productObject.put("firstSpecName", product.getFirstSpecName());
//		productObject.put("secondSpecName", product.getSecondSpecName());
//		productObject.put("shopid", product.getShopid());
		retObject.put("commentList", commentListJson);
		retObject.put("product", productObject);
		retObject.put("tn", tn);
		retObject.put("success", true);
		
		Integer userid = (Integer)getSession(Const.SESSION_CUSTOMER_ID);
		if(userid!=null) {
			retObject.put("userid", userid);
		}
		
		return ajaxJson(retObject.toString());

	}

	public String list() {
		JSONObject retObject = new JSONObject();
		if (categoryid != null) {
			Category category = categoryService.get(categoryid);
			JSONObject cateJsonObject = new JSONObject();
			cateJsonObject.put("categoryName", category.getName());
			retObject.put("category", cateJsonObject);
		}
		if (brandid != null) {
			Brand brand = brandService.get(brandid);
			JSONObject brJsonObject = new JSONObject();
			brJsonObject.put("brandName", brand.getName());
			retObject.put("brand", brJsonObject);
		}
		if (countryid != null) {
			Country country = countryService.get(countryid);
			JSONObject countryObject = new JSONObject();
			countryObject.put("countryName", country.getName());
			retObject.put("country", countryObject);
		}

		return ajaxJson(retObject.toString());
	}

	public String details() {
		Product product = productService.get(id);
		QueryParam params = new QueryParam(2).add("productid", id).add(
				"nodeid", 0);
		List<SubProduct> subProductList = subProductService.getList(params, 0,
				0, null, null, false);
		Object useridObj = getSession(Const.SESSION_CUSTOMER_ID);
		Integer userid = useridObj == null ? null : (Integer) useridObj;
		// 获得用户评论,取前3条显示
		params = new QueryParam(1).add("productid", id);
		List<Comment> commentList = commentService.getList(params, 0, 3,
				"createDate", "desc", false);
		tn = commentService.getTotalCount(params, false);
		// 取出用户购物车里的总条数

		// setAttribute("product", product);
		// setAttribute("commentList", commentList);
		// setAttribute("subProductList", subProductList);
		WebInfo info = webInfoService.get(Const.WEBINFO_ID);
		// setAttribute("info", info);

		JSONObject retObject = new JSONObject();
		JSONObject proObject = new JSONObject();
		proObject.put("cover", product.getCover()==null?"":product.getCover());
		proObject.put("countryIcon", product.getCountryIcon()==null?"":product.getCountryIcon());
		proObject.put("country", product.getCountry()==null?"":product.getCountry());
		proObject.put("shopName", product.getShopName()==null?"":product.getShopName());
		proObject.put("name", product.getName()==null?"":product.getName());
		proObject.put("bottomPrice", product.getBottomPrice()==null?"":product.getBottomPrice());
		proObject.put("indicativePrice", product.getIndicativePrice()==null?"":product.getIndicativePrice());
		proObject.put("score", product.getScore());
		proObject.put("htmlDesc", product.getHtmlDesc());
		proObject.put("brandName", product.getBrandName());
		proObject.put("weight", product.getWeight());
		proObject.put("volumn", product.getVolumn());
		proObject.put("topPrice", product.getTopPrice());
		proObject.put("firstSpecName", product.getFirstSpecName());
		proObject.put("secondSpecName", product.getSecondSpecName());
		proObject.put("cover", product.getCover());

		retObject.put("product", proObject);
		JSONArray comListArray = new JSONArray();
		for (Comment comment : commentList) {
			JSONObject comObject = new JSONObject();
			comObject.put("userPic", comment.getUserPic());
			comObject.put("userName", comment.getUserName());
			comObject.put("content", comment.getContent());
			comObject.put("createDate", comment.getCreateDate());
			comListArray.add(comObject);
		}
		retObject.put("commentList", commentList);
		retObject.put("tn", tn);
		retObject.put("appid", info.getAppid());

		return ajaxJson(retObject.toString());
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

	public Integer getBrandid() {
		return brandid;
	}

	public void setBrandid(Integer brandid) {
		this.brandid = brandid;
	}

	public BrandService getBrandService() {
		return brandService;
	}

	public void setBrandService(BrandService brandService) {
		this.brandService = brandService;
	}

	public Integer getCountryid() {
		return countryid;
	}

	public void setCountryid(Integer countryid) {
		this.countryid = countryid;
	}

}
