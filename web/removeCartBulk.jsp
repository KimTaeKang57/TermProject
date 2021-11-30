<%--
  Created by IntelliJ IDEA.
  User: kimtaekang
  Date: 2021/11/20
  Time: 7:53 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="dto.BulkFood" %>
<%@ page import="dao.BulkFoodRepository" %>

<%
    String id = request.getParameter("id");
    if(id == null || id.trim().equals("")){
        response.sendRedirect("bulkFoods.jsp");
        return;
    }

    BulkFoodRepository dao = BulkFoodRepository.getInstance();

    BulkFood book = dao.getFoodBById(id);
    if(book == null){
        response.sendRedirect("exceptionNoBookId.jsp");
    }

    ArrayList<BulkFood> cartList = (ArrayList<BulkFood>)session.getAttribute("bulkCartlist");
    BulkFood goodsQnt = new BulkFood();
    for(int i = 0; i < cartList.size(); i++){
        goodsQnt = cartList.get(i);
        if(goodsQnt.getFoodId().equals(id)){
            cartList.remove(goodsQnt);
        }
    }

    response.sendRedirect("cartBulk.jsp");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
