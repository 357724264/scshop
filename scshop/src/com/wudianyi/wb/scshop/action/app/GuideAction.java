package com.wudianyi.wb.scshop.action.app;

import net.sf.json.JSONObject;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.entity.WebInfo;

public class GuideAction extends BaseAction{
	
	public String execute() {
		JSONObject retObj = new JSONObject();
		WebInfo webInfo = getWebInfo();
		retObj.put("firstImg", webInfo.getAppimage()==null?"":webInfo.getAppimage());
		retObj.put("secondImg", webInfo.getAppimage2()==null?"":webInfo.getAppimage2());
		retObj.put("thirdImg", webInfo.getAppimage3()==null?"":webInfo.getAppimage3());
		return ajaxJson(retObj.toString());
	}
	
}
