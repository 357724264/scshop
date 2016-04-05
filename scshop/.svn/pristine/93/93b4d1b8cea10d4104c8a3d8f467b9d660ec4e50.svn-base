//分页插件
/**
2014-08-05 ch
**/
(function($){
	var ms = {
		init:function(obj,args){
			return (function(){
				ms.fillHtml(obj,args);
				ms.unbindEvent(obj,args);
				ms.bindEvent(obj,args);
			})();
		},
		//填充html
		fillHtml:function(obj,args){
			return (function(){
				obj.empty();
				//转为数字类型！
				args.current = parseInt(args.current);
				args.pageCount = parseInt(args.pageCount);
				args.dataTotal = parseInt(args.dataTotal);
				
				//if($('.zxmenu').length <= 0){
					//总条数
					//obj.append('<b id="pageCount">共有<i id="pageCountNum">'+args.dataTotal+'</i>条数据</b>');
				//}
					obj.append('<b id="pageCount">共有<i id="pageCountNum">'+args.dataTotal+'</i>条数据</b>');
				//上一页
				if(args.current > 1){
					obj.append('<a href="javascript:;" class="prevPage">上一页</a>');
				}else{
					obj.remove('.prevPage');
					obj.append('<span class="disabled">上一页</span>');
				}
				//中间页码
				if(args.current != 1 && args.current >= 4 && args.pageCount != 4){
					obj.append('<a href="javascript:;" class="tcdNumber">'+1+'</a>');
				}
				if(args.current-2 > 2 && args.current <= args.pageCount && args.pageCount > 5){
					obj.append('<span>...</span>');
				}
				var start = args.current -2,end = args.current+2;
				if((start > 1 && args.current < 4)||args.current == 1){
					end++;
				}
				if(args.current > args.pageCount-4 && args.current >= args.pageCount){
					start--;
				}
				for (;start <= end; start++) {
					if(start <= args.pageCount && start >= 1){
						if(start != args.current){
							obj.append('<a href="javascript:;" class="tcdNumber">'+ start +'</a>');
						}else{
							obj.append('<span class="current">'+ start +'</span>');
						}
					}
				}
				if(args.current + 2 < args.pageCount - 1 && args.current >= 1 && args.pageCount > 5){
					obj.append('<span>...</span>');
				}
				if(args.current != args.pageCount && args.current < args.pageCount -2  && args.pageCount != 4){
					obj.append('<a href="javascript:;" class="tcdNumber">'+args.pageCount+'</a>');
				}
				//下一页
				if(args.current < args.pageCount){
					obj.append('<a href="javascript:;" class="nextPage">下一页</a>');
				}else{
					obj.remove('.nextPage');
					obj.append('<span class="disabled">下一页</span>');
				}
				if(args.pageCount > 1) {
					obj.append('<span>跳到<input style="width:40px;" class="jumpPage" type="text"/>页<a id="jump" href="#">确定</a></span>')
				}
				
				if(args.pageCount == 0){
					obj.html('');
				}
				
			})();
		},
		unbindEvent:function(obj,args){
			return (function(){
				obj.off("click");
			})();
		},
		//绑定事件
		bindEvent:function(obj,args){
			return (function(){
				obj.on("click","a.tcdNumber",function(){
					var current = parseInt($(this).text());
					ms.fillHtml(obj,{"current":current,"pageCount":args.pageCount,"dataTotal":args.dataTotal});
					if(typeof(args.backFn)=="function"){
						args.backFn(current);
					}
				});
				//上一页
				obj.on("click","a.prevPage",function(){
					var current = parseInt(obj.children("span.current").text());
					ms.fillHtml(obj,{"current":current-1,"pageCount":args.pageCount,"dataTotal":args.dataTotal});
					if(typeof(args.backFn)=="function"){
						args.backFn(current-1);
					}
				});
				//下一页
				obj.on("click","a.nextPage",function(){
					var current = parseInt(obj.children("span.current").text());
					ms.fillHtml(obj,{"current":current+1,"pageCount":args.pageCount,"dataTotal":args.dataTotal});
					if(typeof(args.backFn)=="function"){
						args.backFn(current+1);
					}
				});
				//跳转
				obj.on("click","#jump",function(){
					var jumpPage = $(".jumpPage").val();
					var reg = /^[1-9]{1}\d*$/;
					if(jumpPage.match(reg)==null||jumpPage>args.pageCount) {
						alert("请输入正确的页数");
						return false;
					}
					ms.fillHtml(obj,{"current":jumpPage,"pageCount":args.pageCount,"dataTotal":args.dataTotal});
					if(typeof(args.backFn)=="function"){
						args.backFn(jumpPage);
					}
				});
			})();
		}
	}
	$.fn.createPage = function(options){
		var args = $.extend({
			dataTotal: 0,
			pageCount : 10,
			current : 1,
			backFn : function(){}
		},options);
		ms.init(this,args);
	}
})(jQuery);