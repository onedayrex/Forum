package com.forum.serviceimp;

import com.forum.dao.RegistDao;
import com.forum.dao.UserDao;
import com.forum.entities.User;
import com.forum.result.ResultMap;
import com.forum.service.RegistService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.sql.Timestamp;

/**
 * Created by onedayrex on 2016/2/6.
 */
@Service("RegistService")
public class RegistServiceImp implements RegistService{
    private RegistDao registDao;
    private UserDao userDao;

    public UserDao getUserDao() {
        return userDao;
    }

    @Resource(name = "userDao")
    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    public RegistDao getRegistDao() {
        return registDao;
    }
    @Resource(name = "registDao")
    public void setRegistDao(RegistDao registDao) {
        this.registDao = registDao;
    }

    @Override
    public void creatUser(User user) {
        user.setCreatime(new Timestamp(System.currentTimeMillis()));
        registDao.creatUser(user);
    }

    @Override
    public ResultMap checkUserName(String username) {
        ResultMap result = new ResultMap();
        User user = userDao.getUserByUserName(username);
        if(user==null){
            result.setStatu(0);
            result.setMsg("用户名可用");
        }else{
            result.setStatu(1);
            result.setMsg("用户名不可用");
        }
        return result;
    }
}
