<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="dto.RecentProduct"%>
<%@page import="dao.ProductRepository"%>
<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>        
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<fmt:setLocale value='<%=request.getParameter("language") %>'/>
<fmt:bundle basename="resourceBundle.message">
<title><fmt:message key="listTitle"/></title>
</head>
<body>
<jsp:include page="menu.jsp"/>
<div class="jumbotron">
  <div class="container">
     <h1 class="display-3"><fmt:message key="listTitle"/></h1>
  </div>
</div>
<div class="container">
   <div>
     <ul>
       <li><a href="javascript:location.href="list.do?category="프로그래밍 언어">프로그래밍 언어</a></li>
       <li><a href="javascript:location.href="list.do?category="오피스 활용">오피스 활용</a></li>
       <li><a href="javascript:location.href="list.do?category="OS/ 데이터베이스">OS/데이터베이스</a></li>
       <li><a href="javascript:location.href="list.do?category="웹사이트">웹사이트</a></li>
       <li><a href="javascript:location.href="list.do?category="게임">게임</a></li>
       <li><a href="javascript:location.href="list.do?category="그래픽/디자인/멀티미디어">그래픽/디자인/멀티미디어</a></li>
       <li><a href="javascript:location.href="list.do?category="네트워크/해킹/보안">네트워크/해킹/보안</a></li>
       <li><a href="javascript:location.href="list.do?category="모바일 프로그래밍">모바일 프로그래밍</a></li>
     </ul>
   </div>
   <div class="row" align="center">
   	  <%@ include file="dbconn.jsp" %>
      <% /* DB로부터 상품정보 리스트 얻기 */
      	 PreparedStatement pstmt = null;
      	 ResultSet rs = null;
      	 String sql = "select * from product order by productId";
      	 pstmt = conn.prepareStatement(sql);
      	 rs = pstmt.executeQuery();
      	 while(rs.next()) {
      %>
      <div class="col-md-4">
        <img src="/resources/upload/<%=rs.getString("fileName")%>"  style="width:100%">
        <h3><%=rs.getString("pname") %></h3>
        <p><%=rs.getString("description") %></p>
        <p><%=rs.getInt("unitPrice") %>원</p>
        <!-- 링크태그 이동은 get방식 이동 -->
        <p><a href="./product.jsp?id=<%=rs.getString("productId")%>" 
            class="btn btn-success" role="button"><fmt:message key="productInfo"/> &raquo;</a>
      </div>
       <%
         }
       %>
   </div>
   <hr>   
</div>
</fmt:bundle>
<jsp:include page="footer.jsp"/>

<%-- 
<div id="recentPanel" 
     class="card bg-light mb-3" 
      style="position:fixed; max-width:18rem; top:55px; right:50px;">
  <h5 class="card-header">최근 본 상품</h5>
  <div>
    <ul>
<%
	ArrayList<RecentProduct> recentProducts 
		= (ArrayList<RecentProduct>)session.getAttribute("recentProducts");
	if(recentProducts != null) {
		for(int i=0;i<recentProducts.size();i++){
			RecentProduct recentProduct = recentProducts.get(i);
			out.print("<li><a href='product.jsp?id=" + recentProduct.getProductId() + "'>"
			           + recentProduct.getPname() + "</a></li>");
		}
	}
%>
    </ul>
  </div>
</div>  --%>
</body>
</html>