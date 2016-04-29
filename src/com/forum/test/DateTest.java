package com.forum.test;

import com.forum.util.DateDayUtil;
import javafx.scene.input.DataFormat;
import org.junit.Test;

import java.sql.Timestamp;
import java.text.DateFormat;

/**
 * Created by onedayrex on 16-4-29.
 */
public class DateTest {
    @Test
    public void test(){

        System.out.println(DateDayUtil.changDays(new Timestamp(System.currentTimeMillis())));
    }
}
