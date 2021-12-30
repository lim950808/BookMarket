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
  String year=request.getParameter("birthyy");
  String month=request.getParameter("birthmm");
  String day=request.getParameter("birthdd");
  String birth = year+"/"+month+"/"+day;
  String mail1=request.getParameter("mail1");
  String mail2=request.getParameter("mail2");
  String mail = mail1+"@"+mail2;
  String phone1 = request.getParameter("phone1");
  String phone2 = request.getParameter("phone2");
  String phone3 = request.getParameter("phone3");
  String phone = phone1+"-"+phone2+"-"+phone3;
  String zipCode = request.getParameter("zipcode");
  String roadAddress = request.getParameter("roadAddress");
  String jibunAddress= request.getParameter("jibunAddress");
  String detailAddress = request.getParameter("detailAddress");
  
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