package com.forum.service;

import com.forum.entities.Topic;

import java.util.List;

/**
 * Created by Administrator on 2016/3/13.
 */
public interface SelectService {
    public List<Topic> selectTitle(String q);
}
