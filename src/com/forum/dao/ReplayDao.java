package com.forum.dao;

import com.forum.entities.Replay;
import org.apache.ibatis.annotations.Param;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by onedayrex on 2016/2/5.
 */
public interface ReplayDao {

    public List<Replay> findTopicReplayById(@Param(value = "topicid") int topicid, @Param(value = "begin") int begin, @Param(value = "end") int end);

    public void creatReplay(Replay replay);

    public Integer findReplayCount(int topicid);

    public void deletereplay(int replayid);
}
