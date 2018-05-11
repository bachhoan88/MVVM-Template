package ${fragmentPackage};

import ${appPack}.data.DataManager;
import ${appPack}.rx.SchedulerProvider;
import ${basePackage}.BaseViewModel;

public class ${fragmentName}FragmentViewModel extends BaseViewModel<${fragmentName}FragmentNavigator> {
    public ${fragmentName}FragmentViewModel(DataManager dataManager, SchedulerProvider schedulerProvider) {
        super(dataManager, schedulerProvider);
    }
}    