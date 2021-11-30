<%--
  Created by IntelliJ IDEA.
  User: kimtaekang
  Date: 2021/11/13
  Time: 7:59 오후
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
    <div class="jumbotron">
        <div class="container">
            <h1 class="display-3"><fmt:message key="join"/></h1>
        </div>
    </div>
    <div class="container">
    <div class="text-right">
    <a href="?language=ko">Korean</a>|<a href="?language=en" >English</a>
    </div>
        <form name="userInfo" action="joinProcess.jsp" class="form-horizontal" method="post">
            <div class="form-group row">
                <label class="col-sm-2"><fmt:message key="userId"/></label>
                <div class="col-sm-3">
                    <input type="text" id="id" name="id" class="form-control">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2"><fmt:message key="password"/></label>
                <div class="col-sm-3">
                    <input type="password" id="password" name="password" class="form-control">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2"><fmt:message key="sex"/></label>
                <div class="col-sm-3">
                    <input type="radio" id="male" name="gender" value="male">
                    <label for="male"><fmt:message key="male"/></label><br>
                    <input type="radio" id="female" name="gender" value="female">
                    <label for="female"><fmt:message key="female"/></label><br>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2"><fmt:message key="age"/></label>
                <div class="col-sm-3">
                    <input type="text" id="age" name="age" class="form-control">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2"><fmt:message key="height"/></label>
                <div class="col-sm-3">
                    <input type="text" id="height" name="height" class="form-control">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2"><fmt:message key="weight"/></label>
                <div class="col-sm-3">
                    <input type="text" id="weight" name="weight" class="form-control">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2"><fmt:message key="active"/></label>
                <div class="col-sm-5">
                    <input type="radio" id="veryLow" name="activity" value="veryLow">
                    <label for="veryLow"><fmt:message key="veryLow"/></label><p><fmt:message key="littleLowDes"/></p>
                    <input type="radio" id="littleLow" name="activity" value="littleLow">
                    <label for="littleLow"><fmt:message key="littleLow"/></label><p><fmt:message key="veryLowDes"/></p>
                    <input type="radio" id="middle" name="activity" value="middle">
                    <label for="middle"><fmt:message key="middle"/></label><p><fmt:message key="MiddleDes"/></p>
                    <input type="radio" id="littleHigh" name="activity" value="littleHigh">
                    <label for="littleHigh"><fmt:message key="littleHigh"/></label><p><fmt:message key="littleHighDes"/></p>
                    <input type="radio" id="veryHigh" name="activity" value="veryHigh">
                    <label for="veryHigh"><fmt:message key="veryHigh"/></label><p><fmt:message key="veryHighDes"/></p>
                </div>
            </div>
            <div class="form-group now">
                <div class="com-sm-offset-2 col-sm-10">
                    <input type="submit" class="btn btn-primary" value="<fmt:message key="button"/>">
                </div>
            </div>
            <div class="form-group now">
                <div class="com-sm-offset-2 col-sm-10">
                    <a class="btn btn-primary" href="./login.jsp"><fmt:message key="lastPage"/></a>
                </div>
            </div>
        </form>
    </div>
</fmt:bundle>
</body>
</html>
