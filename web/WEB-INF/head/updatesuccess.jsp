<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/3/11
  Time: 15:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>修改头像成功</title>
    <script type="text/javascript" src="bootstrap/js/jquery-2.0.3.js"></script>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript">
        $(function(){
            var i = 3 ;
            var id = setInterval(function(){
                i--;
                $("#time_span").html(i);
                if(i==0){
                    window.location.href="index.do";
                }
            },1000);
        });
    </script>
</head>
<body style="background-color: #e2e2e2">
<c:import url="/WEB-INF/navi/navi.jsp"></c:import>
<div class="container">
    <div class="col-lg-4"></div>
    <div class="col-lg-4">
        <h1>修改成功，需要退出后重新登陆才能看到效果</h1>
        <span id="time_span">3</span>
        <span>秒后跳到主页</span>
    </div>
    <div class="col-lg-4"></div>
</div>
</body>
</html>
