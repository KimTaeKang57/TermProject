<%--
  Created by IntelliJ IDEA.
  User: kimtaekang
  Date: 2021/10/09
  Time: 8:49 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script type="text/javascript" src="./resources/js/validation.js"></script>
    <title>Title</title>
</head>
<script type="text/javascript">
    function addToDietFood() {
        var dietFoodId = document.getElementById("dietFoodId");
        var name = document.getElementById("dietFoodName");
        var description = document.getElementById("description");
        var calorie = document.getElementById("Calorie");

        // 음식 아이디 체크
        if (!check(/^D[0-9]{1,4}$/, dietFoodId, "[음식 코드]\nD와 숫자를 조합하여 2~3자까지 입력하세요\n첫 글자는 반드시 D로 시작하세요"))
            return false;

        // 음식 이름 체크
        if (name.value.length < 1 || name.value.length > 12) {
            alert("[음식명]\n최소 1자에서 최대 12자까지 입력하세요");
            name.select();
            name.focus();
            return false;
        }

        //상품 description 체크
        if (description.value.length < 1) {
            alert("[음식설명]\n최소 1자이상 입력하세요.");
            description.select();
            description.focus();
            return false;
        }

        if (calorie.value.length == isNaN(calorie.value)) {
            alert("[칼로리]\n숫자만 입력하세요");
            calorie.select();
            calorie.focus();
        }

        function check(regExp, e, msg) {
            if (regExp.test(e.value)) {
                return true;
            }
            alert(msg);
            e.select();
            e.focus();
            return false;
        }

        if (confirm("상품을 추가하시겠습니까?")) {
            document.newDietFood.submit();
        } else {
            document.newDietFood.reset();
        }
    }
</script>
<body>
<fmt:setLocale value='<%= request.getParameter("language") %>'/>
<fmt:bundle basename="bundle.message">
    <%@ include file="menuAdmin.jsp" %>
    <div class="jumbotron">
        <div claass="container">
            <h1 class="display-3"><fmt:message key="addDietFood"></fmt:message></h1>
        </div>
    </div>
    <div class="container">
        <div class="text-right">
            <a href="?language=ko">Korean</a>|<a href="?language=en">English</a>
        </div>
        <form name="newDietFood" action="./processAddDietFood.jsp" class="form-horizontal" method="post"
              enctype="multipart/form-data">
            <div class="form-group row">
                <label class="col-sm-2"><fmt:message key="foodId"></fmt:message></label>
                <div class="col-sm-3">
                    <input type="text" id="dietFoodId" name="dietFoodId" class="form-control">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2"><fmt:message key="foodName"></fmt:message></label>
                <div class="col-sm-3">
                    <input type="text" id="dietFoodName" name="dietFoodName" class="form-control">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2"><fmt:message key="description"></fmt:message></label>
                <div class="col-sm-3">
                    <textarea id="description" name="description" cols="50" class="form-control"></textarea>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2"><fmt:message key="Calorie"></fmt:message></label>
                <div class="col-sm-3">
                    <input type="text" id="Calorie" name="Calorie" class="form-control">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2"><fmt:message key="ImageUpload"></fmt:message></label>
                <div class="col-sm-5">
                    <input type="file" id="dietFoodImage" name="dietFoodImage" class="form-control">
                </div>
            </div>
            <div class="form-group row">
                <div class="col-sm-offset-2 col-sm-10 ">
                    <a class="btn btn-primary href=" href="adminPage.jsp"><fmt:message key="lastPage"/></a>
                    <input type="button" class="btn btn-primary" value="<fmt:message key="button"></fmt:message>"
                           onclick="addToDietFood()"></div>
            </div>
        </form>
</fmt:bundle>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>