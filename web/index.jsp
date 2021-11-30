<%--
  Created by IntelliJ IDEA.
  User: kimtaekang
  Date: 2021/09/13
  Time: 11:07 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.sql.*" %>
<%@ page errorPage="exceptionNoPage.jsp" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <title></title>
</head>
<body>

<fmt:setLocale value='<%= request.getParameter("language")%>'/>
<fmt:bundle basename="bundle.message">
<%@ include file="menu.jsp" %>
<%
    String str1 = "Just Do Eat";
    String str2 = "Welcome";
    String ID = (String) session.getAttribute("sid");
%>
<div class = "jumbotron">
    <div class = "container">
    <div class="text-right">
    <a href="?language=ko">Korean</a>|<a href="?language=en" >English</a>
    </div>
        <h1 class = "display-3">
            <%=str1 %>
        </h1>
    </div>
</div>
<main role = "main">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <ul class="list-group list-group-horizontal">
                    <%
                        if(ID != null){
                    %>
                    <li class="list-group-item"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="dish.jsp"><fmt:message key="Diet"/></a></li>
                    <li class="list-group-item"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="bbs.jsp">게시판</a></li>
                    <li class="list-group-item"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="myPage.jsp"><%=ID%>님이 로그인하셨습니다.</a></li>
                    <li class="list-group-item" ><a class="nav-link py-3 px-0 px-lg-3 rounded" href="logout.jsp"><fmt:message key="logout"/></a></li>
                </ul>
                <%
                    } else {
                %>
                <li class="list-group-item" ><a class="nav-link py-3 px-0 px-lg-3 rounded" href="login.jsp"><fmt:message key="afterLogin"/></a></li>
                <%
                    }
                %>
            </div>
        </div>
    </div>
    <div class = "container">
        <div class = "text-center">
            <h4>
                <%= str2 %>
            </h4>
        </div>
        <hr>
    </div>
    </fmt:bundle>
</main>
<%@ include file="footer.jsp" %>
</body>
</html>
