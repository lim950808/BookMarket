<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="dbconn.jsp" %>
<%
request.setCharacterEncoding("UTF-8");
//upload처리
String filename = "";
String realFolder = "c:\\Images";//웹 어플리케이션상의 절대 경로
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
String productId = multi.getParameter("productId");
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
PreparedStatement pstmt=null;

if(fileName!=null){//수정된 파일이 전송된 경우
	//상품수정
	String sql ="update product set pname=?, pwriter=?, unitPrice=?, category=?, "
			   +" publisher=?, publishDate=?, description=?, unitsInStock=?, "
			   +" fileName=? where productId=?";
	//값 설정
	pstmt = conn.prepareStatement(sql);
	int i=0;
	pstmt.setString(++i,pname);
	pstmt.setInt(++i,price);
	pstmt.setString(++i,description);
	pstmt.setString(++i,publisher);
	pstmt.setString(++i,category);
	pstmt.setLong(++i,stock);
	pstmt.setString(++i,publishDate);
	pstmt.setString(++i,fileName);
	pstmt.setString(++i,productId);
	
	pstmt.executeUpdate();
}else{//수정 이미지가 전송이 안된 경우
	//상품수정
	String sql ="update product set pname=?, pwriter=?, unitPrice=?, category=?, "
			   +" publisher=?, publishDate=?, description=?, unitsInStock=?, "
			   +" where productId=?";
	//값 설정
	pstmt = conn.prepareStatement(sql);
	int i=0;
	pstmt.setString(++i,pname);
	pstmt.setInt(++i,price);
	pstmt.setString(++i,description);
	pstmt.setString(++i,publisher);
	pstmt.setString(++i,category);
	pstmt.setLong(++i,stock);
	pstmt.setString(++i,publishDate);
	pstmt.setString(++i,productId);
	pstmt.executeUpdate();	
}

if(pstmt!=null) pstmt.close();
if(conn!=null) conn.close();
//Home으로 이동
response.sendRedirect("welcome.jsp");
%>