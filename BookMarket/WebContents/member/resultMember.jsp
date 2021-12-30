<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>백두도서</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%@ include file="../menu.jsp" %>
<div class="container mt-5">
<div class="row">
<div class="col-sm-1"></div>
<div class="col-sm-10">
  <h2 id="company"><b>백두도서</b></h2>
  <hr>
<pre>

</pre>
  <div class="container" align="center">
      <%
             /* 파라미터로 넘어온 msg 값 얻기 */
      		String msg = request.getParameter("msg");
            /* 파라미터 값: 0-수정, 1-가입(입력), 2-로그인, 3-회원삭제 */
            if(msg !=null){
            	     if(msg.equals("0"))
            	       	  out.print("<h2 class='alert alert-parimary'>회원정보가 수정되었습니다.</h2>");
            	     else if(msg.equals("1"))
           	       	  out.print("<h2 class='alert alert-success'>회원가입을 축하드립니다.</h2>");
            	     else if(msg.equals("2")){
            	    	  String loginId = (String)session.getAttribute("sessionId");
              	       	  out.print("<h2 class='alert alert-info'>"+loginId+"님 환영합니다.</h2>");
            	     }else if(msg.equals("3")){
            	    	 out.print("<h2 class='alert alert-secondary'>회원정보가 삭제되었습니다.</h2>");
            	     }
            }/* else{
            	  out.print("<h2 class='alert alert-secondary'>회원정보가 삭제되었습니다.</h2>");
            }  */     
      %>
  </div>
<div class="col-sm-1"></div>
</div>
</div>
<pre>

</pre>
<%@ include file="../footer.jsp" %>
</body>
</html>