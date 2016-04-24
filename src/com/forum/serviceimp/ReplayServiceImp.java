package com.forum.serviceimp;

import com.forum.dao.ReplayDao;
import com.forum.entities.Replay;
import com.forum.entities.User;
import com.forum.result.ResultMap;
import com.forum.service.ReplayService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.List;

/**
 * Created by onedayrex on 2016/2/12.
 */
@Service("ReplayService")
public class ReplayServiceImp implements ReplayService {
    private ReplayDao replayDao;

    public ReplayDao getReplayDao() {
        return replayDao;
    }
    @Resource(name = "replayDao")
    public void setReplayDao(ReplayDao replayDao) {
        this.replayDao = replayDao;
    }

    @Override
    public void findReplayServiceByID(HttpServletRequest req) {
        String id = req.getParameter("id");
        String replaypage = req.getParameter("replaypage");
        if(replaypage==null||replaypage.equals("")){
            replaypage = "1";
        }
        Integer begin =(Integer.parseInt(replaypage)-1)*5;
        Integer end = Integer.parseInt(replaypage)*5;
        if(!id.isEmpty()&&id!=null){
            List<Replay> replays = replayDao.findTopicReplayById(new Integer(id),begin,end);
            Integer count = (int) Math.ceil(replayDao.findReplayCount(Integer.parseInt(id))/5.0);
            req.setAttribute("count",count);
            req.setAttribute("replays",replays);
            req.setAttribute("replaypage",new Integer(replaypage));
        }
    }

    @Override
    public void creatReplay(HttpServletRequest req) {
        String topicid= req.getParameter("topicid");
        String content = req.getParameter("content");
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        Replay replay = new Replay();
        replay.setTopicid(new Integer(topicid));
        replay.setUserid(user.getId());
        replay.setContent(content);
        replay.setReplaytime(new Timestamp(System.currentTimeMillis()));
        replayDao.creatReplay(replay);
        replayDao.updateTopicLastTime(new Integer(topicid),replay.getReplaytime());
    }

    @Override
    public ResultMap deleteReplay(int replayid) {
        ResultMap result = new ResultMap();
        replayDao.deletereplay(replayid);
        result.setStatu(0);
        result.setMsg("屏蔽成功");
        return result;
    }
}
