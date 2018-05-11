<?xml version="1.0" encoding="utf-8"?>
<layout 
	xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools">

    <data>
        <import type="android.view.View"/>

        <variable
            name="viewModel"
            type="${fragmentPackage}.${fragmentName}FragmentViewModel"/>

    </data>
    <android.support.constraint.ConstraintLayout
        android:fitsSystemWindows="true"
        android:layout_width="match_parent"
        android:layout_height="match_parent">
        
    </android.support.constraint.ConstraintLayout>
</layout>