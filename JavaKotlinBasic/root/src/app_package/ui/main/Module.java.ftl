package ${mainPackage};

import ${appPack}.ViewModelProviderFactory;
import ${appPack}.data.DataManager;
import ${appPack}.rx.SchedulerProvider;
 
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