package ${packageName}.data

import ${packageName}.data.local.db.DbHelper
import ${packageName}.data.local.prefs.PreferencesHelper
import ${packageName}.data.remote.ApiHelper

interface DataManager : ApiHelper, PreferencesHelper {
}
