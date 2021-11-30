<%--
  Created by IntelliJ IDEA.
  User: kimtaekang
  Date: 2021/09/24
  Time: 12:55 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.DietFood" %>
<%@ page import="dao.DietFoodRepository" %>

<jsp:useBean id="bookDAO" class="dao.DietFoodRepository" scope="session"></jsp:useBean>
<html>
<head>
    <link rel="stylesheet" href="./resources/css/bootstrap-grid.min.css">
    <title>식품 목록</title>
</head>
<body>
<jsp:include page="menu.jsp"></jsp:include>
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">다이어트 식품 목록</h1>
    </div>
</div>
<div>
    <a class="btn btn-primary href=" href="dish.jsp">이전화면으로 돌아가기</a>
</div>
<br>
<%
    DietFoodRepository dao = DietFoodRepository.getInstance();
    ArrayList<DietFood> listOfFoods = dao.getAllFoods();
%>
<div class="container">
    <div class="row">
        <%
            for (int i = 0; i < listOfFoods.size(); i++) {
                DietFood food = listOfFoods.get(i);
        %>
        <div class="col-md-5">
            <img src="./resources/images/<%=food.getFilename()%>" style="width: 100%">
        </div>
        <div class="col-md-6">
            <h4>[<%=food.getFoodName() %>]</h4>
            <p><%=food.getDescription()%>
            <p><a href="./dietFood.jsp?id=<%=food.getFoodId()%>" class="btn btn-secondary" role="button">
                상세 정보 &raquo;</a>
            <p><%=food.getFoodCalorie() %>칼로리
        </div>
        <% } %>
    </div>
</div>
</div>
</body>
</html>
