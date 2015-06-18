package app.android.ttp.mikazuki.onepiece.network;

import app.android.ttp.mikazuki.onepiece.model.BaseResponse;
import retrofit.Callback;
import retrofit.http.GET;
import retrofit.http.Path;

/**
 * Created by haijimakazuki on 15/06/11.
 */
public interface ApiService {

    final String GET_QUESTIONS_PATH = "/questions/{id}";

    @GET(GET_QUESTIONS_PATH)
    void getQuestions(@Path("id") int id, Callback<BaseResponse> cb);

}
