<%--
  Created by IntelliJ IDEA.
  User: kimtaekang
  Date: 2021/11/23
  Time: 9:53 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<html>
<head>
    <title>Title</title>
</head>
<body>
<fmt:setLocale value='<%= request.getParameter("language")%>'/>
<fmt:bundle basename="bundle.message">
<%@ include file="menuAdmin.jsp" %>
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3"><fmt:message key="recommend"/></h1>
    </div>
    <div class="container">
    <div class="text-right">
    <a href="?language=ko">Korean</a>|<a href="?language=en" >English</a>
    </div>
        <div class="row">
            <div class="col-12">
                <ul class="list-group list-group-horizontal">
                    <li class="list-group-item"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="dietFoods.jsp">다이어트 식단</a></li>
                    <li class="list-group-item"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="bulkFoods.jsp">벌크업 식단</a></li>
                   </ul>
            </div>
        </div>
    </div>
    <div>
        <a class="btn btn-primary href=" href="adminLogin.jsp"><fmt:message key="GoToFirst"/></a>
    </div>
</div>
</fmt:bundle>
</body>
</html>
