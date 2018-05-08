package ${packageName}.di.builder

import ${mainPackage}.MainActivity
import ${mainPackage}.MainActivityModule
import dagger.Module
import dagger.android.ContributesAndroidInjector

@Module
interface ActivityBuilder {
    @ContributesAndroidInjector(modules = arrayOf(${Name}ActivityModule::class))
    fun bind${Name}Activity(): ${Name}Activity
    
}
