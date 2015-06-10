package app.android.heidi.kaz.manga;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import com.google.android.gms.ads.AdRequest;
import com.google.android.gms.ads.AdView;

import java.util.ArrayList;
import java.util.List;

import butterknife.ButterKnife;
import butterknife.InjectView;
import butterknife.OnClick;

import static app.android.heidi.kaz.manga.util.MangaUtil.getKanjiNumber;


/**
 * A placeholder fragment containing a simple view.
 */
public class MainActivityFragment extends Fragment {


    @InjectView(R.id.title) TextView title;
    @InjectView(R.id.sentence) TextView sentence;
    @InjectView(R.id.choice1) TextView choice1;
    @InjectView(R.id.choice2) TextView choice2;
    @InjectView(R.id.choice3) TextView choice3;
    @InjectView(R.id.choice4) TextView choice4;
    @InjectView(R.id.adView)  AdView mAdView;
    @InjectView(R.id.adView_in_list)  AdView mAdViewInList;

    Listener mListener;

    AdRequest adRequest = new AdRequest.Builder().build();

    int now = 0;
    List<Question> questions = new ArrayList<Question>();
    int mScore = 0;

    public MainActivityFragment() {
    }

    public interface Listener{
        public void goToScoreScreen(int score, int size);
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_main, container, false);
        ButterKnife.inject(this, view);

        mListener = (Listener)getActivity();

        //TODO questions初期化
        questions.add(new Question("ナルトの夢は？", new String[]{"火影", "水影", "土影", "雷影"},0));
        questions.add(new Question("ナルトの技は？", new String[]{"倍化の術", "影真似の術", "千鳥", "螺旋丸"},3));
        questions.add(new Question("ナルトの好物は？", new String[]{"そば", "ラーメン", "うどん", "つけ麺"}, 1));

        updateView();
        return view;
    }


    @OnClick({R.id.choice1, R.id.choice2, R.id.choice3, R.id.choice4})
    public void selectChoice(TextView v) {
        switch(v.getId()){
            case R.id.choice1:
                select(0);
                goNext();
                break;
            case R.id.choice2:
                select(1);
                goNext();
                break;
            case R.id.choice3:
                select(2);
                goNext();
                break;
            case R.id.choice4:
                select(3);
                goNext();
                break;
        }
    }

    public void select(int choice) {
        if(choice==questions.get(now).getAnswer()) mScore++;
    }

    public void goNext() {
        if(now < questions.size()-1) {
            now++;
            updateView();
        } else {
            Log.d("TAG", "end of questions");
            mListener.goToScoreScreen(mScore, questions.size());
        }
    }

    public void updateView() {
        title.setText("第"+getKanjiNumber(now+1)+"問");
        sentence.setText(questions.get(now).getSentence());
        choice1.setText(questions.get(now).getChoices()[0]);
        choice2.setText(questions.get(now).getChoices()[1]);
        choice3.setText(questions.get(now).getChoices()[2]);
        choice4.setText(questions.get(now).getChoices()[3]);
        //AdMobの読み込み
//        mAdView.setAdSize(AdSize.SMART_BANNER);
        mAdView.loadAd(adRequest);
        mAdViewInList.loadAd(adRequest);
    }

}
