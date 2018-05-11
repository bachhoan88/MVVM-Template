package ${mainPackage}

import javax.inject.Inject
import ${appPack}.databinding.Activity${Name}Binding
import ${appPack}.BR
import ${appPack}.R

import ${basePackage}.BaseActivity
import android.arch.lifecycle.ViewModelProvider
import android.arch.lifecycle.ViewModelProviders
import android.os.Bundle
 
class ${Name}Activity : BaseActivity<Activity${Name}Binding, ${Name}ViewModel>(), ${Name}Navigator {
 
	var viewModelFactory: ViewModelProvider.Factory? = null
        @Inject set
    
    var activity${Name}Binding: Activity${Name}Binding? = null
    private var m${Name}ViewModel: ${Name}ViewModel? = null
    
    override val viewModel: ${Name}ViewModel
        get() {
            m${Name}ViewModel = ViewModelProviders.of(this, viewModelFactory).get(${Name}ViewModel::class.java)
            return m${Name}ViewModel as ${Name}ViewModel
        }

    override val bindingVariable: Int
        get() = BR.viewModel

    override val layoutId: Int
        get() = R.layout.${activityLayoutName}

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        activity${Name}Binding = viewDataBinding
        m${Name}ViewModel!!.navigator = this
    }
}

