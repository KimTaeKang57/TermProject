<%--
Created by IntelliJ IDEA.
User: kimtaekang
Date: 2021/09/29
Time: 10:27 오후
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dto.DietFood" %>
<%@ page import="dao.DietFoodRepository" %>

<jsp:useBean id="dietFoodDat" class="dao.DietFoodRepository" scope="session"/>
<html>
<head>
    <link rel="stylesheet" href="./resources/css/bootstrap-grid.min.css">
    <title>Title</title>
</head>

<script type="text/javascript">
    function addToCart(){
        if(confirm("상품을 장바구니에 추가하시겠습니까?")){
            document.addForm.submit();
        }else{
            document.addForm.reset();
        }
    }
</script>

<body>
<jsp:include page="menu.jsp"/>
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">다이어트 음식 목록</h1>
    </div>
</div>
<div>
    <a class="btn btn-primary href=" href="dietFoods.jsp">이전화면으로 돌아가기</a>
</div>
<br>

<%
    String id = request.getParameter("id");
    DietFoodRepository dao = DietFoodRepository.getInstance();
    DietFood dietFood = dao.getFoodById(id);
%>
<div class="container">
    <div class="row">
        <div class="col-md-5">
            <img src="./resources/images/<%=dietFood.getFilename()%>" style="width: 100%">
        </div>
        <div class="col-md-6">
            <h3>[<%=dietFood.getFoodName()%>]</h3>
            <p><%=dietFood.getDescription()%>
            <p><b>음식 코드:</b><span class="badge badge-danger">
				        <%=dietFood.getFoodId() %></span>
            <p><%=dietFood.getFoodCalorie() %>칼로리
            <p>
            <form name="addForm" action="./addCartDiet.jsp?id=<%=dietFood.getFoodId() %>" method="post">
                <a href="#" class="btn btn-info" onclick="addToCart()"> 칼로리 장바구니 담기&raquo;</a>
                <a href="./cartDiet.jsp" class="btn btn-warning">장바구니&raquo;</a>
                <a href="./dietFoods.jsp" class="btn btn-secondary">다이어트 음식 목록 &raquo;</a>
            </form>
        </div>
    </div>
    <hr>
</div>
</body>


</div>
<hr>
</div>
</body>
</html>
