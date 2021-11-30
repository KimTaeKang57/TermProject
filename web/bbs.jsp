<%--
  Created by IntelliJ IDEA.
  User: kimtaekang
  Date: 2021/11/28
  Time: 5:55 오후
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
<style type="text/css">
    a, a:hover{
        color: #000000;
        text-decoration: none;
    }
</style>
<body>
<%
    String userID = null;
    if (session.getAttribute("sid") != null) {
        userID = (String) session.getAttribute("sid");
    }
    int pageNumber = 1;
    if (request.getParameter("pageNumber") != null) {
        pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
    }
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
                    <li><a href="addUser.jsp">회원가입</a></li>
                </ul>
            </li>
        </ul>
        <%
        } else {
        %>
        <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
                <ul class="dropdown-menu">
                    <li><a href="logoutAction.jsp">로그아웃</a></li>
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
                <th style="background-color: #eeeeee; text-align: center;">번호</th>
                <th style="background-color: #eeeeee; text-align: center;">제목</th>
                <th style="background-color: #eeeeee; text-align: center;">작성자</th>
                <th style="background-color: #eeeeee; text-align: center;">작성일</th>
            </tr>
            </thead>
            <tbody>
            <%
                BbsDAO bbsDAO = new BbsDAO();
                ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
                for (int i = 0; i < list.size(); i++) {
            %>
            <tr>
                <td><%=list.get(i).getBbsID()%>
                </td>
                <td><a href="view.jsp?bbsID=<%=list.get(i).getBbsID()%>"><%=list.get(i).getBbsTitle()%>
                </a></td>
                <td><%=list.get(i).getUserID()%>
                </td>
                <td><%=list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시 " + list.get(i).getBbsDate().substring(14, 16) + "분"%>
                </td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
        <%
            if (pageNumber != 1) {
        %>
        <a href="bbs.jsp?pageNumber=<%=pageNumber-1%>" class="btn btn-success btn-arrow-left">이전</a>
            <%
                }
                if (bbsDAO.nextPage(pageNumber + 1)) {
            %>
        <a href="bbs.jsp?pageNumber=<%=pageNumber+1%>" class="btn btn-success btn-arrow-left">다음</a>
        <%
            }
        %>
        <a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
    </div>
</div>
</body>
</html>