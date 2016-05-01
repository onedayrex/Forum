<%--
  Created by IntelliJ IDEA.
  User: onedayrex
  Date: 2016/2/12
  Time: 20:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <title>个人信息</title>
  <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <script type="text/javascript" src="bootstrap\js\jquery-2.0.3.js"></script>
  <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="script/extendPagination.js"></script>
  <script type="text/javascript" src="script/DateFormat.js"></script>
  <script type="text/javascript">
    $(function(){
      $("#userTabs a").click(function (e) {
        e.preventDefault();
        if(this.id=="MyTopic"){
          inittitlepage();
          var page = 1;
          gettitledata(page);
        }
        else if(this.id=="MyReplay"){
          initpage();
          var page = 1;
          getreplaydata(page);
        }
      });
      //模拟点击
      $("#MyTopic").trigger('click');


    });
    //标题分布初始化
    function inittitlepage() {
      var count;
      var userid = ${userid};
      $.ajax({
        url:"getusertitlecount.do",
        type:"post",
        data:{"id":userid},
        datatype:"json",
        success: function (result) {
          count = result.obj;
          $("#titlepage").extendPagination({

            totalCount:count,
            showCount:5,
            limit:5,
            callback:function (curr) {
              getreplaydata(curr);
            }

          });
        },
        error: function () {
          alert("系统出错，请稍后再试");
        }
      });
    }
    //回复分页初始化
    function initpage(){
      var count;
      var userid = ${userid};
      $.ajax({
        url:"getuserreplaycount.do",
        type:"post",
        data:{"userid":userid},
        datatype:"json",
        success: function (result) {
          count = result.obj;
          $("#mypage").extendPagination({

            totalCount:count,
            showCount:5,
            limit:5,
            callback:function (curr) {
              getreplaydata(curr);
            }

          });
        },
        error: function () {
          alert("系统出错，请稍后再试");
        }
      });

    }
    //获取用户主题
    function gettitledata(page){
      $("#titlebody").html("");
      var userid = ${userid};
      $.ajax({
        url:"getusertopic.do",
        type:"post",
        datatype:"json",
        data:{"page":page,"userid":userid},
        success: function (result) {
          var topics = result.obj;
          for(var i =0 ;i<topics.length;i++){
            var title = topics[i].title;
            var topicid = topics[i].id;
            var creatime = topics[i].creatime;
            var timestr = getLocalTime(creatime);
            var str = "<tr><td>"+title+"</td><td>"+timestr+"</td><td><a href='toshow.do?id="+topicid+"' class='btn btn-default'>查看</a></td></tr>"
            var $tr = $(str);
            $("#titlebody").append($tr);
          }
        },
        error: function () {
          alert("系统出错，请稍后再试");
        }
      });
    }
    function getreplaydata(page){
      $("#replaybody").html("");
      var userid = ${userid};
      $.ajax({
        url:"getuserreplay.do",
        type:"post",
        datatype:"json",
        data:{"page":page,"userid":userid},
        success: function (result) {
          var replays = result.obj;
          for (var i=0;i<=replays.length;i++){
            var title = replays[i].topic.title;
            var topicid = replays[i].topic.id;
            var strleng = 5;
            if(replays[i].content.length<6){
              strleng = replays[i].content.length-1;
            }
            var replaycontent = replays[i].content.substring(0,strleng);
            var time = getLocalTime(replays[i].replaytime);
            var str = "<tr><td>"+title+"</td><td>"+replaycontent+"...</td><td>"+time+"</td><td><a class='btn btn-default' href='toshow.do?id="+topicid+"'>查看</a></td></tr>";
            var $tr = $(str);
            $("#replaybody").append($tr);
          }
        },
        error: function () {
          alert("系统出错，请稍后再试");
        }
      });
    }
  </script>
</head>
<body>
<c:import url="/WEB-INF/navi/navi.jsp"></c:import>
<div class="container">
  <div class="row">
    <div class="col-lg-2"></div>
    <div class="col-lg-8">
      <div class="panel">
        <div class="panel-heading">
          <h1 style="text-align: center">个人信息</h1>
        </div>
        <div class="panel-body">
          <ul id="userTabs" class="nav nav-tabs">
            <li>
              <c:if test="${who=='user'}"><a href="#title" data-toggle="tab" id="MyTopic">我的主题</a></c:if>
              <c:if test="${who=='otheruser'}"><a href="#title" data-toggle="tab" id="MyTopic">他的主题</a></c:if>
            </li>
            <li>
              <c:if test="${who=='user'}"><a href="#replay" data-toggle="tab" id="MyReplay">我的回复</a></c:if>
              <c:if test="${who=='otheruser'}"><a href="#replay" data-toggle="tab" id="MyReplay">他的回复</a></c:if>
            </li>
          </ul>
          <div id="UserContent" class="tab-content">
            <div id="title" class="tab-pane fade in active">
              <table class="table">
                <thead>
                  <tr>
                    <td>标题</td>
                    <td>发帖时间</td>
                    <td>操作</td>
                  </tr>
                </thead>
                <tbody id="titlebody">
                </tbody>
              </table>
              <div id="titlepage"></div>
            </div>
            <div id="replay" class="tab-pane fade in">
              <table class="table">
                <thead>
                  <tr>
                    <td>主题</td>
                    <td>回复内容</td>
                    <td>回复时间</td>
                    <td>操作</td>
                  </tr>
                </thead>
                <tbody id="replaybody">
                </tbody>
              </table>
              <div id="mypage"></div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="col-lg-2"></div>
  </div>
</div>
<%--<div class="container">--%>
  <%--<div class="panel panel-default">--%>
    <%--<div class="panel-heading">作者</div>--%>
    <%--<div class="panel-body">--%>
      <%--<span>UID：${user.id}</span>--%>
      <%--<span>用户名：${user.username}</span>--%>
      <%--<em>注册时间：${user.creatime}</em>--%>
    <%--</div>--%>
  <%--</div>--%>
  <%--<div>--%>
  <%--</div>--%>
<%--</div>--%>
  <script type="text/javascript">

</script>

</body>
</html>
