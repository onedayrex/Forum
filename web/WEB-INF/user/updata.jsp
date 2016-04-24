<%--
  Created by IntelliJ IDEA.
  User: onedayrex
  Date: 2016/2/12
  Time: 15:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>密码修改</title>
  <link href="bootstrap\css\bootstrap.min.css" type="text/css" rel="stylesheet">
  <script type="text/javascript" src="bootstrap/js/jquery-2.0.3.js"></script>
  <script type="text/javascript">
   function check(){
     var first = $("#firstpwd").val().trim();
     var seconed = $("#seconedpwd").val().trim();
     if(first==""){
       $("#error_span").html("密码为空");
       return false;
     }else if(first!=seconed){
       $("#error_span").html("两次输入密码不一致")
       return false;
     }else {
       return true;
     }
   }
  </script>
</head>
<body style="background-color: #e2e2e2">
<c:import url="/WEB-INF/navi/navi.jsp"></c:import>
<div class="container">
  <div class="col-lg-4"></div>
  <div class="col-lg-4">
    <div class="panel">
      <div class="panel-body">
        <form action="updata.do" method="post" onsubmit="return check();">
          <div>
            <div class="form-group">
              <label>用户ID</label>
              <input readonly value="${user.id}" name="userid" class="form-control">
            </div>
            <div class="form-group">
              <label>用户名</label>
              <input readonly value="${user.username}" name="username" class="form-control">
            </div>
            <div class="form-group">
              <label>输入密码</label>
              <input type="password" name="password" class="form-control" id="firstpwd">
            </div>
            <div class="form-group">
              <label>再次输入密码</label>
              <input type="password" class="form-control" id="seconedpwd">
              <span id="error_span" style="color: red"></span>
            </div>
            <div>
              <button type="submit" class="btn btn-default">提交</button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
  <div class="col-lg-4"></div>
</div>
</body>
</html>
