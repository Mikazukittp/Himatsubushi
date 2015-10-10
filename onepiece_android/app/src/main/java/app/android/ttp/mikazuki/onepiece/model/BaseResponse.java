package app.android.ttp.mikazuki.onepiece.model;

import java.util.List;

/**
 * Created by haijimakazuki on 15/06/11.
 */
public class BaseResponse {

    //    int status;
//    String message;
//    List<? extends BaseObject> questionArray;
    List<Question> questionArray;

//    public List<? extends BaseObject> getQuestionArray() {
    public List<Question> getQuestionArray() {
        return this.questionArray;
    }
//    public void setQuestionArray(List<? extends BaseObject> questionArray) {
    public void setQuestionArray(List<Question> questionArray) {
        this.questionArray = questionArray;
    }


}
