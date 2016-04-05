<#if list??>
    <tr>
        <th width="120">商品名称</th>
        <th width="120">评论内容</th>
        <th width="80">评分</th>
        <th width="80">用户名字</th>
		<th width="80">评论时间</th>
		<th width="80">回复</th>
		<th width="80">回复时间</th>
		<th width="80">操作</th>
    </tr>
<#list list as item>
    <tr>
		<td><a  href="product!contentProduct.action?cid=${item.productid}">${item.productName}</a></td>
		<td>${item.content}</td>
		<td>${item.point}</td>
		<td>${item.userName}</td>
		<td><#if item.createDate??>${item.createDate?number_to_datetime?string("yyyy/MM/dd")}<#else>-</#if></td>
		<td id="reply_${item.id}">${item.reply}</td>
		<td id="replydate_${item.id}"><#if item.replydate??>${item.replydate?number_to_datetime?string("yyyy/MM/dd")}<#else>-</#if></td>
		<td>
			<b data-id="${item.id}"  class="menu_do menu_edit reply_btn" title="回复"></b>
			<#if permission==0><b data-id="${item.id}"  class="menu_do menu_del del_btn" title="删除"></b></#if>
		</td>
	</#list>
</#if>