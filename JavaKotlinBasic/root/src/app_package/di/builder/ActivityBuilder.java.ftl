package ${packageName}.di.builder;

import ${mainPackage}.MainActivity;
import ${mainPackage}.MainActivityModule;
import dagger.Module;
import dagger.android.ContributesAndroidInjector;

@Module
public abstract interface ActivityBuilder {
    @ContributesAndroidInjector(modules = {${Name}ActivityModule.class})
    abstract ${Name}Activity bind${Name}Activity();
    
}