package com.forum.dao;

import org.apache.ibatis.annotations.Param;

/**
 * Created by Administrator on 2016/3/12.
 */
public interface LimitDao {
    public int getTopicCount(int userid);

    public void changeLimit(@Param(value = "topiclimit") int topiclimit, @Param(value = "userid") int userid);

    public int getReplayCount(int userid);
}
