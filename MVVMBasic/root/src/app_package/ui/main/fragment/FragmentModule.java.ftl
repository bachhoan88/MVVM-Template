package ${fragmentPackage};

import dagger.Module;
import dagger.Provides;
import ${appPack}.data.AppDataManager;
import ${appPack}.rx.SchedulerProvider;

@Module
public class ${fragmentName}FragmentModule {
    @Provides
    ${fragmentName}FragmentViewModel provider${fragmentName}FragmentViewModel(AppDataManager appDataManager, SchedulerProvider schedulerProvider) {
        return new ${fragmentName}FragmentViewModel(appDataManager, schedulerProvider);
    }
}
