<%--
  Created by IntelliJ IDEA.
  User: kimtaekang
  Date: 2021/11/20
  Time: 7:46 오후
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

    BulkFood bulkFood = dao.getFoodBById(id);
    if(bulkFood == null){
        response.sendRedirect("exceptionNoBookId.jsp");
    }

    ArrayList<BulkFood> goodsList = dao.getAllBFoods();
    BulkFood goods = new BulkFood();
    for(int i = 0; i < goodsList.size(); i++){
        goods = goodsList.get(i);
        if(goods.getFoodId().equals(id)){
            break;
        }
    }

    ArrayList<BulkFood> list = (ArrayList<BulkFood>) session.getAttribute("bulkCartlist");
    if(list == null){
        list = new ArrayList<BulkFood>();
        session.setAttribute("bulkCartlist", list);
    }

    list.add(goods);

    response.sendRedirect("bulkFood.jsp?id=" + id);

%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
