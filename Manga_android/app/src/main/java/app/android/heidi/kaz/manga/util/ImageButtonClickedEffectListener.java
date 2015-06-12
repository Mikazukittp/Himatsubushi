package app.android.heidi.kaz.manga.util;

import android.graphics.Color;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnTouchListener;
import android.widget.ImageView;

/**
 * Created by haijimakazuki on 15/06/13.
 */
public class ImageButtonClickedEffectListener implements OnTouchListener {
    @Override
    public boolean onTouch(View v, MotionEvent event) {
        if (event.getAction() == MotionEvent.ACTION_DOWN) {
            ((ImageView) v).setColorFilter(Color.argb(100, 0, 0, 0));
        } else if (event.getAction() == MotionEvent.ACTION_UP) {
            ((ImageView) v).setColorFilter(null);
        }
        return false;
    }
}