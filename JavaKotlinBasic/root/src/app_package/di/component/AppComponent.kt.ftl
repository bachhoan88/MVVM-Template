package ${packageName}.di.component

import android.app.Application
import javax.inject.Singleton
import ${packageName}.${applicationName}
import ${packageName}.di.builder.ActivityBuilder
import ${packageName}.di.module.AppModule
import dagger.BindsInstance
import dagger.Component
import dagger.android.AndroidInjectionModule

@Singleton
@Component(modules = arrayOf(AndroidInjectionModule::class, AppModule::class, ActivityBuilder::class))
interface AppComponent {
    @Component.Builder
    interface MainBuilder {

        @BindsInstance
        fun application(application: Application): MainBuilder

        fun build(): AppComponent
    }

    fun inject(application: ${applicationName})
}

