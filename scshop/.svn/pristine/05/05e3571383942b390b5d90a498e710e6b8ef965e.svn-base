package com.wudianyi.wb.scshop.action.admin.json;

import java.util.Date;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.entity.Ad;
import com.wudianyi.wb.scshop.service.AdService;

public class AdAction extends BaseAction {

	@Resource
	private AdService adService;

	private int id;
	private String name;// 广告名/导航名
	private String images;// 广告图片
	private String url;// url
	private int num;// 0上层(轮询) 1中层(单张) 2下层(4宫格) 3导航
	private int isshow;// 首页是否显示
	private Integer orderbyid;// 排序
	private long createDate;// 创建日期
	private long modifyDate;// 修改日期
	
	
	
	
	public String ad(){
		Ad ad = adService.get(id);
		JSONObject jsonObject =JSONObject.fromObject(ad);
		return ajaxJson(jsonObject.toString());
		
	}

	// 保存广告
	public String save() {
		Date date = new Date();
		Ad ad = new Ad();
		ad.setCreateDate(date.getTime());// 创建的时间
		ad.setModifyDate(0);
		ad.setName(name);
		ad.setImages(images);
		ad.setUrl(url);
		ad.setNum(num);// 上中下层广告
		if(num==3){
			ad.setIsshow(1);//如果是导航的，默认显示
		}else{
			ad.setIsshow(isshow);//是否显示
		}
		ad.setOrderbyid(orderbyid);

		adService.save(ad);
		return ajaxHtml("success");
	}

	// 修改广告
	public String edit() {
		Date date = new Date();
		Ad ad = adService.get(id);
		ad.setModifyDate(date.getTime());// 修改的时间
		ad.setName(name);
		if(images!=null){
			ad.setImages(images);
		}
		ad.setUrl(url);
		ad.setNum(num);// 上中下层广告
		if(num==3){
			ad.setIsshow(1);//如果是导航的，默认显示
		}else{
			ad.setIsshow(isshow);//是否显示
		}
		ad.setOrderbyid(orderbyid);
		adService.update(ad);
		return ajaxHtml("success");
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImages() {
		return images;
	}

	public void setImages(String images) {
		this.images = images;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getIsshow() {
		return isshow;
	}

	public void setIsshow(int isshow) {
		this.isshow = isshow;
	}

	public Integer getOrderbyid() {
		return orderbyid;
	}

	public void setOrderbyid(Integer orderbyid) {
		this.orderbyid = orderbyid;
	}

	public long getCreateDate() {
		return createDate;
	}

	public void setCreateDate(long createDate) {
		this.createDate = createDate;
	}

	public long getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(long modifyDate) {
		this.modifyDate = modifyDate;
	}



}
