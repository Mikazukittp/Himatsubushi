package app.android.heidi.kaz.manga.ui.fragments;

import android.app.Dialog;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ListView;
import android.widget.TextView;

import com.google.android.gms.ads.AdRequest;
import com.google.android.gms.ads.AdView;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import app.android.heidi.kaz.manga.R;
import app.android.heidi.kaz.manga.model.BaseResponse;
import app.android.heidi.kaz.manga.model.Question;
import app.android.heidi.kaz.manga.network.ApiFactory;
import app.android.heidi.kaz.manga.network.RequestCallback;
import app.android.heidi.kaz.manga.network.RequestListener;
import app.android.heidi.kaz.manga.ui.ChoiceAdapter;
import app.android.heidi.kaz.manga.ui.modal.Loading;
import butterknife.ButterKnife;
import butterknife.InjectView;
import retrofit.RetrofitError;

import static app.android.heidi.kaz.manga.util.MangaUtil.getKanjiNumber;


/**
 * A placeholder fragment containing a simple view.
 */
public class MainActivityFragment extends Fragment {

    @InjectView(R.id.title) TextView title;
    @InjectView(R.id.sentence) TextView sentence;
    @InjectView(R.id.choice_list) ListView choiceList;
    @InjectView(R.id.adView)  AdView mAdView;
    @InjectView(R.id.adView_in_list)  AdView mAdViewInList;

    private Dialog mDialog;
    AdRequest adRequest = new AdRequest.Builder().build();
    Listener mListener;
    List<Question> questions = new ArrayList<Question>();

    private ChoiceAdapter mAdapter;
    int now = 0;
    int mScore = 0;

    public MainActivityFragment() {
    }

    public interface Listener{
        public void goToScoreScreen(int score, int size);
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_main, container, false);
        ButterKnife.inject(this, view);
        mAdapter = new ChoiceAdapter(getActivity().getApplicationContext());
        choiceList.setAdapter(mAdapter);
        choiceList.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                select(position);
                ResultDialogFragment dialog = new ResultDialogFragment();
                dialog.setContent(questions.get(now), position);
                dialog.setListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        goNext();
                    }
                });
                dialog.show(getActivity().getSupportFragmentManager(), "dialog");
            }
        });
        mDialog = Loading.getDialog(getActivity());
        mDialog.show();

        mListener = (Listener)getActivity();

        ApiFactory.createApiService().getQuestions(1, new RequestCallback<BaseResponse>(new ResponseListener()));

        return view;
    }

    @Override
    public void onPause() {
        super.onPause();
        dismissProgress();
    }

    public void select(int choice) {
        if(choice==questions.get(now).getAnswer()) mScore++;
    }

    public void goNext() {
        if(now < questions.size()-1) {
            now++;
            updateView();
        } else {
            mListener.goToScoreScreen(mScore, questions.size());
        }
    }

    public void updateView() {
        title.setText("第" + getKanjiNumber(now + 1) + "問");
        sentence.setText(questions.get(now).getSentence());
        mAdapter.setChoices(questions.get(now).getChoices());
        mAdapter.notifyDataSetChanged();

        //AdMobの読み込み
        mAdView.loadAd(adRequest);
        mAdViewInList.loadAd(adRequest);
    }

    public void dismissProgress(){
        if(mDialog != null && mDialog.isShowing()){
            mDialog.dismiss();
        }
    }

    public class ResponseListener implements RequestListener<BaseResponse> {
        @Override
        public void onSuccess(BaseResponse response) {
            Log.d("rest", "onSuccess!!!");
            questions = (List<Question>)response.getData();
            updateView();
            dismissProgress();
        }
        @Override
        public void onFailure(RetrofitError error) {
            Log.d("rest", "onFailure!!!");
            questions.add(new Question("ナルトの夢は？", Arrays.asList(new String[]{"火影", "水影", "土影", "雷影"}), 0));
            questions.add(new Question("ナルトの技は？", Arrays.asList(new String[]{"倍化の術", "影真似の術", "千鳥", "螺旋丸"}),3));
            questions.add(new Question("ナルトの好物は？", Arrays.asList(new String[]{"そば", "ラーメン", "うどん", "つけ麺"}), 1));
            updateView();
            dismissProgress();
        }
    }
}
