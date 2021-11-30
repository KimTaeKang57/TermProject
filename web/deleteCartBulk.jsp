<%--
  Created by IntelliJ IDEA.
  User: kimtaekang
  Date: 2021/11/20
  Time: 7:54 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dto.BulkFood" %>
<%@ page import="dao.BulkFoodRepository" %>

<%
    String id = request.getParameter("cartId");
    if(id == null || id.trim().equals("")){
        response.sendRedirect("cartBulk.jsp");
        return;
    }
    session.invalidate();
    response.sendRedirect("cartBulk.jsp");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
