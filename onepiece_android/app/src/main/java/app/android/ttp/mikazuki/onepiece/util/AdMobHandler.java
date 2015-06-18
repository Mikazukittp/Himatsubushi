package app.android.ttp.mikazuki.onepiece.util;

import com.google.android.gms.ads.AdRequest;

/**
 * Created by haijimakazuki on 15/06/13.
 */
public class AdMobHandler {

    private static AdRequest mAdRequest;

    public static AdRequest getAdRequest(){
        if(mAdRequest==null){
            mAdRequest = new AdRequest.Builder()
                    .addTestDevice(AdRequest.DEVICE_ID_EMULATOR)
                    .addTestDevice("1F8D4E76E2C539631F50710239C8C2DE") // haijima Experia Z3
                    .build();
        }
        return mAdRequest;
    }

}
