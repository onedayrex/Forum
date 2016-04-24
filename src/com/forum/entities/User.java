package com.forum.entities;

import java.sql.Timestamp;

/**
 * Created by onedayrex on 2016/2/5.
 */
public class User {
    private Integer id;
    private String username;
    private String password;
    private Integer topiclimit;
    private Timestamp creatime;
    private Integer userdisable;
    private String headpath;

    public String getHeadpath() {
        return headpath;
    }

    public void setHeadpath(String headpath) {
        this.headpath = headpath;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getTopiclimit() {
        return topiclimit;
    }

    public void setTopiclimit(Integer topiclimit) {
        this.topiclimit = topiclimit;
    }

    public Timestamp getCreatime() {
        return creatime;
    }

    public void setCreatime(Timestamp creatime) {
        this.creatime = creatime;
    }

    public Integer getUserdisable() {
        return userdisable;
    }

    public void setUserdisable(Integer userdisable) {
        this.userdisable = userdisable;
    }
}
