package com.forum.service;

import com.forum.entities.User;
import com.forum.result.ResultMap;

/**
 * Created by onedayrex on 2016/2/6.
 */
public interface RegistService {
    public void creatUser(User user);

    public ResultMap checkUserName(String username);
}
