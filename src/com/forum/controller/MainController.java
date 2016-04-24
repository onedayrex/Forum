package com.forum.controller;

import com.forum.entities.Manage;
import com.forum.entities.Topic;
import com.forum.entities.User;
import com.forum.exception.UserDisableException;
import com.forum.result.ResultMap;
import com.forum.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * Created by Tarena-java on 2016/2/3.
 */
@Controller("maincontroller")
public class MainController {
    private TopicService topicService;
    private TitleService titleService;
    private LoginService loginService;
    private RegistService registService;
    private ReplayService replayService;
    private UserService userService;
    private ManageService manageService;
    private SelectService selectService;

    public SelectService getSelectService() {
        return selectService;
    }
    @Resource(name = "SelectService")
    public void setSelectService(SelectService selectService) {
        this.selectService = selectService;
    }

    public ManageService getManageService() {
        return manageService;
    }
    @Resource(name = "ManageService")
    public void setManageService(ManageService manageService) {
        this.manageService = manageService;
    }

    public UserService getUserService() {
        return userService;
    }
    @Resource(name = "UserService")
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public ReplayService getReplayService() {
        return replayService;
    }

    @Resource(name = "ReplayService")
    public void setReplayService(ReplayService replayService) {
        this.replayService = replayService;
    }

    public RegistService getRegistService() {
        return registService;
    }
    @Resource(name = "RegistService")
    public void setRegistService(RegistService registService) {
        this.registService = registService;
    }

    public LoginService getLoginService() {
        return loginService;
    }
    @Resource(name = "LoginService")
    public void setLoginService(LoginService loginService) {
        this.loginService = loginService;
    }

    public TitleService getTitleService() {
        return titleService;
    }
    @Resource(name = "TitleService")
    public void setTitleService(TitleService titleService) {
        this.titleService = titleService;
    }

    public TopicService getTopicService() {
        return topicService;
    }
    @Resource(name = "TopicService")
    public void setTopicService(TopicService topicService) {
        this.topicService = topicService;
    }

    @RequestMapping("toregist.do")
    public String toRegist(){
        return "regist/regist";
    }

    @RequestMapping("regist.do")
    public String Regist(User user){
        registService.creatUser(user);
        return "redirect:index.do";
    }

    @RequestMapping("/tologin.do")
    public String toLogin(){
        return "login/login";
    }

    @RequestMapping("/login.do")
    @ResponseBody
    public ResultMap login(HttpServletRequest req){
        return  loginService.checkuser(req);
    }
    @RequestMapping("/totopic.do")
    public String toTopic(HttpSession session){
        User user = (User) session.getAttribute("user");
        if(user==null){
            return "redirect:tologin.do";
        }
        return "topic/topic";
    }

    @RequestMapping("/creattopic.do")
    public String Creattopic(HttpSession session,HttpServletRequest req){
        User user = (User) session.getAttribute("user");
        if(user==null){
            return "redirect:tologin.do";
        }
        topicService.CreateTopic(req);
        return "redirect:index.do";
    }

    @RequestMapping("/toshow.do")
    public String toShwo(HttpServletRequest req){
        topicService.getTopicById(req);
        replayService.findReplayServiceByID(req);
        return "topic/show";
    }

    @RequestMapping("/index.do")
    public String toAllTitle(HttpServletRequest req){
        titleService.findAllTitle(req);
        return "title/alltitle";
    }
    @RequestMapping("/replay.do")
    public String replay(HttpSession session,HttpServletRequest req){
        User user = (User) session.getAttribute("user");
        if(user==null){
            return "redirect:tologin.do";
        }
        replayService.creatReplay(req);
        String topicid = req.getParameter("topicid");
        return "redirect:toshow.do?id="+topicid;
    }

    @RequestMapping("/toupdata.do")
    public String toUpdataPwd(HttpSession session,HttpServletRequest req){
        User currentuser = (User) session.getAttribute("user");
        if(currentuser==null){
            return "redirect:tologin.do";
        }
        User user = userService.toupdata(req);
        req.setAttribute("user",user);
        return "user/updata";
    }

    @RequestMapping("/updata.do")
    public String updata(HttpServletRequest req){
        userService.updataPassword(req);
        return "redirect:tologin.do";
    }

    @RequestMapping("/admin.do")
    public String toManageLogin(){
        return "manage/managelogin";
    }

    @RequestMapping("/managelogin.do")
    public String ManageLogin(Manage manage,HttpServletRequest req){
        if (manage!=null&&manage.getManagename()!=null) {
            if(manageService.checkManage(manage,req)){
                return "redirect:tomanage.do";
            }else {
                return "redirect:admin.do";
            }
        } else {
            req.setAttribute("error","输入信息出错");
            return  "redirect:admin.do";
        }
    }

    @RequestMapping("/deletetopic.do")
    public String deleteTopic(HttpServletRequest req){
        String topicid= req.getParameter("id");
        manageService.deleteTopic(new Integer(topicid));
        return "redirect:index.do";
    }

    @RequestMapping("/logout.do")
    public String logout(HttpSession session){
        session.removeAttribute("user");
        session.removeAttribute("manage");
        return "redirect:index.do";
    }

    @RequestMapping("/touploadhead.do")
    public String touploadhead(){
        return "head/head";
    }

    @RequestMapping("/uploadhead.do")
    public String uploadhead(
            HttpServletRequest req,
            String x,
            String y,
            String h,
            String w,
            @RequestParam(value = "imgFile") MultipartFile imageFile){
        try {
            userService.uploadhead(req,x,y,h,w,imageFile);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "head/updatesuccess";
    }

    @RequestMapping("/checkUserName.do")
    @ResponseBody
    public ResultMap checkUserName(String username){
        return registService.checkUserName(username);
    }

    @RequestMapping("/tofind.do")
    public String selectByq(HttpServletRequest req){
        String q = req.getParameter("q");
        List<Topic>  list = selectService.selectTitle(q);
        req.setAttribute("answer",list);
        return "question/question";
    }

    @RequestMapping("/deletereplay.do")
    @ResponseBody
    public ResultMap deleteReplay(String replayid){
        return replayService.deleteReplay(new Integer(replayid));
    }

    @RequestMapping("/tomanage.do")
    public String toManage(HttpSession session){
        Manage manage = (Manage) session.getAttribute("manage");
        if (manage!=null){
            return "manage/manage";
        }
        return "redirect:admin.do";
    }

    @RequestMapping("/tousermessage.do")
    public String tousermessage(){
        return "user/usermessage";
    }

    /**
     * 以下是JSON返回数据
     * @return
     */

    //获取所有用户
    @RequestMapping("/getalluser.do")
    @ResponseBody
    public ResultMap getAllUser(){
        return manageService.getAllUser();
    }

    //管理员禁用用户
    @RequestMapping("/banid.do")
    @ResponseBody
    public ResultMap banid(String id){
        return manageService.banId(new Integer(id));
    }

    //管理员恢复用户
    @RequestMapping("/openid.do")
    @ResponseBody
    public ResultMap openid(String id){
        return manageService.openId(new Integer(id));
    }

    //管理员搜索用户
    @RequestMapping("/searchuser.do")
    @ResponseBody
    public ResultMap searchUser(String username){
        return manageService.searchUserByName(username);
    }

    //获取所有主题
    @RequestMapping("/getalltopic.do")
    @ResponseBody
    public ResultMap getAllTopic(){
        return manageService.getAllTopic();
    }

    //禁用帖子
    @RequestMapping("/bantopicbyid.do")
    @ResponseBody
    public ResultMap banTopicById(String id){
        return manageService.banTopicById(new Integer(id));
    }

    //恢复帖子禁用
    @RequestMapping("/opentopicbyid.do")
    @ResponseBody
    public ResultMap openTopicById(String id){
        return manageService.openTopicById(new Integer(id));
    }


    //管理员搜索帖子
    @RequestMapping("/searchtopic.do")
    @ResponseBody
    public ResultMap searchTopic(String key){
        return manageService.searchTopic(key);
    }

    //用户获取自己的所有主题
    @RequestMapping("/getusertopic.do")
    @ResponseBody
    public ResultMap getUsertopic(HttpSession session){
        User user = (User) session.getAttribute("user");
        int id = user.getId();
        return userService.getUserTopic(new Integer(id));
    }

    //用户获取自己的所有回复
    @RequestMapping("/getuserreplay.do")
    @ResponseBody
    public ResultMap getUserReplay(HttpSession session,int page){
        User user = (User) session.getAttribute("user");
        int id = user.getId();
        return userService.getUserReplay(id,page);
    }

    //用户获取自己回复总数
    @RequestMapping("/getuserreplaycount.do")
    @ResponseBody
    public ResultMap getUserReplayCount(HttpSession session){
        User user = (User) session.getAttribute("user");
        int id = user.getId();
        return userService.getUserReplayCount(id);
    }

    //异常捕获
    //@ExceptionHandler
    public String execeptionHandler(Exception e,HttpServletRequest req){
        if(e==null){
            req.setAttribute("error","用户被禁用，请联系管理员");
        }
        return "error/error";
    }
}
