<%--
  Created by IntelliJ IDEA.
  User: kimtaekang
  Date: 2021/11/28
  Time: 6:13 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="dao.BbsDAO"%>
<%@ page import="dto.Bbs"%>

<%@ page import="java.util.*"%>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <title>Title</title>
</head>
<body>
<%
    String userID = null;
    if (session.getAttribute("sid") != null) {
        userID = (String) session.getAttribute("sid");
    }
    int bbsID = 0;
    if (request.getParameter("bbsID") != null) {
        bbsID = Integer.parseInt(request.getParameter("bbsID"));
    }
    if (bbsID == 0) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('유효하지 않는 글입니다.')");
        script.println("location.href = 'bbs.jsp'");
        script.println("history.back()");
        script.println("</script>");
    }
    Bbs bbs = new BbsDAO().getBbs(bbsID);

%>
<nav class="navbar navbar-default">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed"
                data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
                aria-expanded="false">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="index.jsp">HOME</a>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
            <li class="active"><a href="bbs.jsp">게시판</a></li>
        </ul>
            <%
				if (userID == null) {
			%>
        <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
                <a href="#" class="dropdown-toggle"
                   data-toggle="dropdown" role="button" aria-haspopup="true"
                   aria-expanded="false">접속하기<span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><a href="login.jsp">로그인</a></li>
                    <li><a href="join.jsp">회원가입</a></li>
                </ul>
            </li>
        </ul>
            <%
				} else {
			%>
        <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
                <ul class="dropdown-menu">
                    <li><a href="logout.jsp">로그아웃</a></li>
                </ul>
            </li>
        </ul>
        <%
            }
        %>

    </div>
</nav>
<div class="container">
    <div class="row">
        <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
            <thead>
            <tr>
                <th colspan="3" style="background-color: #eeeeee; text-align: center;">게시판 글보기</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td style="width: 20%;">글제목</td>
                <td colspan="2"><%= bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n", "<br>") %></td>
            </tr>
            <tr>
                <td>작성자</td>
                <td colspan="2"><%= bbs.getUserID() %></td>
            </tr>
            <tr>
                <td>작성일자</td>
                <td colspan="2"><%= bbs.getBbsDate().substring(0, 11) + bbs.getBbsDate().substring(11, 13) + "시" + bbs.getBbsDate().substring(14, 16) + "분 " %></td>
            </tr>
            <tr>
                <td>내용</td>
                <td colspan="2" style="min-height: 200px; text-align: left;"><%= bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n", "<br>") %></td>
            </tr>
            </tbody>
        </table>
        <a href="bbs.jsp" class="btn btn-primary">목록</a>
        <%
            if (userID != null && userID.equals(bbs.getUserID())) {
        %>
        <a href="update.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">수정</a>
        <a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">삭제</a>
        <%
            }
        %>
    </div>
</div>
</body>
</html>
