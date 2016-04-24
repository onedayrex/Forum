<%--
  Created by IntelliJ IDEA
  User: onedayrex
  Date: 2016/2/13
  Time: 20:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <title></title>
</head>
<body>
<div class="container">
  <form action="managelogin.do" method="post">
    <div class="panel panel-default">
      <div class="panel-body">
        <fieldset>
          <legend>登录</legend>
          <div  class="form-group">
            <label for="managename">ID</label>
            <input type="text" name="managename" placeholder="请输入管理员账号" id="managename" class="form-control">
          </div>
          <div class="form-group">
            <label for="pwd">密码</label>
            <input type="password" name="password"  placeholder="密码" id="pwd" class="form-control">
            <p>${error}</p>
          </div>
          <div>
            <button type="submit" class="btn btn-success">登录</button>
          </div>
        </fieldset>
      </div>
    </div>
  </form>
</div>
</body>
</html>
