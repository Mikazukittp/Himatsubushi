package app.android.ttp.mikazuki.starwars.model;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by haijimakazuki on 15/06/06.
 */
public class Question extends BaseObject {

    private int id;
    private int manga_id;
    private String sentence;
//    private List<String> choices;
    private String select_1;
    private String select_2;
    private String select_3;
    private String select_4;
    private int correctAnswer;

    public Question(){
        super();
    }

    public Question(String sentence, List<String> selects, int answer) {
        this.sentence = sentence;
        this.select_1 = selects.get(0);
        this.select_2 = selects.get(1);
        this.select_3 = selects.get(2);
        this.select_4 = selects.get(3);
        this.correctAnswer = answer;
    }

    public String getSentence() {
        return sentence;
    }

    public void setSentence(String sentence) {
        this.sentence = sentence;
    }

    public List<String> getSelects() {
        List<String> rtn = new ArrayList<String>();
        rtn.add(select_1);
        rtn.add(select_2);
        rtn.add(select_3);
        rtn.add(select_4);
        return rtn;
    }

    public void setSelects(List<String> selects) {
        this.select_1 = selects.get(0);
        this.select_2 = selects.get(1);
        this.select_3 = selects.get(2);
        this.select_4 = selects.get(3);
    }

    public int getCorrectAnswer() {
        return correctAnswer;
    }

    public int getCorrectAnswerIndex() {
        return correctAnswer - 1;
    }

    public void setCorrectAnswer(int correctAnswer) {
        this.correctAnswer = correctAnswer;
    }
}
