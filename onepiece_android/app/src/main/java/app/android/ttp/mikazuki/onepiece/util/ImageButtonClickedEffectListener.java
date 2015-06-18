package app.android.ttp.mikazuki.onepiece.util;

import android.graphics.Color;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnTouchListener;
import android.view.ViewGroup.MarginLayoutParams;
import android.widget.ImageView;

/**
 * Created by haijimakazuki on 15/06/13.
 */
public class ImageButtonClickedEffectListener implements OnTouchListener {
    @Override
    public boolean onTouch(View v, MotionEvent event) {
        if (event.getAction() == MotionEvent.ACTION_DOWN) {
            ((ImageView) v).setColorFilter(Color.argb(100, 0, 0, 0));
            addMargin(v, 0, -10, 0, 0);
        } else if (event.getAction() == MotionEvent.ACTION_UP) {
            ((ImageView) v).setColorFilter(null);
            addMargin(v, 0, 10, 0, 0);
        }
        return false;
    }

    private void addMargin(View v, int left, int top, int right, int bottom){
        MarginLayoutParams mlp = (MarginLayoutParams)v.getLayoutParams();
        mlp.setMargins(mlp.leftMargin + left, mlp.topMargin + top, mlp.rightMargin + right, mlp.bottomMargin + bottom);
        v.setLayoutParams(mlp);
    }

}
