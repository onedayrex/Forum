<%--
  Created by IntelliJ IDEA.
  User: Tarena-java
  Date: 2016/2/3
  Time: 10:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <title>发表话题</title>
  <link href="ueditor/themes/default/css/ueditor.css" type="text/css" rel="stylesheet">
  <link href="bootstrap\css\bootstrap.min.css" type="text/css" rel="stylesheet">
  <script type="text/javascript" src="bootstrap/js/jquery-2.0.3.js"></script>
  <script type="text/javascript" charset="utf-8" src="ueditor/ueditor.config.js"></script>
  <script type="text/javascript" charset="utf-8" src="ueditor/ueditor.all.min.js"></script>
  <script type="text/javascript" src="ueditor/lang/zh-cn/zh-cn.js"></script>
  <script type="text/javascript">


  </script>
</head>
<body style="background-color: #e2e2e2">
<c:import url="/WEB-INF/navi/navi.jsp"></c:import>
<div class="container">
  <div class="col-lg-2"></div>
  <div class="col-lg-8">
    <div class="panel">
      <div class="panel-body">
        <form action="/creattopic.do" method="post" class="form-group" onsubmit="return check()">
          <div class="form-group">
            <label for="title">标题</label>
            <input type="text" name="title" class="form-control" id="title" placeholder="请输入标题">
          </div>
          <div class="form-group">
            <label>阅读权限</label>
             <select name="topiclimit">
               <c:forEach begin="10" end="${sessionScope.user.topiclimit}" step="10" varStatus="stat">
                 <option>${stat.current}</option>
               </c:forEach>
             </select>
          </div>
          <script id="editor" type="text/plain"  name="content"></script>
          <input type="submit" value="发布主题" class="btn btn-default">
        </form>
      </div>
    </div>

  </div>
  <div class="col-lg-2"></div>
</div>
</body>
<script type="text/javascript">
  var ue = UE.getEditor("editor",{//这里可以选择自己需要的工具按钮名称,此处仅选择如下五个
    toolbars:[[
      'FullScreen','bold','fontfamily', //字体
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

  function check(){
    if($("#title").val()==""){
      alert("请先输入标题");
      return false;
    }else if(!ue.hasContents()){
      alert("请先输入内容");
      return false;
    }else {
      return true;
    }
  }

</script>
</html>
