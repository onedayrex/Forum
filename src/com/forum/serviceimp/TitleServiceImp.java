package com.forum.serviceimp;

import com.forum.dao.TitleDao;
import com.forum.entities.Topic;
import com.forum.service.TitleService;
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
        req.setAttribute("pages",Integer.parseInt(page));
        req.setAttribute("count",count);
        req.setAttribute("titlelist",list);
    }
}
