package app.android.heidi.kaz.manga.ui.fragments;

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

import app.android.heidi.kaz.manga.R;
import app.android.heidi.kaz.manga.model.Question;
import butterknife.ButterKnife;
import butterknife.InjectView;
import butterknife.OnClick;

;

public class ResultDialogFragment extends DialogFragment {

    @InjectView(R.id.title) TextView title;
    @InjectView(R.id.message) TextView message;

    private String mResultText;

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
                if (keyCode == KeyEvent.KEYCODE_BACK) {
                    return true;
                }
                return false;
            }
        });

        dialog.setContentView(R.layout.result_dialog);

        ButterKnife.inject(this, dialog.getWindow().getDecorView());

        message.setText(mResultText);
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
        mResultText = "";
        if(question.getAnswer() == select) {
            mResultText += "正解!!";
        }else{
            mResultText += "不正解\n";
            mResultText += "o " + question.getChoices().get(question.getAnswer()) +"\n";
            mResultText += "x " + question.getChoices().get(select);
        }
    }

}