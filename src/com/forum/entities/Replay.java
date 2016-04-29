package com.forum.entities;

import java.sql.Timestamp;

/**
 * Created by onedayrex on 2016/2/5.
 */
public class Replay {
    private Integer id;
    private Integer topicid;
    private Integer userid;
    private String content;
    private Timestamp replaytime;
    private User user;
    private int disable;
    private String days;

    public String getDays() {
        return days;
    }

    public void setDays(String days) {
        this.days = days;
    }

    public int getDisable() {
        return disable;
    }

    public void setDisable(int disable) {
        this.disable = disable;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

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
}
