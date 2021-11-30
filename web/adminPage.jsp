<%--
  Created by IntelliJ IDEA.
  User: kimtaekang
  Date: 2021/11/23
  Time: 9:53 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@ include file="menuAdmin.jsp" %>
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">관리자 페이지</h1>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-12">
                <ul class="list-group list-group-horizontal">
                    <li class="list-group-item"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="addDietFood.jsp">다이어트 식단 관리</a></li>
                    <li class="list-group-item"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="addBulkFood.jsp">벌크업 식단 관리</a></li>
                    <li class="list-group-item"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="seeAllUsers.jsp">전체 회원 보기</a></li>
                    <li class="list-group-item"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="userDelete.jsp">회원 삭제하기</a></li>
                </ul>
            </div>
            <div>
                <a class="btn btn-primary href=" href="adminLogin.jsp">초기화면으로 돌아가기</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>
