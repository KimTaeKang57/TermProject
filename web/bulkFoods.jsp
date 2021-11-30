<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.BulkFood" %>
<%@ page import="dao.BulkFoodRepository" %>

<jsp:useBean id="foodDAO" class="dao.BulkFoodRepository" scope="session"/>
<html>
<head>
    <link rel="stylesheet" href="./resources/css/bootstrap-grid.min.css">
    <title>벌크업 식품 목록</title>
</head>
</html>
<body>
<jsp:include page="menu.jsp"></jsp:include>
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">벌크업 식품 목록</h1>
    </div>
</div>
<div>
    <a class="btn btn-primary href=" href="dish.jsp">이전화면으로 돌아가기</a>
</div>
<br>

<%
    BulkFoodRepository dao1 = BulkFoodRepository.getInstance();
    ArrayList<BulkFood> listOfBFoods = dao1.getAllBFoods();
%>
<div class="container" align="center">
    <div class="row">
        <%
            for (int i = 0; i < listOfBFoods.size(); i++) {
                BulkFood food1 = listOfBFoods.get(i);
        %>
        <div class="col-md-5">
            <img src="./resources/images/<%=food1.getFilename()%>" style="width:100%">
        </div>
        <br>
        <div class="col-md-6">
            <h4>[<%=food1.getFoodName()%>]</h4>
            <p><%=food1.getDescription()%>
            </p>
            <p><a href="./bulkFood.jsp?id=<%=food1.getFoodId()%>" class="btn btn-secondary" role="button">
                상세 정보 &raquo;
            </a></p>
            <p><%=food1.getFoodCalorie()%>칼로리</p>
            <br>
        </div>
        <%
            }
        %>
    </div>
</div>
</div>
</body>
</html>