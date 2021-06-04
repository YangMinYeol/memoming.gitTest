<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link href="<c:url value="/resources/css/btn.css"/>" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<script type="text/javascript">

function begin(){ // 로그인 창에 들어가면 바로 아이디 입력창에 포커스
	document.myform.MEM_ID.focus();
}
      
function checkId(){ 
	if(!document.myform.MEM_ID.value){ // 만약 아이디에 값을 넣지 않았으면
	alert("아이디를 입력하지 않으셨습니다."); // alert를 띄우고 
	document.myform.id.focus(); // 아이디 칸에 포커스
	return false;
	}

	if(!document.myform.MEM_PW.value){ // 만약 패스워드에 값을 넣지 않았으면
	alert("비밀번호를 입력하지 않으셨습니다."); // alert를 띄우고
	document.myform.passwd.focus(); // 패스워드 칸에 포커스
	return false;
	}
}
       
function fsubmit(){
	var id = $("#MEM_ID")[0].value; // id에 MEM_ID[0]값을 넣음
	var pw = $("#MEM_PW")[0].value; // pw에 MEM_PW[0]값을 넣음
	if(id==null || id==''){ // 만약 아이디가 널이거나 아아디가 빈칸이면
		alert("아이디를 입력하세요."); // alert를 띄운다
		return false;
	}
	if(pw==null || pw==''){ // 만약 패스워드가 널이거나 패스워드가 빈칸이면
		alert("비밀번호를 입력하세요."); // alert를 띄운다
		return false;
 	}
	myform.submit(); // 전송
}       
       
$(document).ready(function(){
          
	// 저장된 쿠키를 로그인화면에 불러오기위함
	var userInputId = getCookie("userInputId");
	$("#MEM_ID").val(userInputId);  
          
	if($("#MEM_ID").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
		$("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
	}
          
	$("#idSaveCheck").change(function(){ // 체크박스에 변화가 있다면,
		if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
			var userInputId = $("#MEM_ID").val();
			setCookie("userInputId", userInputId, 7); // 7일보관
		}else{ // ID 저장하기 체크 해제 시,
		deleteCookie("userInputId");
		}
	});
          
	// ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
	$("#MEM_ID").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
		if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
			var userInputId = $("#MEM_ID").val();
			setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
		}
	});
});

function setCookie(cookieName, value, exdays){ //SET을 사용하여 쿠키저장
	var exdate = new Date();
	exdate.setDate(exdate.getDate() + exdays); //설정 일수만큼 현재시간에 만료값으로 지정
	var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	document.cookie = cookieName + "=" + cookieValue;
}
        
function deleteCookie(cookieName){
	var expireDate = new Date();
	expireDate.setDate(expireDate.getDate() - 1);
	document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
        
function getCookie(cookieName) {
	cookieName = cookieName + '=';
	var cookieData = document.cookie;
	var start = cookieData.indexOf(cookieName);
	var cookieValue = '';
	if(start != -1){
		start += cookieName.length;
		var end = cookieData.indexOf(';', start);
		if(end == -1)end = cookieData.length;
		cookieValue = cookieData.substring(start, end);
	}
	return unescape(cookieValue);
}

</script>

<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"> -->
</head>

<body onload="begin()">
<!-- 액션login.jsp 경로를 콘트롤러의 RequestMapping과 같음 -->
 <form name="myform" action="/solo/member/login.do" method="post" class="form-signin">

<%@ include file="/WEB-INF/views/template/header.jsp"%>
<div style="height: 160px;"></div>

<div align="center">
   <h3>로그인</h3> 
</div>

<div style="height: 30px;"></div>

<div align="center" style="width:800px; margin-left:auto; margin-right:auto; margin-bottom:30px;">
<ul class="nav nav-tabs"> 
  <li class="nav-item">
    <a class="nav-link active" style="color:black;" href="#">회원 로그인</a>
  </li>
</ul>
</div>

<div style="width:500px; margin-left:auto; margin-right:auto; margin-bottom:30px;">

	<div>
      <p style="font-size:13; color:gray;">
      가입하신 아이디와 비밀번호를 입력해주세요.<br>
      비밀번호는 대소문자를 구분합니다.
      </p>
	</div>
  
		<div class="form-group">
			<label for="inputId">아이디</label>
			<input type="text" class="form-control" id="MEM_ID" placeholder="" name="MEM_ID">
        </div>
        
        <div class="form-group">
          <label for="inputPw">비밀번호</label>
          <input type="password" class="form-control" id="MEM_PW" placeholder="" name="MEM_PW">
        </div>
        
        <div class="form-group form-check">
          <input type="checkbox" class="form-check-input" id="idSaveCheck">
          <label class="form-check-label" for="idSaveCheck">아이디 저장</label>
        </div>
        
        <input type="button" class="btn btn-outline-secondary" style="margin-left:auto; width:100%;" value="로그인" onclick="fsubmit();">
		<div class="form-group form-check" style="margin-top:10px;"></div>
		
		<div style="float:left;">
			<span style="margin-left:30;"><a href="http://localhost:8007/solo/member/findId.do" style="color:black;">아이디/비밀번호 찾기</a></span>
		</div>
		
		<div style="float:right;">
			<span style="margin-right:90;"><a href="http://localhost:8007/solo/member/openJoinForm.do" style="color:black;">회원가입</a></span>
		</div>
</div>
</form>

<div style="height:80px;"> </div>

<footer style="border-top:1px solid #D5D5D5;">
<%@ include file="/WEB-INF/views/template/footer.jsp"%> 
</footer>
</body>
</html>