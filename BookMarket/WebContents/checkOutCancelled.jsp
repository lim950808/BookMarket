<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>주문 취소</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text.javascript" src="./resources/js/validation.js"></script>
</head>
<body>
<jsp:include page="menu.jsp"/>
<div class="jumbotron">
    <div class="container">
      <h1 class="display-3">주문 취소</h1>
    </div>
</div>
<div class="container" >
   <h2 class="alert alert-danger">주문이 취소되었습니다.</h2>
</div>
 <div class="container">
  <p><a href="welcome.jsp" class="btn btn-secondary">&laquo; Home</a>
 </div>
<jsp:include page="footer.jsp"/>
</body>
</html>