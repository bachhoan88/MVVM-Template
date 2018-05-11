package ${mainPackage}

import ${appPack}.data.DataManager
import ${appPack}.rx.SchedulerProvider
import ${basePackage}.BaseViewModel

class ${Name}ViewModel internal constructor(dataManager: DataManager, schedulerProvider: SchedulerProvider) 
	: BaseViewModel<${Name}Navigator>(dataManager, schedulerProvider) {
}
