<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="javax.swing.DefaultBoundedRangeModel"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>백두도서</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%
	 request.setCharacterEncoding("UTF-8");
     //upload처리
     String filename = "";
     String realFolder = "c:\\Image";//웹 어플리케이션상의 절대 경로
     int maxSize = 5 * 1024 * 1024;//5mb - 전송될 파일의 최대 크기
     String encType = "utf-8";
     
     //MultipartRequest객체 생성
     MultipartRequest multi 
      = new MultipartRequest(request,
    		                 realFolder,
    		                 maxSize, 
    		                 encType, 
    		                 new DefaultFileRenamePolicy());
   //request -> multi로 변경
   //String productId = multi.getParameter("productId");
	String pname = multi.getParameter("pname");
	String pwriter = multi.getParameter("pwriter");
	String unitPrice = multi.getParameter("unitPrice");
	String category = multi.getParameter("category");
	String publisher = multi.getParameter("publisher");
	String publishDate = multi.getParameter("publishDate");
	String description = multi.getParameter("description");
	String unitsInStock = multi.getParameter("unitsInStock");
  
   Integer price;
   if(unitPrice==null || unitPrice.isEmpty()) price=0;
   else price =Integer.valueOf(unitPrice);
   
   long stock;
   if(unitsInStock==null || unitsInStock.isEmpty()) stock=0;
   else stock = Long.valueOf(unitsInStock);
   
   //전송된 파일정보 얻기
   Enumeration files = multi.getFileNames();
   String fname =(String)files.nextElement();
   String fileName = multi.getFilesystemName(fname);//전송되어서 서버로 넘어온파일명
   
   //상품등록
   
   //seq Max값 추출
   String sql = "select cast(substr(max(productId), 2) as signed integer) + 1 from product";
   
   PreparedStatement pstmt = conn.prepareStatement(sql);
   ResultSet rs = pstmt.executeQuery();
   String seq = "";
   if(rs.next()) {
	   seq = "P" + rs.getString(1);
	   System.out.println("seq:" + seq);
   }
   //입력처리
   sql = "insert into product values(?,?,?,?,?,?,?,?,?,?)";
   pstmt = conn.prepareStatement(sql);
   
    int i = 0;
    pstmt.setString(++i,seq);
    pstmt.setString(++i,pname);
	pstmt.setString(++i,pwriter);
	pstmt.setInt(++i,price);
	pstmt.setString(++i,category);
	pstmt.setString(++i,publisher);
	pstmt.setString(++i,publishDate);
	pstmt.setString(++i,description);
	pstmt.setLong(++i,stock);
	pstmt.setString(++i,fileName);
   
   pstmt.executeUpdate();
   
   if(pstmt != null) pstmt.close();
   if(conn != null) conn.close();
   
   //Home로 이동
   response.sendRedirect("welcome.jsp");
%>
</body>
</html>