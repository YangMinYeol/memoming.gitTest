<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<html>
<head>

<%@ include file="/WEB-INF/include/include-header.jspf"%>

<style>
header{
    position : fixed;
    left : 0;
    top : 0; 
    width: 100%; 
    height:120px;
    z-index: 4;
    background-color:white;
    font-family:"Tahoma";
    font-weight:"bolder";
}

.td{
   cellspacing:10px;
}
 
</style>

<script type="text/javascript"> 
   $(document).ready(function(){
      
   $("a[name='order']").on("click", function(e){
         e.preventDefault();
         myOrder();
      });
   });

 function myOrder() {
    <c:if test="${session_MEM_ID == null}">
    alert("로그인이 필요한 서비스 입니다.");
    return false;
    </c:if>
    var comSubmit = new ComSubmit();
   comSubmit.setUrl("/solo/member/openMyOrderList.do");
   comSubmit.addParam("MEM_NUM", $("#MEM_NUM").val());
   comSubmit.submit();
   }

 function myPage() {
    <c:if test="${session_MEM_ID == null }">
    alert("로그인이 필요한 서비스 입니다.");
    return false;
    </c:if>

   window.location.href='http://localhost:8007/solo/member/openMyInfoForm.do';
   }
 
 function basketList() {
       <c:if test="${session_MEM_ID == null }">
       alert("로그인이 필요한 서비스 입니다.");
       return false;
       </c:if>
       window.location.href='http://localhost:8007/solo/shop/basketList.do'
 } 
 
 
$('.holder').on('click', function() {
     $this = $(this);
     if($this.hasClass('active')) {
       $this.fadeOut(500);
       setTimeout(function() {
         $this.removeClass('active')
       }, 500);
       setTimeout(function() {
         $this.fadeIn(500);
       }, 1000);
     } else {
       $(this).addClass('active');
     }
   });

   $(document).on('click', function(e) {
     container = $('.holder');
     if ($('.holder').hasClass('active') && !container.is(e.target)  && container.has(e.target).length === 0) {
       $this.fadeOut(500);
       setTimeout(function() {
         $this.removeClass('active')
       }, 500);
       setTimeout(function() {
         $this.fadeIn(500);
       }, 1000);
     }
   });
</script>

</head>



<header style="border-bottom:1px solid #D5D5D5;">  


<!-- 로고 -->
<div style="width:320; height:120; float:left;">
<a href="http://localhost:8007/solo/main/openMainList.do">
   <img src="../img/Solo-logo.png" width="320" height="120" style="margin-left:10px;">    
</a>   
</div>

<!-- 메인 헤더 메뉴 로그인 안했을 때--> 
<c:if test="${session_MEM_ID == null }">
<div style="float:right; width:200px; ">
 <table style="width:100%; padding:0px; margin:0px; border:0px; height:30px;">
      <tr style="margin:0px; padding:0px;">
         <td align="right" style="padding:0px;"><button type="button" onclick="location.href='http://localhost:8007/solo/member/openLoginForm.do'" class="btn btn-link" style="color:black; padding:5px;"><font size='2'>로그인</font></button></td>
         
         <td align="right" style="padding:0px;"><button type="button" class="btn btn-link" style="color:black; padding:5px;" onclick="location.href='http://localhost:8007/solo/member/openJoinForm.do'"><font size='2'>회원가입</font></button></td>
      </tr>
</table>
</div>
</c:if>

<!-- 메인 헤더 메뉴 로그인 했을 때--> 
<c:if test="${session_MEM_ID != null && session_MEM_ID != 'admin' }">
<div style="float:right; width:500px;">
 <table style="width:100%; padding:0px; margin:0px; border:0px; height:30px;">
      <tr style="margin:0px; padding:0px;">
         <td align="right" style="padding:0px;">${session_MEM_ID}<font size='2'>님</font></td>  
          
         <td align="right" style="padding:0px; width:70px;"><button type="button" onclick="location.href='http://localhost:8007/solo/member/logout.do'" class="btn btn-link" style="color:black; padding:5px; width:100;"><font size='2'>로그아웃</font></button></td>
         
         <td align="right" style="padding:0px; width:80px;"><a href="javascript:myPage();"><button type="button" class="btn btn-link" style="color:black; padding:5px;"><font size='2'>마이페이지</font></button></a>  </td> 
         
         <td align="right" style="padding:0px; width:70px;"><a href="javascript:basketList();"><button type="button" class="btn btn-link" style="color:black; padding:5px;"><font size='2'>장바구니</font></button></a></td>
         
		 <td align="right" style="padding:0px; width:80px;"><a href="#this" name="order"><button type="button" class="btn btn-link" style="color:black; padding:0px 15px 0px 5px;"><font size='2'>주문조회</font></button></a>
         <input type="hidden" name="MEM_NUM" id="MEM_NUM" value="${session_MEMBER.MEM_NUM}">
      </tr>
</table>
</div>
</c:if>

<!-- 관리자 로그인 -->
<c:if test="${session_MEM_ID == 'admin' }">
<div style="float:right; width:450px; ">
 <table style="width:100%; padding:0px; margin:0px; border:0px; height:30px;">
      <tr style="margin:0px; padding:0px;">
        <td align="right" style="padding:0px;" class="td">${session_MEM_ID}<font size='2'>(관리자)</font></td>
        <td align="right" style="padding:0px;" class="td"><button type="button" onclick="location.href='http://localhost:8007/solo/member/logout.do'" class="btn btn-link" style="color:black; padding:5px;"><font size='2'>로그아웃</font></button></td>
        <td align="right" style="padding:0px;" class="td"><button type="button" onclick="location.href='http://localhost:8007/solo/admin/openAdminMember.do'" class="btn btn-link" style="color:black; padding:5px;"><font size='2'>관리자페이지</font></button></td> 
        <td align="right" style="padding:0px;" class="td"><button type="button" onclick="location.href='http://localhost:8007/solo/admin/order_admin_a.do'" class="btn btn-link" style="color:black; padding:0px 15px 0px 5px;"><font size='2'>주문관리</font></button></td>        
      </tr>
</table>
</div>
</c:if>

<!-- 카테고리 --> 
<div style="float:left; height:90px;"> 
<table style="width:100%; height:100%; padding:0px; margin:0px;" border="0"> 
	<tr valign="middle">  
         <td width="350" align="center" style="padding:0px;"><button type="button" onclick="location.href='http://localhost:8007/solo/shop/goodsList/상의/NewItem.do'" class="btn btn-link" style="color:black; font-size:20px;">Top</button></td>
         
         <td width="350" align="center" style="padding:0px;"><button type="button" onclick="location.href='http://localhost:8007/solo/shop/goodsList/하의/NewItem.do'" class="btn btn-link" style="color:black; font-size:20px;">Bottom</button></td>
         
         <td width="350" align="center" style="padding:0px;"><button type="button" onclick="location.href='http://localhost:8007/solo/shop/goodsList/아우터/NewItem.do'" class="btn btn-link" style="color:black; font-size:20px;">Outer</button></td>
         
         <td width="350" align="center" style="padding:0px;"><button type="button" onclick="location.href='http://localhost:8007/solo/board/openBoardList.do'" class="btn btn-link" style="color:black; font-size:20px;">Community</button></td>
         
         <td>
            <!-- 검색 -->
         <div class="search">
         <form method="post" action="/solo/main/openMainSearch.do" id="search">
              <input id="search" name="keyword" type="text" placeholder=" " value="${keyword1}"/>
            <div>
                <svg>
                  <use xlink:href="#path">
                 </svg>
            </div>
         </form>
         </div>
         <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
             <symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 160 28" id="path">
                 <path d="M32.9418651,-20.6880772 C37.9418651,-20.6880772 40.9418651,-16.6880772 40.9418651,-12.6880772 C40.9418651,-8.68807717 37.9418651,-4.68807717 32.9418651,-4.68807717 C27.9418651,-4.68807717 24.9418651,-8.68807717 24.9418651,-12.6880772 C24.9418651,-16.6880772 27.9418651,-20.6880772 32.9418651,-20.6880772 L32.9418651,-29.870624 C32.9418651,-30.3676803 33.3448089,-30.770624 33.8418651,-30.770624 C34.08056,-30.770624 34.3094785,-30.6758029 34.4782612,-30.5070201 L141.371843,76.386562" transform="translate(83.156854, 22.171573) rotate(-225.000000) translate(-83.156854, -22.171573)"></path>
             </symbol>
         </svg>
         </td>
	</tr>
</table>
</div>
</header>
</html>