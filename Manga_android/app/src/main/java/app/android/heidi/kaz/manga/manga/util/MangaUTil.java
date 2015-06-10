package app.android.heidi.kaz.manga.manga.util;

/**
 * Created by haijimakazuki on 15/06/07.
 */
public class MangaUtil {


    public static String getKanjiNumber(int num) {
        if(num<0 || 99999<num) return String.valueOf(num);

        String ZERO = "零";
        String[] ONE_TO_NINE = {"", "壱", "弍", "参", "肆", "伍", "陸", "漆", "捌", "玖"};
        String[] ORDERS = {"", "拾", "百", "千", "萬"};

        if(num==0) return ZERO;
        if(num==1) return ONE_TO_NINE[1];

        String numStr = String.valueOf(num);
        String rtn = "";

        for (int i = 0; i < numStr.length(); i++) {
            int d = Character.getNumericValue(numStr.charAt(i));
            if(d > 1) rtn += ONE_TO_NINE[d];
            if(d > 0) rtn += ORDERS[numStr.length() - i - 1];
        }
        return rtn;
    }
}
