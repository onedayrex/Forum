package com.forum.dao;

import com.forum.entities.Replay;
import com.forum.entities.Topic;
import com.forum.entities.User;
import com.forum.entities.UserReplay;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by onedayrex on 2016/2/12.
 */
public interface UserDao {

    public void updataPassword(User user);

    public User getUserByUserName(String username);

    public User getUserById(int id);

    public void uploadhead(@Param(value = "path") String path, @Param(value = "username") String username);


    public List<Topic> getUserTopic(int id);


    public List<UserReplay> getUserReplay(@Param(value = "id") int id, @Param(value = "begin") int begin, @Param(value = "end") int end);

    public int getUserReplayCount(int id);
}
