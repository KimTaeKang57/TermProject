<%--
  Created by IntelliJ IDEA.
  User: kimtaekang
  Date: 2021/11/20
  Time: 7:46 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="dto.DietFood" %>
<%@ page import="dao.DietFoodRepository" %>

<%
    String id = request.getParameter("id");
    if(id == null || id.trim().equals("")){
        response.sendRedirect("dietFoods.jsp");
        return;
    }

    DietFoodRepository dao = DietFoodRepository.getInstance();

    DietFood dietFood = dao.getFoodById(id);
    if(dietFood == null){
        response.sendRedirect("exceptionNoBookId.jsp");
    }

    ArrayList<DietFood> goodsList = dao.getAllFoods();
    DietFood goods = new DietFood();
    for(int i = 0; i < goodsList.size(); i++){
        goods = goodsList.get(i);
        if(goods.getFoodId().equals(id)){
            break;
        }
    }

    ArrayList<DietFood> list = (ArrayList<DietFood>) session.getAttribute("dietCartlist");
    if(list == null){
        list = new ArrayList<DietFood>();
        session.setAttribute("dietCartlist", list);
    }

    list.add(goods);

    response.sendRedirect("dietFood.jsp?id=" + id);

%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
