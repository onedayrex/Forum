package com.forum.serviceimp;

import com.forum.dao.SelectDao;
import com.forum.entities.Topic;
import com.forum.service.SelectService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2016/3/13.
 */
@Service("SelectService")
public class SelectServiceImp implements SelectService {
    private SelectDao selectDao;

    public SelectDao getSelectDao() {
        return selectDao;
    }
    @Resource(name = "selectDao")
    public void setSelectDao(SelectDao selectDao) {
        this.selectDao = selectDao;
    }

    @Override
    public List<Topic> selectTitle(String q) {
        return selectDao.findByTitle(q);
    }
}
