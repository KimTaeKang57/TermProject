<%--
  Created by IntelliJ IDEA.
  User: kimtaekang
  Date: 2021/11/08
  Time: 10:13 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="menu.jsp" />
<div class="jumbotron">
    <div class="container">
        <h2 class="alert alert-danger">404 페이지 오류입니다</h2>
    </div>
</div>
<div class="container">
    <p><%=request.getRequestURL()%></p>
    <p><a href="index.jsp" class="btn btn-secondary">초기화면으로 이동하기 &raquo;</a></p>
</div>
</body>
</html>
