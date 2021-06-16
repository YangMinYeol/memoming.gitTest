<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>

<title>회원가입</title>
</head>

<script language="JavaScript">

$(document).ready(function() { // id check
    $("#idCheck").on("click", function(e) {
       e.preventDefault();
       fn_idCheck();
    });
 });

function fn_idCheck(){ // id check
if(!$("#MEM_ID").val()){ // 아이디 입력창이 비어있으면
       alert("아이디를 입력하세요"); // 아이디를 입력하세요 알람을 띄운다
       $("#MEM_ID").focus(); // 아이디 입력창에 포커스를 준다
       return false; // false값을 준다
}

 var MEM_ID = {MEM_ID : $('#MEM_ID').val()}; // MEM_ID에 MEM_ID칸에 있는 값을 넣는다
 
 $.ajax({
     url:"<c:url value='/member/idCheck.do'/>", // id 중복체크
     type:'get', // get 타입 (get타입은 가져오는것이고 post타입은 수행하는것이다.)
     data: MEM_ID,
     success:function(data){     
         if($.trim(data)=="0"){ // MEM_ID가 0이면 
            alert("사용가능한 아이디입니다."); // 출력
         }else{ // 아니면
            alert("중복된 아이디입니다."); // 출력
             $('#MEM_ID').val(''); // MEM_ID칸을 빈칸
             $('#MEM_ID').focus(); // MEM_ID칸 포커스
         }
     },
     error:function(){ // 에러가 발생하면
             alert("ERROR"); // 에러 출력        
     }
 });
};

$(document).ready(function() { // 닉네임(별명) 확인
    $("#nickCheck").on("click", function(e) {
       e.preventDefault();
       fn_nickCheck();
    });
 });

function fn_nickCheck(){ // 닉네임(별명) 확인
if(!$("#MEM_NICK").val()){ // 만약 닉네임 입력칸이 빈칸이면
       alert("닉네임을 입력하세요"); // 출력
       $("#MEM_NICK").focus(); // 닉네임칸에 포커스
       return false;
}
	var MEM_NICK = {MEM_NICK : $('#MEM_NICK').val()};
 $.ajax({
     url:"<c:url value='/member/nickCheck.do'/>",
     type:'get',
     data: MEM_NICK,
     success:function(data){
         if($.trim(data)=="0"){
            alert("사용가능한 닉네임입니다.");       
         }else{
            alert("중복된 닉네임입니다.");
             $('#MEM_NICK').val('');
             $('#MEM_NICK').focus();
         }
     },
     error:function(){
             alert("닉네임을 입력하세요");
     }
 });
};

function openAgree(){ // 약관동의
    var newWindow=open("http://localhost:8007/solo/member/openAgree.do","약관확인", "width=auto, height=auto"); // 새로운 창을 연다

    if(frm.MEM_AGREE.disabled==true)
      frm.MEM_AGREE.disabled=false
      else
         frm.MEM_AGREE.disabled=true
   }

function agreeCheck(frm) // 동의체크
{
   if(frm.checkButton.disabled==true)
      frm.checkButton.disabled=false
      else
         frm.checkButton.disabled=true
}
</script>

<!-- 다음 주소 API  -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
   function DaumAddressAPI() {
      new daum.Postcode(
            {
               oncomplete : function(data) {
                  var addr = '';
                  var extraAddr = ''; 

                  if (data.userSelectedType === 'R') { 
                     addr = data.roadAddress;
                  } else { 
                     addr = data.jibunAddress;
                  }
                  
                  if (data.userSelectedType === 'R') {
                     if (data.bname !== ''
                           && /[동|로|가]$/g
                                 .test(data.bname)) {
                        extraAddr += data.bname;
                     }
                     
                     if (data.buildingName !== ''
                           && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', '
                              + data.buildingName
                              : data.buildingName);
                     }
                     
                     if (extraAddr !== '') {
                        extraAddr = ' (' + extraAddr
                              + ')';
                     }
                  }
                  document
                        .getElementById('MEM_ZIPCODE').value = data.zonecode;
                  document
                        .getElementById("MEM_ADDRESS1").value = addr;
                  
                  document.getElementById("MEM_ADDRESS2").focus();
               }
            }).open();
   }
</script>
<body>
<%@ include file="/WEB-INF/views/template/header.jsp"%>

<div style="height: 160px;"></div>
<div align="center">
	<h3>회원가입</h3> 
</div>
<div style="height: 50px;"></div>

<form id="frm" name="frm" class="form-inline" method="post">
      <table class="joinFormView" style="border:0; cellpadding:1; cellspacing:1;" align="center">
            <tr> 
               <td style="width:150px; padding-right:15px;" align="right" > 사용자 ID</td>
               <td style="width:300px;">
               <input type="text" id="MEM_ID" name="MEM_ID" size="15" maxlength="12"  class="form-control" placeholder="아이디" style="width:100%;">
               </td>
               <td style="width:100px;">
               <input type="button" name="idCheck" value="ID 중복확인" class="btn btn-outline-dark mb-2" OnClick="fn_idCheck()" style="width:100%;">
               </td>
            </tr>
               
            <tr>
               <td style="width:150px; padding-right:15px;" align="right" > 비밀번호</td>
               <td colspan="2">
               <input type="password" id="MEM_PW" name="MEM_PW" size="15" maxlength="12" class="form-control" placeholder="비밀번호" style="width:100%;">
               </td>
            </tr>
            
            <tr>
               <td style="width:150px; padding-right:15px;" align="right"> 비밀번호 확인</td>
                 <td colspan="2">
                 <input type="password" id="MEM_PW2" name="MEM_PW2" size="15" maxlength="12" class="form-control" placeholder="비밀번호 확인" style="width:100%;">
                 </td>
              </tr>
            
            <tr>
               <td style="width:150px; padding-right:15px;" align="right" > 사용자 이름</td>
               <td colspan="2">
               <input type="text" id="MEM_NAME" name="MEM_NAME" size="15" maxlength="12" class="form-control" placeholder="이름" style="width:100%;">
               </td>
            </tr>
            
            <tr>
               <td style="width:150px; padding-right:15px;" align="right" > 닉네임</td>
               <td>
               <input type="text" id="MEM_NICK" name="MEM_NICK" size="15" maxlength="12" class="form-control" placeholder="닉네임" style="width:100%;">
               </td>
               <td>
               <input type="button" name="nickCheck" value="중복확인" class="btn btn-outline-dark mb-2"  OnClick="fn_nickCheck()" style="width:100%;">
               </td>
            </tr>
            
            <tr>
                  <td style="width:150px; padding-right:15px;" align="right">이메일</td>
                <td colspan="2">
                  <input type="text" id="MEM_EMAIL" name="MEM_EMAIL" size="40" maxlength="30" class="form-control" placeholder="이메일" style="width:100%;">
                </td>
             </tr>
             
             <tr>
                <td style="width:150px; padding-right:15px;" align="right"> 연락처</td>
                <td colspan="2">
                <input type="text" id="MEM_PHONE" name="MEM_PHONE" size="40" maxlength="12" placeholder="연락처(- 없이 숫자만 입력)"
                 oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"  class="form-control" placeholder="PHONE" style="width:100%;">
                </td>
             </tr>

             <tr>
             <td style="width:150px; padding-right:15px;" align="right" rowspan="2"> 주 소</td>
             <td>
             <input type="text" id="MEM_ZIPCODE" name="MEM_ZIPCODE" placeholder="우편번호" size="15" class="form-control" readonly style="width:100%;">
             </td>
             <td>
            <input type="button" onclick="DaumAddressAPI()" class="btn btn-outline-dark mb-2" value="우편번호 찾기" style="width:100%;"><br>
            </td>
            </tr>
            <tr>
            <td colspan="2">
            <input type="text" name="MEM_ADDRESS1" id="MEM_ADDRESS1" placeholder="주소" size="40" class="form-control" style="width:100%;"><br>
            <input type="text" name="MEM_ADDRESS2" id="MEM_ADDRESS2" placeholder="상세주소" size="40" class="form-control" style="width:100%;">
            </td>
            </tr>
			
			<tr>
				<td style="width:150px; padding-right:15px;" align="right" rowspan="2"></td>
				<td colspan="2">
				<br>
				Email 수신  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <!-- &nbsp는 여백을 만들어줌  -->
				<div class="form-check form-check-inline" style="display: inline-block;">
				  <label class="form-check-label" for="inlineRadio1"><input class="form-check-input" type="radio" name="MEM_EMAILCK" id="email1" value="Y" checked="checked">동의</label>
				</div>
				<div class="form-check form-check-inline" style="display: inline-block;">
				  <label class="form-check-label" for="inlineRadio2"><input class="form-check-input" type="radio" name="MEM_EMAILCK" id="email2" value="N">동의 안함</label>
				</div>
				</td>
			</tr>
			
            <tr>
            	<td colspan="2">
               SNS 수신  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
               <div class="form-check form-check-inline" style="display: inline-block;">
				  <label class="form-check-label" for="inlineRadio1"><input class="form-check-input" type="radio" name="MEM_PHONECK" id="phone1" value="Y" checked="checked">동의</label>
				</div>
				<div class="form-check form-check-inline" style="display: inline-block;">
				  <label class="form-check-label" for="inlineRadio2"><input class="form-check-input" type="radio" name="MEM_PHONECK" id="phone2" value="N">동의 안함</label>
				</div>
               </td>
            </tr>
            

			<tr style="margin-top:30px;"> 
            <td colspan="3" align="center">   
            <br><br>
            이용약관 및 개인정보 수집 및 이용에 모두 동의합니다. 
            <br><br>
            <input type="button" name="agree" value="약관확인" class="btn btn-outline-dark mb-2"  onclick="openAgree()"/>
            <div style="display:inline-block; margin-left:100px;">
  				<label class="form-check-label" for="MEM_AGREE"><input class="form-check-input" type="checkbox" name="MEM_AGREE" id="MEM_AGREE" disabled onclick="agreeCheck(this.form)">동의</label>
  			</div>
            </td>
            </tr>

            <tr>
               <td colspan="3" align="center">
               <br>
               <a href="#this" class="btn" id="join"><input type="button" class="btn btn-dark mb-2" name="checkButton" value="가입하기" disabled/></a> 
                  <input type="reset" name="reset" value="다시입력" class="btn btn-outline-dark mb-2"/>&nbsp;&nbsp;&nbsp;
                  <input type="button" value="가입안함" class="btn btn-outline-dark mb-2" onclick="javascript:window.location='/solo/main/openMainList.do'" />
               </td>
            </tr>
      </table>
</form>

 <%@ include file="/WEB-INF/include/include-body.jspf"%>
<div style="height:80px;"></div>

<footer style="border-top:1px solid #D5D5D5;">
<%@ include file="/WEB-INF/views/template/footer.jsp"%> 
</footer>

<script type="text/javascript">
      $("#join").on("click", function(e) {
         e.preventDefault();
         fn_insertJoin();
      });

      function fn_insertJoin() {
         var comSubmit = new ComSubmit("frm");
         comSubmit.setUrl("<c:url value='/member/insertJoin.do' />");
         
            if(!$("#MEM_ID").val()){
                  alert("아이디를 입력하세요");
                  $("#MEM_ID").focus();
                  return false;
               }

            if(!$("#MEM_PW").val()){
               alert("비밀번호를 입력하세요");
               $("#MEM_PW").focus();
               return false;
            }

            if(!$("#MEM_PW2").val()){
               alert("비밀번호를 확인하세요");
               $("#MEM_PW2").focus();
               return false;
            }

            if($("#MEM_PW").val() != $("#MEM_PW2").val()){
               alert("비밀번호가 일치하지 않습니다.");
               $("#MEM_PW2").focus();
               return false;
            }            

            if(!$("#MEM_NAME").val()){
               alert("이름을 입력하세요");
               $("#MEM_NAME").focus();
               return false;
            }

            if(!$("#MEM_NICK").val()){
               alert("닉네임 입력하세요");
               $("#MEM_NICK").focus();
               return false;
            }

            if(!$("#MEM_PHONE").val()){
               alert("연락처를 입력하세요");
               $("#MEM_PHONE").focus();
               return false;
            }

            if(!$("#MEM_ZIPCODE").val()){
               alert("우편번호를 입력하세요");
               $("#MEM_ZIPCODE").focus();
               return false;
            }

            if(!$("#MEM_ADDRESS1").val()){
               alert("주소를 입력하세요");
               $("#MEM_ADDRESS1").focus();
               return false;
            }

            if(!$("#MEM_ADDRESS2").val()){
               alert("상세주소를 입력하세요");
               $("#MEM_ADDRESS2").focus();
               return false;
            }
            alert("가입이 완료 되었습니다.");
            comSubmit.submit();
      }
   </script>
</body>
</html>