<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/3/24
  Time: 15:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="bootstrap\js\jquery-2.0.3.js"></script>
    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
    <title>管理页面</title>
    <script type="text/javascript">
        function ticktopic(btn){
            //帖子管理按钮
            var flag=btn.innerHTML;
            var id = $(btn).parent().parent().data("titleid");
            if(flag=="屏蔽"){
                $.ajax({
                    url:"bantopicbyid.do",
                    type:"post",
                    datatype:"json",
                    data:{"id":id},
                    success: function (result) {
                        $(btn).parent().prev().html("屏蔽");
                        $(btn).html("恢复");
                        $("#alert_content").html("");
                        $("#alert_content").html(result.msg);
                        $("#myalert").modal("toggle");
                    },
                    error: function () {
                        alert("系统出错，请稍后再试");
                    }

                });
            }else {
                $.ajax({
                    url:"opentopicbyid.do",
                    type:"post",
                    datatype:"json",
                    data:{"id":id},
                    success: function (result) {
                        $(btn).parent().prev().html("正常");
                        $(btn).html("屏蔽");
                        $("#alert_content").html("");
                        $("#alert_content").html(result.msg);
                        $("#myalert").modal("toggle");
                    },
                    error: function () {
                        alert("系统出错，请稍后再试");
                    }

                });
            }
        }
        function searchtopic(){
            var valuekey = $("#search_topic").val();
            $.ajax({
                url:"searchtopic.do",
                type:"post",
                datatype:"json",
                data:{"key":valuekey},
                success: function (result) {
                    var titles = result.obj;
                    $("#topictable").html("");
                    for(var i = 0;i<titles.length;i++){
                        var titleid=titles[i].id;
                        var titlename=titles[i].title;
                        var topicdisable = titles[i].topicdisable;
                        var statu;
                        var btn;
                        if(topicdisable==1){
                            statu="正常";
                            btn="<td><button class='btn btn-default' onclick='ticktopic(this)'>屏蔽</button></td>";
                        }else{
                            statu="屏蔽";
                            btn="<td><button class='btn btn-default' onclick='ticktopic(this)'>恢复</button></td>";
                        }
                        var str = "<tr><td>"+titlename+"</td><td>"+statu+"</td>"+btn+"</tr>";
                        var $tr = $(str);
                        $tr.data("titleid",titleid);
                        $("#topictable").append($tr);
                    }
                },
                error: function () {
                    alert("系统出错，请稍后再试");
                }
            });
        }
        //搜索用户操作
        function searchuser(){
            var username = $("#search_user").val();
            $.ajax({
                url:"searchuser.do",
                type:"post",
                datatype:"json",
                data:{"username":username},
                success:function(result){
                    $("#usertable").html("");
                    var userlist = result.obj;
                    for(var i = 0;i<userlist.length;i++){
                        var id=userlist[i].id;
                        var username=userlist[i].username;
                        var userdisable=userlist[i].userdisable;
                        var statu;
                        var btn;
                        if(userdisable==1){
                            statu="启用";
                            btn="<td><button class='btn btn-default' onclick='tick(this)'>禁用</button></td>"
                        }else {
                            statu="禁用";
                            btn="<td><button class='btn btn-default' onclick='tick(this)'>启用</button></td>"
                        }
                        var str ="<tr><td>"+username+"</td><td>"+statu+"</td>"+btn+"</tr>";
                        var $tr = $(str);
                        $tr.data("id",id);
                        $("#usertable").append($tr);
                    }
                },
                error: function () {
                    alert("系统出错，请稍后再试");
                }
            });
        }
        //当点击启用或者禁用的按钮时，进行相应的操作
        function tick(btn){
            var flag=btn.innerHTML;
            var id=$(btn).parent().parent().data("id");
            if(flag=="禁用"){
                //如果是点击的禁用按钮
                $.ajax({
                    url:"banid.do",
                    type:"post",
                    datatype:"json",
                    data:{"id":id},
                    success:function(result){
                        $(btn).parent().prev().html("禁用");
                        $(btn).html("启用");
                        $("#alert_content").html("");
                        $("#alert_content").html(result.msg);
                        $("#myalert").modal("toggle");
                    },
                    error:function(){
                        alert("操作失败，请稍后再试");
                    }
                });
            }else {
                $.ajax({
                    url:"openid.do",
                    type:"post",
                    datatype:"json",
                    data:{"id":id},
                    success:function(result){
                        $(btn).parent().prev().html("启用");
                        $(btn).html("禁用");
                        $("#alert_content").html("");
                        $("#alert_content").html(result.msg);
                        $("#myalert").modal("toggle");
                    },
                    error:function(){
                        alert("操作失败，请稍后再试");
                    }
                });
            }
        }

        $(function(){
            //TAB选择，并获取用户或者是获取帖子标题
            $("#Mytabs a").click(function(e){
                e.preventDefault();
                if(this.id=="manageuser"){
                    $.ajax({
                        url:"getalluser.do",
                        type:"post",
                        datatype:"json",
                        success:function(result){
                                $("#usertable").html("");
                                var userlist = result.obj;
                                for(var i = 0;i<userlist.length;i++){
                                    var id=userlist[i].id;
                                    var username=userlist[i].username;
                                    var userdisable=userlist[i].userdisable;
                                    var statu;
                                    var btn;
                                    if(userdisable==1){
                                        statu="启用";
                                        btn="<td><button class='btn btn-default' onclick='tick(this)'>禁用</button></td>"
                                    }else {
                                        statu="禁用";
                                        btn="<td><button class='btn btn-default' onclick='tick(this)'>启用</button></td>"
                                    }
                                    var str ="<tr><td>"+username+"</td><td>"+statu+"</td>"+btn+"</tr>";
                                    var $tr = $(str);
                                    $tr.data("id",id);
                                    $("#usertable").append($tr);
                                }
                        },
                        error:function(){
                            alert("获取用户失败")
                        }
                    });
                }else if(this.id=="managetopic"){
                    $.ajax({
                        url:"getalltopic.do",
                        type:"post",
                        datatype:"json",
                        success: function (result) {
                            var titles = result.obj;
                            $("#topictable").html("");
                            for(var i = 0;i<titles.length;i++){
                                var titleid=titles[i].id;
                                var titlename=titles[i].title;
                                var topicdisable = titles[i].topicdisable;
                                var statu;
                                var btn;
                                if(topicdisable==1){
                                    statu="正常";
                                    btn="<td><button class='btn btn-default' onclick='ticktopic(this)'>屏蔽</button></td>";
                                }else{
                                    statu="屏蔽";
                                    btn="<td><button class='btn btn-default' onclick='ticktopic(this)'>恢复</button></td>";
                                }
                                var str = "<tr><td>"+titlename+"</td><td>"+statu+"</td>"+btn+"</tr>";
                                var $tr = $(str);
                                $tr.data("titleid",titleid);
                                $("#topictable").append($tr);
                            }
                        },
                        error: function () {
                            alert("系统出错，请稍后再试");
                        }
                    });
                }
                $(this).tab('show');
            });

            //网页加载完成后模拟点击用户TAB
            $("#manageuser").trigger('click');
        });
    </script>
</head>
<body style="background-color: #e2e2e2">
<div class="container">
    <div class="row">
        <div class="col-lg-2"></div>
        <div class="col-lg-8">
            <div class="panel">
                <div class="panel-heading">
                    <h2 style="text-align:center">管理界面</h2>
                    <div class="modal fade" id="myalert" tabindex="-1" role="dialog" aria-labelledby="myalertlable" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header"><h4 id="myalertlable">提示</h4></div>
                                <div class="modal-body" id="alert_content"></div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel-body">
                    <ul id="Mytabs" class="nav nav-tabs">
                        <li class="active">
                            <a href="#user" data-toggle="tab" id="manageuser">用户管理</a>
                        </li>
                        <li>
                            <a href="#topic" data-toggle="tab" id="managetopic">帖子管理</a>
                        </li>
                        <li>
                            <a href="#ammoun">修改公告</a>
                        </li>
                    </ul>
                    <div id="Mytabcontent" class="tab-content">
                        <div id="user" class="tab-pane fade in active">
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-search"></span></span>
                                <input type="text" name="username" class="form-control" style="width: 240px;" placeholder="用户搜索" id="search_user" onkeyup="searchuser()" autocomplete="off">
                            </div>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <td>用户名</td>
                                        <td>状态</td>
                                        <td>操作</td>
                                    </tr>
                                </thead>
                                <tbody id="usertable"></tbody>
                            </table>
                        </div>
                        <div id="topic" class="tab-pane fade">
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-search"></span></span>
                                <input type="text" class="form-control" style="width: 240px;" placeholder="帖子搜索" id="search_topic" onkeyup="searchtopic(this)" autocomplete="off">
                            </div>
                            <table class="table">
                                <thead>
                                <tr>
                                    <td>标题</td>
                                    <td>状态</td>
                                    <td>操作</td>
                                </tr>
                                </thead>
                                <tbody id="topictable"></tbody>
                            </table>
                        </div>
                        <div id="ammoun" class="tab-pane fade">
                            <div class="form-control">
                                <textarea class="form-control" rows="3"></textarea>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-2"></div>
    </div>
</div>
</body>
</html>
