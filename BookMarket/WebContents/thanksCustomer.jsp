<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%
String shipping_cartId=""; 
String shipping_name=""; 
String shipping_shippingDate=""; 
String shipping_country=""; 
String shipping_zipCode=""; 
String shipping_roadAddress=""; 
String shipping_jibunAddress=""; 
String shipping_detailAddress=""; 
//쿠키정보 얻기
Cookie[] cookies = request.getCookies();
if(cookies!=null){
	for(int i=0;i<cookies.length;i++){
		Cookie thisCookie = cookies[i];
		String n = thisCookie.getName();
		if(n.equals("Shipping_cartId"))
			shipping_cartId = URLDecoder.decode(thisCookie.getValue(),"utf-8");
		if(n.equals("Shipping_name"))
			shipping_name = URLDecoder.decode(thisCookie.getValue(),"utf-8");
		if(n.equals("Shipping_shippingDate"))
			shipping_shippingDate = URLDecoder.decode(thisCookie.getValue(),"utf-8");
		if(n.equals("Shipping_country"))
			shipping_country = URLDecoder.decode(thisCookie.getValue(),"utf-8");		
		if(n.equals("Shipping_zipCode"))
			shipping_zipCode = URLDecoder.decode(thisCookie.getValue(),"utf-8");
		if(n.equals("Shipping_roadAddress"))
			shipping_roadAddress = URLDecoder.decode(thisCookie.getValue(),"utf-8");
		if(n.equals("Shipping_jibunAddress"))
			shipping_jibunAddress = URLDecoder.decode(thisCookie.getValue(),"utf-8");
		if(n.equals("Shipping_detailAddress"))
			shipping_detailAddress = URLDecoder.decode(thisCookie.getValue(),"utf-8");
	}
}
%>

<jsp:include page="menu.jsp"/>
<div class="container mt-5">
<div class="row">
<div class="col-sm-1"></div>
<div class="col-sm-10">
  <h2 id="company"><b>주문 완료</b></h2>
  <hr>
<pre>

</pre>

<div class="container" >
   <h2 class="alert alert-primary">주문해주셔서 감사합니다.</h2>
   <p> 주문은 <%=shipping_shippingDate %>에 배송될 예정입니다!
   <p> 주문번호: <%=shipping_cartId %>
</div>
 <div class="container">
  <p><a href="welcome.jsp" class="btn btn-outline-secondary">&laquo; Home</a>
 </div>
</div>
<div class="col-sm-1"></div>
</div>
</div>
<!--쿠키 삭제하기  -->
<%
//세션에서 장바구니 삭제
session.invalidate();

for(int i=0;i<cookies.length;i++){
	Cookie thisCookie = cookies[i];
	String n=thisCookie.getName();
	if(n.equals("Shipping_cartId"))
		thisCookie.setMaxAge(0);
	if(n.equals("Shipping_name"))
		thisCookie.setMaxAge(0);
	if(n.equals("Shipping_shippingDate"))
		thisCookie.setMaxAge(0);
	if(n.equals("Shipping_country"))
		thisCookie.setMaxAge(0);	
	if(n.equals("Shipping_zipCode"))
		thisCookie.setMaxAge(0);
	if(n.equals("Shipping_roadAddress"))
		thisCookie.setMaxAge(0);
	if(n.equals("Shipping_jibunAddress"))
		thisCookie.setMaxAge(0);
	if(n.equals("Shipping_detailAddress"))
		thisCookie.setMaxAge(0);
	
	response.addCookie(thisCookie);
}
%> 
<pre>

</pre> 
<jsp:include page="footer.jsp"/>
</body>
</html>