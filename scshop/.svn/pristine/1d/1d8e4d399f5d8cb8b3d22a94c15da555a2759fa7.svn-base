<!-- 板块公共开始 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>SC商城管理后台</title>
<link rel="stylesheet" type="text/css" href="${base}/static/admin/css/admin.css" />
<script type="text/javascript" src="${base}/static/admin/js/jquery-1.7.1.js"></script>
<script type="text/javascript" src="${base}/static/admin/js/public.js?v=1"></script>
<script type="text/javascript" src="${base}/static/admin/js/jquery.page.js"></script>
<script type="text/javascript" src="${base}/static/admin/js/getarea.js"></script>

<!--start编辑框样式+js-->
<script src="${base}/static/admin/umeditor/ueditor.config.js" type="text/javascript" charset="utf-8"></script>
<script src="${base}/static/admin/umeditor/ueditor.all.js" type="text/javascript" charset="utf-8"></script>
<script src="${base}/static/admin/umeditor/ueditor.parse.js" type="text/javascript" charset="utf-8"></script>
<script src="${base}/static/admin/umeditor/lang/zh-cn/zh-cn.js" type="text/javascript" charset="utf-8"></script>
<!--end编辑框样式+js-->

<!-- start检测表单 -->
<link rel="stylesheet" type="text/css" href="${base}/static/admin/css/validationEngine.jquery.css" />
<script type="text/javascript" src="${base}/static/admin/js/jquery.ajaxfileupload.js"></script>
<script type="text/javascript" src="${base}/static/admin/js/jquery.validationEngine-zh_CN.js"></script>
<script type="text/javascript" src="${base}/static/admin/js/jquery.validationEngine.js"></script>
<script type="text/javascript" src="${base}/static/admin/js/jquery.form.js"></script>
<!-- end检测表单 -->

<!-- start时间控件-->
<link rel="stylesheet" type="text/css" href="${base}/static/admin/css/jquery.datetimepicker.css" />
<script type="text/javascript" src="${base}/static/admin/js/jquery.datetimepicker.js"></script>
<!-- end时间控件 -->

<!-- 头像剪切、水印设置等弹出框 -->
<script type="text/javascript" src="${base}/static/admin/js/artDialog4.1.6/jquery.artDialog.js?skin=default"></script>
<script type="text/javascript" src="${base}/static/admin/js/artDialog4.1.6/plugins/iframeTools.js"></script>
<!-- end头像剪切 -->


<style>
.mask,.mask_ecard,.dia_bg,.reg_error,.mask_ewm{background: url(${base}/static/admin/img/black.png) repeat;}
.zxnav_gl{background: url(${base}/static/admin/img/nav_gl.png) no-repeat 25px center;}
.zxnav_sz{background: url(${base}/static/admin/img/nav_sz.png) no-repeat 25px center;}
.zxnav_tg{background: url(${base}/static/admin/img/nav_tg.png) no-repeat 25px center;}
.zxnav_sj{background: url(${base}/static/admin/img/nav_sj.png) no-repeat 25px center;color:#f10;}
.zxnav_sj:hover{background: #eee url(${base}/static/admin/img/nav_sj.png) no-repeat 25px center;}
.zxnav_sj.on{background: #36a65a url(${base}/static/admin/img/nav_sj.png) no-repeat 25px center;color:#fff;}
.menu_add{background: url(${base}/static/admin/img/do_xz.png) no-repeat;}
.menu_del{background: url(${base}/static/admin/img/do_sc.png) no-repeat;}
.menu_edit{background: url(${base}/static/admin/img/do_bj.png) no-repeat;}
.menu_addspace{background: url(${base}/static/admin/img/do_xz.png) no-repeat;}
.menu_delspace{background: url(${base}/static/admin/img/do_sc.png) no-repeat;}
.menu_editspace{background: url(${base}/static/admin/img/do_bj.png) no-repeat;}
.menu_close,.box_close{background: url(${base}/static/admin/img/do_gb.png) no-repeat;}
.menu_close_unclear{background: url(${base}/static/admin/img/do_gb.png) no-repeat;}
.img_edit{background: url(${base}/static/admin/img/img_edit.png) no-repeat;}
.img_del{background: url(${base}/static/admin/img/img_del.png) no-repeat;}
.do_tip{background:url(${base}/static/admin/img/do_tip.png) no-repeat;}
.img_edit2{background: url(${base}/static/admin/img/img_edit2.png) no-repeat;}
.img_del2{background: url(${base}/static/admin/img/img_del2.png) no-repeat;}

/*新增图标*/
.menu_inquery{background: url(${base}/static/admin/img/iconfont-inquery.png) no-repeat; background-size:20px 20px;} /* 查询 */
.menu_qunzuduoren{background: url(${base}/static/admin/img/iconfont-qunzuduoren.png) no-repeat; background-size:20px 20px;} /* 多人 */
.menu_tianjia{background: url(${base}/static/admin/img/iconfont-tianjia.png) no-repeat; background-size:20px 20px;} /* 添加 */
.menu_paixu{background: url(${base}/static/admin/img/iconfont-paixu.png) no-repeat; background-size:20px 20px;} /* 上下前头 */


/* 权限设置 */
a.btn_yes{background:url(${base}/static/admin/img/btn_yes.png) no-repeat;}
a.btn_no{background:url(${base}/static/admin/img/btn_no.png) no-repeat;}
.zxmenu_bar.on .menu_add{background: url(${base}/static/admin/img/do_xz2.png) no-repeat;}
.zxmenu_bar.on .menu_edit{background: url(${base}/static/admin/img/do_bj2.png) no-repeat;}
.zxmenu_bar.on .menu_del{background: url(${base}/static/admin/img/do_sc2.png) no-repeat;}
/* 切换公司 */
.zxhd2{
	float: left;
	padding: 33px 0 0;
	margin-right: 10px;
}
.zxcompany{
	display: inline-block;
	background: #444;
	color: #fff;
	height: 32px;
	line-height: 32px;
	padding: 0 12px;
}
#loading{
	background: url(${base}/static/admin/img/loadbg.png) repeat;
}
#loadtext{
	background: url(${base}/static/admin/img/black.png) repeat;
}
.zxhead{overflow:visible !important;}
.zmbox{overflow:visible;}
.zmenu{
	position:relative;
}
.tcmenu{width:120px; position:absolute; top:30px; left:-50%; background-color:#fff; text-align:center; box-shadow:1px 1px 2px #666,-1px -1px 2px #666; display:none; z-index:99999;}
.tcmenu span,.tcmenu em{
	display:block;
	width:30px;
	height:16px;
	font-size:30px;
	overflow:hidden;
	_position:relative;
	left:50%;
	margin-left:-15px;
	font-family:SimSun;
	position:relative;
}
.tcmenu em{margin-top:-16px;color:#999;font-style:normal; list-style:none; z-index:1;}
.tcmenu span{margin-top:-14px;color:#fff; z-index:2}
.tcmenu li{width:100%; height:34px; line-height:34px; position:relative;}
.tcmenu li:after{
	content:'';
    position:absolute;
    left:0;
    bottom:0;
    right:auto;
    top:auto;
    height:1px;
    width:100%;
    background-color:#999;
    display:block;
    z-index:2;
    -webkit-transform-origin:50% 100%;
    transform-origin:50% 100%;
    -webkit-transform: scaleY(.5);
    transform: scaleY(.5);
    backface-visibility:hidden;
}
.tcmenu li:last-child:after{
	height:0;
}
.tcmenu li a{display:block; width:100%; height:100%; color:#333; font-size:14px;}
.mea{line-height:30px; font-size:14px !important; color:#333 !important;}
.zmenu:hover .tcmenu{
	display:block;
}
  i{color:red;margin-right:3px;}
       .tccbox{width:70%; height:80%; background:#fff; box-shadow:1px 1px 2px #ddd,-1px -1px 2px #ddd; position:fixed;top:10%; left:15%; padding:10px; z-index:802; display:none;}
       .tccbox .tcc-scroll{width:100%; height:100%; padding-top:30px; overflow:hidden; position:relative;}
       .tccbox .tcc-scroll .scroll-area{width:100%;height:100%; position:relative;}
       .tccbox .tcc-scroll .tcc-wrapper{width:100%; height:100%; position:absolute;top:0px; left:0; bottom:0; overflow-x:hidden; overflow-y:auto; z-index:1; word-wrap: break-word; word-break:break-all; line-height:18px; font-size:13px;}
       .tccbox .tcc-close{display:inline-block; width:30px; height:30px; font-size:18px; float:right; text-align:center; position:absolute; top:0; right:0; z-index:2; color:#666;}
       .pop{position: fixed;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background: rgba(0,0,0,.4);
    z-index:800;
    visibility: hidden;
    opacity: 0;
    -webkit-transition-duration: .3s;
    -moz-transition-duration: .3s;
    -o-transition-duration: .3s;
    -ms-transition-duration: .3s;
    transition-duration: .3s;}
    .pop-visible{
	    visibility:visible;
	    opacity:1;
	}
	.khyslr,.tj{visibility:hidden; opacity:0;position: fixed;}
</style>

</head>

<#assign admins = adminScshop />
<#assign functionitems=admins.functionitems />
<#assign permission=admins.permission />
<input type="hidden" id="functionitems" data-val="">

<body>

<!-- 提交加载提示 -->
<div id="loading">
	<div id="loadtext">
		<h1><img src="${base}/static/admin/img/loading4.gif"></h1>
		<p>加载中，请稍候…</p>
	</div>
</div>


<div class="zxhead">
	<div class="main">
		<a href="info!set">
			<span class="zxlogo">
				<img src="">
			</span>
		</a>
		<div class="zxinfo">
			<table cellspacing="0" cellpadding="0">
				<tr>
					<td rowspan="2">
					</td>
					<td>
						<div class="zxinfo_01">
							<span class="green"></span>
						</div>
					</td>
				</tr>
				
				<tr>
					<td>
						<div class="zxinfo_02 zmbox">
							<div class="zmenu">
								<a href="javascript:;" class="mea">用户中心</a>
								<ul class="tcmenu">
									<span>&#9670;</span>
									<em>&#9670;</em>
									<li><a href="customer!alterpass.action">修改密码</a></li>
									<li><a href="logout.action">退出</a></li>
								</ul>	
							</div>
												
						</div>
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>

<div style="margin: 20px auto 0;width:1202px;display:none;">
	<a href=""><img src="" style="width:1202px;"></a>
</div>

<div class="zxmain">
	<div class="zxnav">
		<div class="zxnav_div">
				<div class="zxnav_title zxnav_sz">网站管理</div>
			</div>
			<div class="zxnav_ul">
				<ul>
					<#if functionitems?index_of(",webinfo,") gte 0>
						<a href="webinfo.action">
							<li id="wzpz">网站配置</li>
						</a>
					</#if>
					<#if functionitems?index_of(",ad,") gte 0>
						<a href="ad!list.action?nn=3&&ii=1">
							<li id="sygg">首页管理</li>
						</a>
					</#if>
					<#if functionitems?index_of(",kuaidi,") gte 0>
					<a href="kuaidi!list.action#">
						<li id="kdgs">快递公司</li>
					</a>
					</#if>
					<#if functionitems?index_of(",member,") gte 0>
					<a href="member!list.action#">
						<li id="djgl">会员等级</li>
					</a>
					</#if>
					<#if functionitems?index_of(",shop,") gte 0>
					<a href="shop_form!list.action">
						<li id="dpsh">店铺审核</li>
					</a>
					</#if>
					
					<#if functionitems?index_of(",ceskill,") gte 0>
					<a href="seckill!auditList.action">
						<li id="yhhd">优惠活动管理</li>
					</a>
					</#if>
					
					<#if functionitems?index_of(",customer,") gte 0>
					<a href="customer!list.action">
						<li id="yhgl">用户管理</li>
					</a>
					</#if>
					
					<#if functionitems?index_of(",country,") gte 0>
					<a href="country!list.action">
						<li id="gjxx">国家信息管理</li>
					</a>
					</#if>
				</ul>
			</div>
			<div class="zxnav_div">
				<div class="zxnav_title zxnav_gl">商城管理</div>
			</div>
			<div class="zxnav_ul">
				<ul>
					<#if functionitems?index_of(",brand,") gte 0>
					<a href="brand!list.action">
						<li id="scpp">商城品牌管理</li>
					</a>
					</#if>
					<#if functionitems?index_of(",coupon,") gte 0>
					<a href="coupon!list.action">
						<li id="yhq">优惠券管理</li>
					</a>
					</#if>
					<#if functionitems?index_of(",myseckill,") gte 0>
					<a href="seckill!applyList.action">
						<li id="myyh">我的优惠活动</li>
					</a>
					</#if>
					<#if functionitems?index_of(",myshop,") gte 0>
					<a href="shop!list.action">
						<li id="dpgl">我的店铺</li>
					</a>
					</#if>
					<#if functionitems?index_of(",stafflist,") gte 0>
					<a href="admin!list.action">
						<li id="wdzy">我的管理员</li>
					</a>
					</#if>
					<#if functionitems?index_of(",category,") gte 0>
					<a href="category!list.action">
						<li id="flgl">分类管理</li>
					</a>
					</#if>
					<#if functionitems?index_of(",product,") gte 0>
					<a href="product!list.action">
						<li id="zysp">自营商品管理</li>
					</a>
					</#if>
					<#if functionitems?index_of(",inventory,") gte 0>
					<a href="inventory!list.action">
						<li id="kcgl">库存管理</li>
					</a>
					</#if>
					<#if functionitems?index_of(",comment,") gte 0>
					<a href="comment!list.action?productid=0">
						<li id="plgl">评论管理</li>
					</a>
					</#if>
					<#if functionitems?index_of(",order,") gte 0>
					<a href="order!list.action">
						<li id="ddgl">订单管理</li>
					</a>
					</#if>
				</ul>
			</div>
			
			<!--<div class="zxnav_ul">
				<ul>
					<a href="leavemanager!leavemanagerList">
						<li id="lygl">留言管理</li>
					</a>
					<a href="develop">
						<li id="tgjl">推广奖励</li>
					</a>
				</ul>
			</div>-->
	</div>
	<div class="tccbox">
		<a href="javascript:;" class="tcc-close">&#10005;</a>
		<div class="tcc-scroll">
			<div class="scroll-area">
				<div class='tcc-wrapper'>
					
				</div>
			</div>
		</div>
	</div>
    
    <div class="pop"></div>
    <p class="khyslr">${webInfo.privacy}</p>
    <p class="tj">${webInfo.clause}</p>
    <script type="text/javascript">
    $(function(){
			$(document).on('click','.khys',function(){
				var khys=$('.khyslr').html();
				$('.tcc-wrapper').html(khys);
				$('.pop').addClass('pop-visible');
				$('.tccbox').fadeIn();
			})
			$(document).on('click','.tiaojian',function(){
				var tj=$('.tj').html();
				$('.tcc-wrapper').html(tj);
				$('.pop').addClass('pop-visible');
				$('.tccbox').fadeIn();
			})
			$(document).on('click','.tcc-close',function(){
				$('.tccbox').fadeOut();
				$('.pop').removeClass('pop-visible');
			})
		})
    </script>
