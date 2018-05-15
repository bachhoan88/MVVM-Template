package ${packageName}.data

import android.content.Context
import ${packageName}.data.local.prefs.PreferencesHelper
import ${packageName}.data.remote.ApiHelper
import io.reactivex.Observable
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class AppDataManager @Inject constructor(
        private val mContext: Context,
        private val mPreferencesHelper: PreferencesHelper,
        private val mApiHelper: ApiHelper
) : DataManager {

    override fun isFirstRun(): Boolean {
        return mPreferencesHelper.isFirstRun()
    }
}