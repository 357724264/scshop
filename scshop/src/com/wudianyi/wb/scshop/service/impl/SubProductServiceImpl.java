package com.wudianyi.wb.scshop.service.impl;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Service;

import com.wudianyi.wb.scshop.dao.SubProductDao;
import com.wudianyi.wb.scshop.entity.Customer;
import com.wudianyi.wb.scshop.entity.SubProduct;
import com.wudianyi.wb.scshop.service.SubProductService;
import com.wudianyi.wb.scshop.util.StringUtils;

@Service
public class SubProductServiceImpl extends BaseServiceImpl<SubProduct, Integer>
		implements SubProductService {

	@Resource
	public void setBaseDao(SubProductDao subProductDao) {
		super.setBaseDao(subProductDao);
	}

	@Override
	public double getUserPriceByProduct(SubProduct product, Customer customer) {
		if (customer.getAgentid() != null) {
			// 取出商品对应用户代理等级的价格
			if (!StringUtils.isEmpty(product.getAgentPriceTable())) {
				// agentPriceTable是json字符串{"agentid":"price",....}
				JSONObject jsonObject = JSONObject.fromObject(product
						.getAgentPriceTable());
				String priceStr = (String) jsonObject.get(customer.getAgentid()
						+ "");
				System.err.println("priceStr=" + priceStr);
				// 如果该代理等级有设置则返回代理价格，没有就返回优惠价或原价
				if (!StringUtils.isEmpty(priceStr)) {
					return Double.parseDouble(priceStr);
				}

			}

		}
		// 如果没有折扣价就返回原价
		return product.getPrice() == null ? 0.00 : product.getPrice();

	}

}
