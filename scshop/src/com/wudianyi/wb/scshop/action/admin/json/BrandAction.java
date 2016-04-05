package com.wudianyi.wb.scshop.action.admin.json;

import java.util.List;

import javax.annotation.Resource;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Brand;
import com.wudianyi.wb.scshop.service.BrandService;
import com.wudianyi.wb.scshop.util.PinyinUtil;
import com.wudianyi.wb.scshop.util.StringUtils;

public class BrandAction extends BaseAction {

	@Resource
	private BrandService brandService;

	private Integer cid;
	private String brandName;
	private String logo;
	private Integer displayOrder;
	private String intro;
	private String rettype;

	// 添加品牌信息
	public String save() {

		Brand brand = new Brand();
		brand.setDisplayOrder(displayOrder);
		brand.setIntro(intro);
		brand.setName(brandName);
		brand.setLogo(logo);
		brand.setDel(0);
		brand.setPinyin(PinyinUtil.getAllLetter(
				brandName == null ? "" : brandName).toUpperCase());

		brandService.save(brand);

		return ajaxHtml("success");
	}

	public String update() {
		Brand brand = brandService.get(cid);
		System.out.println(displayOrder);
		brand.setDisplayOrder(displayOrder);
		brand.setIntro(intro);
		brand.setName(brandName);
		brand.setLogo(logo);
		brand.setPinyin(PinyinUtil.getAllLetter(
				brandName == null ? "" : brandName).toUpperCase());

		brandService.update(brand);

		return ajaxHtml("success");

	}

	public String delete() {

		Brand brand = brandService.get(cid);
		brand.setDel(1);
		brandService.update(brand);

		return ajaxHtml("success");
	}

	public String list() {
		if (StringUtils.isEmpty(rettype)) {
			return ajaxJsonErrorMessage("请选择返回类型");
		}
		QueryParam params = new QueryParam(1).add("del", 0);
		list = brandService.getList(params, 0, 0, "pinyin", "asc", true);
		if (rettype.equals("select")) {

			return "select";
		}
		return null;

	}

	public Integer getCid() {
		return cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public Integer getDisplayOrder() {
		return displayOrder;
	}

	public void setDisplayOrder(Integer displayOrder) {
		this.displayOrder = displayOrder;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getRettype() {
		return rettype;
	}

	public void setRettype(String rettype) {
		this.rettype = rettype;
	}

}
