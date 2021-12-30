<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>백두도서</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%@ include file="menu.jsp" %>
<div class="container mt-5">
<div class="row">
<div class="col-sm-1"></div>
<div class="col-sm-10">


<pre>

</pre>
<center>
 <img src = "https://t1.daumcdn.net/cfile/tistory/9929FC505B3D978002" width = "400" height ="300"
 border = 0></center>
<pre>


</pre>
<div class="jumbotron">
  <div class="container">
    <h2 style = "color:white; background-color:gray;"
 align ="center" class="alert alert-danger">죄송합니다. 현재 서버에 오류가 발생하였습니다.</h2>
    <h2  style = "color:white; background-color:gray;"
 align ="center" class="alert alert-info">복구 중 입니다. 장시간이 소요될 수 있습니다. </h2>
  </div>
</div>
<div align = "center" class="container">
  <p><%=request.getRequestURL() %><!-- 요청페이지 경로명 -->
  <p><a style ="color:while; background-color:DodgerBlue;" href="./welcome.jsp" class="btn btn-secondary">Home &raquo;</a>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>