<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
function selectDomain(obj){
	document.newMember.mail2.value=obj.value;
	if(obj.value=="") document.newMember.mail2.focus();
}
</script> 
<script>
function checkForm(){
 if(document.newMember.password.value!=document.newMember.password_confirm.value){
	 alert("비밀번호와 비밀번호확인 값이 서로 다릅니다!");
	 document.newMember.password.value="";
	 document.newMember.password_confirm.value="";
	 document.newMember.password.focus();
	 return false;
 }	
 
//validation 체크
	var regExpId = /^[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
	var regExpName = /^[가-힣]*$/;
	var regExpPassword =/^[0-9]*$/;
	var regExpPhone = /^\d{3}-\d{3,4}-\d{4}$/;
	var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; //akim
	//form명
	var form = document.newMember;
	
	var id = form.id.value;
	var name = form.name.value;
	var passwd = form.password.value;
	var phone = form.phone1.value +"-" + form.phone2.value +"-" + form.phone3.value;
	var email = form.mail1.value +"@"+form.mail2.value;
	
	/* if(!regExpId.test(id)){
		alert("아이디는 문자로 시작해주세요");
		form.id.focus();
		form.id.value="";
		return false; 
	}*/
	
	if(!regExpName.test(name)){
		alert("이름은 한글만 입력해주세요!");
		form.name.focus();
		form.name.value='';
		return false;
	}
	
	if(!regExpPassword.test(passwd)){
		alert("비밀번호는 숫자만 입력해주세요");
		form.password.focus();
		form.password.value='';
		form.password_confirm.value='';
		return false;
	}
	
	if(!regExpPhone.test(phone)){
		alert("연락처 입력을 확인 해주세요");
		form.phone2.focus();
		form.phone2.value='';
		form.phone3.value='';
		return false;	
	}
	if(!regExpEmail.test(email)){
		alert("이메일 입력을 확인 해주세요");
	    form.email1.focus();
		form.email1.value='';
		form.email2.value='';
		return false;	
	}
	
	return true;
}
</script>

<!--   <script>
글로벌 변수 
var isConfirm=false;
function confirm(){
	var cert1 = document.getElementById("cert").value;
	var cert2= document.getElementById("cert_confirm").value;
	if(cert1!=cert2){
		alert("cert1:"+cert1);
		alert("cert2:"+cert2);
		alert("인증확인요망");
		console.log('인증확인요망','isConfirm:',isConfirm);
	}else{
		alert("인증이 완료되었습니다.");
		isConfirm=true;
		console.log('인증이 완료되었습니다.','isConfirm:',isConfirm);
	}
}
</script> -->

<script>
function changePasswordForm(){
	window.open("changePassword.jsp");
}
</script>

<%
	String sessionId = (String)session.getAttribute("sessionId");
%>
<%-- <%=sessionId %> --%>
<%-- ${sessionId} --%>
<%--데이타 소스 설정 --%>
<sql:setDataSource  var="dataSource"   
      url="jdbc:mysql://localhost:3306/BookMarket"
      user="director" password="director"
      driver="com.mysql.cj.jdbc.Driver" />
<%-- db에서 sessionId에 해당하는 회원 정보 추출 --%>      
<sql:query var="resultSet" dataSource="${dataSource}">
 select * from member where cid = ?
 <sql:param value="${sessionId}"/>
</sql:query>      
<title>백두도서</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%@ include file="../menu.jsp" %>
<div class="container mt-5">
<div class="row">
<div class="col-sm-1"></div>
<div class="col-sm-10">
  <h2 id="company"><b>회원정보 수정</b></h2>
  <hr>
<pre>

</pre>
  <c:forEach var="row" items="${resultSet.rows}">
     <c:set var="mail" value="${row.cmail}"/>
     <c:set var="mail1" value="${mail.split('@')[0]}"/>
     <c:set var="mail2" value="${mail.split('@')[1]}"/>
     
     <c:set var="birth" value="${row.cbday}"/>
     <c:set var="year" value="${birth.split('/')[0]}"/>
     <c:set var="month" value="${birth.split('/')[1]}"/>
     <c:set var="day" value="${birth.split('/')[2]}"/>
     
     <c:set var="phone" value="${row.cphone}"/>
     <c:set var="phone1" value="${phone.split('-')[0]}"/>
     <c:set var="phone2" value="${phone.split('-')[1]}"/>
     <c:set var="phone3" value="${phone.split('-')[2]}"/>
     
    <div class="container">
       <form name="newMember" class="form-hotizontal" action="processUpdateMember.jsp" 
             method="post" onsubmit="return checkForm()">
       <div class="form-group row">
              <label class="col-sm-2">아이디</label>
              <div class="col-sm-3">
                   <input name="cid" type="text" class="form-control" value="${row.cid}" readonly>
              </div>
        </div>
        
             <div class="form-group row">
              <label class="col-sm-2">이름</label>
              <div class="col-sm-3">
                   <input name="cname" type="text" class="form-control" value="${row.cname}" required>
              </div>
        </div>
        
        <div class="form-group row">
              <label class="col-sm-2">비밀번호</label>
              <div class="col-sm-3">
                   <input name="cpw" type="password" class="form-control" placeholder="Password" required>
                   <input type="button" value="비밀번호변경"  class="btn btn-outline-success" onclick="changePasswordForm()">
              </div>
        </div>
        
        <div class="form-group row">
              <label class="col-sm-2">비밀번호(확인)</label>
              <div class="col-sm-3">
                   <input name="password_confirm" type="password" class="form-control" placeholder="Password Confirm" required>
              </div>
        </div>
   
        <div class="form-group row">
              <label class="col-sm-2">생일</label>
              <div class="col-sm-4">
                   <input type="text" name="birthyy" maxlength="4" placeholder="년(4자)" size="6" required value="${year}">
                   <select name="birthmm" required>
                   	<option value="">월</option>
                   	<option value="01" <c:if test="${month.equals('01')}"><c:out value="selected"/></c:if>>1</option>
                   	<option value="02" <c:if test="${month.equals('02')}"><c:out value="selected"/></c:if>>2</option>
                   	<option value="03" <c:if test="${month.equals('03')}"><c:out value="selected"/></c:if>>3</option>
                   	<option value="04" <c:if test="${month.equals('04')}"><c:out value="selected"/></c:if>>4</option>
                   	<option value="05" <c:if test="${month.equals('05')}"><c:out value="selected"/></c:if>>5</option>
                   	<option value="06" <c:if test="${month.equals('06')}"><c:out value="selected"/></c:if>>6</option>
                   	<option value="07" <c:if test="${month.equals('07')}"><c:out value="selected"/></c:if>>7</option>
                   	<option value="08" <c:if test="${month.equals('08')}"><c:out value="selected"/></c:if>>8</option>
                   	<option value="09" <c:if test="${month.equals('09')}"><c:out value="selected"/></c:if>>9</option>
                   	<option value="10" <c:if test="${month.equals('10')}"><c:out value="selected"/></c:if>>10</option>
                   	<option value="11" <c:if test="${month.equals('11')}"><c:out value="selected"/></c:if>>11</option>
                   	<option value="12" <c:if test="${month.equals('12')}"><c:out value="selected"/></c:if>>12</option>
                   </select>
                   <input type="text" name="birthdd" maxlength="2" placeholder="일" size="4"  value="${day}" required>
              </div>
        </div>
        
       <div class="form-group row">
             <label class="col-sm-2">이메일</label>
             <div class="col-sm-10">
                <input type="text" name="mail1" maxlength="50" required value="${mail1}"> @
                <input type="text" name="mail2" maxlength="50" required value="${mail2}">
                 <select name="mail2_select" onchange="selectDomain(this)">
                    <option disabled="disabled" selected="selected">선택</option>
                    <option>naver.com</option>
                    <option>daum.net</option>
                    <option>gmail.com</option>
                    <option>nate.com</option>
                    <option value="">직접입력</option>
                </select>
             </div>
       </div>
       
       <div class="form-group row">
         <label class="col-sm-2">전화번호</label>
         <div class="col-sm-5">
               <select name="phone1" required>
		              <option value="010" <c:if test="${phone1.equals('010')}"><c:out value="selected"/></c:if> >010</option>
		              <option value="011" <c:if test="${phone1.equals('011')}"><c:out value="selected"/></c:if> >011</option>
		              <option value="016" <c:if test="${phone1.equals('016')}"><c:out value="selected"/></c:if> >016</option>
		              <option value="017" <c:if test="${phone1.equals('017')}"><c:out value="selected"/></c:if> >017</option>
		              <option value="019" <c:if test="${phone1.equals('019')}"><c:out value="selected"/></c:if> >019</option>
		           </select>
				- <input maxlength="4" size="4" name="phone2" required value="${phone2}" > -
				<input maxlength="4" size="4" name="phone3" required value="${phone3}">
         </div>
       </div>
  
  <div class="form-group row">
             <label class="col-sm-2">우편번호</label>
             <div class="col-sm-3">
                 <input name="zipcode" id="zipcode" type="text" class="form-control" placeholder="우편번호" value="${row.zipcode}" required>
                 <input type="button" class="btn btn-outline-secondary" onclick="Postcode()" value="우편번호 찾기"><br>
             </div>
         </div>
          <div class="form-group row">
             <label class="col-sm-2">도로명주소</label>
             <div class="col-sm-5">
                 <input name="roadaddr" id="roadAddress" type="text" class="form-control" placeholder="도로명주소" value="${row.roadaddr}" required>
             </div>
         </div>
         <div class="form-group row">
             <label class="col-sm-2">지번주소</label>
             <div class="col-sm-5">
                 <input name="jibuncaddr" id="jibunAddress"  type="text" class="form-control" placeholder="지번주소" value="${row.jibuncaddr}" required>
             </div>
         </div>
         <span id="guide" style="color:#999;display:none"></span>
         <div class="form-group row">
             <label class="col-sm-2">상세주소</label>
             <div class="col-sm-5">
                 <input name="detailcaddr" id="detailAddress" type="text" class="form-control" placeholder="상세주소" value="${row.detailcaddr}" required>
             </div>
         </div>
        
       <div class="form-gorup row">
          <div class="col-sm-offset-2 col-sm-10">
               <input type="submit" class="btn btn-outline-success" value="수정">
               <input type="reset"  class="btn btn-outline-secondary" value="취소" onclick="reset()">
               <button class="btn btn-outline-danger" data-toggle="modal" data-target="#exampleModal">회원탈퇴</button>
          </div>
       </div>
       </form>
    </div><!-- container끝.  --> 
  </c:forEach>
</div>
<div class="col-sm-1"></div>
</div>
</div>
<pre>

</pre>
  
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">회원탈퇴</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        정말 탈퇴하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-outline-danger" onclick="location.href='deleteMember.jsp'">회원탈퇴</button>
      </div>
    </div>
  </div>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function Postcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("roadAddress").value = roadAddr;
                document.getElementById("jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                /* if(roadAddr !== ''){
                    document.getElementById("extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("extraAddress").value = '';
                } */
                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';
                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
<%@ include file="../footer.jsp" %>
</body>
</html>