<%--
  Created by IntelliJ IDEA.
  User: kimtaekang
  Date: 2021/11/20
  Time: 8:10 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <title>Title</title>
</head>
<body>
<jsp:include page="menu.jsp"/>
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">계산 취소</h1>
    </div>
</div>
<div class="container">
    <h2 class="alert alert-danger">계산이 취소되었습니다.</h2>
</div>
<div>
    <p><a href="./bulkFoods.jsp" class="btn btn-secondary"> &laquo; 상품 목록</a>
</div>
</body>
</html>
