package com.wudianyi.wb.scshop.action.admin.json;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.lulu.tool.DateUtil;
import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.entity.Product;
import com.wudianyi.wb.scshop.entity.SubProduct;
import com.wudianyi.wb.scshop.service.ProductService;
import com.wudianyi.wb.scshop.service.SeckillProductService;
import com.wudianyi.wb.scshop.service.SubProductService;

public class ProductAction extends BaseAction{
	
	private Integer cid; //分类id
	private String batchCid;
	
	//产品的查询条件
	private Integer flevel;
	private Integer slevel;
	private Integer brandid;
	private String country;
	private String stat;
	private String sku;
	
	@Resource
	private ProductService productService;
	@Resource
	private SubProductService subProductService;
	@Resource
	private SeckillProductService seckillProductService;
	
	//商品列表
	public String list() {
		QueryParam params = new QueryParam().add("del", 0);
		Integer permission = (Integer)getSession(Const.SESSION_ADMIN_PERMISSION);
		if(permission==null || permission==1) {
			Integer shopid = (Integer)getSession(Const.SESSION_ADMIN_SHOPID);
			params.add("shopid", shopid);
		}
		
		if(slevel!=null&&slevel!=0) {
			if(permission!=null && permission==0) {
				params.add("slevel", slevel);
			}else {
				params.add("shopSlevel", slevel);
			}
		}else if(flevel!=null&&flevel!=0) {
			
			if(permission!=null && permission==0) {
				params.add("flevel", flevel);
			}else {
				params.add("shopFlevel", flevel);
			}
		}
		if(brandid!=null&&brandid!=0) {
			params.add("brandid", brandid);
		}
		if(country!=null&&!"".equals(country)) {
			params.add("country", country);
		}
		if(stat!=null && !"".equals(stat)) {
			params.add("stat", Integer.parseInt(stat));
		}
		List<Product> list = productService.getStaticsLikeList("name,skus", keyword, params, null, null, null, Const.BACK_PAGE_SIZE*(pn-1), Const.BACK_PAGE_SIZE, "modifydate", "desc");
		JSONArray jsonAry = new JSONArray();
		Product product = null;
		for (int i=0; i<list.size(); i++) {
			product = list.get(i);
			JSONObject jsonObject = new JSONObject();
            jsonObject.put("cid", product.getId());
            jsonObject.put("name", product.getName());
            jsonObject.put("price", product.getBottomPrice() + "~" + product.getTopPrice());
            jsonObject.put("stat", product.getStat() == 0 ? "是" : "否");
            if(product.getModifydate()==null||product.getModifydate()==0) {
            	 jsonObject.put("modifydate", "-");
            }else {
            	 jsonObject.put("modifydate", DateUtil.getDate(new Date(product.getModifydate()), "yyyy-MM-dd HH:mm"));
            }
       
           jsonObject.put("index", i+1+(pn-1)*Const.BACK_PAGE_SIZE);
           jsonAry.add(jsonObject);
		}
		return ajaxJson(jsonAry.toString());
		
	}
	
	
	public String deleteSubProduct() {
		
		SubProduct subProduct = subProductService.get(cid);
		//如果是一级规格，则判断是否拥有字规格，如果有，不能删除
		if(subProduct.getNodeid()==0&&subProduct.getDownList()!=null&&subProduct.getDownList().size()>0) {
			return ajaxJsonErrorMessage("删除失败,该规格下还有二级规格!");
		}
		
		if(productService.checkSubProductStatus(subProduct.getProductid(), subProduct.getId())) {
			return ajaxJsonErrorMessage("删除失败,该商品规格正在促销中..");
		}
		
		subProduct.setDel(1);
		subProductService.update(subProduct);
		return ajaxHtml("success");
	}
	
	


	//返回总条数
	public String totalNum() {
		
		QueryParam params = new QueryParam().add("del", 0);
		Integer permission = (Integer)getSession(Const.SESSION_ADMIN_PERMISSION);
		if(permission==null || permission==1) {
			Integer shopid = (Integer)getSession(Const.SESSION_ADMIN_SHOPID);
			params.add("shopid", shopid);
		}
		
		if(slevel!=null&&slevel!=0) {
			if(permission!=null && permission==0) {
				params.add("slevel", slevel);
			}else {
				params.add("shopSlevel", slevel);
			}
		}else if(flevel!=null&&flevel!=0) {
			
			if(permission!=null && permission==0) {
				params.add("flevel", flevel);
			}else {
				params.add("shopFlevel", flevel);
			}
		}
		if(brandid!=null&&brandid!=0) {
			params.add("brandid", brandid);
		}
		if(country!=null&&!"".equals(country)) {
			params.add("country", country);
		}
		if(stat!=null && !"".equals(stat)) {
			params.add("stat", Integer.parseInt(stat));
		}
		tn = productService.getLikeTotalCount("name,skus", keyword, null, params, false);
		
		
		return ajaxJson("{\"total\":\"" + tn + "\",\"size\":\"" + Const.BACK_PAGE_SIZE + "\"}");
	}
	

//	//查询制定分类下的商品
//	public String getColumnProduct() {
//		
//		Category category = categoryService.get(nodeId);
//		
//		String queryLevel = category.getNodeid()==1?"slevel":"flevel";
//		int shopid = (Integer)getSession(Const.SESSION_ADMIN_SHOPID);
//		QueryParam params = new QueryParam(3).add(queryLevel, category.getId()).add("shopid",shopid).add("del", 0);
//		List<Product> list = productService.getList(params, Const.BACK_PAGE_SIZE*(pn-1), Const.FRONT_PAGE_SIZE, "displayOrder", "desc", false);
//		JSONArray jsonAry = new JSONArray();
//		for (Product product : list) {
//			 JSONObject jsonObject = new JSONObject();
//	            jsonObject.put("cid", product.getId());
//	            jsonObject.put("name", product.getName());
//	            jsonObject.put("price", product.getBottomPrice() + "~" + product.getTopPrice());
//	            jsonObject.put("stat", product.getStat() == 0 ? "是" : "否");
//	            jsonAry.add(jsonObject);
//		}
//		return ajaxJson(jsonAry.toString());
//	}
	
	
	//删除指定商品
    public String deleteProduct() {
    	
        Product product = productService.get(cid);
        
        //查询是否有在审核中的
  		QueryParam params = new QueryParam(2).add("productid", cid).add("stat", 0);
  		tn = seckillProductService.getTotalCount(params, false);
  		if(tn > 0) {
  			return ajaxJsonErrorMessage("无法删除,该商品在促销审核中..");
  		}
        
        //如果该商品正在促销中，提示不能删除
        boolean flag = productService.checkProductStatus(product);
        if(flag) {
        	return ajaxJsonErrorMessage("无法删除,该商品正在促销中..");
        }
        product.setDel(1);
        productService.update(product);
        //循环删掉对应的subProduct
        params = new QueryParam().add("productid", product.getId());
        List<SubProduct> subList = subProductService.getList(params, 0, 0, null, null, false);
        for (SubProduct subProduct : subList) {
        	subProduct.setDel(1);
			subProductService.update(subProduct);
		}
        return ajaxHtml("success");
    }
    
    //删除全部选中的商品
    public String deleteAllContent() {
    	if (batchCid!=null&&!"".equals(batchCid)) {
    		Product product = null;
    		String[] idList = batchCid.split(",");
			QueryParam params = new QueryParam();
			List<SubProduct> subList = null;
    		for (int i = 0; i < idList.length; i++) {
    			product = productService.get(Integer.parseInt(idList[i]));
    			params.add("productid", product.getId()).add("stat", 0);
    	  		tn = seckillProductService.getTotalCount(params, false);
    	  		if(tn > 0) {
    				return ajaxJsonErrorMessage("无法删除商品【"+product.getName()+"】,该商品在促销审核中..");

    	  		}
    			//如果该商品正在促销中，提示不能删除
    	        boolean flag = productService.checkProductStatus(product);
    	        if(flag) {
    				return ajaxJsonErrorMessage("无法删除商品【"+product.getName()+"】,该商品正在促销中..");
    	        }
    			product.setDel(1);
    			productService.update(product);
    			//循环删掉对应的subProduct
    			params = new QueryParam().add("productid", product.getId());
    	        subList = subProductService.getList(params, 0, 0, null, null, false);
    	        for (SubProduct subProduct : subList) {
    	        	subProduct.setDel(1);
    				subProductService.update(subProduct);
    			}
			}
		}
    	return ajaxHtml("success");
    }
    
    //修改商品状态
    public String changestat() {
    	
        Product product = productService.get(cid);
        
        //查询是否有在审核中的
  		QueryParam params = new QueryParam(2).add("productid", product.getId()).add("stat", 0);
  		tn = seckillProductService.getTotalCount(params, false);
  		if(tn > 0) {
  			return ajaxJsonErrorMessage("无法修改状态,该商品在促销审核中..");
  		}
        
        boolean flag = productService.checkProductStatus(product);
        //如果促销中,不能修改状态
        if(flag) {
        	return ajaxJsonErrorMessage("商品正在促销中,无法修改状态!");
        }
        if (product.getStat() == 0) {
            product.setStat(-1);
        } else {
            product.setStat(0);
        }
        productService.update(product);

        return ajaxHtml("success");
    }
    
    public String checkSku() {
    	if(cid!=null) {
    		SubProduct subProduct = subProductService.get(cid);
    		if(sku.equalsIgnoreCase(subProduct.getSku())) {
    			return ajaxJsonSuccessMessage("");
    		}
    	}
    	QueryParam params = new QueryParam(2).add("sku", sku).add("del",0);
    	tn = subProductService.getTotalCount(params, false);
    	if(tn > 0) {
    		return ajaxJsonErrorMessage("该sku已存在");
    	}
    	return ajaxJsonSuccessMessage("");
    }


	public Integer getCid() {
		return cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public String getBatchCid() {
		return batchCid;
	}
	public void setBatchCid(String batchCid) {
		this.batchCid = batchCid;
	}


	public int getFlevel() {
		return flevel;
	}


	public void setFlevel(int flevel) {
		this.flevel = flevel;
	}


	public int getSlevel() {
		return slevel;
	}


	public void setSlevel(int slevel) {
		this.slevel = slevel;
	}


	public int getBrandid() {
		return brandid;
	}


	public void setBrandid(int brandid) {
		this.brandid = brandid;
	}


	public String getCountry() {
		return country;
	}


	public void setCountry(String country) {
		this.country = country;
	}


	public void setFlevel(Integer flevel) {
		this.flevel = flevel;
	}


	public void setSlevel(Integer slevel) {
		this.slevel = slevel;
	}


	public void setBrandid(Integer brandid) {
		this.brandid = brandid;
	}


	public String getStat() {
		return stat;
	}


	public void setStat(String stat) {
		this.stat = stat;
	}


	public String getSku() {
		return sku;
	}


	public void setSku(String sku) {
		this.sku = sku;
	}
	
	

	
	
	
	
}
