<%--
  Created by IntelliJ IDEA.
  User: kimtaekang
  Date: 2021/11/22
  Time: 12:26 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>

<%
    Connection conn = null;

    String url = "jdbc:mysql://localhost:3306/termProject?characterEncoding=euckr";
    String user = "root";
    String password = "xorkd13579!";

    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection(url, user, password);
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
