package app.android.heidi.kaz.manga.network;

import com.google.gson.FieldNamingPolicy;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.internal.bind.DateTypeAdapter;

import app.android.heidi.kaz.manga.model.BaseResponse;
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
                    .registerTypeAdapter(BaseResponse.class, new DateTypeAdapter())
                    .create();

            RestAdapter restAdapter = new RestAdapter.Builder()
                    .setEndpoint("http:/domain/path/to/api")
                    .setConverter(new GsonConverter(gson))
                    .build();
            return restAdapter.create(ApiService.class);
        }
        return mApiService;
    }



}
