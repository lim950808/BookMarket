<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<title>장바구니</title>
<%
  String cartId = session.getId();
%>
</head>
<body>
<jsp:include page="menu.jsp" />
<div class="container mt-5">
<div class="row">
<div class="col-sm-1"></div>
<div class="col-sm-10">
  <h2 id="company"><b>장바구니</b></h2>
  <hr>
<pre>

</pre>
<div class="container">
  <div class="row">
     <table width="100%">
        <tr>
          <td align="right">
          	<a href="deleteCart.jsp?cartId=<%=cartId%>" class="btn btn-danger">삭제하기</a>
          	<a href="shippingInfo.jsp?cartId=<%=cartId%>" class="btn btn-success">주문하기</a>
          </td>         
        </tr>
     </table>
  </div>
  <div style="padding-top:50px;">
    <table class="table table-hover">
      <tr>
        <th>상품</th><th>가격</th><th>수량</th><th>소계</th><th>비고</th>
      </tr>
      <%
      	 int sum=0;//합계
      	 ArrayList<Product> cartList = (ArrayList<Product>)session.getAttribute("cartlist");
      	 //세션에 장바구니 정보가 없으면 신규 생성
      	 if(cartList ==null){ cartList =new ArrayList<Product>();}
      	 
      	 for(int i=0;i<cartList.size();i++){//상품 정보 하나씩 출력
      		 Product product = cartList.get(i);
      	     int total = product.getUnitPrice() * product.getQuantity();//단가*장바구니등록 수량
      	     sum +=total;//합계 계산
        %>
          <tr>
          <td><%=product.getProductId()%> - <%=product.getPname() %></td>
          <td><%=product.getUnitPrice()%></td>
          <td>
          <form action="updateCartQty.jsp">
            <input type="number" id="qty" name="qty" value="<%=product.getQuantity() %>">
            <input type="hidden" name="id" value="<%=product.getProductId()%>">
              <input type="submit" class="btn btn-secondary btn-sm" value="수정">
          </form>    
           </td>
          <td><%=total %></td>
          <td><a href="removeCart.jsp?id=<%=product.getProductId()%>" 
                   class="badge badge-danger">삭제</a></td>
          </tr>    	 
      	<% }
      %>
      <tr>
        <th></th>
        <th></th>
        <th>총액</th>
        <th><%=sum%></th>
        <th></th>
      </tr>
    </table>
    <div class="container">
  		<p><a href="welcome.jsp" class="btn btn-outline-secondary">&laquo; HOME</a>
 	</div>
  </div>
  <hr>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>