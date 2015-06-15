package app.android.ttp.mikazuki.manga.ui.fragments;

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

import com.google.android.gms.ads.AdView;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import app.android.ttp.mikazuki.manga.R;
import app.android.ttp.mikazuki.manga.model.BaseResponse;
import app.android.ttp.mikazuki.manga.model.Question;
import app.android.ttp.mikazuki.manga.network.ApiFactory;
import app.android.ttp.mikazuki.manga.network.RequestCallback;
import app.android.ttp.mikazuki.manga.network.RequestListener;
import app.android.ttp.mikazuki.manga.ui.ChoiceAdapter;
import app.android.ttp.mikazuki.manga.ui.modal.Loading;
import app.android.ttp.mikazuki.manga.util.AdMobHandler;
import app.android.ttp.mikazuki.manga.util.MangaUtil;
import butterknife.ButterKnife;
import butterknife.InjectView;
import retrofit.RetrofitError;


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
                dialog.setCancelable(false);
                dialog.show(getActivity().getSupportFragmentManager(), "dialog");
            }
        });
        mDialog = Loading.getDialog(getActivity());
        mDialog.show();
        mListener = (Listener)getActivity();
        ApiFactory.createApiService().getQuestions(2, new RequestCallback<BaseResponse>(new ResponseListener()));
        return view;
    }

    @Override
    public void onPause() {
        super.onPause();
        dismissProgress();
    }

    public void select(int choice) {
        if(choice==questions.get(now).getCorrectAnswerIndex()) mScore++;
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
        title.setText("第" + MangaUtil.getKanjiNumber(now + 1) + "問");
        sentence.setText(questions.get(now).getSentence());
        mAdapter.setChoices(questions.get(now).getSelects());
        mAdapter.notifyDataSetChanged();

        //AdMobの読み込み
        mAdView.loadAd(AdMobHandler.getAdRequest());
        mAdViewInList.loadAd(AdMobHandler.getAdRequest());
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
            questions = (List<Question>)response.getQuestionArray();
            updateView();
            dismissProgress();
        }
        @Override
        public void onFailure(RetrofitError error) {
            dismissProgress();
        }
    }
}
