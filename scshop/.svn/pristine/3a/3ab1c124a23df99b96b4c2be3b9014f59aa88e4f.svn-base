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
</style>

</head>


<body>


