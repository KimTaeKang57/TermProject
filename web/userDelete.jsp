<%--
  Created by IntelliJ IDEA.
  User: kimtaekang
  Date: 2021/11/13
  Time: 7:59 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String ID = (String) session.getAttribute("sid");
    if (ID.equals("")) {
        response.sendRedirect("login.jsp");
    }
%>
<%@ include file="menuAdmin.jsp" %>
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">관리자 - 회원 삭제폼</h1>
    </div>
</div>
<div class="container">
    <form name="userDelete" action="userDeleteProcess.jsp" class="form-horizontal" method="post">
        <div class="form-group row">
            <label class="col-sm-2">ID</label>
            <div class="col-sm-3">
                <input type="text" id="userId" name="userId" class="form-control">
            </div>
        </div>
        <div class="form-group now">
            <div class="com-sm-offset-2 col-sm-10">
                <input type="submit" class="btn btn-primary" value="등록">
                <a class="btn btn-primary" href="adminPage.jsp">이전화면</a>
            </div>
        </div>
    </form>
</div>
</body>
</html>
