<%--
  Created by IntelliJ IDEA.
  User: kimtaekang
  Date: 2021/11/08
  Time: 10:40 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="menu.jsp"></jsp:include>
<div class="jumbotron">
    <div class="jumbotron">
        <h2 class="alert alert-danger">500오류페이지입니다.</h2>
    </div>
</div>
<div class="container">
    <p><%=request.getRequestURL()%>?<%=request.getQueryString()%></p>
    <p><a href="index.jsp" class="btn btn-secondary">초기화면으로 이동&raquo;</a></p>
</div>
</body>
</html>
