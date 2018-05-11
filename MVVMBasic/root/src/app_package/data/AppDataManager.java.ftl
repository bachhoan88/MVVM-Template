package ${packageName}.data;

import android.content.Context;
import javax.inject.Inject;
import javax.inject.Singleton;
import  ${packageName}.data.local.prefs.PreferencesHelper;
import  ${packageName}.data.remote.ApiHelper;
import io.reactivex.Observable;
import io.reactivex.Single;

@Singleton
public class AppDataManager implements DataManager {
    private final Context mContext;
    private final PreferencesHelper mPreferencesHelper;
    private final ApiHelper mApiHelper;

    @Inject
    public AppDataManager(Context context,
                          PreferencesHelper preferencesHelper,
                          ApiHelper apiHelper) {
        mContext = context;
        mPreferencesHelper = preferencesHelper;
        mApiHelper = apiHelper;
    }
}