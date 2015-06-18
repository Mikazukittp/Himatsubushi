package app.android.ttp.mikazuki.onepiece.network;

import retrofit.RetrofitError;

/**
 * Created by haijimakazuki on 15/06/11.
 *
 * REST通信のコールバックに利用するinterface
 */
public abstract interface RequestListener<T> {
    void onSuccess(T response);
    void onFailure(RetrofitError error);
}
