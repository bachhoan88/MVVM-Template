android {
	dataBinding {
		enabled true
	}
}

dependencies {
	<#if generateKotlin>
		kapt 'com.google.dagger:dagger-android-processor:2.15'
		kapt 'com.google.dagger:dagger-compiler:2.15'
		kapt 'android.arch.lifecycle:compiler:1.1.1'
		kapt "com.android.databinding:compiler:3.0.1'
	<#else>
		annotationProcessor 'com.google.dagger:dagger-android-processor:2.15'
		annotationProcessor 'com.google.dagger:dagger-compiler:2.15'
		annotationProcessor "android.arch.lifecycle:compiler:1.1.1"
	</#if>
}
