<#include "/WEB-INF/template/admin/header.ftl" />
<link rel="stylesheet" type="text/css" href="${base}/static/admin/css/fonts/iconfont.css">
	
	<!-- 板块独有内容 -->
	<script>
	$("#yhsc").addClass("on");
	</script>
	<style>
	.dia_table td {
    padding: 10px 0;
    }
    
    .dialog_spec{
	background: #36a65a;
	color: #fff;
	}
	
	.dialog_spec:hover{
		background: #2b8949;
	}
	
	.dia_sinp {
    width: 100px;
    border: 1px solid #ccc;
    padding: 5px 8px;
    font-size: 14px;
    height: 24px;
    }

    .gg-list{display:inline-block;}
    
	</style>

	<div class="zxbody">
		<div class="zxbody_title zxbody_title2">
			<a href="javascript:history.back();" class="zxback">
				<img src="${base}/static/admin/img/do_back.png">
			</a>
			添加内容
		</div>
		
		<form id="myform" name="myform" method="post" action="product!addContent.action<#if product!=null>?cid=${product.id!0}</#if>" ms-controller="test" ms-widget="validation">
			<div class="zxform">
				<table cellspacing="0" cellpadding="0" width="100%" class="zxtable">
					<tr>
						<td class="zxltd"><span class="must">*</span>产品名称：</td>
						<td><input class="form_inp" type="text" placeholder="请输入产品名称" id="name" name="name" value="${product.name}"></td>
					</tr>
			
               <!--     <tr>
                        <td class="zxltd"><span class="must">*</span>所属商户： </td>
                        <td>
                            <select name="shopId" id="shop">
                            <#list shopList as obj>
                                <option value="${obj.id}">${obj.name}</option>
                            </#list>
                            </select>
                        </td>
                    </tr>
				-->	
					<tr>
						<td class="zxltd"><span class="must">*</span>商城分类：</td>
						<td>
						<select name="flevel" id="flevel" >
							<option value="0">一级分类</option>
							<#if flevelList??>
							<#list flevelList as flevel>
								<option value="${flevel.id}" <#if flevel.id==product.flevel>selected="selected"</#if> >${flevel.name}</option>
								<#if flevel.id==product.flevel><#assign f=flevel></#if>
							</#list>
							</#if>
						</select>
						<select id="slevel" name="slevel">
							<option value="0">二级分类</option>
							<#if f??&&(f.downList??)>
								<#list f.downList as slevel>
									<option value="${slevel.id}" <#if slevel.id==product.slevel>selected="selected"</#if>>${slevel.name}</option>
								</#list>
							</#if>
						</select>
						</td>
					</tr>
					<#if shopFlevelList??>
					<tr>
						<td class="zxltd"><span class="must">*</span>商家分类：</td>
						<td>
						<select name="shopFlevel" id="shopFlevel" >
							<option value="0">一级分类</option>
							
							<#list shopFlevelList as shopFlevel>
								<option value="${shopFlevel.id}" <#if shopFlevel.id==product.shopFlevel>selected="selected"</#if> >${shopFlevel.name}</option>
								<#if shopFlevel.id==product.shopFlevel><#assign shopF=shopFlevel></#if>
							</#list>
							
						</select>
						<select id="shopSlevel" name="shopSlevel">
							<option value="0">二级分类</option>
							<#if shopF??&&(shopF.downList??)>
								<#list shopF.downList as shopSlevel>
									<option value="${shopSlevel.id}" <#if shopSlevel.id==product.shopSlevel>selected="selected"</#if>>${shopSlevel.name}</option>
								</#list>
							</#if>
						</select>
						</td>
					</tr>
					</#if>					
					<tr>
						<td class="zxltd"><span class="must">*</span>是否上架：</td>
						<td>
						<select name="stat" id="stat" >
							<option value="0" <#if product??&&product.stat==0>selected="selected"</#if> >上架</option>
							<option value="-1" <#if product??&&product.stat==-1>selected="selected"</#if> >下架</option>
							<option value="1" <#if product??&&product.stat==1>selected="selected"</#if> >草稿</option>
						</select>
						</td>
					</tr>
					
					<#if permission==0>
					<tr>
						<td class="zxltd"><span class="must">*</span>是否热销：</td>
						<td>
						<select name="hotSale" id="hotSale" >
							<option value="0" <#if product??&&product.hotSale==0>selected="selected"</#if> >否</option>
							<option value="1" <#if product??&&product.hotSale==1>selected="selected"</#if> >是</option>
						</select>
						</td>
					</tr>
					<#else>
					<tr>
						<td class="zxltd"><span class="must">*</span>是否热销：</td>
						<td>
						<select name="shopHotSale" id="shopHotSale" >
							<option value="0" <#if product??&&product.shopHotSale==0>selected="selected"</#if> >否</option>
							<option value="1" <#if product??&&product.shopHotSale==1>selected="selected"</#if> >是</option>
						</select>
						</td>
					</tr>
					</#if>
					
					<tr>
						<td class="zxltd"><span class="must">*</span>品牌：</td>
						<td>
						<select name="brandid" id="brandSelect" >
							<option value="0" >请选择</option>
							<#assign letter="0">
							<#list brandList as brand>
								<#if brand.pinyin??&&brand.pinyin?substring(0,1)!=letter>
							<#assign letter=brand.pinyin?substring(0,1)>
							<option disabled="">------------${letter}------------</option>
							</#if>
								<option value="${brand.id}" <#if product??&&(product.brandid==brand.id)>selected="selected"</#if> >${brand.name}</option>
							
							</#list>
						</select>
						<input id="brandName" type="hidden" name="brandName" value="${product.brandName}" />
						</td>
					</tr>
					
					<tr>
						<td class="zxltd"><span class="must">*</span>国家：</td>
						<td>
						<select name="countryid" id="countrySelect" >
							<option value="" >请选择</option>
							<#list countryList as country>
								<option value="${country.id}" <#if product??&&(product.countryid==country.id)>selected="selected"</#if> >${country.name}</option>
							</#list>
						</select>
						<input id="countryName" type="hidden" name="countryName" value="${product.countryName}" />
						</td>
					</tr>
				
					<tr class="tt-0">
						<td class="zxltd">内容简述：</td>
						<td><textarea class="form_text" placeholder="请填写内容简述" name="intro">${product.intro}</textarea></td>
					</tr>
					<tr>
						<td class="zxltd">封面图片：</td>
						<td>
							<table cellspacing="0" cellpadding="0" width="100%" class="form_table">
								<tr>
									<td class="imgtd">
										<div class="dialog_upload">
											<img class="editable" alt="请上传封面图片" id="avatar1" src="<#if product.cover	!=null>${(product.cover)!}<#else>${base}/static/admin/img/img520.jpg</#if>" />
											<input type="file"  id="file" name="file" class="dia_file" />
											<input type="hidden" id="picUrl" name="cover" value="${(product.cover)!}" >
										</div>
									</td>
									<td class="tiptd">
										<div class="dialog_tip form_tip">
											<h1>点击上传封面图片</h1>
											<p>
											建议上传图片规则:
											<br>
											尺寸：400*400像素
											<br>
											格式：jpg、jpeg、png
											<br>
											图片大小不超过300kb（太大网站会加载很慢）
											</p>
										</div>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<!--
					<tr  class="tt-0">
						<td class="zxltd">产品图片</td>
						<td>
							<div id="container">
					            <div id="uploader-demo">
					                <ul id="fileList" class="uploader-list">
										<#if product.imageList??>
										<#list product.imageList as pic>
										
										<li class="file-item">
											<img class="img" src="${pic}@150w_150h_2e" id="img${pic_index}">
											<input id="file${pic_index}" class="fileInput" type="file" name="file" onchange="fileupdata(${pic_index})">
											<input type="hidden" id="pic${pic_index}" name="pic" value="${pic}">
											<span class="delete">x</span>
										</li>
										</#list>
										</#if>
					                    <div id="filePicker">
					                    	<div class="addfilePicker">+</div>
											<input type="file" id="newfile" name="file" class="file" name="picUrl" value="" onChange="fileuploadimg()" >
					                    </div>
					                </ul>
					                
					            </div>
					        </div>
						</td>
					</tr>
					
					-->
					
					
					<tr  class="tt-0">
						<td class="zxltd">内容详情：</td>
						<td>
							<script type="text/plain" id="mycentent" style="width:700px;height:240px;">
							<#if product.htmlDesc!="">${product.htmlDesc}</#if>
							</script>
							<textarea style="display:none" id="txt-content" name="content" >
							<#if product.htmlDesc!="">${product.htmlDesc}</#if>
							</textarea>
							<script>
							var ue = UE.getEditor('mycentent');
							ue.addListener('blur',function(){
								$("#txt-content").val(ue.getContent());
							});
							</script>
						</td>
	
					<tr  class="tt-0">
						<td class="zxltd">排序：</td>
						<td><input class="pro_inp" type="text" placeholder="降序排列" id="displayOrder" name="displayOrder" value="${product.displayOrder}"></td>
					</tr>
					</tr>
					<tr  class="tt-0">
						<td class="zxltd">体积：</td>
						<td><input class="pro_inp" type="text"  id="volumn" name="volumn" value="${product.volumn}"></td>
					</tr>
					<tr  class="tt-0">
						<td class="zxltd">重量：</td>
						<td><input class="pro_inp" type="text"  id="weight" name="weight" value="${product.weight}"></td>
					</tr>
					<tr  class="tt-0">
						<td class="zxltd">单位：</td>
						<td><input class="pro_inp" type="text"  id="unit" name="unit" value="${product.unit}"></td>
					</tr>
					<tr  class="tt-0">
						<td class="zxltd">参考价格：</td>
						<td><input class="pro_inp" type="text"  id="indicativePrice" name="indicativePrice" value="${product.indicativePrice}"></td>
					</tr>
					
				<!--<tr  class="tt-0">
						<td class="zxltd">销售数量(真实)：</td>
						<td><input class="pro_inp" type="text" disabled="disabled" placeholder="" value="${product.count}"></td>
					</tr>
					<tr  class="tt-0">
						<td class="zxltd">销售量增量：</td>
						<td><input class="pro_inp" type="text" placeholder="显示购买数量等于填写数量加销售数量" id="bn" name="displayCount" value="${product.displayCount}"></td>
					</tr>
					<tr  class="tt-0">
						<td class="zxltd">库存：</td>
						<td><input class="pro_inp" type="text" placeholder="-1为无限库存" id="bn" name="inventory" value="${product.inventory}"></td>
					</tr>
				
					<tr  class="tt-0">
						<td class="zxltd">运费：</td>
						<td><input class="pro_inp" type="text"  id="freight" name="freight" value="${product.freight}"></td>
					</tr>
					-->
					<tr class="tt-0">
						<td class="zxltd">
						一级规格：
						</td>
						<td>
						<input  class="dia_sinp" type="text"  id="firstSpecName" name="firstSpecName" value="${product.firstSpecName}">
						</td>
						
					</tr>
					
					<tr class="tt-0" id="second_tr" <#if product.secondSpecName??>style="display:;"<#else>style="display:none;"</#if>>
						<td class="zxltd">
						二级规格：
						</td>
						<td>
						<input  class="dia_sinp" type="text"  id="sencondSpecName" name="secondSpecName" value="${product.secondSpecName}">
						</td>
						
					</tr>
						<input type="hidden" id="firstSpecStr" name="firstSpecStr"/>
						<input type="hidden" id="secondSpecStr" name="secondSpecStr"/>
					<!--<tr>
						<td></td>
						<td class="btntd">
							<button type="button" id="subBtn" class="dia_btn dialog_ok form_ok">确定</button>
						</td>
					</tr>-->
				</table>
				<div class="pro-specarea">
					<table class="pro-specbox">
						<tr>
							<#if subProductList??>
							<#list subProductList as subProduct>
							<td>
							<input tye="text" class="f_input" value="${subProduct.name}"  data-agentStr='${subProduct.agentPriceTable}' id="f_input${subProduct.id+1000}" data-id="${subProduct.id}" data-name="${subProduct.name}" data-price="${subProduct.price}" data-inventory="${subProduct.inventory}" data-sku="${subProduct.sku}" data-pic="${subProduct.logo}" data-minPurchaseQuantity="${subProduct.minPurchaseQuantity}"  data-maxPurchaseQuantity="${subProduct.maxPurchaseQuantity}" readonly="readonly" placeholder="编辑" />
							<i class="delall iconfont icon-shanchu1" attr-id="${subProduct.id}"></i>
							</td>
							</#list>
							</#if>
							<td class="oneadd">
								<a href='javascript:;' id="onelevelbtn" class="firstSpec"><i class="iconfont icon-zengjiazhibiao"></i></a>
							</td>
						</tr>
						<tr>
						
							<#if subProductList??>
							<#list subProductList as subProduct>
							<td>
							<a href="javascript:;" id="pull_down${subProduct.id+1000}" class="twoaddbtn"><i class="iconfont icon-xiangxiashouqi"></i></a>
								<#if subProduct.downList??>
								<#list subProduct.downList as sub>
								<div class="two-level"><input type="text" value="${sub.name}" class="s_input" id="s_input${sub.id+1000}" data-agentStr='${sub.agentPriceTable}' data-parentid="${subProduct.id}" data-id="${sub.id}" data-name="${sub.name}" data-price="${sub.price}"  data-inventory="${sub.inventory}" data-sku="${sub.sku}" data-pic="${sub.logo}" data-minPurchaseQuantity="${sub.minPurchaseQuantity}"  data-maxPurchaseQuantity="${sub.maxPurchaseQuantity}" readonly="readonly"  placeholder="编辑" />
								<i class="dellist iconfont icon-guanbi5" attr-id="${sub.id}"></i>
								</div>
								</#list>
								</#if>
							</td>
							</#list>
							</#if>
							<td class="twoadd">
							</td>
						</tr>
					</table>
					

					<button type="button" id="subBtn" class="dia_btn dialog_ok form_ok">确定</button>
				</div>
		
				
			</div>
			<#-- 分类id -->
			<input type="hidden" name="nodeId" id="nodeId" value="${nodeId}">
		</form>
	</div>
</div>


<script type="text/javascript" src="${base}/static/admin/js/yanzheng.js"></script>
<script>

	var inputIndex = 0;
	var save = false;
	var level = 1;
	

	$("#tt").bind("change",function(){
	var tval = $(this).val();
	if(tval==0){
		$(".tt-0").show();
		$(".tt-1").hide();
	}else{
		$(".tt-0").hide();
		$(".tt-1").show();
	}
	});
	$("#tt").trigger("change");
	
	$("#brandSelect").bind("change",function(){
		
		var brandName = $(this).find("option:selected").text();
		$("#brandName").val(brandName);
	});
	
	$("#countrySelect").bind("change",function(){
		
		var countryName = $(this).find("option:selected").text();
		$("#countryName").val(countryName);
	});
		
	
		
	
	$('.delete').live('click',function(){
		$(this).parent().remove();
	});
	
	var i=<#if product.imageList??>${product.imageList?size}<#else>0</#if>;
	function fileuploadimg(){
		i++;
		//alert(i);
		$.ajaxFileUpload({
				url:'${base}/upload.action',       //需要链接到服务器地址
				secureuri:false,
				fileElementId:'newfile',                            //文件选择框的id属性
				dataType: 'text/html',                                   //服务器返回的格式，可以是json
				fileSize:300,     
				data:{width:'520', length:'250',limit:300},
				success: function (data, textStatus) {
					//兼容ie8以及以下版本
					
		        	if(data.success){		        		
						var $html=$(
							'<li class="file-item">'+
							'<img class="img" width="150px" height="150px" src="'+data.bigurl+'" id="img'+i+'" />'+
							'<input id="file'+i+'" class="fileInput" type="file" name="file" onChange="fileupdata('+i+')"  />'+
							'<input type="hidden" id="pic'+i+'" name="pic" value="'+data.bigurl+'">'+
							'<span class="delete">x</span>'+
							'</li>'
						);
						$('#filePicker').before($html);

		        	}
		            //兼容火狐、谷歌、ie8以上版本
					var dat = eval("("+data+")");
					if(dat.success){
						
						var $html=$(
							'<li class="file-item">'+
							'<img class="img" src="'+dat.bigurl+'@150w_150h_2e" id="img'+i+'" />'+
							'<input id="file'+i+'" class="fileInput" type="file" name="file" onChange="fileupdata('+i+')"  />'+
							'<input type="hidden" id="pic'+i+'" name="pic" value="'+dat.bigurl+'"/>'+
							'<span class="delete">x</span>'+
							'</li>'
						);
						$('#filePicker').before($html);

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

	function fileupdata(id){
		$.ajaxFileUpload({
				url:'${base}/upload.action',       //需要链接到服务器地址
				secureuri:false,
				fileElementId:'file'+id,                            //文件选择框的id属性
				dataType: 'text/html',                                   //服务器返回的格式，可以是json
				fileSize:300,     
				data:{width:'520', length:'250',limit:300},
				success: function (data, textStatus) {
					//兼容ie8以及以下版本
		        	if(data.success){
		        		$("#img"+id).attr("src",data.bigurl);
		        		$("#pic"+id).val(dat.bigurl);		
		        	}
		            //兼容火狐、谷歌、ie8以上版本
					var dat = eval("("+data+")");
					if(dat.success){
						$("#img"+id).attr("src",dat.bigurl+'@150w_150h_2e');	
						$("#pic"+id).val(dat.bigurl);				
					}
					
					if(data.msg){
						alert(data.msg);
					}
					if(dat.msg){
						alert(dat.msg);
					}				
					
				}
		});
	}
	
	<!-- 移过来的 -->
	$("form").validationEngine();
	
	<#if product??&&product.specifications??>
		var ggnum = ${product.specifications?size};
	<#else>
		var ggnum = 1;
	</#if>
	
	$(function(){
			
	
			$('#myform :input').blur(function(){
		         if( $(this).is('#name') ){
		              $(this).required();
		         }
		         if( $(this).is('#displayOrder') ){
		            $(this).numb();
		         }
		         if($(this).is("#firstSpecName")) {
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
		            
		            
		            createJson();
		          $("#myform").submit();
		     });
		})
	

			
		
	$(function() {
		$('#file').bind("change",function(){
			fileupload();
		});
		$("#addgg").bind("click",function(){
			ggnum ++ ;
			$(this).before('<input type="text" id="gginput'+ggnum+'" class="span2 gginput"  style="height:40px;width:170px;line-height:30px;font-size:16px;"  src="/assets/img/search_btn.gif" style="margin:0;margin-left:-12px;"/><img id="ggclose'+ggnum+'" attr-input="gginput'+ggnum+'" class="theclose" src="/assets/img/delete.png" style="margin:0;margin-left:-45px;">')
		});
	
	});
<!--
	$(document).on("blur", ".gginput", function(){
		var ss = "";
		for(var i=0;i<$(".gginput").length;i++){
			ss = ss+"--"+$(".gginput").eq(i).val();
		}
		ss = ss.substring(2);
		$("#gg").val(ss);
	})
	

	
	$(document).on("click", ".theclose", function(){
		var theinput = $(this).attr("attr-input");
		$("#"+theinput).remove();
		$(this).remove();
		var ss = "";
		for(var i=0;i<$(".gginput").length;i++){
			ss = ss+"--"+$(".gginput").eq(i).val();
		}
		ss = ss.substring(2);
		$("#gg").val(ss);
	})
	
	-->

	//打开弹窗
	$(document).on("click","#onelevelbtn",function(){
		level = 1;
		$(".canhide").show();
		openDialog();
	});
	
	function openDialog(){
		save = true;
		$("body").addClass("noscroll");
		$(".mask").show();
		$(".firstSpe_dialog").show();
	}

	
function close_product_dialog(){
	$("body").removeClass("noscroll");
	
	$("#avatar2").attr("src",$("#avatar2").data("default"));
	$("#file2").val('');
	$("#addPic").val('');
	$(".dia_inp").val('');
	$(".dia_text").val('');
	$(".priceInput").val('');
	$("#f_inventory").removeAttr("readonly");
	$(".dialog_body").find(".onError").remove();
	$(".mask").fadeOut();
	$(".firstSpe_dialog").hide();
	save =false;
}

//关闭弹出层
$(".menu_close").live("click", function(){
	close_product_dialog();
});
$(".dialog_no").live("click", function(){
	close_product_dialog();
});

$(document).ready(function() { 
 // 任何需要执行的js特效 
 $("table tr:nth-child(even)").addClass("even"); 
 
 
}); 



	$(document).on('click','.twoaddbtn',function(){
		level = 2;
		save = true;
		$(".canhide").hide();
		$("#second_tr").css("display",'');
		var i = $(this).attr("id").replace("pull_down","");
		var finputid = $("#f_input"+i).attr("data-id");
		$("#finputid").val(finputid).attr("data-index",i);
		openDialog();
	})

function createJson(){
	var firstAry = [];
	var secondAry = [];
	$(".f_input").each(function(index,item){
		var obj = {};
		obj.id = $(item).attr("data-id");
		obj.name = $(item).attr("data-name");
		obj.price = $(item).attr("data-price");
		obj.sku = $(item).attr("data-sku");
		obj.inventory = $(item).attr("data-inventory");
		obj.agentStr = $(item).attr("data-agentStr");
		obj.pic = $(item).attr("data-pic");
		obj.minPurchaseQuantity = $(item).attr("data-minPurchaseQuantity");
		obj.maxPurchaseQuantity = $(item).attr("data-maxPurchaseQuantity");
		firstAry[index] = obj;
	});
	$(".s_input").each(function(index,item){
		var obj = {};
		obj.id = $(item).attr("data-id");
		obj.parentid = $(item).attr("data-parentid");
		obj.name = $(item).attr("data-name");
		obj.price = $(item).attr("data-price");
		obj.sku = $(item).attr("data-sku");
		obj.inventory = $(item).attr("data-inventory");
		obj.agentStr = $(item).attr("data-agentStr");
		obj.pic = $(item).attr("data-pic");
		obj.minPurchaseQuantity = $(item).attr("data-minPurchaseQuantity");
		obj.maxPurchaseQuantity = $(item).attr("data-maxPurchaseQuantity");
		secondAry[index] = obj;
	});
	$("#firstSpecStr").val(JSON.stringify(firstAry));
	$("#secondSpecStr").val(JSON.stringify(secondAry));
	
}

$(document).on("click",".f_input",function(){
	level = 1;
	var id = $(this).attr("data-id");
	//如果是更新的话则不能修改库存
	if(id.substring(0,3)!="new") {
		$("#f_inventory").attr("readonly","readonly");
	}
	
	
	var name = $(this).attr("data-name");
	var sku = $(this).attr("data-sku");
	var inventory = $(this).attr("data-inventory");
	var price = $(this).attr("data-price");
	var agentStr = $(this).attr("data-agentStr");
	var pic = $(this).attr("data-pic");
	var minPurchaseQuantity = $(this).attr("data-minPurchaseQuantity");
	var maxPurchaseQuantity = $(this).attr("data-maxPurchaseQuantity");
	$("#finputid").val(id);
	$("#f_name").val(name);
	$("#f_sku").val(sku);
	$("#f_inventory").val(inventory);
	$("#f_price").val(price);
	$("#f_minPurchaseQuantity").val(minPurchaseQuantity);
	$("#f_maxPurchaseQuantity").val(maxPurchaseQuantity);
	if(pic) {
		$("#avatar2").attr("src",pic);
	}
	$("#addPic").val(pic);
	var jsonObj = eval("("+agentStr+")");
	var i = 0;
	for(var k in jsonObj) {
		$("#agentid"+i).val(k);
		$("#agentPrice"+i).val(jsonObj[k]);
		i++;
	}		
	$(".canhide").show();
	open_dialog();
	$(".firstSpe_dialog").show();
	$("#input_index").val($(this).attr("id").replace("f_input",""));
});

$(document).on("click",".s_input",function(){
	level = 2;
	var id = $(this).attr("data-id");
	//如果是更新的话则不能修改库存
	if(id.substring(0,3)!="new") {
		$("#f_inventory").attr("readonly","readonly");
	}
	
	var parentid = $(this).attr("data-parentid");
	var name = $(this).attr("data-name");
	var sku = $(this).attr("data-sku");
	var inventory = $(this).attr("data-inventory");
	var price = $(this).attr("data-price");
	var agentStr = $(this).attr("data-agentStr");
	var pic = $(this).attr("data-pic");
	var minPurchaseQuantity = $(this).attr("data-minPurchaseQuantity");
	var maxPurchaseQuantity = $(this).attr("data-maxPurchaseQuantity");
	$("#finputid").val(parentid);
	$("#sinputid").val(id);
	$("#f_name").val(name);
	$("#f_sku").val(sku);
	$("#f_inventory").val(inventory);
	$("#f_price").val(price);
	$("#f_minPurchaseQuantity").val(minPurchaseQuantity);
	$("#f_maxPurchaseQuantity").val(maxPurchaseQuantity);
	if(pic) {
		$("#avatar2").attr("src",pic);
	}
	$("#addPic").val(pic);
	var jsonObj = eval("("+agentStr+")");
	var i = 0;
	for(var k in jsonObj) {
		$("#agentid"+i).val(k);
		$("#agentPrice"+i).val(jsonObj[k]);
		i++;
	}		
	$(".canhide").hide();
	open_dialog();
	$(".firstSpe_dialog").show();
	$("#input_index").val($(this).attr("id").replace("s_input",""));
});


	
		


$(document).on("click", ".delall", function(){
	
	var id = $(this).attr("attr-id");
	var this_ =$(this);
	if(id!="") {
		var del = confirm("是否删除");
		if(!del) {
			return;
		}
		$.ajax({
			url:"json/product!deleteSubProduct.action",
			type:"post",
			data:{cid:id},
			success:function(data){
				if(data == "success") {
					var num=$(".delall").index(this_);
					$('.pro-specbox tr').find('td:eq('+num+')').remove();
				}else {
					var data = eval("("+data+")");
					boxalert(data.msg);
				}
			}
		});
		
		
	}else {
		var num=$(".delall").index(this);
		$('.pro-specbox tr').find('td:eq('+num+')').remove();
	}
	
	
})

$(document).on('click','.dellist',function(){
	var id = $(this).attr("attr-id");
	var this_ = $(this);
	if(id!="") {
		var del = confirm("是否删除");
		if(!del) {
			return;
		}
		$.ajax({
			url:"json/product!deleteSubProduct.action",
			type:"post",
			data:{cid:id},
			success:function(data){
				
				if(data == "success") {
					$(this_).parent().remove();
					if($("tr").find(".two-level").length == 0) {
						$("#second_tr").css("display","none");
						$("#sencondSpecName").val("");
					}
					
				}else {
					var data = eval("("+data+")");
					boxalert(data.msg);
				}
			}
		});
	}else {
		$(this).parent().remove();
		if($("tr").find(".two-level").length == 0) {
			$("#second_tr").css("display","none");
			$("#sencondSpecName").val("");
		}
	}

	
})

$(document).on("change","#flevel",function(){
	var id = $(this).val();
	if(id=="0") {
		$("#slevel").html('<option value="0">请选择</option>');
		return false;
	}
	$.ajax({
		url : 'json/category!getChildLevel.action',
		type : 'post',
		data : {id:id},
		success : function(data){
			var data = eval("("+data+")");
			$("#slevel").html('<option value="0">请选择</option>');
			for(var i=0;i<data.length;i++) {
				$("#slevel").append('<option value=' + data[i].id + '>' + data[i].name + '</option>')
			}
		}
	
	});
	
});

$(document).on("change","#shopFlevel",function(){
	var id = $(this).val();
	if(id=="0") {
		$("#shopSlevel").html('<option value="0">请选择</option>');
		return false;
	}
	$.ajax({
		url : 'json/category!getChildLevel.action',
		type : 'post',
		data : {id:id},
		success : function(data){
			var data = eval("("+data+")");
			$("#shopSlevel").html('<option value="0">请选择</option>');
			for(var i=0;i<data.length;i++) {
				$("#shopSlevel").append('<option value=' + data[i].id + '>' + data[i].name + '</option>')
			}
		}
	
	});
	
});

</script>

<!-- 表单提交 -->
<#include "/WEB-INF/template/admin/myform.ftl" />
<#include "/WEB-INF/template/admin/product_dialog.ftl" />
