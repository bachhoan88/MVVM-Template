package ${basePackage}

import android.arch.lifecycle.ViewModel
import android.databinding.ObservableBoolean

import ${packageName}.data.DataManager
import ${packageName}.rx.SchedulerProvider

import io.reactivex.disposables.CompositeDisposable

abstract class BaseViewModel<N>(val dataManager: DataManager,
                                val schedulerProvider: SchedulerProvider) : ViewModel() {
    private val isLoading = ObservableBoolean(false)
    private val compositeDisposable = CompositeDisposable()
    var navigator: N? = null

    fun setIsLoading(isLoading: Boolean) {
        this.isLoading.set(isLoading)
    }

    override fun onCleared() {
        compositeDisposable.dispose()
        super.onCleared()
    }
}
