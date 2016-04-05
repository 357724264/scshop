package com.wudianyi.wb.scshop.action.app;

import java.util.Date;

import javax.annotation.Resource;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.service.ProductService;

public class SeckillAction extends BaseAction{
	
	private int id;
	private int state;// 0现场 1预告
	private int pt;// 1秒杀2限时
	private int pn;
	
	@Resource
	private ProductService productService;
	
	public String list() {
		System.out.println("apppppp....list");
		String orderby = "beginTime";
		String sx = "asc";
		QueryParam param = new QueryParam().add("productType", pt + 1)
				.add("del", 0).add("stat", 0);
		long date = new Date().getTime();
		// 限时购
		if (pt == 1 && state == 0) {
			// 现场
			sx = "desc";
			param.add("<=beginTime", date).add(">endTime", date);
			list = productService.getStaticsLikeList(null, null, param, null,
					null, null, Const.FRONT_PAGE_SIZE * (pn - 1),
					Const.FRONT_PAGE_SIZE, orderby, sx);

			// 预告
		} else if (pt == 1 && state == 1) {
			param.add(">beginTime", date);
			list = productService.getStaticsLikeList(null, null, param, "null",
					null, null, Const.FRONT_PAGE_SIZE * (pn - 1),
					Const.FRONT_PAGE_SIZE, orderby, sx);
			// 秒杀
		} else {
			list = productService.getStaticsLikeList(null, null, param, null,
					null, null, Const.FRONT_PAGE_SIZE * (pn - 1),
					Const.FRONT_PAGE_SIZE, orderby, sx);
		}

		return LIST;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public int getPt() {
		return pt;
	}

	public void setPt(int pt) {
		this.pt = pt;
	}

	public int getPn() {
		return pn;
	}

	public void setPn(int pn) {
		this.pn = pn;
	}

	
}
