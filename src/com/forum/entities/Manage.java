package com.forum.entities;

/**
 * Created by onedayrex on 2016/2/13.
 */
public class Manage {
    private Integer id;
    private String managename;
    private String password;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getManagename() {
        return managename;
    }

    public void setManagename(String managename) {
        this.managename = managename;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
