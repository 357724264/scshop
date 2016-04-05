package com.wudianyi.wb.scshop.action.app;

import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Ad;
import com.wudianyi.wb.scshop.entity.Product;
import com.wudianyi.wb.scshop.service.AdService;
import com.wudianyi.wb.scshop.service.ProductService;

public class IndexAction extends BaseAction {

	@Resource
	private ProductService productService;
	@Resource
	private AdService adService;

	@Override
	public String execute() throws Exception {
		JSONObject jsonObject = new JSONObject();
		JSONArray topAdArray = new JSONArray();
		JSONArray midAdArray = new JSONArray();
		JSONArray undAdArray = new JSONArray();
		JSONArray navArray = new JSONArray();
		List<Ad> ads = adService.getList(new QueryParam(1).add("isshow", 1), 0,
				0, "orderbyid", "desc", false);
		for (Ad ad : ads) {
			String images = ad.getImages();
			String url = ad.getUrl();
			JSONObject object = new JSONObject();
			object.put("images", images);
			object.put("url", url);

			if (ad.getNum() == 0) {
				topAdArray.add(object);
			} else if (ad.getNum() == 1) {
				midAdArray.add(object);
			} else if (ad.getNum() == 2) {
				undAdArray.add(object);
			} else if (ad.getNum() == 3) {
				object.put("name", ad.getName());
				navArray.add(object);
			}
		}
		jsonObject.put("topAd", topAdArray);
		jsonObject.put("midAd", midAdArray);
		jsonObject.put("undAd", undAdArray);
		jsonObject.put("nav", navArray);
		// 查询出所有热销商品
		QueryParam params = new QueryParam(3).add("del", 0).add("hotSale", 1)
				.add("stat", 0);
		List<Product> hotSaleProducts = productService.getList(params, 0, 0,
				"displayOrder", "desc", false);
		JSONArray hotSaleProductsArray = new JSONArray();

		for (Product product : hotSaleProducts) {
			JSONObject object = new JSONObject();
			object.put("countryIcon", product.getCountryIcon()==null?"":product.getCountryIcon());
			object.put("name", product.getName()==null?"":product.getName());
			object.put("cover", product.getCover()==null?"":product.getCover());
			object.put("bottomPrice", product.getBottomPrice()==null?"":product.getBottomPrice());
			object.put("indicativePrice", product.getIndicativePrice()==null?"":product.getIndicativePrice());
			object.put("country", product.getCountry()==null?"":product.getCountry());
			object.put("id", product.getId());
			hotSaleProductsArray.add(object);
		}
		jsonObject.put("hotSaleProducts", hotSaleProductsArray);
		return ajaxJson(jsonObject.toString());

	}
}
