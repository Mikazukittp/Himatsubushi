package app.android.heidi.kaz.manga.ui;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.WindowManager;
import android.widget.ImageButton;

import com.google.android.gms.ads.AdRequest;
import com.google.android.gms.ads.AdView;

import app.android.heidi.kaz.manga.R;
import app.android.heidi.kaz.manga.util.ImageButtonClickedEffectListener;
import butterknife.ButterKnife;
import butterknife.InjectView;
import butterknife.OnClick;


public class SplashActivity extends Activity {

    @InjectView(R.id.start) ImageButton mStart;
    @InjectView(R.id.adView) AdView mAdView;
    AdRequest adRequest = new AdRequest.Builder().build();


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getWindow().addFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN);
        setContentView(R.layout.activity_splash);
        ButterKnife.inject(this);
        mStart.setOnTouchListener(new ImageButtonClickedEffectListener());
        mAdView.loadAd(adRequest);

    }

    @OnClick(R.id.start)
    public void start() {
        Intent intent = new Intent(this, MainActivity.class);
        startActivity(intent);
    }

    @OnClick(R.id.license)
    public void license() {
        Intent intent = new Intent(this, LisenceActivity.class);
        startActivity(intent);
    }

}
