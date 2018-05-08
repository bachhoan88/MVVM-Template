package ${packageName}.di.module;

import android.app.Application;
import dagger.Module;
import dagger.Provides;
import javax.inject.Singleton;
import android.content.Context;
import ${packageName}.data.AppDataManager;
import ${packageName}.data.DataManager;
import ${packageName}.data.local.prefs.AppPreferencesHelper;
import ${packageName}.data.local.prefs.PreferencesHelper;
import ${packageName}.data.remote.ApiHelper;
import ${packageName}.data.remote.AppApiHelper;
import ${packageName}.rx.AppSchedulerProvider;
import ${packageName}.rx.SchedulerProvider;
import ${packageName}.util.Constants;

@Module
public class AppModule {
    @Singleton
    @Provides
    Context providerContext(Application application) {
        return application;
    }
    
    @Singleton
    @Provides
    SchedulerProvider providerSchedulerProvider() {
        return new AppSchedulerProvider();
    }

    @Provides
    @Singleton
    DataManager provideDataManager(AppDataManager appDataManager) {
        return appDataManager;
    }

    @Provides
    @Singleton
    ApiHelper provideApiHelper(AppApiHelper appApiHelper) {
        return appApiHelper;
    }

    @Provides
    @Singleton
    AppApiHelper provideAppApiHelper(Context context) {
        return new AppApiHelper(context);
    }

    @Provides
    @Singleton
    PreferencesHelper providePreferencesHelper(AppPreferencesHelper appPreferencesHelper) {
        return appPreferencesHelper;
    }

    @Provides
    @Singleton
    AppPreferencesHelper providerAppPreferencesHelper(Context context) {
        return new AppPreferencesHelper(context, Constants.PREFERENCES_NAME);
    }
}