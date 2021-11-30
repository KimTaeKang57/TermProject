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
<jsp:include page="menu.jsp"/>
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">나의 정보 확인하기</h1>
    </div>
</div>
<div class="container">
    <form name="checkMy" action="checkMyProcess.jsp" class="form-horizontal" method="post">
        <div class="form-group now">
            <div class="com-sm-offset-2 col-sm-10">
                <input type="submit" class="btn btn-primary" value="확인하기">
            </div>
        </div>
        <div class="form-group now">
            <div class="com-sm-offset-2 col-sm-10">
                <a class="btn btn-primary" href="myPage.jsp">이전화면</a>
            </div>
        </div>
    </form>
</div>
</body>
</html>
