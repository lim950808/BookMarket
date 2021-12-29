<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>Admin Login Page</title>
</head>
<body>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<%@ include file="../menu.jsp" %>
<div class="container mt-5">
<div class="row">
<div class="col-sm-1"></div>
<div class="col-sm-10">
  <h2 id="company"><b>관리자 로그인</b></h2>
  <hr>
<pre>

</pre>
<div class="box" style="user-select: auto;">
 <div class="container" align="center">
  <div class="col-md-4 col-md-offset-4" >
      <%
      	 String error = request.getParameter("error");
         if(error!=null){
        	 out.print("<div class='alert alert-danger'>");
        	 out.print("아이디와 비밀번호를 확인해주세요");
        	 out.print("</div>");
         }
      %>
      <form class="form-signin" action="j_security_check" method="post" >
          <div class="from-group">
             <label for="inputUserName" class="sr-only">아이디</label>
             <input type="text" class="form-control" placeholder="아이디" name='j_username' required autofocus>
          </div>
          <br>
          <div class="form-group">
             <label for="inputPassword" class="sr-only">비밀번호</label>
             <input type="password" class="form-control" placeholder="비밀번호" name='j_password' required>
          </div>
          <br>
          <button class="btn btn-outline-primary" type="submit">로그인</button>
          <div class="save" style="user-select: auto;">
           <input type="checkbox" class="checkbox" id="saveId" name="saveId" value="y" checked="" style="user-select: auto;">
           <label for="saveId" class="" style="user-select: auto;">아이디 저장</label>
          </div>
      </form>
   </div>
  </div>
 </div>
 
</div>
</div>
<div class="col-sm-1"></div>
</div>
<pre>

</pre>
<%@ include file="../footer.jsp" %>
</body>
</html>