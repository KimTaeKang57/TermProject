<%--
  Created by IntelliJ IDEA.
  User: kimtaekang
  Date: 2021/11/28
  Time: 3:58 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>    <title>JSP 게시판 웹 사이트</title>
</head>
<body>
<%
    String userID = null;
    if (session.getAttribute("sid") != null) {
        userID = (String) session.getAttribute("sid");
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
                <a href="#" class="dropdown-toggle"
                   data-toggle="dropdown" role="button" aria-haspopup="true"
                   aria-expanded="false">회원관리<span class="caret"></span></a>
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
        <form action="writeAction.jsp" method="post">
        <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
            <thead>
            <tr>
                <th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글쓰기 양식</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <tr>
                <td>
                    <input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50">
                </td>
                </tr>
                <tr>
                    <td>
                        <textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048"></textarea>
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