package app.android.heidi.kaz.manga.model;

import java.util.List;

/**
 * Created by haijimakazuki on 15/06/06.
 */
public class Question extends BaseObject{

    private String sentence;
    private List<String> choices;
    private int answer;

    public Question(){
        super();
    }

    public Question(String sentence, List<String> choices, int answer) {
        this.sentence = sentence;
        this.choices = choices;
        this.answer = answer;
    }

    public int getAnswer() {
        return answer;
    }

    public String getSentence() {
        return sentence;
    }

    public void setSentence(String sentence) {
        this.sentence = sentence;
    }

    public List<String> getChoices() {
        return choices;
    }

    public void setChoices(List<String> choices) {
        this.choices = choices;
    }

    public void setAnswer(int answer) {
        this.answer = answer;
    }
}
