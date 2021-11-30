<%--
Created by IntelliJ IDEA.
User: kimtaekang
Date: 2021/09/29
Time: 10:27 오후
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dto.ExerciseAdvanced" %>
<%@ page import="dao.ExerciseAdvancedRepository" %>
<%@ page import="java.util.*" %>


<jsp:useBean id="exerciseAdvancedDao" class="dao.ExerciseAdvancedRepository" scope="session"/>
<html>
<head>
    <link rel="stylesheet" href="./resources/css/bootstrap-grid.min.css">
    <title>Title</title>
</head>
<%--
<script type="text/javascript">
    function addToCart(){
        if(confirm("상품을 장바구니에 추가하시겠습니까?")){
            document.addForm.submit();
        }else{
            document.addForm.reset();
        }
    }
</script>
--%>

<body>
<jsp:include page="menu.jsp"/>
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">운동 목록</h1>
    </div>
</div>
<%
    ArrayList<ExerciseAdvanced> list = exerciseAdvancedDao.getAllExercise();
%>
<div class="container">
    <div class="row" aling="center">
        <%--
        <div class="col-md-5">
           <img src="./resources/images/<%=exercise.getFilename()%>" style="width: 100%">
        </div>
        --%>
        <%
            for (int i = 0; i < list.size(); i++) {
                ExerciseAdvanced exercise = list.get(i);
        %>
        <div class="col-md-4">
            <p><b>총 페이지수</b> : <%=exercise.getExercise_adv_name() %>
                <%--
                <p>
                <form name="addForm" action="./addCart.jsp?id=<%=book.getBookId() %>" method="post">
                    <a href="#" class="btn btn-info" onclick="addToCart()"> 도서 주문&raquo;</a>
                    <a href="./cart.jsp" class="btn btn-warning">장바구니&raquo;</a>
                    <a href="./books.jsp" class="btn btn-secondary">도서 목록 &raquo;</a>
                </form>
                --%>
        </div>
        <%
            }
        %>
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
