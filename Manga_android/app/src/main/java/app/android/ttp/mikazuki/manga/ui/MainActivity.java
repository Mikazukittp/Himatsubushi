package app.android.ttp.mikazuki.manga.ui;

import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.support.v7.app.ActionBarActivity;

import app.android.ttp.mikazuki.manga.R;
import app.android.ttp.mikazuki.manga.ui.fragments.MainActivityFragment;
import app.android.ttp.mikazuki.manga.ui.fragments.ScoreFragment;


public class MainActivity extends ActionBarActivity implements MainActivityFragment.Listener, ScoreFragment.Listener {

    FragmentManager fm = getSupportFragmentManager();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        MainActivityFragment fragment = new MainActivityFragment();

        FragmentTransaction ft = fm.beginTransaction();
        ft.replace(R.id.fragment, fragment).commit();
    }

    @Override
    public void goToScoreScreen(int score, int size) {
        ScoreFragment fragment = new ScoreFragment();
        Bundle bundle = new Bundle();
        bundle.putInt("SCORE", score);
        bundle.putInt("SIZE", size);
        fragment.setArguments(bundle);

        FragmentTransaction ft = fm.beginTransaction();
        ft.replace(R.id.fragment, fragment).commit();
    }

    @Override
    public void goToTop() {
        Intent intent = new Intent(this, SplashActivity.class);
        intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
        startActivity(intent);
    }

}
