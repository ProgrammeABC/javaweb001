<%--
  Created by IntelliJ IDEA.
  User: 11382
  Date: 2021/12/6
  Time: 21:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
    <title>拒绝访问</title>
    <%@ include file="head.jsp"%>
    <script type="text/javascript">
        function exit() {
            window.opener=ull;
            window.open("","_self");
            window.close();
        };
    </script>
</head>
<body>
<div class="jumbotron">
    <h1>拒绝访问：黑名单IP</h1>
    <h4>您的ip已被列入本站黑名单列表中</h4>
    <p><a class="btn btn-primary btn-lg" onclick="exit" role="button">Learn more</a></p>
</div>
</body>
</html>