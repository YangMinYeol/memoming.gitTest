<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script> -->

<style>
  table MypageForm{
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  .td {
    border-bottom: 1px solid #444444;
    padding: 10px;
  }
</style>

<title>My Page</title>
</head>

<body>

<%@ include file="/WEB-INF/views/template/header.jsp"%>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>

   <div style="height: 160px;"></div>
   
   <div align="center">
		<h3>My Page</h3>
   </div>
   
   <br/>
   
	<table class="joinFormView" style="width:900px;border:0;cellpadding:1; cellspacing:1;" align="center">
		<tr>
			<td  class="td" style="width:900px; padding-right:15px;" align="left"></td>
   		</tr>
	</table>
   
	<table class="joinFormView" style="border:0;cellpadding:1; cellspacing:1;" align="center">
		<tr>
			<td style="width:900px; padding-right:15px;" align="left">
				<font size="3">항상 저희 쇼핑몰을 이용해 주셔서 감사합니다. [ &nbsp;<b>${map.MEM_NICK}</b>&nbsp; ] 님</font>
			</td>
		</tr>
	</table>
   
	<br/>
    
	<!-- 주문처리 현황 -->
	<table class="joinFormView" style="cellpadding:1; cellspacing:1; font-style:Tahoma;" border="1" align="center">
		<tr>
			<td style="width:180px; font-color:gray; padding-right:15px;" align="center">
				<font color=black size="4px"><b>&nbsp;결제확인&nbsp;</b></font>
					${map1.PAT_NOT_YET}
			</td>
			
			<td style="width:180px; padding-right:15px;" align="center">
    			<font color=black size="4px"><b>&nbsp;준비중&nbsp;</b></font>
    				${map1.READY_DELIVERY}
     		</td>
     		
     		<td style="width:180px; padding-right:15px;" align="center">
     			<font color=black size="4px"><b>&nbsp;배송중&nbsp;</b></font>
      				${map1.DELIVERING}
      		</td>
      		
      		<td style="width:180px; padding-right:15px;" align="center">
      			<font color=black size="4px"><b>&nbsp;배송완료&nbsp;</b></font>
      				${map1.SCDELIVERY}
      		</td>
      		
      		<td style="width:180px; padding-right:15px;" align="left" valign=middle>	
		      <ul>
		         <li><font size="2px">취소 : ${map1.CXL}</font></li>
		         <li><font size="2px">교환 : ${map1.EXCHANGE}</font></li>
		         <li><font size="2px">반품 : ${map1.REFUND}</font></li>
		      </ul>
      		</td>
		</tr>
	</table>

	<p>
      
	<table class="joinFormView" style="font-family:Tahoma; cellpadding:1; cellspacing:1;" border="0" align="center">
		<tr>
			<td class="td" style="width:900px; padding-right:15px;" align="left" hr="">
				<a href="#this" name="order"><font color=blue size="3px"><b>Order 주문내역 조회 </b></font></a><br/>
				<font color="gray" size="2px">고객님께서 주문하신 상품의 주문내역을 확인하실 수 있습니다.<br/>
				비회원의 경우, 주문서의 주문번호와 비밀번호로 주문조회가 가능합니다.</font>
				<input type="hidden" id="MEM_NUM" name="MEM_NUM" value="${session_MEMBER.MEM_NUM}">
			</td>
		</tr>
         
		<tr>
			<td class="td" style="width:900px; padding-right:15px;" align="left">
				<a href="/solo/member/updateMyInfoForm.do"><font color=blue size="3px"><b>Profile 회원정보 </b></font></a><br/>
				<font color="gray" size="2px">회원이신 고객님의 개인정보를 관리하는 공간입니다.<br/>
				개인정보를 최신 정보로 유지하시면 보다 간편히 쇼핑을 즐기실 수 있습니다.</font>
			</td>
		</tr>
         
		<tr>
			<td class="td" style="width:900px; padding-right:15px;" align="left">
				<a href="/solo/shop/basketList.do"><font color=blue size="3px"><b>Basket 장바구니</b></font><br/></a>
				<font color="gray" size="2px">고객님께서 장바구니에 담아두신 상품을 보여드립니다.<br/>
				담아두신 원하는 상품을 골라서 주문 하실 수 있습니다.</font>
			</td>
		</tr>
             
		<tr>
			<td class="td" style="width:900px; padding-right:15px;" align="left">
				<a href="/solo/member/openMyBoardList.do"><font color=blue size="3px"><b>Board 게시물 </b></font><br/></a>
				<font color="gray" size="2px">고객님께서 작성하신 게시물을 관리하는 공간입니다.<br/>
				고객님께서 작성하신 글을 한눈에 관리하실 수 있습니다.</font>
			</td>
		</tr>
	</table>
	
	<br/>
	<br/>
	
   <%@ include file="/WEB-INF/include/include-body.jspf"%>
   
   <div style="height: 80px;"></div>
   
   
<footer style="border-top: 1px solid #D5D5D5;">
<%@ include file="/WEB-INF/views/template/footer.jsp"%>
</footer>
   
 <script type="text/javascript">
      $(document).ready(function(){
         $("a[name='order']").on("click", function(e){
               e.preventDefault();
               order();
            });
         });

      function order(){
          var comSubmit = new ComSubmit();
          comSubmit.setUrl("<c:url value='/member/openMyOrderList.do' />");
          comSubmit.addParam("MEM_NUM", $("#MEM_NUM").val());
          comSubmit.submit();
         }
   </script>
   
</body>
</html>