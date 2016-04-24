package com.forum.dao;

import com.forum.entities.Topic;

/**
 * Created by Tarena-java on 2016/2/3.
 */
public interface TopicDao {
    public void CreatTopic(Topic topic);

    public Topic getTopicById(int id);

    public void updateconter(int id);
}
