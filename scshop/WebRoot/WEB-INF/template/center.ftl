
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>个人中心</title>
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">

<link rel="stylesheet" href="http://g.alicdn.com/msui/sm/0.5.6/css/sm.min.css">
<link rel="stylesheet" href="http://g.alicdn.com/msui/sm/0.5.6/css/sm-extend.min.css">
<link rel="stylesheet" href="http://g.alicdn.com/msui/sm/0.5.6/css/sm-extend.min.css">
<link rel="stylesheet" href="${base}/static/fonts/iconfont.css">
<link rel="stylesheet" href="${base}/static/css/myapp.css">
</head>
<body>
	<!-- 个人中心 -->
	<div class="page page-current" id='router'>
	  	<header class="bar bar-nav" id="second-bar">
		    <a class="button button-link button-nav pull-left" href="index.action" data-transition='slide-out'>
		      	<span class="icon iconfont icon-xiangzuo2"></span>
		    </a>
	    	<h1 class="title">个人中心</h1>
	  	</header>

	  	<#include "/WEB-INF/template/nav.ftl" />

	  	<div class="content padd-content">
	  		<div class="grzx-headbox">
	  			<a href='#router2'>
	  				<div class="grzx-avatar"><img src="${customer.pic}" alt="头像" id="centerhead"/></div>
	  				<div class="grzx-tit">
			  			<#if customer.name?length<=0>${customer.phone}<#else>${customer.name}</#if>
			  		</div>
			  		<i class="iconfont icon-xiangyou1 grzx-jt"></i>
	  			</a>
	  		</div>

	  		<div class="bar bar-tab grzx-bar">
			  	<a class="tab-item external" href="order!list.action?tt=0">
				    <span class="icon iconfont icon-daifukuan"></span>
				    <span class="tab-label">待付款</span>
				    <#if unpay gt 0><span class="badge">${unpay}</span></#if>
			  	</a>
			  	<a class="tab-item external" href="order!list.action?tt=1">
				    <span class="icon iconfont icon-daifahuo01"></span>
				    <span class="tab-label">待发货</span>
				    <#if paid gt 0><span class="badge">${paid}</span></#if>
			  	</a>
			  	<a class="tab-item external" href="order!list.action?tt=2">
				    <span class="icon iconfont icon-daifahuo011"></span>
				    <span class="tab-label">已发货</span>
				    <#if send gt 0><span class="badge">${send}</span></#if>
			  	</a>
			  	<a class="tab-item external" href="order!list.action?tt=3">
				    <span class="icon iconfont icon-daipingjia1"></span>
				    <span class="tab-label">待评价</span>
				    <#if deal gt 0><span class="badge">${deal}</span></#if>
			  	</a>
		  	  	<a class="tab-item external" href="order!refund.action">
				    <span class="icon iconfont icon-tuikuan-shouhou"></span>
				    <span class="tab-label">退款/售后</span>
			  	</a>
			</div>

			<div class="grzx-listgroup">
				<a class="external"  href="order!list.action">
					<i class='iconfont icon-dingdan grzxlbicon'></i>&nbsp;我的订单
					<span class="grzxlg-right">查看全部订单<i class='iconfont icon-xiangyou1'></i></span>
				</a>
			</div>
			<div class="grzx-listgroup">
					<a class="external" href="bankcard!list.action">
						<i class='iconfont icon-card1 grzxlbicon'></i>&nbsp;我的银行卡
						<span class="grzxlg-right">查看银行卡<i class='iconfont icon-xiangyou1'></i></span>
					</a>
			</div>
			<div class="grzx-listbox">
				<div class="grzx-listgroup">
					<a class="external" href="coupon!list.action">
						<i class='iconfont icon-youhuiquan grzxlbicon'></i>&nbsp;我的优惠券
						<span class="grzxlg-right">查看优惠券<i class='iconfont icon-xiangyou1'></i></span>
					</a>
				</div>
				<div class="grzx-listgroup">
					<a class="external" href="point!list.action">
						<i class='iconfont icon-jifen grzxlbicon'></i>&nbsp;我的积分
						<span class="grzxlg-right">您有${customer.point}积分<i class='iconfont icon-xiangyou1'></i></span>
					</a>
				</div>
				
				<div class="grzx-listgroup">
					<a  class="external" href="address!list.action">
						<i class='iconfont icon-dizhi grzxlbicon'></i>&nbsp;收货地址管理
						<span class="grzxlg-right"><i class='iconfont icon-xiangyou1'></i></span>
					</a>
				</div>
			<!--	<div class="grzx-listgroup">
					<a class="external" href="#">
						<i class='iconfont icon-shoudongtuiguang grzxlbicon'></i>&nbsp;我的推广
						<span class="grzxlg-right"><i class='iconfont icon-xiangyou1'></i></span>
					</a>
				</div>-->
			</div>
	  	</div>
	</div>

	<!-- 个人信息  customer.data-->
	<div class="page" id='router2'>
	  	<header class="bar bar-nav" id="second-bar">
		    <a class="button button-link button-nav pull-left" href="#router" data-transition='slide-out'>
		      	<span class="icon iconfont icon-xiangzuo2"></span>
		    </a>
	    	<h1 class="title">个人信息</h1>
	  	</header>

	  	<div class="content padd-content">
	  		<div class="grxx-box">
	  			<table>
	  				<tbody>
	  					<tr>
	  						<td class="td1">头像</td>
	  						<td class="td2">
	  							<div class="abm-img">
	  								<input  accept="image/*" type="file" id="file" name="file" />
	  								<img id="headimg" src="${customer.pic}" onerror="this.src='${base}/static/images/iconfont-touxiang.png'" />
	  							</div>
	  						</td>
	  					</tr>
	  					<tr>
	  						<td class="td1">昵称</td>
	  						<td class="td2"><a class="external" href="customer!nickname.action">
	  						<#if customer.name?length<=0>${customer.phone}<#else>${customer.name}</#if>
	  						</a></td>
	  					</tr>
	  				</tbody>
	  			</table>
	  		</div>

	  		<h5 class="obm-tit">安全管理</h5>
	  		<div class="grxx-box">
	  			<table>
	  				<tbody>
	  					<tr>
	  						<td class="td1">手机号码</td>
	  						<td class="td2"><a class="external" href="customer!changephone.action">${customer.phone}</a></td>
	  					</tr>
	  					<tr>
	  						<td class="td1">电子邮箱</td>
	  						<td class="td2">
	  					    <a class="external" href="login!email.action">
	  		                   <#if customer.emailtest==1>
				                                        已认证
				               </#if>
				               <#if customer.emailtest==0>
				              	 未认证
				               </#if>
				           </a></td>
	  					</tr>
	  					<tr>
	  						<td class="td1">登录密码</td>
	  						<td class="td2"><a class="external"   href="customer!alterpass.action">修改</a></td>
	  					</tr>
	  					<tr>
	  						<td class="td1">会员等级</td>
	  						<td class="td2">
	  							<a href="#"><!--#router3-->
	  								<#if customer.memberrank??>
	  								${customer.memberrank}级
	  								<#else>
	  								无
	  								</#if>
	  							<!--	<#if customer.agentid??>
	  									${agent.name}
	  								<#else>
	  									<#if agentBill??&&agentBill.applystate??>
	  										<#if agentBill.applystate==0>申请中</#if>
	  										<#if agentBill.applystate==-1>申请失败</#if>
	  									<#else>
	  										申请
	  									</#if>
	  								</#if> -->
	  							</a> 
	  						</td>
	  					</tr>
	  				</tbody>
	  			</table>
	  		</div>

	  		<div class="defaultbtnbox">
	  			<button type="button" onclick="logout()" class="logofftbtn">注销</button>
	  		</div>
	  	</div>	  	
	</div>

	<!-- 申请代理页面 -->
	<div class="page" id='router3'>
	  	<header class="bar bar-nav" id="second-bar">
		    <a class="button button-link button-nav pull-left back" href="#router2" data-transition='slide-out'>
		      	<span class="icon iconfont icon-xiangzuo2"></span>
		    </a>
	    	<h1 class="title">申请代理</h1>
	  	</header>

	  	<div class="content padd-content">
	  		<div class="registerbox">
	  			<div class="regist-group">
	  				<input type="text" id="phone" value="${(agentBill.phone)!}" class="regist-ipt" autocapitalize="off" autocomplete="off" spellcheck="true" placeholder="请输入手机号码" />
	  			</div>
	  			<div class="regist-group">
	  				<input type="text" id="name" value="${(agentBill.name)!}" class="regist-ipt" autocapitalize="off" autocomplete="off" spellcheck="true" placeholder="请输入真实姓名" />
	  			</div>
	  			<div class="regist-group">
	  				<input type="text" id="idnum" value="${(agentBill.idnum)!}" class="regist-ipt" autocapitalize="off" autocomplete="off" spellcheck="true" placeholder="请输入身份证号码" />
	  			</div>
	  			<div class="regist-group">
	  				<input type="text" id="nowaddress" value="${(agentBill.nowaddress)!}" class="regist-ipt" autocapitalize="off" autocomplete="off" spellcheck="true" placeholder="请输入可联系地址" />
	  			</div>
	  			
	  		</div>

	  		<div class="defaultbtnbox">
	  			<button type="button" class="dia_btn dialog_ok defaultbtn"  
	  					<#if agentBill??>style="background:#A9A9A9" disabled="disabled"</#if>
	  					<#if customer.agentid??>style="background:#A9A9A9" disabled="disabled"</#if>
	  			>
	  					提交申请
	  			</button>

	  		</div>
	  	</div>
	</div>

	<script type='text/javascript' src='http://g.alicdn.com/sj/lib/zepto/zepto.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='http://g.alicdn.com/msui/sm/0.5.7/js/sm.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='http://g.alicdn.com/msui/sm/0.5.7/js/sm-extend.min.js' charset='utf-8'></script>
    <script type="text/javascript" src="${base}/static/script/lrz.bundle.js"></script>
   <script type="text/javascript" src="${base}/static/js/jquery-1.8.2.min.js"></script>
     <script type="text/javascript" src="${base}/static/js/jquery.ajaxfileupload.js"></script>
    <script type="text/javascript">
       
       function logout(){
           $.ajax({
                url:'logout.action',
                success:function(html){
                  var json = eval("("+html+")");
                     if(json.success){
                         location.href="login.action";
                     }
                }
           })
       }
       
		$(function(){
			$("#file").bind("change",function(){
				 fileuploadimg();
			})
		})
		function updateimg(img){
			var p = img;
			$.ajax({
				url:'${base}/json/customer!updateimg.action',
				data:{img:p},
				type:"post",
				
			})
		}
		function fileuploadimg(){
 			$.ajaxFileUpload({
				url:'${base}/upload.action',       //需要链接到服务器地址
				secureuri:false,
				fileElementId:'file',                            //文件选择框的id属性
				dataType: 'text/html',                                   //服务器返回的格式，可以是json
				success: function (data, textStatus) {
					//兼容ie8以及以下版本
					var dat = eval("("+data+")");
					if(dat.success){
						var img = dat.bigurl;						
						$("#headimg").attr("src",img);
						$("#centerhead").attr("src",img);
						
						updateimg(img);
						$("#file").bind("change",function(){
				 			fileuploadimg();
						});
					}
					
					if(data.msg){
						alert(data.msg);
					}
					if(dat.msg){
						alert(dat.msg);
					}				
					//i++;
				}
		});
	}

    </script>
   	<script type="text/javascript" src="${base}/static/js/list.js"></script>
    <script type='text/javascript'>
    	$(function(){
    		$(".tab-item").eq(3).addClass("active");
    	})

    	$(function(){
        
        $(".dialog_ok").click(function(){
			var phone=$("#phone").val();
			var name=$("#name").val();
			var idnum=$("#idnum").val();
			var nowaddress=$("#nowaddress").val();
			if ($("#phone").val() == "") { 
				alert("手机号码不能为空！");
				return;
			}
			if (!$("#phone").val().match(/^(((13[0-9]{1})|1[0-9][0-9])+\d{8})$/)) { 
				alert("手机号码格式不正确！");
				return;
			}
			if (name==""||name==null) { 
				alert("请填写姓名！");
				return;
			}
			if (idnum==""||idnum==null) { 
				alert("请填写身份证号！");
				return;
			}
			if (nowaddress==""||nowaddress==null) { 
				alert("请填写联系地址！");
				return;
			}
		
			$.ajax({
				url:"json/customer!submitagent.action",
				type:"post",
				data:{"phone":phone,"name":name,"idnum":idnum,"nowaddress":nowaddress},
				success:function(html){
					if(html=="success"){
						alert("申请成功！");
						location.href="center.action";
					}else if(html=="have"){
						alert("已申请过！请耐心等待");
					}else{
						alert("未知错误！");
					}
				}
			});
	 	});
})
    
    	function checkTextLength(obj, length){      
           if(obj.value.length > length){                
               obj.value = obj.value.substr(0, length);   
           }   
		}
    </script>
</body>
</html>