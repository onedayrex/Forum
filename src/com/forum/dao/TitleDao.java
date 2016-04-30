package com.forum.dao;

import com.forum.entities.Topic;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Tarena-java on 2016/2/3.
 */
public interface TitleDao {
    public List<Topic> findAllTopic(@Param(value = "begin") int begin, @Param(value = "end") int end);

    public Integer findAllCount();

    public Integer getReplayCount(int replayId);
}
