package app.android.ttp.mikazuki.starwars.ui;

import android.app.Activity;
import android.os.Bundle;
import android.webkit.WebView;

import app.android.ttp.mikazuki.starwars.R;
import butterknife.ButterKnife;
import butterknife.InjectView;

public class LisenceActivity extends Activity {

    @InjectView(R.id.webView) WebView mWebView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_lisence);
        ButterKnife.inject(this);
        mWebView.loadUrl("file:///android_asset/lisences.html");
    }
}