package ${mainPackage};

import ${appPack}.data.DataManager;
import ${appPack}.rx.SchedulerProvider;
import ${basePackage}.BaseViewModel;

import android.support.annotation.NonNull;
  
public class ${Name}ViewModel extends BaseViewModel<${Name}Navigator> {
    public ${Name}ViewModel(@NonNull DataManager dataManager, @NonNull SchedulerProvider schedulerProvider) {
    	super(dataManager, schedulerProvider);
    }
}
