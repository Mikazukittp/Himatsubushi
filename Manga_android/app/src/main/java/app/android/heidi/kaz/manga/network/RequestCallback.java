package app.android.heidi.kaz.manga.network;

import retrofit.Callback;
import retrofit.RetrofitError;
import retrofit.client.Response;

/**
 * Created by haijimakazuki on 15/06/11.
 */
public class RequestCallback<T> implements Callback<T> {
    private RequestListener<T> mListener;

    public RequestCallback(RequestListener<T> listener){
        mListener = listener;
    }
    // 正常終了時に呼ばれる
    @Override
    public void success(T object, Response response){
        mListener.onSuccess(object);
    }

    // 異常終了時に呼ばれる
    @Override
    public void failure(RetrofitError error){
        mListener.onFailure(error);
    }
}
