package com.forum.entities;

import java.sql.Timestamp;

/**
 * Created by Tarena-java on 2016/2/3.
 */
public class Topic {
    private Integer id;
    private Integer blockid;
    private Integer userid;
    private String title;
    private String content;
    private Integer topicdisable;
    private Timestamp creatime;
    private Integer topiclimit;
    private User user;

    public Integer getTopicdisable() {
        return topicdisable;
    }

    public void setTopicdisable(Integer topicdisable) {
        this.topicdisable = topicdisable;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }



    public Integer getTopiclimit() {
        return topiclimit;
    }

    public void setTopiclimit(Integer topiclimit) {
        this.topiclimit = topiclimit;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getBlockid() {
        return blockid;
    }

    public void setBlockid(Integer blockid) {
        this.blockid = blockid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getCreatime() {
        return creatime;
    }

    public void setCreatime(Timestamp creatime) {
        this.creatime = creatime;
    }

}
