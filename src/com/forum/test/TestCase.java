package com.forum.test;

import com.forum.dao.SelectDao;
import com.forum.dao.TitleDao;
import com.forum.entities.Topic;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.sql.DataSource;
import java.util.List;

/**
 * Created by Tarena-java on 2016/2/3.
 */
@Service("test")
public class TestCase {
    @Resource(name = "titleDao")
    private TitleDao titleDao;

    public TitleDao getTitleDao() {
        return titleDao;
    }

    public void setTitleDao(TitleDao titleDao) {
        this.titleDao = titleDao;
    }

    private DataSource ds;

    public DataSource getDs() {
        return ds;
    }

    @Resource(name = "db")
    public void setDs(DataSource ds) {
        this.ds = ds;
    }

public static void main(String[] args){
    ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
//    TopicService topicService= (TopicService) ctx.getBean("TopicService");
//    Topic topic = new Topic();
//    topicService.CreateTopic(topic);
    TitleDao titleDao = (TitleDao) ctx.getBean("titleDao");
    List<Topic> list = titleDao.findAllTopic(0,10);
//    for(Topic t:list){
//        System.out.println(t.getUser().getUsername());
//    }
    SelectDao selectDao = (SelectDao) ctx.getBean("selectDao");
    List<Topic> list1 = selectDao.findByTitle("a");
    for (Topic t:list1){
        System.out.println(t.getTitle());
    }
}
}
