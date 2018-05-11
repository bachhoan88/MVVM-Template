<#macro addAptKotlinDependencies>
	<#if generateKotlin>
  		<apply plugin="kotlin-kapt" />
  	</#if>
</#macro>