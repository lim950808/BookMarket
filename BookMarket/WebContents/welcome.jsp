<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>백두도서</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
  #best_item{border-bottom: 1px solid #C8C8C8;}
  #rec_item{border-bottom: 1px solid #C8C8C8;}
  #new_item{border-bottom: 1px solid #C8C8C8;}
</style>
</head>
<body>
<%@ include file="menu.jsp" %>
<div class="container" id="body">
<div class="row">
<div class="col-sm-1"></div>
<div class="col-sm-10">

<!-- Carousel -->
<div id="demo" class="carousel slide" data-bs-ride="carousel">

  <!-- Indicators/dots -->
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
  </div>
  
  <!-- The slideshow/carousel -->
  <div class="carousel-inner" align="center" >
    <div class="carousel-item active">
      <img src="/Image/carousel/test_banner1.png" alt="banner1" class="d-block" style="width:100%">
      <div class="carousel-caption">
      </div>
    </div>
    <div class="carousel-item">
      <img src="/Image/carousel/test_banner2.png" alt="banner1" class="d-block" style="width:100%">
      <div class="carousel-caption">
      </div> 
    </div>
    <div class="carousel-item">
      <img src="/Image/carousel/test_banner3.png" alt="banner1" class="d-block" style="width:100%">
      <div class="carousel-caption">
      </div>  
    </div>
  </div>
  
  <!-- Left and right controls/icons -->
  <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
    <span class="carousel-control-next-icon"></span>
  </button>
</div>

<div class="container mt-5">
  <h1 class="display-6"><b>베스트상품</b></h1>
  <p id="best_item">
</div>

<!-- Three columns of text below the carousel -->
  <div class="container mt-5 mb-5">
    <div class="row" align="center">
      <div class="col-lg-3">
        <a href="#" class="rounded mx-auto"><img src="/Image/1-1.jfif" alt="1-1" width="166px" height="204px" ></a>
        <p><b class="text-center">로블록스 게임 제작 무작정 따라하기</b>
        <p class="text-center"><b>18,000</b>원</p>
      </div><!-- /.col-lg-4 -->
      
      <div class="col-lg-3">
      <a href="#"><img src="/Image/1-2.jfif" alt="1-2" width="166px" height="204px" ></a>
        <p><b class="text-center">레트로의 유니티 게임 프로그래밍 에센스</b>
        <p class="text-center"><b>60,000</b>원</p>
      </div><!-- /.col-lg-4 -->
      
      <div class="col-lg-3">
      <a href="#"><img src="/Image/1-3.jfif" alt="1-3" width="166px" height="204px" ></a>
        <p><b class="text-center">유니티 교과서</b>
        <p class="text-center"><b>28,000</b>원</p>
      </div><!-- /.col-lg-4 -->
      
      <div class="col-lg-3">
      <a href="#"><img src="/Image/1-4.jfif" alt="1-4" width="166px" height="204px" ></a>
        <p><b class="text-center">나만의 로블록스 게임 만들기</b>
        <p class="text-center"><b>14,000</b>원</p>
      </div><!-- /.col-lg-4 -->
    </div><!-- /.row -->
  </div>

<!-- Three columns of text below the carousel -->
  <div class="container mt-5 mb-5">
    <div class="row" align="center">
      <div class="col-lg-3">
        <a href="#" class="rounded mx-auto"><img src="/Image/1-1.jfif" alt="1-1" width="166px" height="204px" ></a>
        <p><b class="text-center">로블록스 게임 제작 무작정 따라하기</b>
        <p class="text-center"><b>18,000</b>원</p>
      </div><!-- /.col-lg-4 -->
      
      <div class="col-lg-3">
      <a href="#"><img src="/Image/1-2.jfif" alt="1-2" width="166px" height="204px" ></a>
        <p><b class="text-center">레트로의 유니티 게임 프로그래밍 에센스</b>
        <p class="text-center"><b>60,000</b>원</p>
      </div><!-- /.col-lg-4 -->
      
      <div class="col-lg-3">
      <a href="#"><img src="/Image/1-3.jfif" alt="1-3" width="166px" height="204px" ></a>
        <p><b class="text-center">유니티 교과서</b>
        <p class="text-center"><b>28,000</b>원</p>
      </div><!-- /.col-lg-4 -->
      
      <div class="col-lg-3">
      <a href="#"><img src="/Image/1-4.jfif" alt="1-4" width="166px" height="204px" ></a>
        <p><b class="text-center">나만의 로블록스 게임 만들기</b>
        <p class="text-center"><b>14,000</b>원</p>
      </div><!-- /.col-lg-4 -->
    </div><!-- /.row -->
  </div>

<div class="container mt-5">
  <h1 class="display-6"><b>신상품</b></h1>
  <p id="rec_item">
</div>

<!-- Three columns of text below the carousel -->
  <div class="container mt-5 mb-5">
    <div class="row" align="center">
      <div class="col-lg-3">
        <a href="#" class="rounded mx-auto"><img src="/Image/1-1.jfif" alt="1-1" width="166px" height="204px" ></a>
        <p><b class="text-center">로블록스 게임 제작 무작정 따라하기</b>
        <p class="text-center"><b>18,000</b>원</p>
      </div><!-- /.col-lg-4 -->
      
      <div class="col-lg-3">
      <a href="#"><img src="/Image/1-2.jfif" alt="1-2" width="166px" height="204px" ></a>
        <p><b class="text-center">레트로의 유니티 게임 프로그래밍 에센스</b>
        <p class="text-center"><b>60,000</b>원</p>
      </div><!-- /.col-lg-4 -->
      
      <div class="col-lg-3">
      <a href="#"><img src="/Image/1-3.jfif" alt="1-3" width="166px" height="204px" ></a>
        <p><b class="text-center">유니티 교과서</b>
        <p class="text-center"><b>28,000</b>원</p>
      </div><!-- /.col-lg-4 -->
      
      <div class="col-lg-3">
      <a href="#"><img src="/Image/1-4.jfif" alt="1-4" width="166px" height="204px" ></a>
        <p><b class="text-center">나만의 로블록스 게임 만들기</b>
        <p class="text-center"><b>14,000</b>원</p>
      </div><!-- /.col-lg-4 -->
    </div><!-- /.row -->
  </div>

<!-- Three columns of text below the carousel -->
  <div class="container mt-5 mb-5">
    <div class="row" align="center">
      <div class="col-lg-3">
        <a href="#" class="rounded mx-auto"><img src="/Image/1-1.jfif" alt="1-1" width="166px" height="204px" ></a>
        <p><b class="text-center">로블록스 게임 제작 무작정 따라하기</b>
        <p class="text-center"><b>18,000</b>원</p>
      </div><!-- /.col-lg-4 -->
      
      <div class="col-lg-3">
      <a href="#"><img src="/Image/1-2.jfif" alt="1-2" width="166px" height="204px" ></a>
        <p><b class="text-center">레트로의 유니티 게임 프로그래밍 에센스</b>
        <p class="text-center"><b>60,000</b>원</p>
      </div><!-- /.col-lg-4 -->
      
      <div class="col-lg-3">
      <a href="#"><img src="/Image/1-3.jfif" alt="1-3" width="166px" height="204px" ></a>
        <p><b class="text-center">유니티 교과서</b>
        <p class="text-center"><b>28,000</b>원</p>
      </div><!-- /.col-lg-4 -->
      
      <div class="col-lg-3">
      <a href="#"><img src="/Image/1-4.jfif" alt="1-4" width="166px" height="204px" ></a>
        <p><b class="text-center">나만의 로블록스 게임 만들기</b>
        <p class="text-center"><b>14,000</b>원</p>
      </div><!-- /.col-lg-4 -->
    </div><!-- /.row -->
  </div>

<div class="container mt-5">
  <h1 class="display-6"><b>추천상품</b></h1>
  <p id="new_item">
</div>

<!-- Three columns of text below the carousel -->
  <div class="container mt-5 mb-5">
    <div class="row" align="center">
      <div class="col-lg-3">
        <a href="#" class="rounded mx-auto"><img src="/Image/1-1.jfif" alt="1-1" width="166px" height="204px" ></a>
        <p><b class="text-center">로블록스 게임 제작 무작정 따라하기</b>
        <p class="text-center"><b>18,000</b>원</p>
      </div><!-- /.col-lg-4 -->
      
      <div class="col-lg-3">
      <a href="#"><img src="/Image/1-2.jfif" alt="1-2" width="166px" height="204px" ></a>
        <p><b class="text-center">레트로의 유니티 게임 프로그래밍 에센스</b>
        <p class="text-center"><b>60,000</b>원</p>
      </div><!-- /.col-lg-4 -->
      
      <div class="col-lg-3">
      <a href="#"><img src="/Image/1-3.jfif" alt="1-3" width="166px" height="204px" ></a>
        <p><b class="text-center">유니티 교과서</b>
        <p class="text-center"><b>28,000</b>원</p>
      </div><!-- /.col-lg-4 -->
      
      <div class="col-lg-3">
      <a href="#"><img src="/Image/1-4.jfif" alt="1-4" width="166px" height="204px" ></a>
        <p><b class="text-center">나만의 로블록스 게임 만들기</b>
        <p class="text-center"><b>14,000</b>원</p>
      </div><!-- /.col-lg-4 -->
    </div><!-- /.row -->
  </div>

<!-- Three columns of text below the carousel -->
  <div class="container mt-5 mb-5">
    <div class="row" align="center">
      <div class="col-lg-3">
        <a href="#" class="rounded mx-auto"><img src="/Image/1-1.jfif" alt="1-1" width="166px" height="204px" ></a>
        <p><b class="text-center">로블록스 게임 제작 무작정 따라하기</b>
        <p class="text-center"><b>18,000</b>원</p>
      </div><!-- /.col-lg-4 -->
      
      <div class="col-lg-3">
      <a href="#"><img src="/Image/1-2.jfif" alt="1-2" width="166px" height="204px" ></a>
        <p><b class="text-center">레트로의 유니티 게임 프로그래밍 에센스</b>
        <p class="text-center"><b>60,000</b>원</p>
      </div><!-- /.col-lg-4 -->
      
      <div class="col-lg-3">
      <a href="#"><img src="/Image/1-3.jfif" alt="1-3" width="166px" height="204px" ></a>
        <p><b class="text-center">유니티 교과서</b>
        <p class="text-center"><b>28,000</b>원</p>
      </div><!-- /.col-lg-4 -->
      
      <div class="col-lg-3">
      <a href="#"><img src="/Image/1-4.jfif" alt="1-4" width="166px" height="204px" ></a>
        <p><b class="text-center">나만의 로블록스 게임 만들기</b>
        <p class="text-center"><b>14,000</b>원</p>
      </div><!-- /.col-lg-4 -->
    </div><!-- /.row -->
  </div>

 </div>
 <div class="col-sm-1"></div>  
</div>  
</div>
<%@ include file="footer.jsp" %>
</body>
</html>