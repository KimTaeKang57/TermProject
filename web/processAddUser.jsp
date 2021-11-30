<%--
  Created by IntelliJ IDEA.
  User: kimtaekang
  Date: 2021/10/09
  Time: 9:14 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.UserRepository" %>
<%@ page import="dto.User" %>
<%@ page import="com.oreilly.servlet.*" %>

<%@ page import="com.oreilly.servlet.multipart.*" %>
<%
    String id = request.getParameter("id");
    String password = request.getParameter("password");
    String sex = request.getParameter("gender");
    String age = request.getParameter("age");
    String height = request.getParameter("height");
    String weight = request.getParameter("weight");

    Integer price;

    UserRepository dao = UserRepository.getInstance();

    User addUser = new User();
    addUser.setUserId(id);
    addUser.setPassWord(password);
    addUser.setSex(sex);
    addUser.setAge(age);
    addUser.setHeight(height);
    addUser.setWeight(weight);

    dao.addUser(addUser);

    response.sendRedirect("books.jsp");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>

