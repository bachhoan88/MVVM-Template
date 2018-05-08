package ${packageName}


import android.app.Activity
import android.app.Application
import ${packageName}.di.component.DaggerAppComponent
import dagger.android.AndroidInjector
import dagger.android.DispatchingAndroidInjector
import dagger.android.HasActivityInjector
import javax.inject.Inject

class ${applicationName} : Application(), HasActivityInjector {

    @Inject
    lateinit var
            activityDispatchingAndroidInjector: DispatchingAndroidInjector<Activity?>

    override fun activityInjector(): AndroidInjector<Activity?>? {
        return activityDispatchingAndroidInjector
    }

    override fun onCreate() {
        super.onCreate()

        DaggerAppComponent
                .builder()
                .application(this)
                .build()
                .inject(this)

    }
}