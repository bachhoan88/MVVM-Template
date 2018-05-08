package ${packageName}.util;

import android.content.Context;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.support.annotation.NonNull;
import android.support.v7.app.AlertDialog;

import ${packageName}.R;


public final class CommonUtils {
    public static AlertDialog showLoadingDialog(@NonNull Context context) {
        AlertDialog alertDialog = new AlertDialog.Builder(context).setView(R.layout.progress_dialog).create();
        alertDialog.show();

        if (alertDialog.getWindow() != null) {
            alertDialog.getWindow().setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
        }
        alertDialog.setCancelable(false);
        alertDialog.setCanceledOnTouchOutside(false);

        return alertDialog;
    }

}
