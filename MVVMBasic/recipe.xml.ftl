<?xml version="1.0"?>
<#import "root://activities/common/kotlin_macros.ftl" as kt>
<#import "root/kapt.gradle.ftl" as kapt>
<recipe>
    <@kt.addAllKotlinDependencies />
	<#if isNewProject!false>
		<#-- Init Theme -->
		<#if requireTheme!false>
	    	<#include "../common/comonrecipe_theme.xml.ftl" />
	    </#if>
	    
	    <#-- Init strings.xml -->
	    <merge from="../common/root/res/values/manifest_strings.xml.ftl"
	         to="${escapeXmlAttribute(resOut)}/values/strings.xml" />
	         
		<#-- Init Android Manifest -->
	    <merge from="root/AndroidManifest.xml.ftl" 
	    	to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml" />         
	    
		<#-- Init dir -->
		<mkdir at="${escapeXmlAttribute(srcOut)}/data"/>
		<mkdir at="${escapeXmlAttribute(srcOut)}/data/local"/>
		<mkdir at="${escapeXmlAttribute(srcOut)}/data/local/db"/>
		<mkdir at="${escapeXmlAttribute(srcOut)}/data/local/prefs"/>
		<mkdir at="${escapeXmlAttribute(srcOut)}/data/local/model"/>
		<mkdir at="${escapeXmlAttribute(srcOut)}/data/remote"/>
		<mkdir at="${escapeXmlAttribute(srcOut)}/data/remote/model"/>
		
		<mkdir at="${escapeXmlAttribute(srcOut)}/di"/>
		<mkdir at="${escapeXmlAttribute(srcOut)}/di/builder"/>
		<mkdir at="${escapeXmlAttribute(srcOut)}/di/component"/>
		<mkdir at="${escapeXmlAttribute(srcOut)}/di/module"/>
		
		<mkdir at="${escapeXmlAttribute(srcOut)}/rx"/>
		
		<mkdir at="${escapeXmlAttribute(srcOut)}/util"/>
		
		<mkdir at="${escapeXmlAttribute(srcOut)}/ui"/>
		<mkdir at="${escapeXmlAttribute(srcOut)}/ui/base"/>
		<mkdir at="${escapeXmlAttribute(srcOut)}/ui/custom"/>
	
		<merge from="root/build.gradle.ftl" 
			to="${escapeXmlAttribute(projectOut)}/build.gradle" />
			
		<@kapt.addAptKotlinDependencies />			
			
		<#-- Init build gradle -->
		<#if appCompat && !(hasDependency('com.android.support:appcompat-v7'))>
	        <dependency mavenUrl="com.android.support:appcompat-v7:${buildApi}.+" />
	    </#if>
	
	    <#if hasAppBar && !(hasDependency('com.android.support:design'))>
	        <dependency mavenUrl="com.android.support:design:${buildApi}.+"/>
	    </#if>
	    
	    <#if !(hasDependency('com.android.support:support-vector-drawable'))>
	        <dependency mavenUrl="com.android.support:support-vector-drawable:${buildApi}.+" />
	    </#if>
	    
	    <#if !(hasDependency('com.android.support:support-annotations'))>
	        <dependency mavenUrl="com.android.support:support-annotations:${buildApi}.+" />
	    </#if>
	    
	    <#if !(hasDependency('com.android.support.constraint:constraint-layout'))>
	        <dependency mavenUrl="com.android.support.constraint:constraint-layout:+" />
	    </#if>
	    
	    <dependency mavenUrl="com.amitshekhar.android:rx2-android-networking:1.0.1" />
	    <dependency mavenUrl="com.google.code.gson:gson:+" />
	    <dependency mavenUrl="android.arch.lifecycle:extensions:+" />
	    <dependency mavenUrl="com.google.dagger:dagger:2.15" />
	    <dependency mavenUrl="com.google.dagger:dagger-android-support:2.15" />
	    <dependency mavenUrl="pub.devrel:easypermissions:1.2.0" />
	    
	    <#-- Init config -->
	    <copy from="root/config/" 
			to="${escapeXmlAttribute(projectLocation)}/config/" />
	    
		<#-- Init base Classes -->
		<instantiate from="root/src/app_package/MainApplication.${ktOrJavaExt}.ftl" 
			to="${escapeXmlAttribute(srcOut)}/${applicationName}.${ktOrJavaExt}" />
		
		<instantiate from="root/src/app_package/data/local/db/DbHelper.${ktOrJavaExt}.ftl" 
			to="${escapeXmlAttribute(srcOut)}/data/local/db/DbHelper.${ktOrJavaExt}" />
		
		<instantiate from="root/src/app_package/data/local/prefs/PreferencesHelper.${ktOrJavaExt}.ftl" 
			to="${escapeXmlAttribute(srcOut)}/data/local/prefs/PreferencesHelper.${ktOrJavaExt}" />
		<instantiate from="root/src/app_package/data/local/prefs/AppPreferencesHelper.${ktOrJavaExt}.ftl" 
			to="${escapeXmlAttribute(srcOut)}/data/local/prefs/AppPreferencesHelper.${ktOrJavaExt}" />
		
		<instantiate from="root/src/app_package/data/remote/ApiHelper.${ktOrJavaExt}.ftl" 
			to="${escapeXmlAttribute(srcOut)}/data/remote/ApiHelper.${ktOrJavaExt}" />
		<instantiate from="root/src/app_package/data/remote/AppApiHelper.${ktOrJavaExt}.ftl" 
			to="${escapeXmlAttribute(srcOut)}/data/remote/AppApiHelper.${ktOrJavaExt}" />
		
		<instantiate from="root/src/app_package/data/AppDataManager.${ktOrJavaExt}.ftl" 
			to="${escapeXmlAttribute(srcOut)}/data/AppDataManager.${ktOrJavaExt}" />
		<instantiate from="root/src/app_package/data/DataManager.${ktOrJavaExt}.ftl" 
			to="${escapeXmlAttribute(srcOut)}/data/DataManager.${ktOrJavaExt}" />
		
		<instantiate from="root/src/app_package/di/builder/ActivityBuilder.${ktOrJavaExt}.ftl" 
			to="${escapeXmlAttribute(srcOut)}/di/builder/ActivityBuilder.${ktOrJavaExt}" />
		<instantiate from="root/src/app_package/di/module/AppModule.${ktOrJavaExt}.ftl" 
			to="${escapeXmlAttribute(srcOut)}/di/module/AppModule.${ktOrJavaExt}" />
		<instantiate from="root/src/app_package/di/component/AppComponent.${ktOrJavaExt}.ftl" 
			to="${escapeXmlAttribute(srcOut)}/di/component/AppComponent.${ktOrJavaExt}" />
		
		<instantiate from="root/src/app_package/rx/SchedulerProvider.${ktOrJavaExt}.ftl" 
			to="${escapeXmlAttribute(srcOut)}/rx/SchedulerProvider.${ktOrJavaExt}" />
		<instantiate from="root/src/app_package/rx/AppSchedulerProvider.${ktOrJavaExt}.ftl" 
			to="${escapeXmlAttribute(srcOut)}/rx/AppSchedulerProvider.${ktOrJavaExt}" />
		
		<instantiate from="root/src/app_package/ui/base/BaseActivity.${ktOrJavaExt}.ftl" 
			to="${escapeXmlAttribute(srcOut)}/ui/base/BaseActivity.${ktOrJavaExt}" />
		<instantiate from="root/src/app_package/ui/base/BaseDialog.${ktOrJavaExt}.ftl" 
			to="${escapeXmlAttribute(srcOut)}/ui/base/BaseDialog.${ktOrJavaExt}" />
		<instantiate from="root/src/app_package/ui/base/BaseFragment.${ktOrJavaExt}.ftl" 
			to="${escapeXmlAttribute(srcOut)}/ui/base/BaseFragment.${ktOrJavaExt}" />
		<instantiate from="root/src/app_package/ui/base/BaseNavigator.${ktOrJavaExt}.ftl" 
			to="${escapeXmlAttribute(srcOut)}/ui/base/BaseNavigator.${ktOrJavaExt}" />
		<instantiate from="root/src/app_package/ui/base/BaseViewHolder.${ktOrJavaExt}.ftl" 
			to="${escapeXmlAttribute(srcOut)}/ui/base/BaseViewHolder.${ktOrJavaExt}" />
		<instantiate from="root/src/app_package/ui/base/BaseViewModel.${ktOrJavaExt}.ftl" 
			to="${escapeXmlAttribute(srcOut)}/ui/base/BaseViewModel.${ktOrJavaExt}" />
		
		<instantiate from="root/src/app_package/util/CommonUtils.${ktOrJavaExt}.ftl" 
			to="${escapeXmlAttribute(srcOut)}/util/CommonUtils.${ktOrJavaExt}" />
		<instantiate from="root/src/app_package/util/NetworkUtils.${ktOrJavaExt}.ftl" 
			to="${escapeXmlAttribute(srcOut)}/util/NetworkUtils.${ktOrJavaExt}" />
		<instantiate from="root/src/app_package/util/Constants.${ktOrJavaExt}.ftl" 
			to="${escapeXmlAttribute(srcOut)}/util/Constants.${ktOrJavaExt}" />
		
		<#-- Init Main Classes -->
		<instantiate from="root/src/app_package/ViewModelProviderFactory.${ktOrJavaExt}.ftl" 
			to="${escapeXmlAttribute(srcOut)}/ViewModelProviderFactory.${ktOrJavaExt}" />
		<instantiate from="root/src/app_package/ui/main/Activity.${ktOrJavaExt}.ftl" 
			to="${escapeXmlAttribute(srcOut)}/ui/${classToResource(className)}/${className}.${ktOrJavaExt}" />
	    <instantiate from="root/src/app_package/ui/main/Navigator.${ktOrJavaExt}.ftl" 
	    	to="${escapeXmlAttribute(srcOut)}/ui/${classToResource(className)}/${Name}Navigator.${ktOrJavaExt}" />
	    <instantiate from="root/src/app_package/ui/main/ViewModel.${ktOrJavaExt}.ftl" 
	    	to="${escapeXmlAttribute(srcOut)}/ui/${classToResource(className)}/${Name}ViewModel.${ktOrJavaExt}" />
	    <instantiate from="root/src/app_package/ui/main/Module.${ktOrJavaExt}.ftl" 
	    	to="${escapeXmlAttribute(srcOut)}/ui/${classToResource(className)}/${Name}ActivityModule.${ktOrJavaExt}" />
	
	    <#-- Init base resource -->
	    <instantiate from="root/res/layout/activity_layout.xml.ftl" to="${escapeXmlAttribute(resOut)}/layout/${activityLayoutName}.xml" />
	    <instantiate from="root/res/layout/progress_dialog.xml.ftl" to="${escapeXmlAttribute(resOut)}/layout/progress_dialog.xml" />
	    <instantiate from="root/res/drawable/bg_rounded.xml.ftl" to="${escapeXmlAttribute(resOut)}/drawable/bg_rounded.xml" />
	    <merge from="root/res/values/colors.xml.ftl" to="${escapeXmlAttribute(resOut)}/values/colors.xml" />
    
    <#else>
	    <#if componentType == 'type_activity'>
	    	<instantiate from="root/res/layout/activity_layout.xml.ftl" to="${escapeXmlAttribute(resOut)}/layout/${activityLayoutName}.xml" />
	    	
		    <merge from="root/AndroidManifest.xml.ftl" to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml" />
		
		    <instantiate from="root/src/app_package/ui/main/Activity.${ktOrJavaExt}.ftl" to="${escapeXmlAttribute(srcOut)}/${className}.${ktOrJavaExt}" />
		    <instantiate from="root/src/app_package/ui/main/Navigator.${ktOrJavaExt}.ftl" to="${escapeXmlAttribute(srcOut)}/${Name}Navigator.${ktOrJavaExt}" />
		    <instantiate from="root/src/app_package/ui/main/ViewModel.${ktOrJavaExt}.ftl" to="${escapeXmlAttribute(srcOut)}/${Name}ViewModel.${ktOrJavaExt}" />
		    <instantiate from="root/src/app_package/ui/main/Module.${ktOrJavaExt}.ftl" to="${escapeXmlAttribute(srcOut)}/${Name}ActivityModule.${ktOrJavaExt}" />
		    
		    <open file="${srcOut}/${className}.${ktOrJavaExt}"/>
		<#elseif componentType == 'type_fragment'>
			<instantiate from="root/res/layout/fragment_layout.xml.ftl" to="${escapeXmlAttribute(resOut)}/layout/${fragmentLayoutName}.xml" />
	    	
		    <instantiate from="root/src/app_package/ui/main/fragment/Fragment.${ktOrJavaExt}.ftl" to="${escapeXmlAttribute(srcOut)}/${fragmentClassName}.${ktOrJavaExt}" />
		    <instantiate from="root/src/app_package/ui/main/fragment/FragmentModule.${ktOrJavaExt}.ftl" to="${escapeXmlAttribute(srcOut)}/${fragmentName}FragmentModule.${ktOrJavaExt}" />
		    <instantiate from="root/src/app_package/ui/main/fragment/FragmentProvider.${ktOrJavaExt}.ftl" to="${escapeXmlAttribute(srcOut)}/${fragmentName}FragmentProvider.${ktOrJavaExt}" />
		    <instantiate from="root/src/app_package/ui/main/fragment/FragmentNavigator.${ktOrJavaExt}.ftl" to="${escapeXmlAttribute(srcOut)}/${fragmentName}FragmentNavigator.${ktOrJavaExt}" />		    
		    <instantiate from="root/src/app_package/ui/main/fragment/FragmentViewModel.${ktOrJavaExt}.ftl" to="${escapeXmlAttribute(srcOut)}/${fragmentName}FragmentViewModel.${ktOrJavaExt}" />		    
	    </#if>
    </#if>
</recipe>
