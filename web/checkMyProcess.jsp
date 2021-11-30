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
<%@ include file="dbconn.jsp" %>
<jsp:include page="menu.jsp"/>
<div class="jumbotron">
    <div class="container">
        <h1 class = "display-3">회원 정보</h1>
    </div>
</div>
<div>
    <table class="table table-hover">
        <tr>
            <th>아이디</th>
            <th>이름</th>
            <th>성별</th>
            <th>나이</th>
            <th>키</th>
            <th>몸무게</th>
            <th>활동량</th>
        </tr>
        <%
            String ID = (String) session.getAttribute("sid");
            if (ID.equals("")) {
                response.sendRedirect("login.jsp");
            }
            request.setCharacterEncoding("utf-8");

            ResultSet rs = null;
            Statement stmt = null;
            try{
                String sql = "select * from user where userId = '" + ID + "'";
                stmt = conn.createStatement();
                rs = stmt.executeQuery(sql);

                while(rs.next()){
                    String userId = rs.getString("userId");
                    String passWord = rs.getString("passWord");
                    String sex = rs.getString("sex");
                    String age = rs.getString("age");
                    String height = rs.getString("height");
                    String weight = rs.getString("weight");
                    String active = rs.getString("active");
        %>
        <tr>
            <td><%=userId%></td>
            <td><%=passWord%></td>
            <td><%=sex%></td>
            <td><%=age%></td>
            <td><%=height%></td>
            <td><%=weight%></td>
            <td><%=active%></td>
        </tr>
        <%
                }
            }catch (SQLException ex){
                out.println("user 테이블 호출이 실패했습니다.<br>");
                out.println("SQLException: "+ex.getMessage());
            }finally{
                if(rs!=null)
                    rs.close();
                if(stmt!=null)
                    stmt.close();
                if(conn!=null)
                    conn.close();
            }
        %>
    </table>
</div>
<div class="form-group now">
    <div class="com-sm-offset-2 col-sm-10">
        <a class="btn btn-primaryhref=" href="myPage.jsp">이전화면으로 돌아가시겠습니까?</a>
    </div>
</div>
</body>
</html>
