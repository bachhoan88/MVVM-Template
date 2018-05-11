package ${fragmentPackage};

import dagger.Module;
import dagger.android.ContributesAndroidInjector;

@Module
public abstract class ${fragmentName}FragmentProvider {
    @ContributesAndroidInjector(modules = ${fragmentName}FragmentModule.class)
    abstract ${fragmentName}Fragment provider${fragmentName}FragmentFactory();
}
