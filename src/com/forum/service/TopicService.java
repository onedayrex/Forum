package com.forum.service;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Tarena-java on 2016/2/3.
 */
public interface TopicService {
    public void CreateTopic(HttpServletRequest req);

    public void getTopicById(HttpServletRequest req);
}
