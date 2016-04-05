package com.wudianyi.wb.scshop.action;

import java.util.List;

import javax.annotation.Resource;

import com.wudianyi.wb.scshop.bean.NoticeRequest;
import com.wudianyi.wb.scshop.bean.NoticeResponse;
import com.wudianyi.wb.scshop.bean.Result;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Order;
import com.wudianyi.wb.scshop.service.OrderService;
import com.wudianyi.wb.scshop.util.JacksonHelper;


public class CallbackAction extends BaseAction{
	
	@Resource
	private OrderService orderService;
	
	private String param;
	
	public String execute(){
		System.out.println(param);
		
		NoticeResponse resp = new NoticeResponse();
		resp.setResult(false);
		resp.setReturnCode("500");
		resp.setMessage("保存失败");
		try {
			NoticeRequest notice = JacksonHelper.fromJSON(param,
					NoticeRequest.class);

			Result result = notice.getLastResult();
			// 将获取到的最新快递信息保存
			QueryParam params = new QueryParam(1).add("postNum", result.getNu());
			List<Order> orderList = orderService.getList(params, 0, 0, null, null, false);
			for (Order order : orderList) {
				order.setPostjson(param);
				orderService.update(order);
			
			}
			//返回接收成功的信息
			resp.setResult(true);
			resp.setReturnCode("200");
			resp.setMessage("保存成功");
			return ajaxJson(JacksonHelper.toJSON(resp));//这里必须返回，否则认为失败，过30分钟又会重复推送。
		} catch (Exception e) {
			System.out.println(e.getLocalizedMessage());
			resp.setMessage("保存失败" + e.getMessage());
			return ajaxJson(JacksonHelper.toJSON(resp));//保存失败，服务端等30分钟会重复推送。
		}
		
	}

	public String getParam() {
		return param;
	}

	public void setParam(String param) {
		this.param = param;
	}
	
	
}
