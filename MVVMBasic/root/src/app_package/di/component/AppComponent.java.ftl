package ${packageName}.di.component;

import android.app.Application;
import javax.inject.Singleton;
import ${packageName}.${applicationName};
import ${packageName}.di.builder.ActivityBuilder;
import ${packageName}.di.module.AppModule;
import dagger.BindsInstance;
import dagger.Component;
import dagger.android.AndroidInjectionModule;

@Singleton
@Component(modules = {AndroidInjectionModule.class, AppModule.class, ActivityBuilder.class})
public interface AppComponent {

    @Component.Builder
    interface MainBuilder {

        @BindsInstance
        MainBuilder application(Application application);

        AppComponent build();
    }

    void inject(${applicationName} application);
}

