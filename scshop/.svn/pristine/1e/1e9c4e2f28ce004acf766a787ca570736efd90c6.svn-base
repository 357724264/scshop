package com.wudianyi.wb.scshop.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import net.sf.json.JSONObject;

import org.hibernate.annotations.GenericGenerator;

import com.wudianyi.wb.scshop.util.StringUtils;

/**
 * 商品评价
 * 
 * @author zhongmou
 * 
 */
@Entity
@Table(name = "scshop_comment")
public class Comment implements Serializable {

	private static final long serialVersionUID = 1L;

	private String id;
	private int productid;// 产品id
	@Column(name = "productname")
	private String productName;//产品名字
	private String pics;// 评论图片
	private String content;// 评论内容
	private String resource;// 评论来源
	private String orderid;// 订单id
	private int point;// 评分
	private long createDate;// 创建时间
	private int del;// 是否删除 0正常，1删除
	private int userid;// 评论的用户id
	private String userinfo;// 用户信息，用json的形式保存{name,pic}
	private String reply;// 评论回复
	private Integer adminid;// 管理员ID
	private Long replydate;// 回复时间
	private int clevel;// 3好评（4,5），2中评(2,3)，1差评(1)
	private Integer shopid;
	
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

	@Transient
	public String getUserName() {
		if (StringUtils.isEmpty(userinfo)) {
			return null;
		}
		JSONObject jsonObj = JSONObject.fromObject(userinfo);
		return jsonObj.get("name")==null?"":jsonObj.getString("name");
	}

	@Transient
	public String getUserPic() {
		if (StringUtils.isEmpty(userinfo)) {
			return null;
		}
		JSONObject jsonObj = JSONObject.fromObject(userinfo);
		return jsonObj.get("pic")==null?"":jsonObj.getString("pic");
	}

	public int getProductid() {
		return productid;
	}

	public void setProductid(int productid) {
		this.productid = productid;
	}

	public String getPics() {
		return pics;
	}

	public void setPics(String pics) {
		this.pics = pics;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getResource() {
		return resource;
	}

	public void setResource(String resource) {
		this.resource = resource;
	}

	public String getOrderid() {
		return orderid;
	}

	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	@Column(name = "createdate")
	public long getCreateDate() {
		return createDate;
	}

	public void setCreateDate(long createDate) {
		this.createDate = createDate;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getUserinfo() {
		return userinfo;
	}

	public void setUserinfo(String userinfo) {
		this.userinfo = userinfo;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	public Integer getAdminid() {
		return adminid;
	}

	public void setAdminid(Integer adminid) {
		this.adminid = adminid;
	}

	public Long getReplydate() {
		return replydate;
	}

	public void setReplydate(Long replydate) {
		this.replydate = replydate;
	}

	public int getClevel() {
		return clevel;
	}

	public void setClevel(int clevel) {
		this.clevel = clevel;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Integer getShopid() {
		return shopid;
	}

	public void setShopid(Integer shopid) {
		this.shopid = shopid;
	}
	

}
