<%--
  Created by IntelliJ IDEA.
  User: kimtaekang
  Date: 2021/11/23
  Time: 9:55 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.sql.*" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@ include file="dbconn.jsp"%>
<%
    String ID = (String) session.getAttribute("sid");
    if (ID.equals("")) {
        response.sendRedirect("login.jsp");
    }

    request.setCharacterEncoding("utf-8");
    String passwd = request.getParameter("password");
    String sex = request.getParameter("gender");
    String age = request.getParameter("age");
    String height = request.getParameter("height");
    String weight = request.getParameter("weight");
    String activity = request.getParameter("activity");

    double floatAge = Double.parseDouble(age);
    double floatHeight = Double.parseDouble(height);
    double floatWeight = Double.parseDouble(weight);
    double FinCalorie = 0;
    double calorie = 0;
    long round = 0;

    if(sex.equals("male")){
        calorie = 66.0 + (13.7 * floatWeight) + (5.0 * floatHeight) - (6.8 * floatAge);

        switch (activity) {
            case "veryLow":
                FinCalorie = calorie * 1.2;
                round = Math.round(FinCalorie);
                break;
            case "littleLow":
                FinCalorie = calorie * 1.375;
                round = Math.round(FinCalorie);
                break;
            case "middle":
                FinCalorie = calorie * 1.55;
                round = Math.round(FinCalorie);
                break;
            case "littleHigh":
                FinCalorie = calorie * 1.725;
                round = Math.round(FinCalorie);
                break;
            case "veryHigh":
                FinCalorie = calorie * 1.9;
                round = Math.round(FinCalorie);
                break;
        }
    } else if (sex.equals("female")) {
        calorie = 66.0 + (9.6 * floatWeight) + (1.7 * floatHeight) - (4.7 * floatAge);

        switch (activity) {
            case "veryLow":
                FinCalorie = calorie * 1.2;
                round = Math.round(FinCalorie);
                break;
            case "littleLow":
                FinCalorie = calorie * 1.375;
                round = Math.round(FinCalorie);
                break;
            case "middle":
                FinCalorie = calorie * 1.55;
                round = Math.round(FinCalorie);
                break;
            case "littleHigh":
                FinCalorie = calorie * 1.725;
                round = Math.round(FinCalorie);
                break;
            case "veryHigh":
                FinCalorie = calorie * 1.9;
                round = Math.round(FinCalorie);
                break;
        }
    }

    ResultSet rs = null;
    Statement stmt = null;
    try {
        String sql = "select userId from user where userId = '" + ID + "'";
        stmt = conn.createStatement();
        rs = stmt.executeQuery(sql);

        if (rs.next()) {
            String rID = rs.getString("userId");

            if (ID.equals(rID)) {
                sql = "update user set passWord = '" + passwd + "'," + "sex = '" + sex +"',"
                        + "age = '" + age + "'," + "height = '" + height +"',"
                        + "weight ='" + weight + "'," +"active = '" + activity +"',"
                        + "Calorie = '" + round + "'" + "where userId = '" + ID +"'";

                stmt = conn.createStatement();
                stmt.executeUpdate(sql);
                out.println("user 테이블을 수정했습니다.");
            } else {
                out.println("일치하는 비밀번호가 아닙니다.");
            }
        } else
            out.println("user 테이블에 일치하는 아이디가 없습니다.");
    } catch (SQLException exception) {
        out.print("SQLException : " + exception.getMessage());
    } finally {
        if (rs != null) {
            rs.close();
        }
        if (stmt != null) {
            stmt.close();
        }
        if (conn != null) {
            conn.close();
        }
    }
%>
<jsp:include page="menu.jsp"/>
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">회원 정보 수정</h1>
    </div>
</div>
<div class="form-group now">
    <div class="com-sm-offset-2 col-sm-10">
        <a class="btn btn-primaryhref=" href="myPage.jsp">초기화면으로 돌아가시겠습니까?</a>
    </div>
</div>
</body>
</html>
