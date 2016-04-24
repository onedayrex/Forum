package com.forum.entities;

import java.sql.Timestamp;

/**
 * Created by Administrator on 2016/4/7.
 */
public class UserReplay {
    private Integer id;
    private Integer topicid;
    private Integer userid;
    private String content;
    private Timestamp replaytime;
    private User user;
    private int disable;
    private Topic topic;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTopicid() {
        return topicid;
    }

    public void setTopicid(Integer topicid) {
        this.topicid = topicid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getReplaytime() {
        return replaytime;
    }

    public void setReplaytime(Timestamp replaytime) {
        this.replaytime = replaytime;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getDisable() {
        return disable;
    }

    public void setDisable(int disable) {
        this.disable = disable;
    }

    public Topic getTopic() {
        return topic;
    }

    public void setTopic(Topic topic) {
        this.topic = topic;
    }
}
