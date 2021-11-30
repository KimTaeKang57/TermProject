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

    String id = request.getParameter("userId");

    ResultSet rs = null;
    Statement stmt = null;
    try {
        String sql = "select userId from user where userId = '" + id + "'";
        stmt = conn.createStatement();
        rs = stmt.executeQuery(sql);
        if (rs.next()) {
            String rID = rs.getString("userId");
            if (id.equals(rID)) {
                sql = "delete from user where userId = '" + id + "'";
                stmt = conn.createStatement();
                stmt.executeUpdate(sql);
                out.println("user를 삭제했습니다.");
            } else {
                out.println("일치하는 비밀번호가 아닙니다.");
            }
        } else
            out.println("일치하는 아이디가 없습니다.");
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
<%@ include file="menuAdmin.jsp" %>
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">삭제한 후 회원목록</h1>
    </div>
</div>
<div class="form-group now">
    <div class="com-sm-offset-2 col-sm-10">
        <a class="btn btn-primaryhref=" href="seeAllUsers.jsp">회원 확인하기</a>
        <a class="btn btn-primaryhref=" href="adminLogin.jsp">초기화면으로 돌아가기</a>

    </div>
</div>
</body>
</html>
