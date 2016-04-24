package com.forum.dao;

import com.forum.entities.Manage;
import com.forum.entities.Topic;
import com.forum.entities.User;

import java.util.List;

/**
 * Created by onedayrex on 2016/2/13.
 */
public interface ManageDao {
    public Manage findManageByName(String managename);

    public void deleteTopic(int TopicId);

    public List<User> getAllUser();

    public void banId(int id);

    public void openId(int id);

    public List<User> searchUserByName(String username);

    public List<Topic> getAllTopic();

    public void banTopicById(int id);

    public void openTopicById(int id);

    public List<Topic> searchTopicByTitleOrContent(String valuekey);
}
