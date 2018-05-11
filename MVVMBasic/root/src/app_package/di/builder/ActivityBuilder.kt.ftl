package ${packageName}.di.builder

import ${mainPackage}.${Name}Activity
import ${mainPackage}.${Name}ActivityModule
import dagger.Module
import dagger.android.ContributesAndroidInjector

@Module
interface ActivityBuilder {
    @ContributesAndroidInjector(modules = arrayOf(${Name}ActivityModule::class))
    fun bind${Name}Activity(): ${Name}Activity
    
}
