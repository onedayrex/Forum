package com.forum.util;

import java.sql.Timestamp;
import java.util.Date;

/**
 * Created by onedayrex on 16-4-29.
 * 用来转换时间，例如给定一个时间，计算出到
 * 今天的秒，分，小时，天数，月数，年数。
 */
public class DateDayUtil {

    public static String changDays(Timestamp time){
        Date date = new Date();
        //得到距今天的毫秒数
        Long temp = (date.getTime() - time.getTime());
        String day;
        //转化为Int
        int dayormouth = (int) Math.ceil(temp/1000);
        if(dayormouth>(364*24*60*60)){
            int i = (int) Math.ceil(dayormouth/(60*60*24*364));
            day = String.valueOf(i)+"年";
            return day;
        }
        else if(dayormouth>(30*24*60*60)){
            int i = (int) Math.ceil(dayormouth/(60*60*24*30));
            day = String.valueOf(i)+"月";
            return day;
        } else if (dayormouth>(24*60*60)) {
            int i = (int) Math.ceil(dayormouth/(24*60*60));
            return String.valueOf(i)+"天";
        } else if (dayormouth>(60*60)) {
            int i = (int) Math.ceil(dayormouth/(60*60));
            return String.valueOf(i)+"小时";
        } else if (dayormouth>(60)) {
            int i = (int) Math.ceil(dayormouth/60);
            return String.valueOf(i)+"分钟";
        } else {
            if(dayormouth<1){
                dayormouth =1;
            }
            return String.valueOf(dayormouth) + "秒";
        }
    }
}
