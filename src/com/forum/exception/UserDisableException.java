package com.forum.exception;

/**
 * 用来捕获用户ID被禁用以后不能发帖的异常
 * Created by Administrator on 2016/3/24.
 */
public class UserDisableException extends Exception{
    public UserDisableException(){

    }
    public UserDisableException(String msg){
        super(msg);
    }
}
