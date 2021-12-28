<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>백두도서</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  <!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@700&display=swap" rel="stylesheet">
<style>
#mynavbar{margin-left:90px;}
#footer{margin-left:290px;}
#top{margin-right: -90px;}
  *{font-family: 'Gowun Batang', serif;}
</style>
</head>
<body>
<nav class="navbar navbar-expand navbar-light bg-light">
 <div class="container">
  <div class="container-fluid">
    <div class="nav navbar-nav">
      <ul class="navbar-nav me-auto" id="mynavbar">
        <li class="nav-item">
          <a class="nav-link" href="http://localhost:8080/BookMarket/footer/company.jsp">회사소개</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" > | </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="http://localhost:8080/BookMarket/footer/agreement.jsp">이용약관</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" > | </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="http://localhost:8080/BookMarket/footer/private.jsp">개인정보처리방침</a>
        </li>
<!--         <li class="nav-item"> -->
<!--           <a class="nav-link" > | </a> -->
<!--         </li> -->
<!--         <li class="nav-item"> -->
<!--           <a class="nav-link" href="http://localhost:8080/WebMarket_book/footer/guide.jsp">이용안내</a> -->
<!--         </li> -->
      </ul>
    </div>
  </div>
 </div>
</nav>
<div class="container mt-3" id="footer">
 <div class="row">
  <div class="col-sm-3" align="left">
   <a href="http://localhost:8080/BookMarket/welcom.jsp"><img src="/Image/carousel/baekdoo_full.PNG" alt="home" width="100%" height="100%" ></a>
  </div>
  <div class="col-sm-7">
   <p><b>백두도서</b> 서울 강남구 테헤란로 7길 7(역삼동 에스코빌딩 6층)</p>
   <p>대표자 : 정현경 | 사업자등록번호 : 220-90-07535 | 통신판매번호 : 제 강남-8062호</p>
   <p>TEL : 02-561-1911 | FAX : 02-538-2613 | 메일 : einfo1@choongang.co.kr</p>
   <p>개인정보관리책임자:유창현, Copyright &copy; 1969 by CHOONGANG INSTITUTE, All Rights Reserved. </p>
  </div>
   <div class="col-sm-2" align="right">
     <p><a class="btn btn-outline-light text-dark mb-5 mt-5" href="#top" id="top">top</a></p>
   </div>
 </div>
</div>
</body>
</html>