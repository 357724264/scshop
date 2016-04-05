document.onkeydown = function(e){
	if($(".bac").length==0)
	{
		if(!e) e = window.event;
		if((e.keyCode || e.which) == 13){
			var obtnLogin=document.getElementById("submit-btn");
			obtnLogin.focus();
		}
	}
}

jQuery(document).ready(function(){

	// login验证
	$('#submit-btn').click(function(){
		user();
		pass();
		if(user()==true && pass()==true){
			var submitData = {};
			submitData["iphone"] = $("#username").val();
			submitData["password"] = $("#password").val();
			$.ajax({
				type:'post',
				url:'',
				dataType:'json',
				data:submitData,
				async:false,
				success:function(data){
					if(data.success){
						window.location.href='';
					}else{
						$('#username').parent().addClass("has-error");
           				$('.user-error').html("用户名或密码错误！");
					}
				},
				error:function(data){
					$('#username').parent().addClass("has-error");
       				$('.user-error').html("数据错误，请联系管理员！");
				}
			})
		}
	})

	// register验证
	$('#register-btn').click(function(){
		user();
		pass();
		repass();
		identifyingcode();
		check();
		if(user()==true && pass()==true && repass()==true && identifyingcode()==true&& check()==true){
			alert("ok");
			var submitData = {};

			submitData["iphone"] = $("#username").val();
			submitData["password"] = $("#password").val();

			$.ajax({
				type:'post',
				url:'',
				dataType:'json',
				data:submitData,
				async:false,
				success:function(data){
					if(data.success){
						window.location.href='';
					}else{
						$('#username').parent().addClass("has-error");
           				$('.user-error').html("用户名或密码错误！");
					}
				},
				error:function(data){
					$('#username').parent().addClass("has-error");
       				$('.user-error').html("数据错误，请联系管理员！");
				}
			})
		}
	})

	$('#username').blur(function(){
		user();
	})
	$('#password').blur(function(){
		pass();
		repass();
	})

	$('#repassword').blur(function(){
		repass();
	})

	$('#identifyingcode').blur(function(){
		identifyingcode();
	})

	$('#check').blur(function(){
		check();
	})

	function user(){
		var username = $('#username').val();
		var myReg = /^(13[\d]{9}|15[\d]{9}|18[\d]{9})$/; //邮件正则
		if(username==''){
			$('#username').parent().addClass("has-error");
           	$('.user-error').html("请输入手机号码！");
           	return false;
        }else if(!myReg.test(username)){
        	$('#username').parent().addClass("has-error");
           	$('.user-error').html("请输入正确的手机号码！");
           	return false;
        }else{
        	$('#username').parent().removeClass("has-error");
           	$('.user-error').html("");
           	return true;
        }
	}
	function pass(){
		var password = $('#password').val();
		if(password==''){
			$('#password').parent().addClass("has-error");
           	$('.pass-error').html("请输入密码！");
           	return false;
        }else{
        	$('#password').parent().removeClass("has-error");
           	$('.pass-error').html("");
           	return true;
        }
	}

	function repass(){
		var password = $('#password').val();
		var repassword = $('#repassword').val();
		if(repassword!=password){
			$('#repassword').parent().addClass("has-error");
           	$('.repass-error').html("两次密码输入不一至！");
           	return false;
        }else{
        	$('#repassword').parent().removeClass("has-error");
           	$('.repass-error').html("");
           	return true;
        }
	}

	function identifyingcode(){
		var identicode = $('#identifyingcode').val();
		if(identicode==''){
			$('#identifyingcode').parent().addClass("has-error");
           	$('.ident-error').html("请输入验证码！");
           	return false;
        }else{
        	$('#identifyingcode').parent().removeClass("has-error");
           	$('.ident-error').html("");
           	return true;
        }
	}

	function check(){
		var check=$('#check');
		if(check.is(':checked')){
			$('#check').parent().removeClass("has-error");
           	$('.check-error').html("");
           	return true;
        }else{        	
           	$('#check').parent().addClass("has-error");
           	$('.check-error').html("请阅读并同意协议！");           	
           	return false;
        }
	}

})