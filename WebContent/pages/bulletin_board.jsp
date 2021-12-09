<%--
  Created by IntelliJ IDEA.
  User: 11382
  Date: 2021/12/6
  Time: 19:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <div class="jumbotron">
        <h1>公告：</h1>
        <h4>本站已开启ip访问过滤！您的ip是：<span class="label label-danger"><%=request.getAttribute("ip").toString()%></span></h4>
    </div>