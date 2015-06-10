package app.android.heidi.kaz.manga;

/**
 * Created by haijimakazuki on 15/06/06.
 */
public class Question {

    private String sentence;
    private String[] choices;
    private int answer;

    public Question(){
        super();
    }

    public Question(String sentence, String[] choices, int answer) {
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

    public String[] getChoices() {
        return choices;
    }

    public void setChoices(String[] choices) {
        this.choices = choices;
    }

    public void setAnswer(int answer) {
        this.answer = answer;
    }
}
