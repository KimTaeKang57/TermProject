<%--
  Created by IntelliJ IDEA.
  User: kimtaekang
  Date: 2021/11/22
  Time: 12:30 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>

<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <title>Title</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%
    request.setCharacterEncoding("utf-8");

    String id = request.getParameter("id");
    String foodName = request.getParameter("foodName");
    String description = request.getParameter("description");
    String calorie = request.getParameter("calorie");

    Statement stmt = null;

    try {
        String sql = "INSERT INTO food(foodId, foodName, description, foodCalorie) " +
                "VALUES('" + id + "','" + foodName + "','" + description + "','" + calorie + "')";
        stmt = conn.createStatement();
        stmt.executeUpdate(sql);
        out.println("음식 넣기 성공하였습니다");
    } catch (SQLException exception) {
        out.println("SQLException: " + exception.getMessage());
    }finally {
        if(stmt != null)
            stmt.close();
        if(conn != null)
            conn.close();
    }
%>
<jsp:include page="menu.jsp"/>
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">관리자 - 음식 추가하기</h1>
    </div>
    <div class="form-group now">
        <div class="com-sm-offset-2 col-sm-10">
            <a class="btn btn-primaryhref=" href="./index.jsp">초기화면으로 돌아가시겠습니까?</a>
        </div>
    </div>
</div>

</body>

</html>
