
(function ($) { 
	var defaults = { 
		'error':'请输入内容！',
		version:'1.0'
    }; 
    function idCard(val) {
        if ((/^\d{15}$/).test(val)) {
            return true;
        } else if ((/^\d{17}[0-9xX]$/).test(val)) {
            var vs = "1,0,x,9,8,7,6,5,4,3,2".split(","),
                ps = "7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2".split(","),
                ss = val.toLowerCase().split(""),
                r = 0;
            for (var i = 0; i < 17; i++) {
                r += ps[i] * ss[i];
            }
            return (vs[r % 11] == ss[17]);
        }
    }
	$.fn.extend({
		
	required:function(options){
            var options = $.extend({},defaults, options);
			options.error="必须填写";
			var value=$(this).val();			
			$(this).parent().find('.onError').remove();	

			if(value!=""){
				$(this).parent().find('.onError').remove();
				return true;
			}else{				
				$(this).parent().append("<span class='onError'>"+options.error+"</span>");
				return false;
			}
        },
        
		integer:function(){
			var options = $.extend({},defaults, options);
			var reg=/^-?[1-9]\d*$/;
			options.error="必须输入整数";
			var value=$(this).val();			
			$(this).parent().find('.onError').remove();	

			if(reg.test(value)){
				$(this).parent().find('.onError').remove();
				return true;
			}else{				
				$(this).parent().append("<span class='onError'>"+options.error+"</span>");
				return false;
			}
		},
		numb:function(){
			var options = $.extend({},defaults, options);
			var reg=/^\d+$/;
			options.error="必须输入正整数";
			var value=$(this).val();			
			$(this).parent().find('.onError').remove();	

			if(reg.test(value)){
				$(this).parent().find('.onError').remove();
				return true;
			}else{				
				$(this).parent().append("<span class='onError'>"+options.error+"</span>");
				return false;
			}
		},
		url:function(options){
			var options = $.extend({},defaults, options);
			var reg=/^(ftp|http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?$/;
			options.error="URL格式错误(例：http://www.baidu.com)";
			var value=$(this).val();
			$(this).parent().find('.onError').remove();	

			if(reg.test(value)){
				$(this).parent().find('.onError').remove();
				return true;
			}else{				
				$(this).parent().append("<span class='onError'>"+options.error+"</span>");
				return false;
			}
		},
		phone:function(options){
			var options = $.extend({},defaults, options);
			options.error="手机号码不合法";
			var reg =/^(13[\d]{9}|15[\d]{9}|18[\d]{9})$/;			
			var value=$(this).val();
			$(this).parent().find('.onError').remove();	
			if(reg.test(value)){
				$(this).parent().find('.onError').remove();
				return true;
			}else{				
				$(this).parent().append("<span class='onError'>"+options.error+"</span>");
				return false;
			}
		},
		email:function(options){
			var options = $.extend({},defaults, options);
			options.error="邮件地址错误";
			var reg = /^([A-Z0-9]+[_|\_|\.]?)*[A-Z0-9]+@([A-Z0-9]+[_|\_|\.]?)*[A-Z0-9]+\.[A-Z]{2,3}$/i;
			var value=$(this).val();
			$(this).parent().find('.onError').remove();	
			if(reg.test(value)){
				$(this).parent().find('.onError').remove();
				return true;
			}else{				
				$(this).parent().append("<span class='onError'>"+options.error+"</span>");
				return false;
			}
		},
		abc_numb:function(options){
			var options = $.extend({},defaults, options);
			options.error="必须为字母或数字";
			var reg = /^[a-z0-9]+$/i;	
			var value=$(this).val();
			$(this).parent().find('.onError').remove();	
			if(reg.test(value)){
				$(this).parent().find('.onError').remove();
				return true;
			}else{				
				$(this).parent().append("<span class='onError'>"+options.error+"</span>");
				return false;
			}
		},
		idcard:function(options){
			var options = $.extend({},defaults, options);
			options.error="身份证格式错误";
			var value=$(this).val();
			$(this).parent().find('.onError').remove();	
			if(idCard(value)){
				$(this).parent().find('.onError').remove();
				return true;
			}else{				
				$(this).parent().append("<span class='onError'>"+options.error+"</span>");
				return false;
			}
		},
		qq:function(options){
			var options = $.extend({},defaults, options);
			options.error="腾讯QQ号从10000开始";
			var reg = /^[1-9]\d{4,10}$/;
			var value=$(this).val();
			$(this).parent().find('.onError').remove();	
			if(reg.test(value)){
				$(this).parent().find('.onError').remove();
				return true;
			}else{				
				$(this).parent().append("<span class='onError'>"+options.error+"</span>");
				return false;
			}
		},
		mmlength:function(options){
			var options = $.extend({},defaults, options);
			var maxlength=options.maxlength,
				minlength=options.minlength;
			options.error="必须输入"+minlength+"--"+maxlength+"字";
			var value=$(this).val().length;
			$(this).parent().find('.onError').remove();	
			if(value>=minlength&&value<=maxlength){
				$(this).parent().find('.onError').remove();
				return true;
			}else{				
				$(this).parent().append("<span class='onError'>"+options.error+"</span>");
				return false;
			}
		},
		abc:function(options){
			var options = $.extend({},defaults, options);
			options.error="必须是字母";
			var reg = /^[a-z]+$/i;
			var value=$(this).val();
			$(this).parent().find('.onError').remove();	
			if(reg.test(value)){
				$(this).parent().find('.onError').remove();
				return true;
			}else{				
				$(this).parent().append("<span class='onError'>"+options.error+"</span>");
				return false;
			}
		},
		abc_num:function(options){
			var options = $.extend({},defaults, options);
			options.error="必须为字母或数字";
			var reg = /^[a-z0-9]+$/i;
			var value=$(this).val();
			$(this).parent().find('.onError').remove();	
			if(reg.test(value)){
				$(this).parent().find('.onError').remove();
				return true;
			}else{				
				$(this).parent().append("<span class='onError'>"+options.error+"</span>");
				return false;
			}
		},
		decimal:function(options){
			var options = $.extend({},defaults, options);
			options.error="只能为整数或小数";
			var reg = /^\d*\.?\d+$/;
			var value=$(this).val();
			$(this).parent().find('.onError').remove();	
			if(reg.test(value)){
				$(this).parent().find('.onError').remove();
				return true;
			}else{				
				$(this).parent().append("<span class='onError'>"+options.error+"</span>");
				return false;
			}
		},change:function(options){
			var options = $.extend({},defaults, options);
			options.error="请选择内容";
			var reg = /^[1-9]{1}[\d]*$/;
			var value=$(this).val();
			$(this).parent().find('.onError').remove();	
			if(reg.test(value)){
				$(this).parent().find('.onError').remove();
				return true;
			}else{				
				$(this).parent().append("<span class='onError'>"+options.error+"</span>");
				return false;
			}
		},
		decimalOrNull:function(options){
			var options = $.extend({},defaults, options);
			options.error="只能为整数或小数";
			var reg = /^(?:(?!0)\d*|0|\s*)(?:\.\d+)?$/;
			var value=$(this).val();
			$(this).parent().find('.onError').remove();	
			if(reg.test(value)){
				$(this).parent().find('.onError').remove();
				return true;
			}else{				
				$(this).parent().append("<span class='onError'>"+options.error+"</span>");
				return false;
			}
		}
	})
})(jQuery); 

/**
 * js表单验证说明
 * 
 * js 引用 <script type="text/javascript" src="${base}/static/admin/js/yanzheng.js"></script>
 * 
   $(function(){
			$('#myform :input').blur(function(){     //给需要验证的部分加表单myform
		         if( $(this).is('#name') ){
		              $(this).required();
		         }
		         
		    }).keyup(function(){
		       $(this).triggerHandler("blur");
		    }).focus(function(){
		         $(this).triggerHandler("blur");
		    });	
		    	    
		    //提交，最终验证。
		     $('#subBtn').click(function(){
		            $("#myform :input.required").trigger('blur');
		            var numError = $('#myform .onError').length;
		            if(numError){
		                return false;   
		            } 
		            
		            createJson();            //需要处理的函数
		          $("#myform").submit();     //submit方法可以提交表单
		          
		     });
		})
 */

