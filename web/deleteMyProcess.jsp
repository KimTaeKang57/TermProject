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

    ResultSet rs = null;
    Statement stmt = null;
    try {
        String sql = "select userId from user where userId = '" + ID + "'";
        stmt = conn.createStatement();
        rs = stmt.executeQuery(sql);
        if (rs.next()) {
            String rID = rs.getString("userId");
            if (ID.equals(rID)) {
                sql = "delete from user where userId = '" + ID + "'";
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
<jsp:include page="menu.jsp"/>
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">회원탈퇴 처리되었습니다.</h1>
    </div>
</div>
<div class="form-group now">
    <%
        session.invalidate();
        response.sendRedirect("index.jsp");
    %>
</div>
</body>
</html>
