package com.wudianyi.wb.scshop.action.json;

import javax.annotation.Resource;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.service.CommentService;

public class CommentAction extends BaseAction {

	@Resource
	private CommentService commentService;

	private int pn;
	private int id;
	private int level;

	public String list() {
		Integer clevel = null;
		if (level > 0 && level <= 3) {
			clevel = level;
		}

		list = commentService.getList(new QueryParam(3).add("productid", id)
				.add("del", 0).add("clevel", clevel), Const.FRONT_PAGE_SIZE
				* (pn - 1), Const.FRONT_PAGE_SIZE, "createDate", "desc", false);
		return LIST;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public int getPn() {
		return pn;
	}

	public void setPn(int pn) {
		this.pn = pn;
	}

}
