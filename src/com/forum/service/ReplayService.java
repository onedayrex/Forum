package com.forum.service;


import com.forum.result.ResultMap;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by onedayrex on 2016/2/12.
 */
public interface ReplayService {
    public void findReplayServiceByID(HttpServletRequest req);

    public void creatReplay(HttpServletRequest req);

    public ResultMap deleteReplay(int replayid);
}
