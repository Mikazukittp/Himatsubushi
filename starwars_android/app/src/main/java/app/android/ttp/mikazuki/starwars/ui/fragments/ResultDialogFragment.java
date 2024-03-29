package app.android.ttp.mikazuki.starwars.ui.fragments;

import android.app.Dialog;
import android.content.DialogInterface;
import android.content.DialogInterface.OnKeyListener;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import android.support.v4.app.DialogFragment;
import android.view.KeyEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.Window;
import android.view.WindowManager;
import android.widget.TextView;

import app.android.ttp.mikazuki.starwars.R;
import app.android.ttp.mikazuki.starwars.model.Question;
import butterknife.ButterKnife;
import butterknife.InjectView;
import butterknife.OnClick;


public class ResultDialogFragment extends DialogFragment {

    @InjectView(R.id.title) TextView mTitle;
    @InjectView(R.id.sentence) TextView mSentence;
    @InjectView(R.id.answer) TextView mAnswer;

    private String mResultTitle, mResultSentence, mResultAnswer;

    private OnClickListener mListener;

    @Override
    public Dialog onCreateDialog(Bundle savedInstanceState) {
        Dialog dialog = new Dialog(getActivity());
        dialog.getWindow().requestFeature(Window.FEATURE_NO_TITLE);
        dialog.getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN, WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN);
        dialog.getWindow().setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
        dialog.setOnKeyListener(new OnKeyListener() {
            @Override
            public boolean onKey(DialogInterface dialog, int keyCode, KeyEvent event) {
                return keyCode == KeyEvent.KEYCODE_BACK;
            }
        });
        dialog.setContentView(R.layout.result_dialog);
        ButterKnife.inject(this, dialog.getWindow().getDecorView());
        mTitle.setText(mResultTitle);
        mSentence.setText(mResultSentence);
        mAnswer.setText(mResultAnswer);
        return dialog;
    }

    @OnClick(R.id.positive_button)
    public void goNext(View v){
        mListener.onClick(v);
        dismiss();
    }

    public void setListener(OnClickListener listener){
        this.mListener = listener;
    }

    public void setContent(Question question, int select){
        int correctIndex = question.getCorrectAnswerIndex();
        mResultTitle = (correctIndex == select)? "正解": "不正解";
        mResultSentence = question.getSentence();
        if(correctIndex == select) {
            mResultAnswer = "O : " + question.getSelects().get(select);
        }else{
            mResultAnswer = "X : " + question.getSelects().get(select) +"\n";
            mResultAnswer += "O : " + question.getSelects().get(correctIndex);
        }
    }

}
