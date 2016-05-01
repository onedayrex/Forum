package com.forum.service;

import com.forum.entities.User;
import com.forum.result.ResultMap;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * Created by onedayrex on 2016/2/12.
 */
public interface UserService {
    public void updataPassword(HttpServletRequest req);

    public User toupdata(HttpServletRequest req);

    public void uploadhead(HttpServletRequest req,String x,String y,String h,String w,MultipartFile imageFile ) throws IOException;

    public ResultMap getUserTopic(int id,int page);

    public ResultMap getUserReplay(int id,int page);

    public ResultMap getUserReplayCount(int id);

    public ResultMap getUserTitleCount(int id);

}
