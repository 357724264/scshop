<#include "/WEB-INF/template/admin/header.ftl" />
	<!-- 板块独有内容 -->
	<script>
	$("#plgl").addClass("on");
	</script>
	<style>
	.dialog_btn{
	   margin-right : 20px;
	   width : 90px;
	   border : 0px;
	   height : 26px;
	   cursor : pointer;
	}
	.search_btn {
		margin-left: 10px;
	    height: 22px;
	    width: 50px;
	    font-size: 13px;
	    border: 0;
	}
	.hidden_tr {
		display : none;
	}
	</style>
	<div class="zxbody" style="position:relative;">
		<div class="zxbody_title" style="border-bottom: 1px solid #ccc;">评论管理</div>
		<div class="extend_tab" style="padding-top:10px;padding-bottom:10px;">
		<!--	<input id="in_btn" class="dialog_btn" type="button" value="入库"/>
			<input id="out_btn" class="dialog_btn"  type="button" value="出库"/> -->
			<input id="keyword" type="text" placeholder="搜索商品名字" />
			<input id="search_button" type="button" class="dialog_btn" value="搜索"/>
		</div>
		<div class="extend_list">
			<table cellspacing="0" cellpadding="0" width="100%" class="extend_table" id="table">
				
			</table>
		</div>
			
		<div class="zxbody_page">
			<div class="showPage" id="showPage">
			</div>
		</div>
		
	</div>
</div>

	
<!-- 遮罩层 -->
<div class="mask"></div>
	
<div class="dialog dialog_extend dialog_account increment_dia">
			<div class="dialog_head">
				<span class="menu_do menu_close"></span>
				<b id="title">回复评论</b>
			</div>
			<input id="comment_id" type="hidden"/>
			<div class="dialog_body">
				<table cellspacing="0" cellpadding="0" width="100%" class="dia_table">
				
					<tr>
						<td class="dia_ltd">回复：</td>
						<td><textarea   class="dia_text" id="reply"  value=""></textarea></td>
					</tr>
					
				</table>
			</div>
			
			<div class="dialog_foot">
				<button type="button" class="dia_btn dialog_no">取消</button>
				<button type="submit" class="dia_btn dialog_ok increment_ok">确定</button>
			</div>
		</div>
<script>

//关闭弹出层
$(document).on("click",".menu_close", function(){
	close_product_dialog();
});
$(document).on("click",".dialog_no", function(){
	close_product_dialog();
});

function close_product_dialog(){
	$("body").removeClass("noscroll");
	$(".dia_inp").val('');
	$(".dia_text").val('');
	$(".mask").fadeOut();
	$(".hidden_tr").hide();
	$(".increment_dia").hide();
}

$(function(){
	
	showPage(1,"");		
	
	var sku = $("#functionitems").val();
	//alert(sku);	
	
});
	
function getContentList(pn,keyword){
	var url = "json/comment!list.action?productid=${productid}";
    if(pn==0){
        pn=1;
    }
	$.ajax({
		url:url,
		type: "post",
		data:{pn:pn,keyword:keyword},
		async:false,
		success:function(html){
			$("#table").html(html);
		}
	});
	
}
	
//生成分页
function showPage(pn,keyword){
	var url = "json/comment!totalNum.action?productid=${productid}";
	var showpage = "showPage";
	if(!pn) pn=1;

	$.ajax({
		url: url,
		type:"post", 
		data:{keyword:keyword},
		dataType: "json",
		async:false,
		success:function(dat){
			//计算页数
			var pageCount = Math.ceil(dat.total/dat.size);
			if(pageCount < pn){
				pn=pageCount;
			}
			//分页
			$("#"+showpage).createPage({
				dataTotal: dat.total, //数据条数
				pageCount: pageCount, //总页数
				current: pn, //当前页
				backFn: function(pn){
					//单击回调方法，pn是当前页码
					//获取列表数据
					getContentList(pn,keyword);
					
				}
			});
			//获取列表数据
			getContentList(pn,keyword);
		}
	});
}

//查询
$(document).on("click",".search_btn",function(){
	var sku = $("#sku").val();
	$.ajax({
		url : 'json/inventory!queryProduct.action',
		type : 'post',
		data : {sku:sku},
		success : function(data){
			var data = eval("("+data+")");
			if(data.success) {
				$('#productName').val(data.productName);
				$('#surplus').val(data.surplus);
				$('#productid').val(data.productid);
				$(".hidden_tr").show();
			}else {
				boxalert(data.msg);
			}
			
		}
	
	});
});


//删除评论
$(document).on("click",".del_btn",function(){
	if(confirm("确认要删除吗?")) {
		var this_ = $(this);
		var id = $(this_).attr("data-id");
		$.ajax({
			url : 'json/comment!deleteComment.action',
			type : 'post',
			data : {id:id},
			success : function(data) {
				$(this_).parent().parent().remove();
			}
		});
	}
});

//回复
$(document).on("click",".reply_btn",function(){
	var id = $(this).attr("data-id");
	var reply = $('#reply_'+id).html();
	$('#reply').val(reply);
	$('#comment_id').val(id);
	$(".mask").show();
	$(".increment_dia").show();
});

//提交回复
$(document).on("click",".increment_ok",function(){
	var id = $('#comment_id').val();
	var reply = $('#reply').val();
	
	$.ajax({
		url : 'json/comment!replyComment.action',
		type : 'post',
		data : {id:id,reply:reply},
		success : function(data){
			var data = eval("("+data+")");
			if(data.success){
				$('#reply_'+id).html(data.reply);
				$('#replydate_'+id).html(data.replydate);
				close_product_dialog();
			}
		}
	});
});

//搜索
$(document).on("click","#search_button",function(){
	var keyword = $('#keyword').val();
	showPage(1,keyword);
});
</script>
