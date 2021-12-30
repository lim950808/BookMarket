<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>백두도서</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<script>
function checkForm(){
	console.log('${sessionScope.sessionId}');
	if(${sessionScope.sessionId==null}){
		$('#myModal').modal('show');
	}else{
		location.href="./BbWriteForm.bo?id=${sessionScope.sessionId}&pageNum=${pageNum}&items=${items}&text=${text}";
	}	
}
</script>
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
<form action="<c:url value="./BbListAction.bo"/>" method="post">  
      <div class="text-right">
             <span class="badge rounded-pill bg-light text-dark">전체 ${total_record}</span>
      </div>
    <div style="padding-top:10px">
       <table class="table table-hover">
            <tr>
             <th>번호</th>
             <th>제목</th>
             <th>작성일</th>
             <th>조회</th>
             <th>글쓴이</th>
            </tr>
     
   <c:if test="${not empty bblist }">
     <c:forEach items="${bblist}"  var="bb"> <!-- ${bblist} <-출처 : BbListAction -->      
        <tr>
         <td>${bb.num}</td>
         <td>
           <c:forEach var="blank" begin="1" end="${bb.re_level}">
           <%-- https://icons.getbootstrap.com/ --%>
             <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-return-right" viewBox="0 0 16 16">
			  <path fill-rule="evenodd" d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5z"/>
			 </svg>
           </c:forEach>
           <a href="./BbViewAction.bo?firstNum=${firstNum}&lastNum=${lastNum}&num=${bb.num}&pageNum=${pageNum}&items=${items}&text=${text}">${bb.subject}</a></td>
         <td>${bb.reg_date}</td>
         <td>${bb.readcount}</td>
         <td>${bb.writer}</td>
        </tr>        	    	       
      </c:forEach>
   </c:if>  
    
       </table>
       
    </div><!-- 페이지별 게시글 리스트 출력 영역 끝. -->
   <div align="center">
     <c:set var="pageNum" value="${pageNum}"/>
   <nav aria-label="...">
   <ul class="pagination justify-content-center">
  
   <c:if test="${startPage-1==1 }">
   <li class="page-item  disabled"> 
     <a  class="page-link" href="<c:url value="./BbListAction.bo?pageNum=${startPage-1}"/>">Previous</a> 
    </li>
   </c:if>
   <c:if test="${startPage-1>1 }">
    <li class="page-item"> 
     <a  class="page-link" href="<c:url value="./BbListAction.bo?pageNum=${startPage-1}&items=${items}&text=${text}"/>">Previous</a> 
    </li>
  </c:if>
      
     <c:forEach var="i" begin="${startPage}" end="${endPage}">
         <c:choose>
            <c:when test="${pageNum==i }">
                 <li class="page-item active" aria-current="page">
                    <a class="page-link" href="<c:url value="./BbListAction.bo?pageNum=${i}&items=${items}&text=${text}"/>">${i}</a>
                  </li>
            </c:when>
            <c:otherwise>
                   <li class="page-item"><a class="page-link" href="<c:url value="./BbListAction.bo?pageNum=${i}&items=${items}&text=${text}"/>">${i}</a></li>
            </c:otherwise>
         </c:choose>
     </c:forEach>
     <c:if test="${endPage+1==finalPage }">
   <li class="page-item  disabled"> 
     <a  class="page-link" href="<c:url value="./BbListAction.bo?pageNum=${endPage+1}&items=${items}&text=${text}"/>">Next</a> 
    </li>
   </c:if>
   <c:if test="${endPage+1 < finalPage }">
    <li class="page-item"> 
     <a  class="page-link" href="<c:url value="./BbListAction.bo?pageNum=${endPage+1}&items=${items}&text=${text}"/>">Next</a> 
    </li>
  </c:if>
   </ul>
</nav>
   </div>
   <div align="left">
      <table>
        <tr>
         <td width="100%" align="left">&nbsp;&nbsp;
          <select name="items" class="txt">
                <option value="subject"  <c:if test="${items=='subject'}">selected</c:if>>제목에서</option>
                <option value="content" <c:if test="${items=='content'}">selected</c:if>>본문에서</option>
                <option value="writer" <c:if test="${items=='writer'}">selected</c:if> >글쓴이에서</option>
          </select>
                <input name="text" type="search" value="${text}">
                <input type="submit" id="btnAdd" class="btn btn-outline-secondary" value="검색">
         </td>
         <td width="100%" align="right">
        <a href="#" onclick="checkForm(); return false;" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#myModal">&laquo;글쓰기</a>
         </td>
        </tr>
      </table>
   </div>
  </form> 
</div>
</div>
<pre>

</pre>
<div class="col-sm-1"></div>
</div>
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">글쓰기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        로그인 해주세요
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">아니오</button>
        <button type="button" class="btn btn-outline-primary" onclick='javascript:location.href="./BbWriteForm.bo?id=${sessionScope.sessionId}"'>예</button>
      </div>
    </div>
  </div>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>