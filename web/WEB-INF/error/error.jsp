<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/3/24
  Time: 23:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <title>错误</title>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="bootstrap\js\jquery-2.0.3.js"></script>
    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(function(){
            var i = 3;
            setInterval(function () {
                i--;
                $("#error_span").html(i);
                if(i==0){
                    window.location.href="index.do";
                }
            },1000);

        });
    </script>
</head>
<body>
    <h1 style="text-align: center">
        <c:if test="${error!=null}">${error}</c:if>
        <c:if test="${error==null}">系统出错，请稍后再试</c:if>
    </h1>

    <div style="text-align: center"><span id="error_span">3</span><span>秒后跳到主页</span></div>
</body>
<script type="text/javascript">
   $
        alert($("#ccc").val());



</script>
</html>
