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
 <img src = "https://cdn.notefolio.net/img/ed/2d/ed2d2fa31e2682043a55f7f4fd170137fb677fc7b22dab1b931c46192df6b03e_v1.jpg" width = "800" height ="500" border = "3"></center>
<pre>

</pre>
  <h2 align = "center" id="company"><b>불편을 끼쳐드려 죄송합니다. 해당 페이지가 존재하지 않습니다.</b></h2>
  <hr>

<pre>

</pre>

<h2 style = "color:white; background-color:gray;"
 align ="center" class="alert alert-danger"> 메인으로 돌아가시려면 메인으로 버튼을 눌러주세요.</h2>
<div align="center" class="container">
  <p><%=request.getRequestURL() %><!-- 요청페이지 경로명 -->
  <p><a style ="color:while; background-color:DodgerBlue;"
   href="./welcome.jsp" class="btn btn-secondary">Home &raquo;</a>
</div>
<div class="col-sm-1"></div>
</div>
</div>
<pre>

</pre>
<%@ include file="footer.jsp" %>
</body>
</html>