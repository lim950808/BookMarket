<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%
	String sessionId = (String)session.getAttribute("sessionId");	
%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>비밀번호 변경하기</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%@ include file="../menu.jsp" %>
<div class="container mt-5">
<div class="row">
<div class="col-sm-1"></div>
<div class="col-sm-10">
  <h2 id="company"><b>비밀번호 변경</b></h2>
  <hr>
<pre>

</pre>
<div class="container mt-5">
<div class="row">
<div class="col-sm-1"></div>
<div class="col-sm-10">
  <div class="container" align="center">
     <div class="col-md-4 col-md-offset-4">
          <h3 class="form-signin-heading">Change Password</h3>
          <form class="form-signin" method="post" action="processChangePassword.jsp">
              <div class="form-group">
                  <label for="inputUserName" class="sr-only">User Name</label>
                  <input type="hidden" class="form-control" placeholder="ID" name="id" value="<%=sessionId%>" required autofocus>
              </div>
              <div class="form-group">
                 <label class="col-sm-7" for="inputPassword">현재 비밀번호</label>
                 <input type="password" class="form-control" placeholder="Password" name="currentPassword" required>
              </div>
               <div class="form-group">
                 <label class="col-sm-7" for="inputPassword">새로운 비밀번호</label>
                 <input type="password" class="form-control" placeholder="New Password" name="newPassword" required>
              </div>
               <div class="form-group">
                 <label class="col-sm-7" for="inputPassword">비밀번호 확인</label>
                 <input type="password" class="form-control" placeholder="Confirm Password" name="newPasswordConfirm" required>
              </div>
              <button class="btn btn btn-outline-primary " type="submit">변경하기</button>
              <button class="btn btn btn-outline-secondary " type="reset">초기화</button>
              <button class="btn btn btn-outline-success " type="button" 
                        onclick="window.close()">닫기</button>
          </form>
     </div>
  </div>
</div>
<div class="col-sm-1"></div>
</div>
</div>
<pre>



</pre>
<%@ include file="../footer.jsp" %> 
</body>
</html>