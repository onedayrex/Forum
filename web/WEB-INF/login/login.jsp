<%--
  Created by IntelliJ IDEA.
  User: onedayrex
  Date: 2016/2/5
  Time: 17:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
  <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="panel panel-default">
  <form action="login.do" method="post" class="form-horizontal" role="form">
    <div class="panel-body">
      <fieldset>
        <legend>登录</legend>
        <div  class="form-group">
          <label for="userid" class="col-sm-2 control-label">用户名</label>
          <div class="col-sm-10">
            <input type="text" name="username" placeholder="请输入用户名" id="userid" class="form-control">
          </div>
        </div>
        <div class="form-group">
          <label for="pwd" class="col-sm-2 control-label">密码</label>
          <div class="col-sm-10">
            <input type="password" name="password"  placeholder="密码" id="pwd" class="form-control">
          </div>
          <p>${error}</p>
        </div>
        <div class="form-group">
          <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-success">登录</button>
            <button type="button" onclick="location.href='toregist.do'" class="btn btn-success">注册</button>
          </div>
        </div>
      </fieldset>
    </div>
  </form>
</div>
</body>
</html>
