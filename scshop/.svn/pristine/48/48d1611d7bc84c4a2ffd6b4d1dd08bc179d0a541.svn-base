<#assign letter="0">
<#list list as brand>
	<#if brand.pinyin??&&brand.pinyin?substring(0,1)!=letter>
<#assign letter=brand.pinyin?substring(0,1)>
<option disabled="">------------${letter}------------</option>
</#if>
	<option value="${brand.id}">${brand.name}</option>

</#list>