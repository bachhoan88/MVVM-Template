package ${mainPackage};

import <#if isNewProject>${packageName}<#else>${applicationPackage}</#if>.ViewModelProviderFactory;
import <#if isNewProject>${packageName}<#else>${applicationPackage}</#if>.data.DataManager;
import <#if isNewProject>${packageName}<#else>${applicationPackage}</#if>.rx.SchedulerProvider;
 
import dagger.Module;
import dagger.Provides;
import android.arch.lifecycle.ViewModelProvider;

@Module
public class ${Name}ActivityModule {
	@Provides
    ${Name}ViewModel provide${Name}ViewModel(DataManager dataManager,
                                       SchedulerProvider schedulerProvider) {
        return new ${Name}ViewModel(dataManager, schedulerProvider);
    }

    @Provides
    ViewModelProvider.Factory ${Name}ViewModelProvider(${Name}ViewModel viewModel) {
        return new ViewModelProviderFactory<>(viewModel);
    }
}