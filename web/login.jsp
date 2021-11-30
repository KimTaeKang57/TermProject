<%--
  Created by IntelliJ IDEA.
  User: kimtaekang
  Date: 2021/11/23
  Time: 2:57 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<html>
<head>
    <title>Title</title>
</head>
<script language="javascript">
    function submit(){
        document.login.submit();
    } //함수 호출하여 aa이름의 폼의 submit 실행
</script>
<body>
<fmt:setLocale value='<%= request.getParameter("language")%>'/>
<fmt:bundle basename="bundle.message">
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3"><fmt:message key="login"/></h1>
    </div>
</div>
<div class="container" align="center">
    <%
        String error = request.getParameter("error");
        if (error != null) {
            out.println("<div class='alert alert-danger'?>");
            out.println("아이디와 비밀번호를 확인해주세요.");
            out.println("</div>");
        }
    %>

    <div class="text-right">
    <a href="?language=ko">Korean</a>|<a href="?language=en" >English</a>
    </div>

    <form name="login" action="loginAction.jsp" class="form-signin" method="post" align="center">
        <div class="form-group row" align = "center">
            <label class="col-sm-2"><fmt:message key="userId"/></label>
            <div class="col-sm-3">
                <input text-align:center type="text" id="id" name="id" class="form-control">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2"><fmt:message key="password"/></label>
            <div class="col-sm-3" align = "center">
                <input type="password" id="password" name="password" class="form-control">
            </div>
        </div>
        <div class="form-group now">
            <div class="com-sm-offset-2 col-sm-10">
                <a class="btn btn-primary" href="javascript:submit();"><fmt:message key="login"/></a>
                <a class="btn btn-primary" href="./addUser.jsp"><fmt:message key="join"/></a>
                <a class="btn btn-primary" href="./index.jsp"><fmt:message key="lastPage"/></a>
            </div>
        </div>
    </form>
</div>
</fmt:bundle>
</html>
