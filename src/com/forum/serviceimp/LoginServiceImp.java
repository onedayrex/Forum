package com.forum.serviceimp;

import com.forum.dao.LoginDao;
import com.forum.dao.UserDao;
import com.forum.entities.User;
import com.forum.result.ResultMap;
import com.forum.service.LoginService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by onedayrex on 2016/2/5.
 */
@Service("LoginService")
public class LoginServiceImp implements LoginService {
    @Resource(name = "userDao")
    private UserDao userDao;

    public UserDao getUserDao() {
        return userDao;
    }

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    public ResultMap checkuser(HttpServletRequest req) {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        ResultMap result = new ResultMap();
        User user = null;
        if(username!=null&&!username.equals("")){
            user = userDao.getUserByUserName(username);
            if (user!=null) {
                if(user.getPassword().equals(password)){
                    //登录成功
                    HttpSession session = req.getSession();
                    session.setAttribute("user",user);
                    result.setStatu(0);
                    return result;
                }
            } else {
                result.setStatu(1);
                result.setMsg("没有此用户");
            }
        }
        if(username==null||username.equals("")||user==null){
            result.setStatu(1);
            result.setMsg("没有此用户");
        }else{
            result.setStatu(2);
            result.setMsg("密码错误");
        }


        return result;
    }


}
