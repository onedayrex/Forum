<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/3/13
  Time: 22:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>搜索结果</title>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="bootstrap\js\jquery-2.0.3.js"></script>
    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body style="background-color: #e2e2e2">
<c:import url="/WEB-INF/navi/navi.jsp"></c:import>
<div class="container">
    <div class="row">
        <div class="col-lg-9">
            <div class="panel">
                <div class="panel-body">
                    <c:if test="${empty answer}"><h1 style="text-align:center">没有此主题</h1></c:if>
                    <c:forEach items="${answer}" var="c">
                        <div class="media">
                            <div class="media-left"><a><img src="${c.user.headpath}" class="img-circle" style="width: 50px;height: 50px"></a></div>
                            <div class="media-body">
                                <div class="media-middle">
                                    <a href="/toshow.do?id=${c.id}" class="am-text-truncate" style="color: #778087;font-size: large">${c.title}</a>
                                    <p class="small">用户:${c.user.username}</p>
                                    <p class="small">发贴时间：<fmt:formatDate value="${c.creatime}" type="both"></fmt:formatDate></p>
                                </div>
                                <hr>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <div class="col-lg-3">
            <div class="panel">
                <div class="panel panel-heading"><h1 style="text-align:center;margin: 0;">公告</h1></div>
                <hr>
                <div class="panel-body">
                    公告示例
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
