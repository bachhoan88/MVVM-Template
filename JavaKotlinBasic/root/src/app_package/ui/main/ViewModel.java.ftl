package ${mainPackage};

import <#if isNewProject>${packageName}<#else>${applicationPackage}</#if>.data.DataManager;
import <#if isNewProject>${packageName}<#else>${applicationPackage}</#if>.rx.SchedulerProvider;
import ${basePackage}.BaseViewModel;

import android.support.annotation.NonNull;
  
public class ${Name}ViewModel extends BaseViewModel<${Name}Navigator> {
    public ${Name}ViewModel(@NonNull DataManager dataManager, @NonNull SchedulerProvider schedulerProvider) {
    	super(dataManager, schedulerProvider);
    }
}
