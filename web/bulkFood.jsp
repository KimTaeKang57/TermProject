<%--
Created by IntelliJ IDEA.
User: kimtaekang
Date: 2021/09/29
Time: 10:27 오후
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dto.BulkFood" %>
<%@ page import="dao.BulkFoodRepository" %>

<jsp:useBean id="bultFoodDat" class="dao.BulkFoodRepository" scope="session"/>
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
        <h1 class="display-3">벌크음식 목록</h1>
    </div>
</div>
<div>
    <a class="btn btn-primary href=" href="bulkFoods.jsp">이전화면으로 돌아가기</a>
</div>
<br>

<%
    String id = request.getParameter("id");
    BulkFoodRepository dao = BulkFoodRepository.getInstance();
    BulkFood bulkFood = dao.getFoodBById(id);
%>
<div class="container">
    <div class="row">
        <div class="col-md-5">
            <img src="./resources/images/<%=bulkFood.getFilename()%>" style="width: 100%">
        </div>
        <div class="col-md-6">
            <h3>[<%=bulkFood.getFoodName()%>]</h3>
            <p><%=bulkFood.getDescription()%>
            <p><b>음식 코드:</b><span class="badge badge-danger">
				        <%=bulkFood.getFoodId() %></span>
            <p><%=bulkFood.getFoodCalorie() %>칼로리
            <p>
            <form name="addForm" action="./addCartBulk.jsp?id=<%=bulkFood.getFoodId() %>" method="post">
                <a href="#" class="btn btn-info" onclick="addToCart()"> 칼로리 장바구니 담기&raquo;</a>
                <a href="./cartBulk.jsp" class="btn btn-warning">장바구니&raquo;</a>
                <a href="./bulkFoods.jsp" class="btn btn-secondary">벌크음식 목록 &raquo;</a>
            </form>
        </div>
    </div>
    <hr>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</div>
<hr>
</div>
</body>
</html>
