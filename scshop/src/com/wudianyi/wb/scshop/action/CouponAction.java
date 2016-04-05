package com.wudianyi.wb.scshop.action;

public class CouponAction extends BaseAction {
	private int tt;// 0:未使用，1：已使用，2：已过期

	public String list() {
		return LIST;
	}

	public int getTt() {
		return tt;
	}

	public void setTt(int tt) {
		this.tt = tt;
	}

}
