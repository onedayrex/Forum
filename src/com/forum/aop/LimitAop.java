package com.forum.aop;

import com.forum.dao.LimitDao;
import com.forum.dao.UserDao;
import com.forum.entities.User;
import com.forum.exception.UserDisableException;
import com.forum.serviceimp.TopicServiceImp;
import org.aspectj.lang.JoinPoint;
import org.springframework.beans.factory.annotation.Value;

import javax.annotation.Resource;
import javax.management.RuntimeErrorException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by Administrator on 2016/3/12.
 */
public class LimitAop {
    private int start;
    private int step;
    private int max;

    public int getMax() {
        return max;
    }
    @Value("#{limitpro[max]}")
    public void setMax(int max) {
        this.max = max;
    }

    public int getStep() {
        return step;
    }
    @Value("#{limitpro[step]}")
    public void setStep(int step) {
        this.step = step;
    }

    public int getStart() {
        return start;
    }
    @Value("#{limitpro[start]}")
    public void setStart(int start) {
        this.start = start;
    }

    private LimitDao limitDao;

    public LimitDao getLimitDao() {
        return limitDao;
    }
    @Resource(name = "limitDao")
    public void setLimitDao(LimitDao limitDao) {
        this.limitDao = limitDao;
    }

    /**
     * 对发贴方法creatTopic执行后处理
     * 判断用户发贴数量(包括回复)
     * 如果发贴数量大于N，
     * 则对用户的权限进行更改
     * @param jp aop参数
     * 可以通过此参数获取到切入的方法的参数
     *  例：
     *    jp.getArgs()
     *    此方法返回的是一个Object数组
     */
    public void creatdoAfter(JoinPoint jp){
        HttpServletRequest req  = (HttpServletRequest) jp.getArgs()[0];
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        int count=0;
        count = limitDao.getTopicCount(user.getId())+limitDao.getReplayCount(user.getId());
        for(int i = 1 ;i<=max/step;i++){
            if(count>=start*i){
                if(user.getTopiclimit()<start*(i+1)){
                    limitDao.changeLimit(start*(i+1),user.getId());
                    break;
                }
            }else {
                break;
            }
        }


    }

    public void creatBefore(JoinPoint jp) throws Exception {
        HttpServletRequest req  = (HttpServletRequest) jp.getArgs()[0];
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        if(user.getUserdisable()==0) {
            throw new UserDisableException();
        }
    }

}
