<%--
  Created by IntelliJ IDEA.
  User: kimtaekang
  Date: 2021/10/09
  Time: 9:14 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.DietFoodRepository" %>
<%@ page import="dto.DietFood" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.Enumeration" %>

<%
    request.setCharacterEncoding("utf-8");

    String filename = "";
    String realFolder = "/Users/study/TermProject/web/resources/images";
    int maxSize = 5*1024*1024;
    String encType = "utf-8";

    MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

    String bookId = multi.getParameter("dietFoodId");
    String name = multi.getParameter("dietFoodName");
    String unitPrice = multi.getParameter("description");
    String calorie = multi.getParameter("Calorie");

    float dietCalorie = Float.parseFloat(calorie);

    Enumeration files = multi.getFileNames();
    String fname = (String) files.nextElement();
    String fileName = multi.getFilesystemName(fname);

    DietFoodRepository dao = DietFoodRepository.getInstance();

    DietFood newProduct=new DietFood();
    newProduct.setFoodId(bookId);
    newProduct.setFoodName(name);
    newProduct.setDescription(unitPrice);
    newProduct.setFoodCalorie(dietCalorie);
    newProduct.setFilename(fileName);

    dao.addFood(newProduct);

    response.sendRedirect("dietFoods.jsp");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>

