package com.wudianyi.wb.scshop.action.json;

import javax.annotation.Resource;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.service.JflogService;

public class PointAction extends BaseAction {

	@Resource
	private JflogService jflogService;

	private int pn;
	private Integer tt;

	public String list() {
		Integer userid = (Integer) getSession(Const.SESSION_CUSTOMER_ID);

		if (tt != null && (tt.intValue() != 0 || tt.intValue() != 1)) {
			tt = null;
		}

		list = jflogService.getList(new QueryParam(2).add("userid", userid)
				.add("in", tt), Const.FRONT_PAGE_SIZE * (pn - 1),
				Const.FRONT_PAGE_SIZE, "createdate", "desc", false);

		return LIST;

	}

	public int getPn() {
		return pn;
	}

	public void setPn(int pn) {
		this.pn = pn;
	}

	public Integer getTt() {
		return tt;
	}

	public void setTt(Integer tt) {
		this.tt = tt;
	}

}
