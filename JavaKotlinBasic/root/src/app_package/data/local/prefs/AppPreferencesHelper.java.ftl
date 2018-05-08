package ${packageName}.data.local.prefs;

import android.content.Context;
import android.content.SharedPreferences;
import android.support.annotation.NonNull;
import android.support.v7.view.menu.MenuPresenter;

import javax.inject.Inject;


public class AppPreferencesHelper implements PreferencesHelper {
    private final SharedPreferences mPrefs;

    @Inject
    public AppPreferencesHelper(Context context, String prefFileName) {
        mPrefs = context.getSharedPreferences(prefFileName, Context.MODE_PRIVATE);
    }
}
