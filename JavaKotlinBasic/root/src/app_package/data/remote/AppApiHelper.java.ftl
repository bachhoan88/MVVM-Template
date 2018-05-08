package ${packageName}.data.remote;

import android.content.Context;
import javax.inject.Inject;

public class AppApiHelper implements ApiHelper {
    private final Context mContext;

    @Inject
    public AppApiHelper(Context context) {
        mContext = context;
    }
}