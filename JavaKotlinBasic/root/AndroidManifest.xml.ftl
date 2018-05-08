<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="${packageName}">
	
    <application
    	<#if isNewProject!false> 
    	android:name="${packageName}.${applicationName}"
        android:allowBackup="true"
        android:icon="@drawable/ic_launcher"
        android:label="@string/app_name"
        android:theme="@style/AppTheme"</#if>>
        <activity
            android:name="${packageName}.ui.${classToResource(className)}.${className}"
            android:label="@string/app_name" >
            <#if isLauncher!false>
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />
                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
            </#if>
        </activity>
    </application>
</manifest>
