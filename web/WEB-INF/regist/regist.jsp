<%--
  Created by IntelliJ IDEA.
  User: onedayrex
  Date: 2016/2/6
  Time: 23:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>注册</title>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="script/style.css" rel="stylesheet">
    <script type="text/javascript" src="bootstrap/js/jquery-2.0.3.js"></script>
    <script type="text/javascript">
      var flag = false;
      function check(){
        $("#user_span").html("");
        $("#pwd1_span").html("");
        $("#pwd2_span").html("");
        if($("#username_input").val()==""){
          $("#user_span").html("用户名为空");
          return false;
        }else if($("#pwd1_input").val()==""){
          $("#pwd1_span").html("密码为空");
          return false;
        }else if($("#pwd2_input").val()!=$("#pwd1_input").val()){
          $("#pwd2_span").html("再次输入密码不一致");
          return false;
        }else {
          return true;
        }
      }

      function checkUserName(){
        var username = $("#username_input").val();
        $.ajax({
          url:"checkUserName.do",
          type:"post",
          dataType:"json",
          data:{"username":username},
          success:function(result){
            if(result.statu==0){
              $("#user_span").removeClass("error");
              $("#user_span").addClass("success");
              $("#user_span").html(result.msg);
              flag = true;
            }else {
              $("#user_span").removeClass("success");
              $("#user_span").addClass("error");
              $("#user_span").html("<i class='glyphicon glyphicon-warning-sign'>"+result.msg+"</i>");
              flag = false;
            }
          },
          error:function(){
            alert("获取用户失败，请稍后在试");
          }
        });
        return flag;
      }
    </script>
</head>
<body style="background-color: #e2e2e2">
<c:import url="/WEB-INF/navi/navi.jsp"></c:import>
<div class="container">
  <div class="col-lg-4"></div>
  <div class="col-lg-4">
    <div class="panel">
      <div class="panel-heading"><h1>注册</h1></div>
      <div class="panel-body">
        <form action="regist.do" method="post" onsubmit="return flag+check()==2;">
          <div>
            <div class="form-group">
              <label>用户名</label>
              <input type="text" name="username" class="form-control" id="username_input" onkeyup="checkUserName();">
              <span id="user_span" class="error"></span>
            </div>
            <div>
              <label>密码</label>
              <input type="password" name="password" class="form-control" id="pwd1_input">
              <span id="pwd1_span" class="error"></span>
            </div>
            <div>
              <label>再次输入密码</label>
              <input type="password" name="pwd" class="form-control" id="pwd2_input" onkeyup="check()">
              <span id="pwd2_span" class="error"></span>
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
