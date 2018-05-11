<?xml version="1.0" encoding="utf-8"?>
<layout 
	xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools"
    tools:context="${mainPackage}.${Name}Activity">

    <data>
        <import type="android.view.View"/>

        <variable
            name="viewModel"
            type="${mainPackage}.${Name}ViewModel"/>

    </data>
    <android.support.constraint.ConstraintLayout
        android:fitsSystemWindows="true"
        android:layout_width="match_parent"
        android:layout_height="match_parent">
        
    </android.support.constraint.ConstraintLayout>
</layout>