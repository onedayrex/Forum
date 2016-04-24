package com.forum.serviceimp;

import com.forum.dao.ManageDao;
import com.forum.entities.Manage;
import com.forum.entities.Topic;
import com.forum.entities.User;
import com.forum.result.ResultMap;
import com.forum.service.ManageService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by onedayrex on 2016/2/13.
 */
@Service("ManageService")
public class ManageServiceImp implements ManageService {
    private ManageDao manageDao;

    public ManageDao getManageDao() {
        return manageDao;
    }
    @Resource(name = "manageDao")
    public void setManageDao(ManageDao manageDao) {
        this.manageDao = manageDao;
    }

    @Override
    public boolean checkManage(Manage manage,HttpServletRequest req) {
        Manage remanage = manageDao.findManageByName(manage.getManagename());
        if (remanage!=null) {
            if(manage.getPassword().equals(remanage.getPassword())){
                HttpSession session = req.getSession();
                session.setAttribute("manage",remanage);
                return true;
            }else {
                req.setAttribute("error","密码错误");
                return false;
            }
        } else {
            req.setAttribute("error","没有此管理员");
            return false;
        }
    }

    @Override
    public void deleteTopic(int TopicId) {
        manageDao.deleteTopic(TopicId);
    }

    @Override
    public ResultMap getAllUser() {
        ResultMap result = new ResultMap();
        result.setStatu(0);
        result.setObj(manageDao.getAllUser());
        return result;
    }

    @Override
    public ResultMap banId(int id) {
        ResultMap result = new ResultMap();
        manageDao.banId(id);
        result.setMsg("禁用成功");
        return result;
    }

    @Override
    public ResultMap openId(int id) {
        ResultMap result = new ResultMap();
        manageDao.openId(id);
        result.setMsg("启用成功");
        return result;
    }

    @Override
    public ResultMap searchUserByName(String username) {
        ResultMap result = new ResultMap();
        List<User> list = manageDao.searchUserByName(username);
        result.setObj(list);
        return result;
    }

    @Override
    public ResultMap getAllTopic() {
        ResultMap result = new ResultMap();
        List<Topic> list = manageDao.getAllTopic();
        result.setObj(list);
        return result;
    }

    @Override
    public ResultMap banTopicById(int id) {
        ResultMap result = new ResultMap();
        manageDao.banTopicById(id);
        result.setMsg("屏蔽成功");
        return result;
    }

    @Override
    public ResultMap openTopicById(int id) {
        ResultMap result = new ResultMap();
        manageDao.openTopicById(id);
        result.setMsg("恢复成功");
        return result;
    }

    @Override
    public ResultMap searchTopic(String valuekey) {
        ResultMap result = new ResultMap();
        List<Topic> list = manageDao.searchTopicByTitleOrContent(valuekey);
        result.setObj(list);
        return  result;
    }
}
