<#macro addAptKotlinDependencies>
	<#if generateKotlin>
  		<apply plugin="kotlin-kapt" />
  		<apply from="${escapeXmlAttribute(projectLocation)}/config/quality/quality.gradle" />
  	</#if>
</#macro>