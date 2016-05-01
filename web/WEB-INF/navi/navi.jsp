<%--
  Created by IntelliJ IDEA.
  User: onedayrex
  Date: 2016/2/14
  Time: 14:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <%--<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">--%>
  <%--<script type="text/javascript" src="bootstrap/js/jquery-2.0.3.js"></script>--%>
    <title></title>
  <script type="text/javascript">
    $(function(){
      $("#login").click(function(){
        var username = $("#username").val().trim();
        var password = $("#pwd").val().trim();
        $("#error_p").html("");
        if(username==""){
          $("#error_p").html("用户名为空");
        }else if(password==""){
          $("#error_p").html("密码为空");
        }else {
          $.ajax({
            url:"login.do",
            type:"post",
            datatype:"json",
            data:{"username":username,"password":password},
            success:function(result){
              if(result.statu==0){
                window.location.href="index.do";
              }else if(result.statu==1){
                $("#error_p").html(result.msg);
              }else if(result.statu==2){
                $("#error_p").html(result.msg);
              }
            },
            error:function(){
              alert("登陆失败，稍后再试");
            }
          });
        }
      });
    });
  </script>
  <style type="text/css">
    .main{
      height: 100px;
      width: auto;
      color: #00a0e9;
    }
    /*bootstrap内置没有滑动下拉通过修改CSS设置滑动下拉*/
    .nav > li .dropdown-menu {
      margin: 0;
    }
    .nav > li:hover .dropdown-menu {
      display: block;
    }
  </style>
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container">
    <div class="navbar-header">
      <a href="index.do" style="color: white" class="navbar-brand">
        <i class="glyphicon glyphicon-home fontstyle">主页</i>
      </a>
      <a href="totopic.do" style="color: white" class="navbar-brand">
        <i class="glyphicon glyphicon-edit fontstyle">发表主题</i>
      </a>
    </div>
    <div class="navbar-collapse collapse">
      <ul class="nav navbar-nav">
        <%--搜索框--%>
          <form class="navbar-form navbar-left" id="search_form" role="search" method="get" action="tofind.do">
            <div class="form-group has-feedback">
              <input type="text" name="q" class="form-control" style="width: 240px;" value="" placeholder="回车搜索">
              <span class="glyphicon glyphicon-search form-control-feedback" aria-hidden="true" style="line-height: 28px;"></span>
            </div>
          </form>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li>
          <c:choose>
          <c:when test="${user!=null}">
        <li class="dropdown" id="user">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">
            <i>
              <img src="${user.headpath}" class="img-circle" style="width: 25px;height: 25px">
                ${user.username}
            </i>
          </a>
          <ul class="dropdown-menu animated" data-animation="flipInX">
            <li><a href="tousermessage.do?userid=${sessionScope.user.id}"><span class="glyphicon glyphicon-user">个人信息</span></a></li>
            <li class="divider"></li>
            <li><a href="toupdata.do"><span class="glyphicon glyphicon-modal-window">密码修改</span></a></li>
            <li><a href="touploadhead.do"><span class="glyphicon glyphicon-picture">头像上传</span></a></li>
          </ul>
        </li>
        </c:when>
        <c:when test="${manage!=null}"><a href="#"><i class="glyphicon glyphicon-user">${manage.managename}</i></a></c:when>
        <c:otherwise>

          <!-- 登陆模态框 -->
          <a href="" data-toggle="modal" data-target=".logmodal">登录</a>

          <div class="modal fade logmodal" tabindex="-1" role="dialog" aria-labelledby="theloginmodal" id="loginmodal">
            <div class="modal-dialog modal-lg">
              <div class="modal-content">

                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                  <h4 class="modal-title" id="mySmallModalLabel">登陆</h4>
                </div>
                <div class="modal-body">
                  <div class="panel-body">
                    <div  class="form-group">
                      <label for="username" class="col-sm-2 control-label">用户名</label>
                      <div class="col-sm-10">
                        <input type="text" name="username" placeholder="请输入用户名" id="username" class="form-control">
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="pwd" class="col-sm-2 control-label">密码</label>
                      <div class="col-sm-10">
                        <input type="password" name="password"  placeholder="密码" id="pwd" class="form-control">
                      </div>
                      <p id="error_p"></p>
                    </div>
                    <div class="form-group">
                      <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-success" id="login">登录</button>
                        <button type="button" onclick="location.href='toregist.do'" class="btn btn-success">注册</button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </c:otherwise>
        </c:choose>
        </li>
        <c:if test="${user!=null||manage!=null}"><li><a href="logout.do"><i class="glyphicon glyphicon-off">退出</i></a></li></c:if>
      </ul>
    </div>
  </div>
</nav>
</body>
</html>
