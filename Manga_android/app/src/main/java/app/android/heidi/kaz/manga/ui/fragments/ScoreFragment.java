package app.android.heidi.kaz.manga.ui.fragments;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import com.google.android.gms.ads.AdRequest;
import com.google.android.gms.ads.AdView;

import app.android.heidi.kaz.manga.R;
import butterknife.ButterKnife;
import butterknife.InjectView;
import butterknife.OnClick;


/**
 * A placeholder fragment containing a simple view.
 */
public class ScoreFragment extends Fragment {

    @InjectView(R.id.score) TextView score;
    @InjectView(R.id.go_to_top) TextView goToTop;
    @InjectView(R.id.adView) AdView mAdView;

    Listener mListener;
    AdRequest adRequest = new AdRequest.Builder().build();

    public ScoreFragment() {
    }

    public interface Listener{
        public void goToTop();
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        mListener = (Listener)getActivity();

        View view = inflater.inflate(R.layout.fragment_score, container, false);
        ButterKnife.inject(this, view);
        mAdView.loadAd(adRequest);
        return view;
    }


    @Override
    public void onActivityCreated(Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);
        Bundle bundle = getArguments();
        int num = bundle.getInt("SCORE");
        int size = bundle.getInt("SIZE");
        int percentage = num*100/size;
        score.setText("正答率"+percentage+"%");
    }

    @OnClick(R.id.go_to_top)
    public void onTopLinkClicked() {
        mListener.goToTop();
    }
}
