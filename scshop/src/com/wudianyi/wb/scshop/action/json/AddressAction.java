package com.wudianyi.wb.scshop.action.json;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Address;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.entity.Customer;
import com.wudianyi.wb.scshop.entity.Order;
import com.wudianyi.wb.scshop.service.AddressService;
import com.wudianyi.wb.scshop.service.CustomerService;
import com.wudianyi.wb.scshop.service.OrderService;
import com.wudianyi.wb.scshop.util.StringUtils;

public class AddressAction extends BaseAction {

	@Resource
	private AddressService addressService;
	@Resource
	private OrderService orderService;
	@Resource
	private CustomerService customerService;

	private String id;
	private String name;// 名字
	private String phone;// 电话
	private String address;// 地址

	private String province;// 省
	private String city;// 市
	private String address_detail;
	private String oid;

	private String qu; // 区
	private String identity;// 身份证号码
	private Integer iscommon;// 是否默认，0 否 1是

	private String defaultid;// 默认地址id

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

	public String save() {
		Date date = new Date();
		Integer userid = (Integer) getSession(Const.SESSION_CUSTOMER_ID);
		Address ads = new Address();
		ads.setCreateDate(date.getTime());
		ads.setName(name);
		ads.setPhone(phone);
		ads.setUserid(userid);
		ads.setIdentity(identity);
		String[] split = address.split(" ");
		ads.setProvince(split[0]);
		ads.setCity(split[1]);
		if (split.length > 2) {
			ads.setQu(split[2]);
		}
		ads.setAddress(address_detail);
		QueryParam param = new QueryParam(1).add("userid", userid);
		String adrressid = addressService.save(ads);
		Customer customer = customerService.get(userid);
		if (iscommon == 1
				|| StringUtils.isEmpty(customer.getDefaultAddressid())) {

			customer.setDefaultAddressid(adrressid);
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("name", ads.getName());
			jsonObject.put("phone", ads.getPhone());
			jsonObject.put("address", ads.getFullAddress());
			jsonObject.put("identity", ads.getIdentity());
			customer.setDefaultAddressInfo(jsonObject.toString());
			customerService.update(customer);
		}

		// 如果携带了orderid
		if (!StringUtils.isEmpty(oid)) {
			Order order = orderService.get(oid);
			order.setAddress(ads.getFullAddress());
			order.setName(ads.getName());
			order.setPhone(ads.getPhone());
			order.setAddressid(id);
			orderService.update(order);
		}

		return ajaxJsonSuccessMessage(ads.getId());

	}

	public String update() {
		System.out.println("进入update");
		Date date = new Date();
		Integer userid = (Integer) getSession(Const.SESSION_CUSTOMER_ID);
		System.out.println((Integer) getSession(Const.SESSION_CUSTOMER_ID));
		System.out.println(id);
		Address ads = addressService.get(id);

		ads.setCreateDate(date.getTime());
		ads.setName(name);
		ads.setPhone(phone);
		ads.setUserid(userid);
		ads.setIdentity(identity);
		String[] split = address.split(" ");
		ads.setProvince(split[0]);
		System.out.println(split[0]);
		ads.setCity(split[1]);
		ads.setQu(split.length > 1 ? split[2] : "");
		ads.setAddress(address_detail);
		System.out.println(iscommon);
		if(iscommon==1) {	
			Customer customer = customerService.get(userid);
			customer.setDefaultAddressid(id);
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("name", ads.getName());
			jsonObject.put("phone", ads.getPhone());
			jsonObject.put("address", ads.getFullAddress());
			jsonObject.put("identity", ads.getIdentity());
			customer.setDefaultAddressInfo(jsonObject.toString());
			customerService.update(customer);
			
		}
		// Address addressold = addressService.get(
		// new QueryParam(2).add("iscommon", "1").add("userid", userid), false);
		//
		// if (addressold != null&&iscommon=="1") {
		// addressold.setIscommon("0");
		// addressService.update(addressold);
		// ads.setIscommon(iscommon);
		// }else if (addressold == null) {
		// ads.setIscommon(iscommon);
		// }
		addressService.update(ads);
		// 如果携带了orderid
		if (!StringUtils.isEmpty(oid)) {
			Order order = orderService.get(oid);
			order.setAddress(ads.getFullAddress());
			order.setName(ads.getName());
			order.setPhone(ads.getPhone());
			order.setAddressid(id);
			orderService.update(order);
		}

		return ajaxJson("success");

	}

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
		return ajaxHtml("success");
	}

	public String edit() {
		Address address = addressService.get(id);
		return null;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getIdentity() {
		return identity;
	}

	public void setIdentity(String identity) {
		this.identity = identity;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getQu() {
		return qu;
	}

	public void setQu(String qu) {
		this.qu = qu;
	}

	public String getAddress_detail() {
		return address_detail;
	}

	public void setAddress_detail(String address_detail) {
		this.address_detail = address_detail;
	}

	public String getOid() {
		return oid;
	}

	public void setOid(String oid) {
		this.oid = oid;
	}

	public String getDefaultid() {
		return defaultid;
	}

	public void setDefaultid(String defaultid) {
		this.defaultid = defaultid;
	}

	public Integer getIscommon() {
		return iscommon;
	}

	public void setIscommon(Integer iscommon) {
		this.iscommon = iscommon;
	}

}
