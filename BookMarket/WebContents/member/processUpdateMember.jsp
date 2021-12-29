<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%
	/* 문자셋 설정 */
  request.setCharacterEncoding("UTF-8"); 
    /* 파라미터 받기 */
  String id=request.getParameter("cid");
  String name=request.getParameter("cname");  
  String password=request.getParameter("cpw");
  String birth=request.getParameter("birthyy")+"/"+request.getParameter("birthmm")+"/"+request.getParameter("birthdd");
  String mail1=request.getParameter("cmail1");
  String mail2=request.getParameter("cmail2");
  String mail = mail1+" @ "+mail2;
  String phone1 = request.getParameter("cphone1");
  String phone2 = request.getParameter("cphone2");
  String phone3 = request.getParameter("cphone3");
  String phone = phone1+"-"+phone2+"-"+phone3;
  String zipCode = request.getParameter("zipcode");
  String roadAddress = request.getParameter("roadaddr");
  String jibunAddress= request.getParameter("jibuncaddr");
  String detailAddress = request.getParameter("detailcaddr");
  /* 회원 가입일자 타임스템프 정보 생성 */
  Date currentDatetime = new Date(System.currentTimeMillis());
  java.sql.Date sqlDate = new java.sql.Date(currentDatetime.getTime());//long타입의값을 매개변수 생성
  java.sql.Timestamp timestamp = new java.sql.Timestamp(currentDatetime.getTime());
%>

<%-- <%=id %><br>
<%=name %><br>
<%=password %><br>
<%=gender %><br>
<%=birth %><br>
<%=mail %><br>
<%=phone %><br>
<%=zipCode %><br>
<%=roadAddress %><br>
<%=jibunAddress %><br>
<%=detailAddress %><br>
<%=extraAddress %><br> --%>
<%-- 데이터 셋 설정 --%>
<sql:setDataSource var="dataSource"  
     url="jdbc:mysql://localhost:3306/BookMarket" 
     driver="com.mysql.cj.jdbc.Driver" user="director" password="director" />
     
<%-- 입력처리 --%>     
<sql:update dataSource="${dataSource}" var="resultSet">
update member set cname=?,cpw=?,cbday=?,cmail=?,cphone=?,zipcode=?,roadaddr=?,jibuncaddr=?,detailcaddr=? where cid=?
   	   	   
<sql:param value="<%=name %>"/>
<sql:param value="<%=password %>"/>
<sql:param value="<%=birth %>"/>
<sql:param value="<%=mail %>"/>
<sql:param value="<%=phone %>"/>
<sql:param value="<%=zipCode %>"/>
<sql:param value="<%=roadAddress %>"/>
<sql:param value="<%=jibunAddress %>"/>
<sql:param value="<%=detailAddress %>"/>
<sql:param value="<%=id%>"/> 
</sql:update>     

<!-- 입력후 페이지 이동 처리, response.sendRedirect -->
<c:if test="${resultSet >=1}">
   <c:redirect url="resultMember.jsp?msg=0"/>
</c:if>