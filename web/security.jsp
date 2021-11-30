<%--
  Created by IntelliJ IDEA.
  User: kimtaekang
  Date: 2021/11/23
  Time: 2:57 오후
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
        <h1 class="display-3">로그인</h1>
    </div>
</div>
<div class="container">
    <%
        String error = request.getParameter("error");
        if (error != null) {
            out.println("<div class='alert alert-danger'>");
            out.println("아이디와 비밀번호를 확인해주세요");
            out.println("</div>");
        }
    %>
    <form name="login" action="j_security_check" class="form-horizontal" method="post">
        <div class="form-group row">
            <label class="col-sm-2">ID</label>
            <div class="col-sm-3">
                <input type="text" placeholder="ID" name="j_username" class="form-control" required autofocus>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2">password</label>
            <div class="col-sm-3">
                <input type="password" placeholder="password" name="j_password" class="form-control" required autofocus>
            </div>
        </div>
        <div class="form-group now">
            <button class="btn btn btn-lg btn-success btn-block" type="submit">로그인</button>
        </div>
        <div>
            <a class="btn btn-primary href=" href="adminPage.jsp">이전화면으로 돌아가기</a>
        </div>
    </form>
</div>
</body>
</html>
