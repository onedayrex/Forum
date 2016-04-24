package com.forum.dao;

import com.forum.entities.Topic;

import java.util.List;

/**
 * Created by Administrator on 2016/3/11.
 */
public interface SelectDao {
    public List<Topic> findByTitle(String title);
}
