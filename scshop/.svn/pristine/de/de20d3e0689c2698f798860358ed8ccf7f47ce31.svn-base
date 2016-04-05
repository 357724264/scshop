package com.wudianyi.wb.scshop.action.app;

import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.convention.annotation.ParentPackage;

import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Address;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.entity.Customer;
import com.wudianyi.wb.scshop.service.AddressService;
import com.wudianyi.wb.scshop.service.CustomerService;

/**
 * 个人用户地址管理
 * 
 * @author Administrator
 * 
 */
@ParentPackage("appUser")
public class AddressAction extends BaseAction {

	private String oid;
	
    
	private String aid;
	
	private String defaultid;//默认的地址id

	@Resource
	private AddressService addressService;
	@Resource
	private CustomerService customerService;
	

	/*
	 * 用户地址列表
	 */
	public String list() {
		JSONObject retObject = new JSONObject();
		Integer uid = (Integer) getSession(Const.SESSION_CUSTOMER_ID);
		if(uid!=null) {
			retObject.put("userid", uid);
		}
		defaultid = customerService.get(uid).getDefaultAddressid();
		QueryParam param = new QueryParam(1).add("userid", uid);
		List<Address> addresslist = addressService.getList(param, 0, 0, null, null, false);
		//setAttribute("defaultid", defaultid);
        
		JSONArray addressArray = new JSONArray();
		for(Address address:addresslist){
			JSONObject addreObject = new JSONObject();
			addreObject.put("id", address.getId());
			addreObject.put("province", address.getProvince());
			addreObject.put("city", address.getCity());
			addreObject.put("qu", address.getQu());
			addreObject.put("address", address.getAddress());
			addreObject.put("name", address.getName());
			addreObject.put("phone", address.getPhone());
			addressArray.add(addreObject);
		}
		retObject.put("list", addressArray);
		retObject.put("oid", oid);
		retObject.put("defaultid", defaultid);
		return ajaxJson(retObject.toString());
	}

	public String add() {
		
		return "add";
	}
	
	public String edit() {
		Integer uid = (Integer) getSession(Const.SESSION_CUSTOMER_ID);
		
	    QueryParam param = new QueryParam(1).add("userid", uid).add("id", aid);
	    Address address = addressService.get(param, false);
	   // setAttribute("address", address);
	    
	    JSONObject addressObject = new JSONObject();
	    
	    addressObject.put("id", address.getId());
	    addressObject.put("province", address.getProvince());
		addressObject.put("city", address.getCity());
		addressObject.put("qu", address.getQu());
		addressObject.put("address", address.getAddress());
		addressObject.put("name", address.getName());
		addressObject.put("phone", address.getPhone());
		addressObject.put("identity", address.getIdentity());
		return ajaxJson(addressObject.toString());
	}

	public String getOid() {
		return oid;
	}

	public void setOid(String oid) {
		this.oid = oid;
	}
	public String getAid() {
		return aid;
	}

	public void setAid(String aid) {
		this.aid = aid;
	}

	public String getDefaultid() {
		return defaultid;
	}

	public void setDefaultid(String defaultid) {
		this.defaultid = defaultid;
	}
	
	
}
