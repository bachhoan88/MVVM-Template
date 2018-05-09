package ${packageName}.di.builder;

import ${mainPackage}.${Name}Activity;
import ${mainPackage}.${Name}ActivityModule;
import dagger.Module;
import dagger.android.ContributesAndroidInjector;

@Module
public abstract interface ActivityBuilder {
    @ContributesAndroidInjector(modules = {${Name}ActivityModule.class})
    abstract ${Name}Activity bind${Name}Activity();
    
}