<?xml version="1.0"?>
<globals>
	<#include "../common/common_globals.xml.ftl" />
	<global id="kaptEnable" type="boolean" value="true" />
	<global id="manifestOut" value="${manifestDir}" />
    <global id="resOut" value="${resDir}" />
    <global id="srcOut" value="${srcDir}/${slashedPackageName(packageName)}" />
    <global id="mainPackage" value="<#if isNewProject>${packageName}<#else>${applicationPackage}</#if>.ui.${classToResource(className)}" />
    <global id="fragmentPackage" value="<#if isNewProject>${packageName}<#else>${applicationPackage}</#if>.ui.${classToResource(fragmentClassName)}" />
    <global id="basePackage" value="<#if isNewProject>${packageName}<#else>${applicationPackage}</#if>.ui.base" />
    <global id="appPack" value="<#if isNewProject>${packageName}<#else>${applicationPackage}</#if>" />

    <!-- Indicates whether the extension of the file is kt or java -->
    <#assign generateKotlin=(((includeKotlinSupport!false) || (language!'Java')?string == 'Kotlin'))>
    <global id="generateKotlin" type="boolean" value="${generateKotlin?string}" />
    <global id="ktOrJavaExt" type="string" value="${generateKotlin?string('kt','java')}" />
</globals>
