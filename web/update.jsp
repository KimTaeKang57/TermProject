<%--
  Created by IntelliJ IDEA.
  User: kimtaekang
  Date: 2021/11/28
  Time: 3:58 오후
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
    if (userID == null) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('로그인을 하세요.')");
        script.println("location.href = 'login.jsp'");
        script.println("</script>");
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
    if (!userID.equals(bbs.getUserID())) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('권한이 없습니다.')");
        script.println("location.href = 'bbs.jsp'");
        script.println("history.back()");
        script.println("</script>");
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

        <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
                <a href="#" class="dropdown-toggle"
                   data-toggle="dropdown" role="button" aria-haspopup="true"
                   aria-expanded="false">회원관리<span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><a href="logout.jsp">로그아웃</a></li>
                </ul>
            </li>
        </ul>
    </div>
</nav>
<div class="container">
    <div class="row">
        <form action="updateAction.jsp?bbsID=<%=bbsID%>" method="post">
        <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
            <thead>
            <tr>
                <th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글 수정 양식</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <tr>
                <td>
                    <input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50"
                    value="<%=bbs.getBbsTitle()%>">
                </td>
                </tr>
                <tr>
                    <td>
                        <textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048"
                        value="<%=bbs.getBbsContent()%>"></textarea>
                    </td>
                </tr>
            </tr>
            </tbody>
        </table>
            <input type="submit" class="btn btn-primary pull-right" value="글 쓰기">
        </form>
    </div>
</div>
</body>
</html>