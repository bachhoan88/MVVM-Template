<?xml version="1.0"?>
<globals>
	<#include "../common/common_globals.xml.ftl" />
	<global id="kaptEnable" type="boolean" value="true" />
	<global id="manifestOut" value="${manifestDir}" />
    <global id="resOut" value="${resDir}" />
    <global id="srcOut" value="${srcDir}/${slashedPackageName(packageName)}" />
    <global id="mainPackage" value="<#if isNewProject>${packageName}<#else>${applicationPackage}</#if>.ui.${classToResource(className)}" />
    <global id="basePackage" value="<#if isNewProject>${packageName}<#else>${applicationPackage}</#if>.ui.base" />
</globals>
