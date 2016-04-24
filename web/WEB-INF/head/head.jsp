<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/3/10
  Time: 14:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>头像上传</title>
    <script type="text/javascript" src="bootstrap/js/jquery-2.0.3.js"></script>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
    <link href="script/jquery.Jcrop.min.css">
    <script type="text/javascript" src="script/jquery.Jcrop.min.js"></script>
    <script type="text/javascript">
        //定义一个全局api，这样操作起来比较灵活
        var api = null;
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.readAsDataURL(input.files[0]);
                reader.onload = function (e) {
                    $('#cutimg').removeAttr('src');
                    $('#cutimg').attr('src', e.target.result);
                    api = $.Jcrop('#cutimg', {
                        setSelect: [ 20, 20, 200, 200 ],
                        aspectRatio: 1,
                        onSelect: updateCoords
                    });
                };
                if (api != undefined) {
                    api.destroy();
                }
            }
            function updateCoords(obj) {
                $("#x").val(obj.x);
                $("#y").val(obj.y);
                $("#w").val(obj.w);
                $("#h").val(obj.h);
            };
        }
    </script>
    <style type="text/css">
        /*bootstrap内置没有滑动下拉通过修改CSS设置滑动下拉*/
        .nav > li .dropdown-menu {
            margin: 0;
        }
        .nav > li:hover .dropdown-menu {
            display: block;
        }
    </style>
</head>
<body style="background-color: #e2e2e2">
<nav class="navbar navbar-inverse">
    <div class="container">
        <div class="navbar-header">
            <a href="index.do" style="color: white" class="navbar-brand">
                <i class="glyphicon glyphicon-home">主页</i>
            </a>
            <a href="totopic.do" style="color: white" class="navbar-brand">
                <i class="glyphicon glyphicon-edit">发表主题</i>
            </a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <c:choose>
                    <c:when test="${user!=null}">
                <li class="dropdown" id="user">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <i>
                            <img src="${user.headpath}" class="img-circle" style="width: 25px;height: 25px">
                                ${user.username}
                        </i>
                    </a>
                    <ul class="dropdown-menu animated" data-animation="flipInX">
                        <li><a href="#">个人信息</a></li>
                        <li class="divider"></li>
                        <li><a href="toupdata.do">密码修改</a></li>
                        <li><a href="touploadhead.do">头像上传</a></li>
                    </ul>
                </li>
                </c:when>
                <c:when test="${manage!=null}"><a href="#"><i class="glyphicon glyphicon-user">${manage.managename}</i></a></c:when>
                </c:choose>
                </li>
                <c:if test="${user!=null||manage!=null}"><li><a href="logout.do"><i class="glyphicon glyphicon-off">退出</i></a></li></c:if>
            </ul>
        </div>
    </div>
</nav>
<div class="container">
    <div class="col-lg-4"></div>
    <div class="col-lg-4">
        <div class="panel">
            <div class="panel-heading">头像上传</div>
            <div class="panel-body">
                <form name="form" action="uploadhead.do"
                      method="post" enctype="multipart/form-data">
                    <div class="modal-body text-center">
                        <div class="zxx_main_con">
                            <div class="zxx_test_list">
                                <img alt="" src="" id="cutimg"/>
                                <input class="photo-file" type="file" name="imgFile" id="fcupload" onchange="readURL(this);"/>
                                <input type="hidden" id="x" name="x"/>
                                <input type="hidden" id="y" name="y"/>
                                <input type="hidden" id="w" name="w"/>
                                <input type="hidden" id="h" name="h"/>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button id="submit">上传</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="col-lg-4"></div>
</div>

</body>
</html>
