package ${packageName}.data.local.prefs

import android.content.Context
import javax.inject.Inject

private const val FIRST_RUN = "FIRST_RUN"

class AppPreferencesHelper @Inject constructor(
        private val mContext: Context,
        private val name: String
) : PreferencesHelper {

    var sharePreference = mContext.getSharedPreferences(name, Context.MODE_PRIVATE)

    override fun isFirstRun(): Boolean {
        val isFirstRun = sharePreference.getBoolean(FIRST_RUN, true);
        if (isFirstRun) {
            sharePreference.edit().putBoolean(FIRST_RUN, false).apply()
        }

        return isFirstRun
    }
}
