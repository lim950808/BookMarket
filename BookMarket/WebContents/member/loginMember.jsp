<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>
<title>백두도서</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<style>
#col_1{margin-bottom:70px;}
</style>
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
  <h2 id="company"><b>로그인</b></h2>
  <hr>
<pre>

</pre>
<div class="container" align="center" id="col_1">
     <div class="col-md-4 col-md-offset-4">
          <h3 class="form-signin-heading">로그인 하세요</h3>
          <%
          	 String error = request.getParameter("error");
              if(error!=null){
            	  out.print("<div class='alert alert-danger'>");
            	  out.print("아이디와 비밀번호를 확인해 주세요");
            	  out.print("</div>");
              }
          %> 
          <form class="form-signin" action="processLoginMember.jsp" method="post">
              <div class="form-group">
                  <label for="inputUserName" class="sr-only">아이디</label>
                  <input type="text" class="form-control" placeholder="아이디" name="id" required autofocus>
              </div>
              <div class="form-group">
                 <label class="sr-only" for="inputPassword">비밀번호</label>
                 <input type="password" class="form-control" placeholder="비밀번호" name="password" required>
              </div>
               <button class="btn btn-outline-primary" type="submit">로그인</button>
              <button class="btn btn-outline-secondary" type="button" 
                        onclick="location.href='addMember.jsp'">회원가입</button>  
          </form>
        </div>
</div>                           
</div>
<div class="col-sm-1"></div>
</div>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>