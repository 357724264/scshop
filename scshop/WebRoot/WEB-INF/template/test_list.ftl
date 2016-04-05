<#list list as entity>
<p>
${entity.userid}&nbsp;&nbsp;&nbsp;${entity.point}&nbsp;&nbsp;&nbsp;${entity.linkid}&nbsp;&nbsp;&nbsp;${entity.createdate?number_to_datetime?string("yyyy/MM/dd HH:mm")}
</p>

</#list>