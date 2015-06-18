package app.android.ttp.mikazuki.onepiece.network;

import com.google.gson.FieldNamingPolicy;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import retrofit.RestAdapter;
import retrofit.converter.GsonConverter;

/**
 * Created by haijimakazuki on 15/06/11.
 */
public class ApiFactory {

    private static ApiService mApiService;

    public static ApiService createApiService() {
        if(mApiService == null) {
            Gson gson = new GsonBuilder()
                    .setFieldNamingPolicy(FieldNamingPolicy.LOWER_CASE_WITH_UNDERSCORES)
//                    .registerTypeAdapter(BaseResponse.class, new DateTypeAdapter())
                    .create();

            RestAdapter restAdapter = new RestAdapter.Builder()
                    .setEndpoint("http://ec2-52-68-159-188.ap-northeast-1.compute.amazonaws.com/api/v1")
                    .setConverter(new GsonConverter(gson))
                    .build();
            return restAdapter.create(ApiService.class);
        }
        return mApiService;
    }



}
