<%--
  Created by IntelliJ IDEA.
  User: Tarena-java
  Date: 2016/2/3
  Time: 10:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title></title>
  <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="ueditor/themes/default/css/ueditor.css" type="text/css" rel="stylesheet">
  <script type="text/javascript" src="bootstrap/js/jquery-2.0.3.js"></script>
  <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
  <script type="text/javascript" charset="utf-8" src="ueditor/ueditor.config.js"></script>
  <script type="text/javascript" charset="utf-8" src="ueditor/ueditor.all.min.js"></script>
  <script type="text/javascript" src="ueditor/lang/zh-cn/zh-cn.js"></script>
  <script type="text/javascript" src="script/disablereplay.js"></script>
</head>
<body style="background-color: #e2e2e2">
<c:import url="/WEB-INF/navi/navi.jsp"></c:import>
<div class="container">
  <div class="content-wrap">
    <div class="row">
      <div class="opacity_bg" style='display:none'></div>
      <div id="can"></div>
      <div class="col-lg-9">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 style="text-align: center">${topic.title}</h3>
          </div>
          <div class="panel-body">
            <div>
              <c:if test="${sessionScope.user.topiclimit>=topic.topiclimit}">${topic.content}</c:if>
              <c:if test="${sessionScope.user.topiclimit<topic.topiclimit}"><h1 style="text-align: center">您没有权限阅读，请去发贴或回复升级权限</h1></c:if>
              <c:if test="${sessionScope.user==null}">
                <c:if test="${topic.topiclimit==10}">
                  ${topic.content}
                </c:if>
                <c:if test="${topic.topiclimit>10}">
                  <h1 style="text-align: center">您没有权限阅读,请登陆后重试</h1>
                </c:if>
              </c:if>
            </div>
          </div>
        </div>
        <div class="panel panel-default">
          <div class="panel-heading">
            <div class="panel-body">
              <c:if test="${replays.isEmpty()}"><div style="text-align: center">现在还没有回复哦</div></c:if>
              <c:forEach items="${replays}" var="c">
              <div class="media">
                <div class="media-left">
                  <img src="${c.user.headpath}" class="img-circle" style="width: 25px">
                </div>
                <div class="media-body">
                  <div class="media-heading">
                    <p class="small-fade">
                      <i><a href="#">${c.user.username}</a></i>
                      <span class="pull-right">${c.days}前</span>
                    </p>
                  </div>
                  <div class="media-body" style="margin-left: 24px">
                    <c:if test="${c.disable==1}"><p id="${c.id}">${c.content}</p></c:if>
                    <c:if test="${c.disable==0}"><p>用户回复被屏蔽</p></c:if>
                  </div>
                  <div class="media-right">
                    <c:if test="${sessionScope.user.id==topic.userid}">
                      <c:if test="${c.disable==1}">
                        <button type="button" class="btn btn-default" onclick="disablereplay('${c.id}')">
                          屏蔽回复
                        </button>
                      </c:if>
                    </c:if>
                  </div>

                </div>
              </div>
                <hr>
                <ul class="pagination">
              </c:forEach>
              <c:if test="${requestScope.replaypage>1}"><li class="previous"><a href="toshow.do?id=${topic.id}&replaypage=${requestScope.replaypage-1}">上一页</a></li></c:if>
              <c:forEach var="c" begin="1" end="${requestScope.count}">
                <li <c:if test="${replaypage==c}">class="active"</c:if>><a href="toshow.do?id=${topic.id}&replaypage=${c}">${c}</a></li>
              </c:forEach>
              <c:if test="${requestScope.replaypage lt requestScope.count}"><li class="next"><a href="toshow.do?id=${topic.id}&replaypage=${requestScope.replaypage+1}">下一页</a></li></c:if>共${count}页
                </ul>
            </div>
          </div>
        </div>
        <div class="panel panel-default">
          <div class="panel-body">
          <form action="replay.do" method="post" onsubmit="return submittest()==1">
            <input type="hidden" name="topicid" value="${topic.id}">
            <script id="editor" type="text/plain" name="content"></script>
            <input type="submit" value="回复">
          </form>
          </div>
        </div>
      </div>
      <div class="col-lg-3">
          <div class="panel panel-default">
            <div class="panel-heading">作者</div>
            <div class="panel-body">
              <div><img src="${requestScope.showuser.headpath}" style="width: 50px;height: 50px"></div>
              <span>UID：${requestScope.showuser.id}</span><br>
              <span>用户名：${requestScope.showuser.username}</span><br>
              <p class="small">注册时间：<fmt:formatDate value="${requestScope.showuser.creatime}"></fmt:formatDate></p>
            </div>
          </div>
          <div>
          </div>
      </div>
    </div>
  </div>
</div>
</body>
<script type="text/javascript">
  var ue = UE.getEditor("editor",{//这里可以选择自己需要的工具按钮名称,此处仅选择如下五个
    toolbars:[[
      'bold','fontfamily', //字体
      'fontsize', //字号
      'insertcode', //代码语言
      '|',
      'link', //超链接
      'unlink', //取消链接
      'simpleupload', //单图上传
      'insertimage', //多图上传
    ]],
    //focus时自动清空初始化时的内容
    autoClearinitialContent:true,
    //关闭字数统计
    wordCount:false,
    //关闭elementPath
    elementPathEnabled:false,
    //默认的编辑区域高度
    initialFrameHeight:300
    //更多其他参数，请参考ueditor.config.js中的配置项
  });

  function submittest(){
    if(!ue.hasContent()){
      alert("请先输入内容！！");
      return false;
    }else{
      return true;
    }
  }

</script>
</html>
