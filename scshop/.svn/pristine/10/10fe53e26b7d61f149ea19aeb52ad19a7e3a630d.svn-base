package com.wudianyi.wb.scshop.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import net.sf.json.JSONArray;

import org.hibernate.annotations.GenericGenerator;

import com.wudianyi.wb.scshop.util.StringUtils;
import com.wudianyi.wb.scshop.vo.CartItemVo;

@Entity
@Table(name = "scshop_cart")
public class Cart implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private Integer userid;
	private String sessionid;
	private String itemjson;// [{name,pic,model,price,id},{name,pic,model,price,id}]
	private int shopid;
	private int num;
	private String shopname;

	public Cart() {
		// TODO Auto-generated constructor stub
	}

	public Cart(Integer userid, String sessionid, int shopid, String shopname,
			int min, int max) {
		super();
		this.userid = userid;
		this.sessionid = (userid == null ? sessionid : null);
		this.itemjson = "[]";
		this.shopid = shopid;
		this.shopname = shopname;
		this.num = 0;
	}

	@Id
	@Column(length = 32, nullable = true)
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public String getSessionid() {
		return sessionid;
	}

	public void setSessionid(String sessionid) {
		this.sessionid = sessionid;
	}

	public String getItemjson() {
		return itemjson;
	}

	public void setItemjson(String itemjson) {
		this.itemjson = itemjson;
	}

	public int getShopid() {
		return shopid;
	}

	public void setShopid(int shopid) {
		this.shopid = shopid;
	}

	public String getShopname() {
		return shopname;
	}

	public void setShopname(String shopname) {
		this.shopname = shopname;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	// 得到购物车里面的购物项
	@Transient
	public List<CartItemVo> getItemlist() {
		if (StringUtils.isEmpty(itemjson)) {
			return null;
		}
		return JSONArray.toList(JSONArray.fromObject(itemjson),
				CartItemVo.class);
	}

}
