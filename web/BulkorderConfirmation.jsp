<%--
  Created by IntelliJ IDEA.
  User: kimtaekang
  Date: 2021/11/20
  Time: 8:05 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*"%>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="dto.BulkFood" %>
<%@ page import="dao.BulkFoodRepository" %>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <title>Title</title>
</head>
<body>
<jsp:include page="menu.jsp"/>
<div class="jumbotron">
    <div class="container">
        <h1 class = "display-3">칼로리 정보</h1>
    </div>
</div>
<div class="container col-8 alert alert-info">
    <div class="jumbotron">
        <div class="container">
            <h1 class="display-3">칼로리 정보</h1>
        </div>
    </div>
    <div>
        <table class="table table-hover">
            <tr>
                <th>상품</th>
                <th>#</th>
                <th>소계</th>
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
                <td class="text-center"><em><%=dietFood.getFoodName()%></em></td>
                <td class="text-center"><%=dietFood.getFoodCalorie() %></td>
                <td class="text-center"><%=total%>칼로리</td>
            </tr>
            <%
                }
            %>
            <tr>
                <td></td>
                <td></td>
                <td class="text-right"><strong>총 칼로리 : </strong></th>
                <td class="text-center text-danger"><strong><%=sum %> </strong></th>
            </tr>
        </table>
        <a href="./cartBulk.jsp" class="btn btn-secondary" role="button">이전</a>
        <a href="./loginSuccess.jsp" class="btn btn-success" role="button">확인 완료</a>
        <a href="./BulkcheckOutCancelled.jsp" class="btn btn-secondary" role="button">취소</a>
    </div>
</div>
</body>
</html>