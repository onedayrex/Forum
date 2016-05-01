package com.forum.serviceimp;

import com.forum.dao.UserDao;
import com.forum.entities.Replay;
import com.forum.entities.Topic;
import com.forum.entities.User;
import com.forum.entities.UserReplay;
import com.forum.result.ResultMap;
import com.forum.service.UserService;
import com.forum.util.FileUploadUtil;
import com.forum.util.ImageCut;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;

/**
 * Created by onedayrex on 2016/2/12.
 */
@Service("UserService")
public class UserServiceImp implements UserService {
    private UserDao userDao;

    public UserDao getUserDao() {
        return userDao;
    }
    @Resource(name = "userDao")
    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    public void updataPassword(HttpServletRequest req) {
        String id = req.getParameter("username");
        String password = req.getParameter("password");
        User user = new User();
        user.setId(new Integer(id));
        user.setPassword(password);
        userDao.updataPassword(user);
        HttpSession session = req.getSession();
        session.removeAttribute("user");
    }

    @Override
    public User toupdata(HttpServletRequest req) {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        return userDao.getUserByUserName(user.getUsername());
    }

    @Override
    public void uploadhead(HttpServletRequest req, String x, String y, String h, String w, MultipartFile imageFile) throws IOException {
        String realPath = req.getSession().getServletContext().getRealPath("/");
        String resourcePath = "resources/uploadImages/";
        User user = (User) req.getSession().getAttribute("user");
        if(imageFile!=null){
            if(FileUploadUtil.allowUpload(imageFile.getContentType())){
                String fileName = FileUploadUtil.rename(imageFile.getOriginalFilename(),user.getUsername());
                int end = fileName.lastIndexOf(".");
                String saveName = fileName.substring(0,end);
                File dir = new File(realPath + resourcePath);
                if(!dir.exists()){
                    dir.mkdirs();
                }
                File file = new File(dir,saveName+"_src.jpg");
                imageFile.transferTo(file);
                String srcImagePath = realPath + resourcePath + saveName;
                String srcpath = resourcePath+saveName;
                int imageX = Integer.parseInt(x);
                int imageY = Integer.parseInt(y);
                int imageH = Integer.parseInt(h);
                int imageW = Integer.parseInt(w);
                //这里开始截取操作并存入服务器
                ImageCut.imgCut(srcImagePath,imageX,imageY,imageW,imageH);
                //获取以前的头像，如果是默认头像则不操作，如果不是默认头像则先删除服务器中头像文件
                User temp = userDao.getUserByUserName(user.getUsername());
                System.out.println(temp.getHeadpath());
                if(temp.getHeadpath()!=null||!"script/default.jpg".equals(temp.getHeadpath())){
                    File file1 = new File(realPath+temp.getHeadpath());
                    file1.delete();
                }

                userDao.uploadhead(srcpath+"_cut.jpg",user.getUsername());
            }
        }
    }

    @Override
    public ResultMap getUserTopic(int id,int page) {
        ResultMap result = new ResultMap();
        int begin =(page-1)*5;
        int end = 5;
        List<Topic> topics = userDao.getUserTopic(id,begin,end);
        result.setObj(topics);
        return result;
    }

    public ResultMap getUserReplay(int id,int page){
        ResultMap result = new ResultMap();
        int begin =(page-1)*5;
        int end = 5;
        List<UserReplay> replays = userDao.getUserReplay(id,begin,end);
        result.setObj(replays);
        return result;
    }

    public ResultMap getUserReplayCount(int id){
        ResultMap result = new ResultMap();
        int count = userDao.getUserReplayCount(id);
        result.setObj(count);
        return result;
    }

    @Override
    public ResultMap getUserTitleCount(int id) {
        ResultMap result = new ResultMap();
        int count = userDao.getUserTitleCount(id);
        result.setObj(count);
        return result;
    }
}
