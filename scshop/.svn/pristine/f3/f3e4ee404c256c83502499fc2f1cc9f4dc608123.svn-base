<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<html>
<head>
    <title>首页</title>
    <meta charset="utf-8">
    <meta name="keywords" content="">
    <!-- seo网站关键字 -->
    <meta name="description" content="">
    <!-- seo对网站的文字描述 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <!-- IE使用最新渲染模式，chrome框架使用webkit内核 -->
    <meta name='renderer' content="webkit">
    <!-- 让360浏览器使用webkit内核 -->
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <!-- 让屏幕1：1缩放，并且在移动设备上禁止放大缩小 -->

    <!-- 以下两个插件用于在IE8以及以下版本浏览器支持HTML5元素和媒体查询，如果不需要用可以移除 -->
    <!--[if lt IE 9]>
    <script src="${base}/static/js/html5shiv.js"></script>
    <script src="${base}/static/js/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="${base}/static/admin/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${base}/static/admin/css/agency.css">

    <script type="text/javascript" src="${base}/static/js/jquery-1.10.2.min.js"></script>

    <script type="text/javascript">
        $(function () {
            // register验证
            $('#register-btn').click(function () {
                user();
                pass();
                repass();
                identifyingcode();
                check();
                if (user() == true && pass() == true && repass() == true && identifyingcode() == true && check() == true) {
                    var phone = $("#username").val();
                    var code = $("#identifyingcode").val();
                    var adminname = $("#adminname").val();
                    var companyname = $("#companyname").val();
                    var pwd = $("#password").val();
					var description = $("#description").val();
					
					
                    $.ajax({
                        type: 'post',
                        url: 'shop_form!save.action',
                        dataType: 'json',
                        data: {phone: phone, code: code, password: pwd, shopName: companyname, userName: adminname,description:description},
                        async: false,
                        success: function (data) {
                            if (data.success) {
                                
                                window.location.href = data.url;
                            } else {
                               
                                $('#username').parent().addClass("has-error");
                                $('.user-error').html("用户名或密码错误！");
                            }
                        },
                        error: function (data) {
                            $('#username').parent().addClass("has-error");
                            $('.user-error').html("数据错误，请联系管理员！");
                        }
                    })
                }
            })

            function user() {
                var username = $('#username').val();
                var myReg = /^(13[\d]{9}|15[\d]{9}|18[\d]{9})$/; //邮件正则
                if (username == '') {
                    $('#username').parent().addClass("has-error");
                    $('.user-error').html("请输入手机号码！");
                    return false;
                } else if (!myReg.test(username)) {
                    $('#username').parent().addClass("has-error");
                    $('.user-error').html("请输入正确的手机号码！");
                    return false;
                } else {
                    $('#username').parent().removeClass("has-error");
                    $('.user-error').html("");
                    return true;
                }
            }

            function pass() {
                var password = $('#password').val();
                if (password == '') {
                    $('#password').parent().addClass("has-error");
                    $('.pass-error').html("请输入密码！");
                    return false;
                } else {
                    $('#password').parent().removeClass("has-error");
                    $('.pass-error').html("");
                    return true;
                }
            }

            function repass() {
                var password = $('#password').val();
                var repassword = $('#repassword').val();
                if (repassword != password) {
                    $('#repassword').parent().addClass("has-error");
                    $('.repass-error').html("两次密码输入不一至！");
                    return false;
                } else {
                    $('#repassword').parent().removeClass("has-error");
                    $('.repass-error').html("");
                    return true;
                }
            }

            function identifyingcode() {
                var identicode = $('#identifyingcode').val();
                if (identicode == '') {
                    $('#identifyingcode').parent().addClass("has-error");
                    $('.ident-error').html("请输入验证码！");
                    return false;
                } else {
                    $('#identifyingcode').parent().removeClass("has-error");
                    $('.ident-error').html("");
                    return true;
                }
            }

            function check() {
                var check = $('#check');
                if (check.is(':checked')) {
                    $('#check').parent().removeClass("has-error");
                    $('.check-error').html("");
                    return true;
                } else {
                    $('#check').parent().addClass("has-error");
                    $('.check-error').html("请阅读并同意协议！");
                    return false;
                }
            }

            var InterValObj; //timer变量，控制时间
            var count = 50; //间隔函数，1秒执行
            var curCount;//当前剩余秒数
            $('#identifying-btn').click(function () {
        　     			 curCount = count;
                //设置button效果，开始计时
                $("#identifying-btn").attr("disabled", "true");
                $("#identifying-btn").val(curCount + "秒后重新发送");
                InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次
                var phone = $("#username").val();
                $.ajax({
                    type: 'post',
                    url: '/json/sms!sendcodeforadmin.action',
                    dataType: 'json',
                    data: {adminphone: phone},
                    success: function (html) {
                        if (html == "success") {
                            //倒计时开始
                        } else {
                            alert("尚未填写手机号");
                        }
                    }
                })
            })

            //timer处理函数
            function SetRemainTime() {
                if (curCount == 0) {
                    window.clearInterval(InterValObj);//停止计时器
                    $("#identifying-btn").removeAttr("disabled");//启用按钮
                    $("#identifying-btn").val("重新发送验证码");
                }
                else {
                    curCount--;
                    $("#identifying-btn").val(curCount + "秒后重新发送");
                }
            }
        })

    </script>

</head>
<body>
<div class="container-fluid">
    <div class="row" style="border-bottom:1px solid #ba3a17">
        <div class='logo-area'>
            <img src="${base}/static/images/agency-logo.png" alt="SCSHOP"/>
        </div>
    </div>
    <form class="form-horizontal register-area">
        <div class="form-group">
            <label for="username" class="col-sm-4 control-label"><i>*</i>手机号码</label>

            <div class="col-sm-3">
                <input type="text" class="form-control" id="username" name="phone" placeholder="今后使用手机号码登陆">
                <span class="errors user-error"></span>
            </div>
        </div>
        <div class="form-group">
            <label for="username" class="col-sm-4 control-label"><i>*</i>短信验证码</label>

            <div class="col-sm-3 ident">
                <input type="text" class="form-control" maxlength="6" id="identifyingcode" name="code"
                       placeholder="请输入收到的手机验证码">
                <input type="button" id="identifying-btn" value="获取验证码" <#--onclick="sendMessage()-->"/>
                <span class="errors ident-error"></span>
            </div>
        </div>
        <div class="form-group">
            <label for="username" class="col-sm-4 control-label">用户名</label>

            <div class="col-sm-3">
                <input type="text" class="form-control" id="adminname" name="userName" placeholder="请输入商户名">
                <span class="errors comp-error"></span>
            </div>
        </div>
        <div class="form-group">
            <label for="username" class="col-sm-4 control-label">店名</label>

            <div class="col-sm-3">
                <input type="text" class="form-control" id="companyname" name="shopName" placeholder="请输入店名">
                <span class="errors comp-error"></span>
            </div>
        </div>
        
        <div class="form-group">
            <label for="username" class="col-sm-4 control-label"><i>*</i>设置密码</label>

            <div class="col-sm-3">
                <input type="password" class="form-control" id="password" name="password" placeholder="6~20个字符">
                <span class="errors pass-error"></span>
            </div>
        </div>
        <div class="form-group">
            <label for="username" class="col-sm-4 control-label"><i>*</i>确认密码</label>

            <div class="col-sm-3">
                <input type="password" class="form-control" id="repassword" placeholder="请再输入一次">
                <span class="errors repass-error"></span>
            </div>
        </div>
        <div class="form-group">
            <label for="username" class="col-sm-4 control-label">店铺描述</label>

            <div class="col-sm-3">
                <input type="text" class="form-control" id="description" name="description" placeholder="没有就不用填啦~">
                <span class="errors invite-error"></span>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-4 col-sm-4">
                <div class="checkbox check-regist">
                    <label>
                        <input type="checkbox" id="check"> 我已阅读并同意<a href="#">《scshop商家注册协议》</a>
                        <span class="errors check-error"></span>
                    </label>
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-4 col-sm-3">
                <button type="button" id="register-btn">立即注册</button>
            </div>
        </div>
    </form>
    <h5 class="text-center">XX科技有限公司</h5>
</div>

<script type="text/javascript" src="${base}/static/js/bootstrap.min.js"></script>
</body>
</html>
