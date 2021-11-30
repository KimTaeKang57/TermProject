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
        <h1 class="display-3">칼로리 계산을 위한 신체조건 입력</h1>
    </div>
</div>
<div class="container">
    <form name="userInfo" action="userUpdateProcess.jsp" class="form-horizontal" method="post">
        <div class="form-group row">
            <label class="col-sm-2">ID</label>
            <div class="col-sm-3">
                    <%=ID%>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2">password</label>
            <div class="col-sm-3">
                <input type="text" id="password" name="password" class="form-control">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2">성별</label>
            <div class="col-sm-3">
                <input type="radio" id="male" name="gender" value="male">
                <label for="male">남자</label><br>
                <input type="radio" id="female" name="gender" value="female">
                <label for="female">여자</label><br>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2">나이</label>
            <div class="col-sm-3">
                <input type="text" id="age" name="age" class="form-control">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2">키</label>
            <div class="col-sm-3">
                <input type="text" id="height" name="height" class="form-control">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2">몸무게</label>
            <div class="col-sm-3">
                <input type="text" id="weight" name="weight" class="form-control">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2">활동량</label>
            <div class="col-sm-5">
                <input type="radio" id="veryLow" name="activity" value="veryLow">
                <label for="veryLow">매우 적음</label><p>거의 좌식생을 하고 운동 안함</p>
                <input type="radio" id="littleLow" name="activity" value="littleLow">
                <label for="littleLow">조금 적음</label><p>활동량이 보통이거나 주 1~3회 운동</p>
                <input type="radio" id="middle" name="activity" value="middle">
                <label for="middle">보통</label><p>활동량이 다소 많거나 주 3~5회 운동</p>
                <input type="radio" id="littleHigh" name="activity" value="littleHigh">
                <label for="littleHigh">조금 많음</label><p>활동량이 많거나 주 6~7회 운동</p>
                <input type="radio" id="veryHigh" name="activity" value="veryHigh">
                <label for="veryHigh">매우 많음</label><p>활동량이 매우 많거나 거의 매일 하루 2번 운동</p>
            </div>
        </div>
        <div class="form-group now">
            <div class="com-sm-offset-2 col-sm-10">
                <input type="submit" class="btn btn-primary" value="등록">
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
