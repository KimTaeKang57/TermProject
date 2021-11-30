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
        String passwd = request.getParameter("password");
        String sex = request.getParameter("gender");
        String age = request.getParameter("age");
        String height = request.getParameter("height");
        String weight = request.getParameter("weight");
        String activity = request.getParameter("activity");

        double floatAge = Double.parseDouble(age);
        double floatHeight = Double.parseDouble(height);
        double floatWeight = Double.parseDouble(weight);
        double floatAgetest = floatAge*2;
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

        Statement stmt = null;

        try {
            String sql = "INSERT INTO user(userId, passWord, sex, age, height, weight, active, Calorie) " +
                    "VALUES('" + id + "','" + passwd + "','" + sex + "','"+ age + "','"
                    + height + "','" + weight + "','" + activity + "','" + round + "')";
            stmt = conn.createStatement();
            stmt.executeUpdate(sql);
            out.println("회원가입에 성공하였습니다");
        } catch (SQLException exception) {
            out.println("SQLException: " + exception.getMessage());
        }finally {
            if(stmt != null)
                stmt.close();
            if(conn != null)
                conn.close();
        }
    %>
    <div class="jumbotron">
        <div class="container">
            <h1 class="display-3">회원 가입</h1>
        </div>
        <div class="form-group now">
            <div class="com-sm-offset-2 col-sm-10">
                <a class="btn btn-primaryhref=" href="./index.jsp">초기화면으로 돌아가시겠습니까?</a>
            </div>
        </div>
    </div>

</body>

</html>
