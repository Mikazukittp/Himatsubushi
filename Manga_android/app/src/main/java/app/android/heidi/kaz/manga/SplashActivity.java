package app.android.heidi.kaz.manga;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.WindowManager;
import android.widget.ImageButton;

import com.google.android.gms.ads.AdRequest;
import com.google.android.gms.ads.AdView;

import butterknife.ButterKnife;
import butterknife.InjectView;
import butterknife.OnClick;


public class SplashActivity extends Activity {

    @InjectView(R.id.start) ImageButton start;
    @InjectView(R.id.adView) AdView mAdView;
    AdRequest adRequest = new AdRequest.Builder().build();


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getWindow().addFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN);
        setContentView(R.layout.activity_splash);
        ButterKnife.inject(this);
        mAdView.loadAd(adRequest);
    }

    @OnClick(R.id.start)
    public void start() {
        Intent intent = new Intent(this, MainActivity.class);
        startActivity(intent);
    }

}
