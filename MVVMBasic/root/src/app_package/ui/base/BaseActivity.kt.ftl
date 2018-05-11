package ${basePackage};

import android.Manifest
import android.annotation.TargetApi
import android.content.Context
import android.content.pm.PackageManager
import android.databinding.DataBindingUtil
import android.databinding.ViewDataBinding
import android.os.Build
import android.os.Bundle
import android.support.annotation.LayoutRes
import android.support.annotation.RequiresPermission
import android.support.v7.app.AlertDialog
import android.support.v7.app.AppCompatActivity
import android.view.View
import android.view.inputmethod.InputMethodManager
import android.widget.EditText


import ${packageName}.util.CommonUtils
import ${packageName}.util.NetworkUtils

import dagger.android.AndroidInjection
import pub.devrel.easypermissions.EasyPermissions


abstract class BaseActivity<T : ViewDataBinding, V : BaseViewModel<*>> : AppCompatActivity(), BaseFragment.Callback {

    private var mAlertDialog: AlertDialog? = null

    var viewDataBinding: T? = null
        private set
    private var mViewModel: V? = null

    val isNetworkConnected: Boolean
        @RequiresPermission(Manifest.permission.ACCESS_NETWORK_STATE)
        get() = NetworkUtils.isNetworkConnected(applicationContext)

    /**
     * Override for set view model
     *
     * @return view model instance
     */
    abstract val viewModel: V

    /**
     * Override for set binding variable
     *
     * @return variable id
     */
    abstract val bindingVariable: Int

    /**
     * @return layout resource id
     */
    @get:LayoutRes
    abstract val layoutId: Int

    override fun onCreate(savedInstanceState: Bundle?) {
        performDependencyInjection()
        super.onCreate(savedInstanceState)
        performDataBinding()
    }


    private fun performDataBinding() {
        viewDataBinding = DataBindingUtil.setContentView(this, layoutId)
        this.mViewModel = if (mViewModel == null) viewModel else mViewModel
        viewDataBinding!!.setVariable(bindingVariable, mViewModel)
        viewDataBinding!!.executePendingBindings()
    }

    @TargetApi(Build.VERSION_CODES.M)
    fun hasPermission(permission: String): Boolean {
        return Build.VERSION.SDK_INT < Build.VERSION_CODES.M || checkSelfPermission(permission) == PackageManager.PERMISSION_GRANTED
    }

    override fun onRequestPermissionsResult(requestCode: Int, permissions: Array<String>, grantResults: IntArray) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)

        EasyPermissions.onRequestPermissionsResult(requestCode, permissions, grantResults, this)
    }

    override fun onFragmentAttached() {

    }

    override fun onFragmentDetached(tag: String) {

    }

    fun hideKeyboard() {
        val view = this.currentFocus
        if (view != null) {
            val imm = getSystemService(Context.INPUT_METHOD_SERVICE) as InputMethodManager

            imm.hideSoftInputFromWindow(view.windowToken, 0)
        }
    }

    fun showKeyboard(editText: EditText?) {
        if (editText == null) return

        val imm = getSystemService(Context.INPUT_METHOD_SERVICE) as InputMethodManager
        imm.showSoftInput(editText, InputMethodManager.SHOW_IMPLICIT)
    }

    fun showLoading() {
        hideLoading()
        mAlertDialog = CommonUtils.showLoadingDialog(this)
    }

    fun hideLoading() {
        if (mAlertDialog != null && mAlertDialog!!.isShowing) {
            mAlertDialog!!.cancel()
        }
    }

    fun getStringArray(id: Int): Array<String> {
        return resources.getStringArray(id)
    }

    fun performDependencyInjection() {
        AndroidInjection.inject(this)
    }
}
