<%--
  Created by IntelliJ IDEA.
  User: kimtaekang
  Date: 2021/11/20
  Time: 7:50 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import = "dto.BulkFood" %>
<%@ page import = "dao.BulkFoodRepository" %>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <%
        String cartId = session.getId();
    %>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<jsp:include page="menu.jsp" />
<div class="jumbotron">
    <div class="container">
        <h1 class = "display-3">벌크 음식 장바구니</h1>
    </div>
</div>
<div class="container">
    <div class="row">
        <table width="100%">
            <tr>
                <td align="left"><a href="./deleteCartBulk.jsp?cartId=<%=cartId %>" class="btn btn-danger">삭제 하기</a></td>
                <td align="right"><a href="BulkorderConfirmation.jsp" class="btn btn-success">계산 하기</a></td>
            </tr>
        </table>
    </div>
    <div style="padding-top: 50px">
        <table class="table table-hover">
            <tr>
                <th>상품</th>
                <th>칼로리</th>
                <th>소계</th>
                <th>비고</th>
            </tr>
            <%
                float sum = 0;
                ArrayList<BulkFood> cartList = (ArrayList<BulkFood>)session.getAttribute("bulkCartlist");
                if(cartList == null)
                    cartList = new ArrayList<BulkFood>();
                for(int i=0; i<cartList.size(); i++){
                    BulkFood dietFood = cartList.get(i);
                    float total = dietFood.getFoodCalorie();
                    sum += total;
            %>
            <tr>
                <td><%=dietFood.getFoodId()%> - <%=dietFood.getFoodName() %></td>
                <td><%=dietFood.getFoodCalorie() %></td>
                <td><%=total %></td>
                <td><a href="./removeCartBulk.jsp?id=<%=dietFood.getFoodId()%>" class="badge badge-danger">삭제</a></td>
            </tr>
            <%
                }
            %>
            <tr>
                <th></th>
                <th></th>
                <th>총액</th>
                <th><%=sum%></th>
                <th></th>
            </tr>
        </table>
        <a href="./bulkFoods.jsp" class="btn btn-secondary">&laquo;쇼핑 계속하기</a>
    </div>
    <hr>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>