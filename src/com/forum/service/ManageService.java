package com.forum.service;

import com.forum.entities.Manage;
import com.forum.result.ResultMap;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by onedayrex on 2016/2/13.
 */
public interface ManageService {
    public boolean checkManage(Manage manage,HttpServletRequest req);

    public void deleteTopic(int TopicId);

    public ResultMap getAllUser();

    public ResultMap banId(int id);

    public ResultMap openId(int id);

    public ResultMap searchUserByName(String username);

    public ResultMap getAllTopic();

    public ResultMap banTopicById(int id);

    public ResultMap openTopicById(int id);

    public ResultMap searchTopic(String valuekey);
}
