<%--
  Created by IntelliJ IDEA.
  User: Tarena-java
  Date: 2016/2/3
  Time: 14:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <title></title>
  <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="script/main.css" rel="stylesheet">
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
          <c:forEach items="${titlelist}" var="c">
            <div class="media">
              <div class="media-left"><a href="tousermessage.do?userid=${c.user.id}"><img src="${c.user.headpath}" class="img-circle" style="width: 50px;height: 50px"></a></div>
              <div class="media-body">
                <div class="media-heading item">
                  <a href="toshow.do?id=${c.id}" class="am-text-truncate" style="color: #778087;font-size: large">${c.title}</a>

                </div>
                <%--<div class="media-middle">--%>
                  <%--<p class="small">发贴时间：<fmt:formatDate value="${c.creatime}" type="both"></fmt:formatDate></p>--%>
                <%--</div>--%>
                    <p class="small">
                      ${c.createday}前 •
                        <span class="glyphicon glyphicon-eye-open"></span> ${c.conter} •
                        <span class="glyphicon glyphicon-comment"></span> ${c.replaycount}
                    </p>
                <p class="pull-right">
                  <c:if test="${!empty c.days}"><span class="small">最后回复${c.days}前</span></c:if>
                </p>
                <hr>
              </div>
              <div class="media-right">
                <c:if test="${!empty c.lastreplayuser}">
                  <a href="tousermessage.do?userid=${c.lastreplayuser.id}"><img src="${c.lastreplayuser.headpath}" class="img-circle" style="width: 35px;height: 35px"></a>
                </c:if>
              </div>
            </div>
          </c:forEach>
        </div>
          <div class="row">
            <div class="col-lg-4"></div>
            <div class="col-lg-4">
              <ul class="pagination">
                <c:if test="${pages>1}"><li class="previous"><a href="index.do?page=${pages-1}" class="fui-arrow-left">上一页</a></li></c:if>
                <c:forEach var="cx" begin="1" end="${count}">
                  <li <c:if test="${pages==cx}">class="active"</c:if>><a href="index.do?page=${cx}">${cx}</a></li>
                </c:forEach>
                <c:if test="${pages lt count}"><li class="next"><a href="index.do?page=${pages+1}" class="fui-arrow-right">下一页</a></li></c:if>
              </ul>
              共${count}页
            </div>
            <div class="col-lg-4"></div>
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
