# Android-Studio-MVVM-DataBinding-Dagger-Template-Google-Architecture

This is an Android Studio template for MVVM; the template is inspired by [google samples/ android architecture](https://github.com/googlesamples/android-architecture/tree/todo-mvvm-databinding/)

`Important`: The main goal of this template is to speed up the development process using android MVVM template. This is just a template and basic code, so feel free to make changes according to your needs. It also shows how to create a set of files using template files in Android Studio. This template was successfully tested with Android 3.1.1.

## Demo
![Create MVVM template](demo/out2.mp4 "Create MVVM template")

## Code Quality

This project integrates a combination of unit tests, functional test and code analysis tools. 

### Tests

To run **unit** tests on your machine:

``` 
./gradlew test
``` 

To run **functional** tests on connected devices:

``` 
./gradlew connectedAndroidTest
``` 

Note: For Android Studio to use syntax highlighting for Automated tests and Unit tests you **must** switch the Build Variant to the desired mode.

### Code Analysis tools 

The following code analysis tools are set up on this project:

* [PMD](https://pmd.github.io/): It finds common programming flaws like unused variables, empty catch blocks, unnecessary object creation, and so forth. See [this project's PMD ruleset](config/quality/pmd/pmd-ruleset.xml).

``` 
./gradlew pmd
```

* [Findbugs](http://findbugs.sourceforge.net/): This tool uses static analysis to find bugs in Java code. Unlike PMD, it uses compiled Java bytecode instead of source code.

```
./gradlew findbugs
```

* [Checkstyle](http://checkstyle.sourceforge.net/): It ensures that the code style follows [our Android code guidelines](https://github.com/ribot/android-guidelines/blob/master/project_and_code_guidelines.md#2-code-guidelines). See our [checkstyle config file](config/quality/checkstyle/checkstyle-config.xml).

```
./gradlew checkstyle
```

### The check task

To ensure that your code is valid and stable use check: 

```
./gradlew check
```

This will run all the code analysis tools and unit tests in the following order:

![Check Diagram](images/check-task-diagram.png)
 

## Installation

#### For Mac:

- If you have a standard Android Studio installation:

Just run the install script at the root of this repository:

```
./install.sh
```

- Manual installation:

Just copy directory `MVVMTemplate/*` to `$ANDROID_STUDIO_FOLDER$/Contents/plugins/android/lib/templates/activities/`

#### For Windows:

Just copy directory `MVVMTemplate/*` to `$ANDROID_STUDIO_FOLDER$\plugins\android\lib\templates\activities\`

## How to use

#### 1. Create Base classes

The main idea of the base classes is to have common methods that share across the Activities, Navigator, ViewModel and Module written down in one place.

Code Basic
- BaseActivity
```
public abstract class BaseActivity<T extends ViewDataBinding, V extends BaseViewModel> extends AppCompatActivity
        implements BaseFragment.Callback {

    ...
    public T getViewDataBinding() {
        return mViewDataBinding;
    }

    public abstract V getViewModel();

    public abstract int getBindingVariable();

    public abstract
    @LayoutRes
    int getLayoutId();

    public void performDependencyInjection() {
        AndroidInjection.inject(this);
    }
}
```

- BaseFragment
```
public abstract V getViewModel();

    public abstract int getBindingVariable();

    public abstract
    @LayoutRes
    int getLayoutId();

    public interface Callback {

        void onFragmentAttached();

        void onFragmentDetached(String tag);
    }

```

- BaseViewModel
```
public abstract class BaseViewModel<N> extends ViewModel {

    private final DataManager mDataManager;
    private final SchedulerProvider mSchedulerProvider;
    private N mNavigator;
    private CompositeDisposable mCompositeDisposable;

    public BaseViewModel(DataManager dataManager,
                         SchedulerProvider schedulerProvider) {
        this.mDataManager = dataManager;
        this.mSchedulerProvider = schedulerProvider;
        this.mCompositeDisposable = new CompositeDisposable();
    }

    public N getNavigator() {
        return mNavigator;
    }

    public void setNavigator(N navigator) {
        this.mNavigator = navigator;
    }

    public DataManager getDataManager() {
        return mDataManager;
    }

    public SchedulerProvider getSchedulerProvider() {
        return mSchedulerProvider;
    }

    public CompositeDisposable getCompositeDisposable() {
        return mCompositeDisposable;
    }

    @Override
    protected void onCleared() {
        mCompositeDisposable.dispose();
        super.onCleared();
    }
}

```

- BaseViewHolder for ```RecycleView.Adapter```
```
public abstract class BaseViewHolder extends RecyclerView.ViewHolder {
    public BaseViewHolder(View itemView) {
        super(itemView);
    }

    public abstract void onBind(int position);
}

```
#### 2. Create Activity MVVM template
![Create MVVM template](demo/out1.mp4 "Create MVVM template")


Support
-------

If you've found an error in this sample, please file an issue to
https://github.com
Patches are encouraged, and may be submitted by forking this project and
submitting a pull request through GitHub.

License
-------

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

Copyright 2017 Bach

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

