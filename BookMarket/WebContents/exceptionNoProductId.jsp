<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<title>상품 아이디 오류</title>
</head>
<body>
 <jsp:include page="menu.jsp"/>
 <div class="jumbortron">
   <div class="container">
   	 <h2 class="alert alert-danger">해당 상품이 존재하지 않습니다.</h2>
   </div>
 </div>
 <div class="container">
    <p><%=request.getRequestURL() %>?<%=request.getQueryString()%><!-- 요청페이지 경로명  -->
    <p><a href="products.jsp" class="btn btn-secondary">상품 목록 &raquo;</a>
 </div>
<jsp:include page="footer.jsp"/> 
</body>
</html>