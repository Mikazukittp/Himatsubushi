package app.android.ttp.mikazuki.onepiece.ui.modal;

import android.app.Activity;
import android.app.Dialog;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.view.Window;
import android.view.WindowManager;

import app.android.ttp.mikazuki.onepiece.R;


/**
 * Created by haijimakazuki on 15/06/11.
 */
public class Loading {
    // Dialogを返す
    public static Dialog getDialog(Activity activity){
        Dialog dialog = new Dialog(activity);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
        dialog.getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN, WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN);
        dialog.getWindow().setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
        dialog.setContentView(R.layout.simple_progress);
        return dialog;
    }
}
