<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
 Connection conn = null;
 try{
	 String url = "jdbc:mysql://localhost:3306/BookMarket";
	 String user = "director";
	 String password = "director";
	 
	 Class.forName("com.mysql.cj.jdbc.Driver");
	 conn=DriverManager.getConnection(url,user,password);
	 if(conn==null){
		 Context init = new InitialContext();
		 DataSource ds = 
		     (DataSource)init.lookup("java:comp/env/jdbc/BookMarket");
		      conn=ds.getConnection();
	 }
	 //if(conn != null) out.print("연결 성공");
 }catch(Exception e){
	 out.println("데이터베이스 연결이 실패했습니다");
	 out.print("SQLException: " + e.getMessage());
 }
%>