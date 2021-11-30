<%--
  Created by IntelliJ IDEA.
  User: kimtaekang
  Date: 2021/11/20
  Time: 7:53 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="dto.DietFood" %>
<%@ page import="dao.DietFoodRepository" %>

<%
    String id = request.getParameter("id");
    if(id == null || id.trim().equals("")){
        response.sendRedirect("books.jsp");
        return;
    }

    DietFoodRepository dao = DietFoodRepository.getInstance();

    DietFood book = dao.getFoodById(id);
    if(book == null){
        response.sendRedirect("exceptionNoBookId.jsp");
    }

    ArrayList<DietFood> cartList = (ArrayList<DietFood>)session.getAttribute("dietCartlist");
    DietFood goodsQnt = new DietFood();
    for(int i = 0; i < cartList.size(); i++){
        goodsQnt = cartList.get(i);
        if(goodsQnt.getFoodId().equals(id)){
            cartList.remove(goodsQnt);
        }
    }

    response.sendRedirect("cartDiet.jsp");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
