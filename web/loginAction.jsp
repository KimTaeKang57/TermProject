<%--
  Created by IntelliJ IDEA.
  User: kimtaekang
  Date: 2021/11/23
  Time: 3:44 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.sql.*" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%
    String ID = request.getParameter("id");//login 페이지의 loginid파라미터를 받아와 ID에 넣음
    String pass = request.getParameter("password"); // loginpass를 받아와 pass에 넣어준다
    //out.println(session.getAttribute("sid"));
    Statement stmt = null;

    try {
        String sql = "SELECT * FROM user where userId='" + ID + "'";
        stmt = conn.createStatement();

        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();
        if (rs.next()) { //값이 있으면 들어간다.
            if (ID.equals(rs.getString(1)) == true && pass.equals(rs.getString(2)) == true) { //ID와 pass가 같을 때
                session.setAttribute("sid", ID);
                rs.close(); //닫아줌
                response.sendRedirect("loginSuccess.jsp");
            } else if (pass.equals(rs.getString(2)) == false) { // pass가 틀렸을 때
                rs.close();
                out.println("<script>");
                out.println("alert('패스워드가 잘못입력되었습니다. 다시 입력해 주시기 바랍니다.')");
                out.println("location.href='login.jsp'");
                out.println("</script>");
            }
        } else { //데이터가 존재하지 않을 때
            rs.close();
            out.println("<script>");

            out.println("alert('존재하지 않는 아이디입니다. 회원가입을 진행해 주시기 바랍니다.')");
            out.println("location.href='login.jsp'");
            out.println("</script>");

        }
    } catch (Exception e) {
        out.println("<h3>데이터 가져오기에 실패하였습니다.</h3>");
        e.printStackTrace();
    } finally {
        conn.close(); //연결을 끊어준다.
    }
%>
</body>
</html>
