package com.wudianyi.wb.scshop.common;

import net.sf.json.JSONObject;

public class WxUser {

	private String openid;
	private String nickname;
	private String sex;
	private String city;
	private String province;
	private String country;
	private String headimgurl;

	private Boolean isSubscribe;

	public WxUser() {
		// TODO Auto-generated constructor stub
	}

	public WxUser(JSONObject object) {
		openid = object.getString("openid");
		Object nn = object.get("nickname");
		if (nn != null) {
			nickname = nn.toString();
		}

		Object ss = object.get("sex");
		if (ss != null) {
			sex = ss.toString();
		}
		Object cc = object.get("city");
		if (cc != null) {
			city = cc.toString();
		}
		Object pp = object.get("province");
		if (pp != null) {
			province = pp.toString();
		}
		Object coco = object.get("country");
		if (coco != null) {
			country = coco.toString();
		}
		Object hh = object.get("headimgurl");
		if (hh != null) {
			headimgurl = hh.toString();
		}

	}

	public String getOpenid() {
		return openid;
	}

	public void setOpenid(String openid) {
		this.openid = openid;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getHeadimgurl() {
		return headimgurl;
	}

	public void setHeadimgurl(String headimgurl) {
		this.headimgurl = headimgurl;
	}

	public Boolean getIsSubscribe() {
		return isSubscribe;
	}

	public void setIsSubscribe(Boolean isSubscribe) {
		this.isSubscribe = isSubscribe;
	}

}
