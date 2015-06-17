package app.android.ttp.mikazuki.starwars.ui;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.WindowManager;
import android.widget.Button;

import com.google.android.gms.ads.AdView;

import app.android.ttp.mikazuki.starwars.R;
import app.android.ttp.mikazuki.starwars.util.AdMobHandler;
import butterknife.ButterKnife;
import butterknife.InjectView;
import butterknife.OnClick;

public class SplashActivity extends Activity {

    @InjectView(R.id.start) Button mStart;
    @InjectView(R.id.adView) AdView mAdView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getWindow().addFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN);
        setContentView(R.layout.activity_splash);
        ButterKnife.inject(this);
        //mStart.setOnTouchListener(new ImageButtonClickedEffectListener());
        mAdView.loadAd(AdMobHandler.getAdRequest());
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
