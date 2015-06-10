package app.android.heidi.kaz.manga.manga;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.widget.Button;

import butterknife.ButterKnife;
import butterknife.InjectView;
import butterknife.OnClick;


public class SplashActivity extends Activity {

    @InjectView(R.id.start) Button start;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_splash);
        ButterKnife.inject(this);
    }

    @OnClick(R.id.start)
    public void start() {
        Intent intent = new Intent(this, MainActivity.class);
        startActivity(intent);
    }

}
