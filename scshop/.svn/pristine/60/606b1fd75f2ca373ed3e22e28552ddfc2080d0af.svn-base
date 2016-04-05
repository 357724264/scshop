package com.wudianyi.wb.scshop.action;

import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;

import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.service.ProductService;

public class SeckillAction extends BaseAction {

	@Resource
	private ProductService productService;
	private int state;// 0现场 1预告
	private int pt;// 1秒杀2限时

	@Override
	public String execute() throws Exception {
		
		return "seckill";
	}

	// 秒杀/限时列表
	public String list() {

		return LIST;
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

}
