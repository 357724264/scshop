package com.wudianyi.wb.scshop.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.ParentPackage;

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
import com.wudianyi.wb.scshop.service.CartService;
import com.wudianyi.wb.scshop.service.CategoryService;
import com.wudianyi.wb.scshop.service.CommentService;
import com.wudianyi.wb.scshop.service.CountryService;
import com.wudianyi.wb.scshop.service.CustomerService;
import com.wudianyi.wb.scshop.service.ProductService;
import com.wudianyi.wb.scshop.service.SubProductService;
import com.wudianyi.wb.scshop.service.WebInfoService;

@ParentPackage("front")
public class ProductAction extends BaseAction {

	@Resource
	private ProductService productService;
	@Resource
	private CommentService commentService;
	@Resource
	private CartService cartService;
	@Resource
	private CustomerService customerService;
	@Resource
	private CategoryService categoryService;
	@Resource
	private CountryService countryService;
	@Resource
	private BrandService brandService;
	@Resource
	private SubProductService subProductService;
	@Resource
	private WebInfoService webInfoService;

	private Integer brandid;
	private Integer categoryid;
	private Integer countryid;
	private Integer id;

	public String details() {
		Product product = productService.get(id);
		QueryParam params = new QueryParam(3).add("productid", id).add(
				"nodeid", 0).add("del", 0);
		List<SubProduct> subProductList = subProductService.getList(params, 0,
				0, null, null, false);
		Object useridObj = getSession(Const.SESSION_CUSTOMER_ID);
		Integer userid = useridObj == null ? null : (Integer) useridObj;
		// 获得用户评论,取前3条显示
		params = new QueryParam(2).add("productid", id).add("del",0);
		List<Comment> commentList = commentService.getList(params, 0, 3,
				"createDate", "desc", false);
		tn = commentService.getTotalCount(params, false);
		// 取出用户购物车里的总条数

		// int cartCount = cartService.getCartNum(userid, getStatusid());
		// cookieSet(Const.COOKIE_CARTNUM, cartCount + "");
		// setAttribute("cartCount", cartCount);
		setAttribute("commentList", commentList);
		setAttribute("product", product);
		setAttribute("subProductList", subProductList);
		WebInfo info = webInfoService.get(Const.WEBINFO_ID);
		setAttribute("info", info);
		setAttribute("userid", userid);
		return "details";
	}

	public String list() {

		if (categoryid != null) {
			Category category = categoryService.get(categoryid);
			String categoryName = category.getName();
			setAttribute("categoryName", categoryName);
		}
		if (brandid != null) {
			Brand brand = brandService.get(brandid);
			String brandName = brand.getName();
			setAttribute("brandName", brandName);
		}
		if (countryid != null) {
			Country country = countryService.get(countryid);
			String countryName = country.getName();
			setAttribute("countryName", countryName);
		}

		return LIST;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
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

	public Integer getCountryid() {
		return countryid;
	}

	public void setCountryid(Integer countryid) {
		this.countryid = countryid;
	}

}
