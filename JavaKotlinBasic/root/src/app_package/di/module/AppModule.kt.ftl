package ${packageName}.di.module

import android.app.Application
import dagger.Module
import dagger.Provides
import javax.inject.Singleton
import android.content.Context
import ${packageName}.data.AppDataManager
import ${packageName}.data.DataManager
import ${packageName}.data.local.prefs.AppPreferencesHelper
import ${packageName}.data.local.prefs.PreferencesHelper
import ${packageName}.data.remote.ApiHelper
import ${packageName}.data.remote.AppApiHelper
import ${packageName}.rx.AppSchedulerProvider
import ${packageName}.rx.SchedulerProvider
import ${packageName}.util.Constants

@Module
class AppModule {
    @Singleton
    @Provides
    fun providerContext(application: Application): Context {
        return application
    }
    
    @Singleton
    @Provides
    fun providerSchedulerProvider(): SchedulerProvider {
        return AppSchedulerProvider()
    }

    @Provides
    @Singleton
    fun provideDataManager(appDataManager: AppDataManager): DataManager {
        return appDataManager
    }

    @Provides
    @Singleton
    fun provideApiHelper(appApiHelper: AppApiHelper): ApiHelper {
        return appApiHelper
    }

    @Provides
    @Singleton
    fun provideAppApiHelper(context: Context): AppApiHelper {
        return AppApiHelper(context)
    }

    @Provides
    @Singleton
    fun providePreferencesHelper(appPreferencesHelper: AppPreferencesHelper): PreferencesHelper {
        return appPreferencesHelper
    }

    @Provides
    @Singleton
    fun providerAppPreferencesHelper(context: Context): AppPreferencesHelper {
        return AppPreferencesHelper(context, Constants.PREFERENCES_NAME)
    }
}