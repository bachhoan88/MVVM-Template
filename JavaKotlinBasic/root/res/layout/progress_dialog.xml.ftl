<?xml version="1.0" encoding="utf-8"?>
<RelativeLayout 
	xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="wrap_content"
    android:layout_height="wrap_content"
    android:layout_gravity="center"
    android:background="@android:color/transparent">

    <ProgressBar
        android:id="@+id/pb_loading"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_centerInParent="true"
        android:background="@drawable/bg_rounded"
        android:padding="10dp"
        android:progressDrawable="@color/black_effective" />
</RelativeLayout>