package ${mainPackage};

import javax.inject.Inject;
import <#if isNewProject>${packageName}<#else>${applicationPackage}</#if>.databinding.Activity${Name}Binding;
import <#if isNewProject>${packageName}<#else>${applicationPackage}</#if>.BR;
import <#if isNewProject>${packageName}<#else>${applicationPackage}</#if>.R;

import ${basePackage}.BaseActivity;
import android.arch.lifecycle.ViewModelProvider;
import android.arch.lifecycle.ViewModelProviders;
import android.os.Bundle;
import android.support.annotation.Nullable;
 
public class ${className} extends BaseActivity<Activity${Name}Binding, ${Name}ViewModel> implements ${Name}Navigator {
 
	@Inject
    ViewModelProvider.Factory viewModelFactory;
    
    Activity${Name}Binding activity${Name}Binding;
    private ${Name}ViewModel m${Name}ViewModel;
    
    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        activity${Name}Binding = getViewDataBinding();
        m${Name}ViewModel.setNavigator(this);
    }
    
    @Override
    public ${Name}ViewModel getViewModel() {
        m${Name}ViewModel = ViewModelProviders.of(this, viewModelFactory).get(${Name}ViewModel.class);
        return m${Name}ViewModel;
    }

    @Override
    public int getBindingVariable() {
        return BR.viewModel;
    }

    @Override
    public int getLayoutId() {
        return R.layout.activity_${classToResource(className)};
    }
}

