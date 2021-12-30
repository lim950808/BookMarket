<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head>
<link rel="stylesheet" 
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>      
<meta charset="UTF-8">
<title>백두도서</title>
<script>
function confirmDelete(num,pageNum,items,text){
 location.href="./BbDeleteAction.bo?num="+num+"&pageNum="+pageNum+"&items="+items+"&text="+text;
}
</script>
</head>
<body>
<%@ include file="../menu.jsp" %>
<div class="container mt-5">
<div class="row">
<div class="col-sm-1"></div>
<div class="col-sm-10">
  <h2 id="company"><b>게시판</b></h2>
  <hr>
<pre>

</pre>
<div class="container">
    <form name="newUpdate" 
          action="BbUpdateAction.bo?num=${bb.num}&pageNum=${page}&items=${items}&text=${text}"
          class="form-horizontal" 
          method="post">
         <input type="hidden" name="id" value="${sessionId}"><!-- request->session->application순으로 조회 -->
    	 <input name="ref" type="hidden" value="${bb.ref}">
   		 <input name="re_step" type="hidden" value="${bb.re_step}">
 		 <input name="re_level" type="hidden" value="${bb.re_level}">
    <div class="form-group row">
        <label class="col-sm-2 control-label">작성자</label>
        <div class="col-sm-3">
            <input name="writer" class="form-control" value="${bb.writer}">
        </div>
    </div>
        <div class="form-group row">
        <label class="col-sm-2 control-label">제목</label>
        <div class="col-sm-3">
            <input name="subject" class="form-control" value="${bb.subject}">
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 control-label">내용</label>
        <div class="col-sm-8" style="word-break:break-all;">
            <textarea rows="5" cols="50" name="content"
               class="form-control">${bb.content}</textarea>
        </div>
    </div>
   
    <div class="form-group row">
        <div class="col-sm-offset-2 col-sm-10">
        	<button type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#exampleModal">삭제
        	</button>
            <input type="submit" class="btn btn-outline-secondary" value="수정">
            <a href="./BbListAction.bo?pageNum=${page}&items=${items}&text=${text}" class="btn btn-outline-dark">목록</a>
            <a href="./BbReplyForm.bo?id=${sessionId}&pageNum=${page}&items=${items}&text=${text}&num=${bb.num}&ref=${bb.ref}&re_step=${bb.re_step}&re_level=${bb.re_level}"
               class="btn btn-outline-primary">답변</a>
        </div>	
    </div>
    </form>
    <div>이전글:
      <c:if test="${firstNum!=bb.num}">
        <a href="./BbViewAction.bo?firstNum=${firstNum}&lastNum=${lastNum}&num=${bb.num-1}&pageNum=${page}&items=${items}&text=${text}">${bb.num-1}</a>
      </c:if>
    </div>
    <div>다음글:
      <c:if test="${lastNum!=bb.num}">
        <a href="./BbViewAction.bo?firstNum=${firstNum}&lastNum=${lastNum}&num=${bb.num+1}&pageNum=${page}&items=${items}&text=${text}">${bb.num+1}</a>
      </c:if>
    </div>
</div>
</div>
<div class="col-sm-1"></div>
</div>
</div>
<pre>

</pre>
<%@ include file="../footer.jsp" %>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">게시글 삭제</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
         ${bb.num}번 글을 삭제하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">아니오</button>
        <button type="button" class="btn btn-outline-primary" onclick="confirmDelete('${bb.num}','${page}','${items}','${text}')">예</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>