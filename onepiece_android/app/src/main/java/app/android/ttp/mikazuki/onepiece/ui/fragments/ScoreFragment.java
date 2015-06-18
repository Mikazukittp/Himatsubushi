package app.android.ttp.mikazuki.onepiece.ui.fragments;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import com.google.android.gms.ads.AdView;

import app.android.ttp.mikazuki.onepiece.R;
import app.android.ttp.mikazuki.onepiece.util.AdMobHandler;
import butterknife.ButterKnife;
import butterknife.InjectView;
import butterknife.OnClick;



/**
 * A placeholder fragment containing a simple view.
 */
public class ScoreFragment extends Fragment {

    @InjectView(R.id.score) TextView mScore;
    @InjectView(R.id.result_message_title) TextView mResultMessageTitle;
    @InjectView(R.id.result_message) TextView mResultMessage;
    @InjectView(R.id.go_to_top) TextView mGoToTop;
    @InjectView(R.id.adView) AdView mAdView;

    Listener mListener;

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
        mAdView.loadAd(AdMobHandler.getAdRequest());
        return view;
    }


    @Override
    public void onActivityCreated(Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);
        Bundle bundle = getArguments();
        int num = bundle.getInt("SCORE");
        int size = bundle.getInt("SIZE");
        int percentage = num*100/size;

        mResultMessageTitle.setText(getMessageTitle(percentage));
        mResultMessage.setText(getMessage(percentage));
        mScore.setText("正答率" + percentage + "%");
    }

    @OnClick(R.id.go_to_top)
    public void onTopLinkClicked() {
        mListener.goToTop();
    }

    private String getMessageTitle(int percentage) {
        if(0 <= percentage && percentage < 25) {
            return getString(R.string.result_message_title_1);
        }else if(25 <= percentage && percentage < 50) {
            return getString(R.string.result_message_title_2);
        }else if(50 <= percentage && percentage < 75) {
            return getString(R.string.result_message_title_3);
        }else if(75 <= percentage && percentage < 100) {
            return getString(R.string.result_message_title_4);
        }else if(percentage == 100) {
            return getString(R.string.result_message_title_5);
        }else{
            return "";
        }
    }

    private String getMessage(int percentage) {
        if(0 <= percentage && percentage < 25) {
            return getString(R.string.result_message_1);
        }else if(25 <= percentage && percentage < 50) {
            return getString(R.string.result_message_2);
        }else if(50 <= percentage && percentage < 75) {
            return getString(R.string.result_message_3);
        }else if(75 <= percentage && percentage < 100) {
            return getString(R.string.result_message_4);
        }else if(percentage == 100) {
            return getString(R.string.result_message_5);
        }else{
            return "";
        }
    }

}
