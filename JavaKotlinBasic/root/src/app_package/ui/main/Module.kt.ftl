package ${mainPackage}

import android.arch.lifecycle.ViewModelProvider
import ${appPack}.ViewModelProviderFactory
import ${appPack}.data.DataManager
import ${appPack}.rx.SchedulerProvider

import dagger.Module
import dagger.Provides

@Module
class ${Name}ActivityModule {
    @Provides
    internal fun provide${Name}ViewModel(dataManager: DataManager,
                                      schedulerProvider: SchedulerProvider): ${Name}ViewModel {
        return ${Name}ViewModel(dataManager, schedulerProvider)
    }

    @Provides
    internal fun ${Name}ViewModelProvider(viewModel: ${Name}ViewModel): ViewModelProvider.Factory {
        return ViewModelProviderFactory(viewModel)
    }
}