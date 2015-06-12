package app.android.heidi.kaz.manga.model;

import java.util.List;

/**
 * Created by haijimakazuki on 15/06/11.
 */
public class BaseResponse {

    int status;
    String message;
    List<BaseObject> data;

    public List<? extends BaseObject> getData() {
        return this.data;
    }

}
