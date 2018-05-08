package ${mainPackage}

import <#if isNewProject>${packageName}<#else>${applicationPackage}</#if>.data.DataManager
import <#if isNewProject>${packageName}<#else>${applicationPackage}</#if>.rx.SchedulerProvider
import ${basePackage}.BaseViewModel

class ${Name}ViewModel internal constructor(dataManager: DataManager, schedulerProvider: SchedulerProvider) 
	: BaseViewModel<${Name}Navigator>(dataManager, schedulerProvider) {
}
