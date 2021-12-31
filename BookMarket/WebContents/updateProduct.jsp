<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.mysql.cj.xdevapi.PreparableStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="./resources/js/validation.js"></script>
<title><fmt:message key="updateTitle"/></title>
</head>
<body>
<fmt:bundle basename="resourceBundle.message">
<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3"><fmt:message key="updateTitle"/></h1>
		</div>
	</div>
	<%@ include file="dbconn.jsp"%>
	<%
	PreparedStatement pstmt = null;
	ResultSet rs = null;
    String sql = "select publisher, name from publisher";
	
	pstmt= conn.prepareStatement(sql);
    rs = pstmt.executeQuery();
	List<String> list = new ArrayList<String>();
	while(rs.next()){
		list.add(rs.getString(1)+"-"+rs.getString(2));
	}
	%>
	<%
    sql = "select category, name from category";
	pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();
	List<String> cateList = new ArrayList<String>();
	while(rs.next()){
		cateList.add(rs.getString(1)+"-"+rs.getString(2));
	}

	%>
	<%
		String productId = request.getParameter("id");
	
		sql = "select * from product where productId = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, productId);
		rs = pstmt.executeQuery();
		if (rs.next()) {
	%>
	<div class="container">
		<div class="row">
		<div class="text-right">
         <a href="logout.jsp" class="btn btn-sm btn-success pull-right">logout</a>
       </div>
			<div class="col-md-5">
				<img src="c:\\Images<%=rs.getString("filename")%>" alt="image" style="width: 100%" />
			</div>
			<div class="col-md-7">
				<form name="newProduct" action="processUpdateProduct.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
					<div class="form-group row">
						<label class="col-sm-2">도서번호</label>
						<div class="col-sm-3">
							<input type="text" id="productId" name="productId" class="form-control" value='<%=rs.getString("productId")%>' disabled>
							<input type="hidden" id="productId" name="productId" value='<%=rs.getString("productId")%>'>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">도서 제목</label>
						<div class="col-sm-3">
							<input type="text" id="name" name="name" class="form-control" value="<%=rs.getString("pname")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">저자</label>
						<div class="col-sm-3">
							<input type="text" id="writer" name="writer" class="form-control" value="<%=rs.getString("pwriter")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">판매가</label>
						<div class="col-sm-3">
							<input type="text" id="unitPrice" name="unitPrice" class="form-control" value="<%=rs.getInt("unitPrice")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">카테고리</label>
						<div class="col-sm-3">
							<select name="category" class="form-control">
							<%
							for(String s:cateList)
								out.print("<option value='"+s.substring(0,s.indexOf('-'))+"'>"
							                  +s.substring(s.indexOf('-')+1)+"</option>");
							%>
							</select>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">출판사</label>
						<div class="col-sm-3">
							<select name="publisher" class="form-control">
						<%
						for(String s:list)
							out.print("<option value='"+s.substring(0,s.indexOf('-'))+"'>"
						                     +s.substring(s.indexOf('-')+1)+"</option>");
						%>	
						</select>	
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">출판일자</label>
						<div class="col-sm-3">
							<input type="text" id="publishDate" name="publishDate" class="form-control" value="<%=rs.getInt("publishDate")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">한 줄 소개</label>
						<div class="col-sm-5">
							<textarea name="description" cols="50" rows="2" class="form-control"><%=rs.getString("description")%></textarea>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">재고 수</label>
						<div class="col-sm-3">
							<input type="text" id="unitsInStock" name="unitsInStock" class="form-control" value="<%=rs.getLong("unitsInStock")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">이미지</label>
						<div class="col-sm-5">
						    <img style="width: 500px;" id="preview-image" >
							<input type="file" name="productImage" id="productImage" class="form-control" >
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-offset-2 col-sm-10 ">
							<input type="submit" class="btn btn-primary" value="<fmt:message key="buttonEdit"/>">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%
		}
		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
	%>
</fmt:bundle>	
</body>
</html>
<script>
function readImage(input) {
    // 인풋 태그에 파일이 있는 경우
    if(input.files && input.files[0]) {
        // 이미지 파일인지 검사 (생략)
        // FileReader 인스턴스 생성
        const reader = new FileReader()
        // 이미지가 로드가 된 경우
        reader.onload = e => {
            const previewImage = document.getElementById("preview-image")
            previewImage.src = e.target.result
        }
        // reader가 이미지 읽도록 하기
        reader.readAsDataURL(input.files[0])
    }
}
// input file에 change 이벤트 부여
const inputImage = document.getElementById("productImage")
inputImage.addEventListener("change", e => {readImage(e.target)})
</script>