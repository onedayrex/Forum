package com.forum.serviceimp;

import com.forum.dao.TitleDao;
import com.forum.entities.Topic;
import com.forum.service.TitleService;
import com.forum.util.DateDayUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by Tarena-java on 2016/2/3.
 */
@Service("TitleService")
public class TitleServiceImp implements TitleService {
    private TitleDao titleDao;

    public TitleDao getTitleDao() {
        return titleDao;
    }

    @Resource(name = "titleDao")
    public void setTitleDao(TitleDao titleDao) {
        this.titleDao = titleDao;
    }

    @Override
    public void findAllTitle(HttpServletRequest req) {
        List<Topic> list = null;
        String page = req.getParameter("page");
        if(page==null||page.equals("")){
            page = "1";
        }
        Integer begin =(Integer.parseInt(page)-1)*10;
        Integer end = Integer.parseInt(page)*10;
        list = titleDao.findAllTopic(begin,end);
        int count = (int) Math.ceil(titleDao.findAllCount()/10.0);
        for (Topic topic : list) {
            //转化最后回复时间
            if(topic.getLasttime()!=null){
                topic.setDays(DateDayUtil.changDays(topic.getLasttime()));
            }
            //转化创建时间
            if(topic.getCreatime()!=null){
                topic.setCreateday(DateDayUtil.changDays(topic.getCreatime()));
            }
            //查询回复数量
            topic.setReplaycount(titleDao.getReplayCount(topic.getId()));
        }
        req.setAttribute("pages",Integer.parseInt(page));
        req.setAttribute("count",count);
        req.setAttribute("titlelist",list);
    }
}
