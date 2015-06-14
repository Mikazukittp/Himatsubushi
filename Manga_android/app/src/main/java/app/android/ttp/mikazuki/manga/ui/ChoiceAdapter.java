package app.android.ttp.mikazuki.manga.ui;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

import java.util.List;

import app.android.ttp.mikazuki.manga.R;

/**
 * Created by haijimakazuki on 15/06/11.
 */
public class ChoiceAdapter extends BaseAdapter{

    Context context;
    LayoutInflater layoutInflater = null;
    List<String> choices;

    public ChoiceAdapter(Context context) {
        this.context = context;
        this.layoutInflater = (LayoutInflater)context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
    }

    public void setChoices(List<String> choices){
        this.choices = choices;
    }

    @Override
    public int getCount() {
        return (choices!=null)? choices.size(): 0;
    }

    @Override
    public Object getItem(int position) {
        return choices.get(position);
    }

    @Override
    public long getItemId(int position) {
        return position;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        if (convertView == null)
            convertView = layoutInflater.inflate(R.layout.choice_row,parent,false);

        ((TextView)convertView.findViewById(R.id.choice_sentence)).setText(choices.get(position));
        return convertView;
    }
}
