package com.wudianyi.wb.scshop.action.admin;

import java.util.Date;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.ParentPackage;

import com.joyoos.util.MD5;
import com.wudianyi.wb.scshop.action.BaseAction;
import com.wudianyi.wb.scshop.common.QueryParam;
import com.wudianyi.wb.scshop.entity.Admin;
import com.wudianyi.wb.scshop.entity.Const;
import com.wudianyi.wb.scshop.entity.Shop;
import com.wudianyi.wb.scshop.entity.ShopForm;
import com.wudianyi.wb.scshop.entity.WebInfo;
import com.wudianyi.wb.scshop.service.AdminService;
import com.wudianyi.wb.scshop.service.MailService;
import com.wudianyi.wb.scshop.service.ShopFormService;
import com.wudianyi.wb.scshop.service.ShopService;
import com.wudianyi.wb.scshop.service.WebInfoService;
import com.wudianyi.wb.scshop.util.SmsUtil;
public class ShopFormAction extends BaseAction{
	
	@Resource
	private ShopFormService shopFormService;
	@Resource
	private AdminService adminService;
	@Resource
	private ShopService shopService;
	@Resource
	private MailService mailService;
	@Resource
	private WebInfoService webInfoService;
	
	private String phone;//电话
	private String email;//邮箱
	private String password;//密码
	private String userName;//登录账号
	private String shopName;//店名
	private String code;
	private String description;//店铺描述
	private String license;//营业执照(多张图片)
	private String logo;//商店图标
	private Integer id;
	private int registernum;//营业执照注册号
	private String companyname;//公司名称
	private int idnum;//法人身份证
	private Integer stat;//-1为审核不通过 0为审核中 1为审核通过
	private String reason;//未通过的原因
	private Integer tt;
	private String feedback1;//店铺申请反馈信息
	private String feedback2;//店铺申请反馈信息
	


	//后台列表
	public String list() {
		/*QueryParam params = new QueryParam(1).add("stat", tt);
		
		// 分页
		if (pn == 0 || pn == 1 || ps == 0) {
			pn = 1;
			tn = shopFormService.getLikeTotalCount("stat", keyword, null,
					params, false);
			if (tn % ADMIN_PAGE_SIZE == 0) {
				ps = tn / ADMIN_PAGE_SIZE;
			} else {
				ps = tn / ADMIN_PAGE_SIZE + 1;
			}
		}
		
		list = shopFormService.getLikeList("stat", keyword, null, params, 
				ADMIN_PAGE_SIZE * (pn - 1), ADMIN_PAGE_SIZE, "createTime",
				"desc", false);*/
		
		return LIST;
	}
	

	//商家注册申请1
	public String register() {
		System.err.println("11");
		WebInfo info = webInfoService.get(Const.WEBINFO_ID);
		setAttribute("info", info);
		return "register";
	}
	
	
	
	//管理员进入审核页面
	public String detail() {
		ShopForm shopForm = shopFormService.get(id);
		Admin admin = adminService.get((Integer)getSession(Const.SESSION_ADMIN_NAME));
		setAttribute("feedback1", admin.getFeedback1());
		System.out.println("detail feedback1:"+feedback1);
		setAttribute("feedback2", admin.getFeedback2());
		setAttribute("shopForm", shopForm);
		return "detail";
		
	}
	
	//管理员审核修改保存
	public String update() throws Exception  {
		
		System.err.println("进入审核阶段");
		System.err.println("stat:"+stat);
		Date date = new Date();
		//修改申请表
		ShopForm shopForm = shopFormService.get(id);
		shopForm.setStat(stat);
		shopForm.setCreateTime(date.getTime());
			Integer adminId = (Integer)getSession(Const.SESSION_ADMIN_NAME);
			Admin admin1= adminService.get(adminId);
		shopForm.setAssessor(admin1.getName());
		shopFormService.update(shopForm);
		System.out.println("feedback1:"+feedback1+"feedback2:"+feedback2);
		if(feedback1!=null&&feedback1!=""){
			admin1.setFeedback1(feedback1);
		}else{
			admin1.setFeedback2(feedback2);
		}
		adminService.update(admin1);
		
		
		//用于判断是否原本有账号
		String AUserName = shopForm.getAccount();
		QueryParam param = new QueryParam(1).add("userName",AUserName);
		Admin adm = adminService.get(param, false);
		//审核通过
		if(stat==1) {
			if(adm==null){//如果没有账号（那也就没有店铺）就新增账号和店铺
				//新增店铺后台登录账户
				System.out.println("新增店铺后台登录账户");
				String fun = ",myshop,coupon,couponadd,couponedit,coupondel,myseckill,stafflist,staffedit,staffadd,category,categoryadd,categoryedit,categorydel,product,padd,pedit,pdel,inventory,inventoryadd,comment,commentedit,order,orderedit,";
				Admin admin = new Admin();
				admin.setName(shopForm.getShopName());
				admin.setPassword(shopForm.getPassword());
				admin.setUserName(shopForm.getAccount());
				admin.setCompany(shopForm.getCompanyname());
				admin.setPhone(shopForm.getPhone());
				admin.setEmail(email);
				admin.setCreateDate(date.getTime());//账号创建日期
				admin.setFunctionitems(fun);//创建后给予的权限
				admin.setPermission(1);//店铺属性1
				admin.setState(0);//账号可用
				Integer adminid = adminService.save(admin);
				//新增店铺
				Shop shop = new Shop();
				shop.setCreateDate(date.getTime());//同意开店日期
				shop.setName(shopForm.getShopName());//店名
				shop.setDescription(shopForm.getDescription());//店铺描述
				shop.setLogo(shopForm.getLogo());
				shop.setAdmin(adminid);//店铺创始人id，店铺总管理员id
				Integer shopid=shopService.save(shop);
				//将新增的店铺id保存到ademin里
				Admin admin2= adminService.get(adminid);
				admin2.setShopId(shopid);
				
				adminService.update(admin2);
				
				String front ="";
				String content = front + reason;
				System.out.println(content);
				SmsUtil.sendSms(content, phone);
				String toMail=email;
				String name = "卖疯乐";
				String subject = "卖疯乐邮箱验证";
				System.out.println("toMail:"+toMail);
				if(toMail!=null){
					mailService.sendMail(name, subject, content, toMail);
				}
				
				
			}else if(adm.getState()==1){//1账号禁用 0可用，（有账号/店铺 ,但账号不能用）
					adm.setState(0);
					adminService.save(adm);
					
					////////还需要加个 旗下管理员账号也可用
					
			}else{//0可用,（有账号/店铺，而且都能用），就不操作了，正常也不会出现这步。
				
			}
			
				String front ="";
				String content = front + reason;
				System.out.println(content);
				SmsUtil.sendSms(content, phone);
				String toMail=email;
				String name = "卖疯乐";
				String subject = "卖疯乐邮箱验证";
				System.out.println("toMail:"+toMail);
				if(toMail!=null){
					mailService.sendMail(name, subject, content, toMail);
				}
			
			
		}else if(stat==-1){
			if(adm != null){//若不为空，就原本有账号，不管状态原本是否可用都设置为 1禁用
				adm.setState(1);
				adminService.save(adm);
				
				/////////还需要加个 旗下管理员账号也不可以用
			}
			//管理员填写不通过的原因并以短信或邮件的方式发送给客户
	        String front ="";
			String content = front + reason;
			System.out.println(content);
			SmsUtil.sendSms(content, phone);
			String toMail=email;
			String name = "卖疯乐";
			String subject = "卖疯乐邮箱验证";
			System.out.println("toMail:"+toMail);
			if(toMail!=null){
				mailService.sendMail(name, subject, content, toMail);
			}
					
		}
		
		return ajaxHtml("success");
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getLicense() {
		return license;
	}

	public void setLicense(String license) {
		this.license = license;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getStat() {
		return stat;
	}

	public void setStat(Integer stat) {
		this.stat = stat;
	}

	public int getRegisternum() {
		return registernum;
	}

	public void setRegisternum(int registernum) {
		this.registernum = registernum;
	}

	public String getCompanyname() {
		return companyname;
	}

	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}

	public int getIdnum() {
		return idnum;
	}

	public void setIdnum(int idnum) {
		this.idnum = idnum;
	}


	public Integer getTt() {
		return tt;
	}


	public void setTt(Integer tt) {
		this.tt = tt;
	}

	


	public String getReason() {
		return reason;
	}


	public void setReason(String reason) {
		this.reason = reason;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	

	public String getFeedback2() {
		return feedback2;
	}


	public void setFeedback2(String feedback2) {
		this.feedback2 = feedback2;
	}
	
	public String getFeedback1() {
		return feedback1;
	}


	public void setFeedback1(String feedback1) {
		this.feedback1 = feedback1;
	}



	
}
