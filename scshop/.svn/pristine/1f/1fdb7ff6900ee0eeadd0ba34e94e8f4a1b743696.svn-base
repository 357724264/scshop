package com.wudianyi.wb.scshop.action.app.json;

import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Address;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.entity.Customer;
import com.wudianyi.wb.scshop.service.AddressService;
import com.wudianyi.wb.scshop.service.CustomerService;

public class AddressAction extends BaseAction {
	@Resource
	private CustomerService customerService;
	@Resource
	private AddressService addressService;
	private String id;
	private String defaultid;// 默认地址id

	public String setDefaultAddress() {

		Integer userid = (Integer) getSession(Const.SESSION_CUSTOMER_ID);
		Customer customer = customerService.get(userid);

		Address ads = addressService.get(defaultid);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("name", ads.getName());
		jsonObject.put("phone", ads.getPhone());
		jsonObject.put("address", ads.getFullAddress());
		jsonObject.put("identity", ads.getIdentity());
		customer.setDefaultAddressid(defaultid);
		customer.setDefaultAddressInfo(jsonObject.toString());
		customerService.update(customer);
		return ajaxJsonSuccessMessage(null);
	}

	public String delete() {
		Integer userid = (Integer) getSession(Const.SESSION_CUSTOMER_ID);
		Address address = addressService.get(id);
		if (address != null && (address.getUserid() == userid.intValue())) {
			addressService.delete(address);
			Customer customer = customerService.get(userid);
			if (customer.getDefaultAddressid().equals(id)) {// 如果是删除默认的，则如果还有其他地址，则选择第一个作为默认的，如果没有，则没有默认的
				List<Address> addresses = addressService.getList(
						new QueryParam(1).add("userid", userid), 0, 0,
						"createDate", "desc", false);
				if (addresses != null && !addresses.isEmpty()) {
					Address newdefaultAddress = addresses.get(0);
					customer.setDefaultAddressid(newdefaultAddress.getId());
					JSONObject jsonObject = new JSONObject();
					jsonObject.put("name", newdefaultAddress.getName());
					jsonObject.put("phone", newdefaultAddress.getPhone());
					jsonObject.put("address",
							newdefaultAddress.getFullAddress());
					jsonObject.put("identity", newdefaultAddress.getIdentity());
					customer.setDefaultAddressInfo(jsonObject.toString());
				} else {
					customer.setDefaultAddressid(null);
					customer.setDefaultAddressInfo(null);
				}
				customerService.update(customer);
			}
		}
		return ajaxJsonSuccessMessage(null);
	}

	public String getDefaultid() {
		return defaultid;
	}

	public void setDefaultid(String defaultid) {
		this.defaultid = defaultid;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

}
