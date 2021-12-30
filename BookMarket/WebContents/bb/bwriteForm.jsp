<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  <h2 id="company"><b>게시글 입력</b></h2>
  <hr>
<pre>

</pre>
<div class="container">
  <form name="newWrite" action="./BbWriteAction.bo"
  		class="form-horizontal" method="post" 
  		onsubmit="return checkForm()">
    <input name="id" type="hidden" class="form-control" value="${sessionId}">
    <input name="pageNum" type="hidden" value="${pageNum}">
    <input name="items" type="hidden" value="${items}">
    <input name="text" type="hidden" value="${text}">
    <input name="ref" type="hidden" value="${ref}">
    <input name="re_step" type="hidden" value="${re_step}">
    <input name="re_level" type="hidden" value="${re_level}">
    
    <div class="form-group row">
      <label class="col-sm-2 control-label">작성자</label>
      <div class="col-sm-3"><%-- BoardWriteForm.java의 request.setAttribute("name", name);에서 name가져옴 --%>
      	<%-- ${}의 속성값은 자동 형변환처리 및 null 처리, String인 경우 빈 문자열("")로 처리 --%>
        <input name="writer" class="form-control" value="${writer}" placeholder="writer">
      </div>
    </div>
    
    <div class="form-group row">
      <label class="col-sm-2 control-label">제목</label>
      <div class="col-sm-5">
        <input name="subject" class="form-control" placeholder="subject" 
        <c:if test='${num!=null}'> value="답변 :"</c:if>>
      </div>
    </div>
    
    <div class="form-group row">
      <label class="col-sm-2 control-label">내용</label>
      <div class="col-sm-8">
        <textarea rows="5" cols="50" class="form-control" placeholder="content" name="content"></textarea>
      </div>
    </div>
    
    <div class="form-group row">
      <label class="col-sm-2 control-label">password</label>
      <div class="col-sm-5">
        <input name="password" type="password" class="form-control" placeholder="password" required>
      </div>
    </div>
<pre>

</pre>    
    <div class="form-group row">
      <div class="col-sm-offset-2 col-sm-10">
        <input type="submit" class="btn btn-outline-primary" value="등록" >
        <input type="reset" class="btn btn-outline-secondary" value="취소" >
      </div>
    </div>   
  </form>
</div>
<div class="col-sm-1"></div>
</div>
</div>
<pre>


</pre>
<%@ include file="../footer.jsp" %>
</body>
</html>