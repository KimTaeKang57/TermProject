<%--
  Created by IntelliJ IDEA.
  User: kimtaekang
  Date: 2021/11/23
  Time: 9:53 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="menu.jsp"/>
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">마이페이지</h1>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-12">
                <ul class="list-group list-group-horizontal">
                    <li class="list-group-item"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="checkMy.jsp">내정보 확인하기</a></li>
                    <li class="list-group-item"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="userUpdate.jsp">내 정보 수정하기</a></li>
                    <li class="list-group-item"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="deleteMy.jsp">회원 탈퇴하기</a></li>
                </ul>
            </div>
        </div>
    </div>

</div>
<div class="form-group now">
    <div class="com-sm-offset-2 col-sm-10">
        <a class="btn btn-primaryhref=" href="loginSuccess.jsp">초기화면으로 돌아가시겠습니까?</a>
    </div>
</div>
</body>
</html>
