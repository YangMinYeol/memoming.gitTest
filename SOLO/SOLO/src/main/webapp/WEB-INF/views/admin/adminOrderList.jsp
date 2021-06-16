<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<script src="<c:url value='/js/common_s.js'/>" charset="utf-8"></script>
<title>Admin주문메인</title>

<!-- 부트스트랩 -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/dashboard.css" rel="stylesheet">
<link href="css/justified-nav.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.5.1.js"></script>
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
<script src="js/bootstrap.min.js"></script>

<script type="text/javascript">
/* 필요한거 이페이지가 돌아왔을때 order_state값이 0이면  id="o1"에 추가class="active" */

$(document).ready(function(){
	$("#o1").on("click", function(e){
		e.preventDefault();
		fn_openBoardList();
	});

	$("a[name='title']").on("click", function(e){
		e.preventDefault();
		order_detail(${order.AORDER_ORDER_NUM});
	});
});

function order_detail(no){ // order_detail 페이지
	var comSubmit = new ComSubmit();
	var AORDER_ORDER_NUM = no;
	comSubmit.setUrl("<c:url value='/admin/order_detail.do' />");
	comSubmit.addParam("AORDER_ORDER_NUM", AORDER_ORDER_NUM);
	comSubmit.submit();    
}
   
function fn_openBoardList(){
	var comSubmit = new ComSubmit();
	var state = 0;
	comSubmit.setUrl("<c:url value='/solo/admin/order_admin_a.do' />");
	comSubmit.addParam("AORDER_STATE", state);
	comSubmit.submit();
}

function order_state(state, no){ // 주문상태변경*아직 변경전
	var AORDER_STATE = state; // 주문상태
    var AORDER_ORDER_NUM = no; // 오더넘버
    var AORDER_TRACKING = $("#AORDER_TRACKING").val(); // 송장번호
 
	if(confirm("확인하시겠습니까?")){
		$.ajax({
			url: "/solo/admin/order_admin_a.do",
			data : {"AORDER_STATE": AORDER_STATE, "AORDER_ORDER_NUM": AORDER_ORDER_NUM, "AORDER_TRACKING": AORDER_TRACKING},
			type: "POST",
			async:false,
			success : function(data){
				alert("주문상태가 변경되었습니다.");
				location.href = "/solo/admin/order_admin_a.do?os="+AORDER_STATE;
				window.opener.location.reload(); 
				self.close(); 
			}
		})}else{
	return;
	}
}
</script>
</head>

<body>
<%@ include file="/WEB-INF/views/template/header.jsp"%>

<div style="height: 160px;"></div>

<div align="center">
   <h3>Admin</h3> 
</div>

<div style="height: 30px;"></div>

<div align="center" style="width:1000px; margin-left:auto; margin-right:auto;">

<ul class="nav nav-tabs">
     <li class="active">
       <a class="nav-link active" href="<c:url value='/admin/order_admin_a.do'/>"><font color=black><b>주문관리</b></font></a>
     </li>
     <li class="nav-item">
       <a class="nav-link" href="<c:url value='/admin/as_admin.do?as=4'/>"><font color=black>교환 / 반품 / 취소</font></a>
     </li>
</ul>

<div class="container" style="margin-top:20px;"></div>
<!-- body -->
<div class="container" style="text-decoration:none;">
<div class="masthead" style="margin-bottom:10px;">
      
      <nav>
         <ul class="nav nav-justified">
         <c:choose>
            <c:when test="${fn:length(order_a) > 0}">
               <c:forEach items="${order_a }" var="state" begin="0" end="0">
               <c:choose>
                  <c:when test="${state.AORDER_STATE eq '0' }"> <!-- 상태가 0이면 -->
                  |&nbsp;<li class="active"><a href="/solo/admin/order_admin_a.do?os=0" style="text-decoration:none; color:black;"><strong><font color=black>신규주문</font></strong></a> | </li>&nbsp;
                  </c:when>
                  <c:otherwise> <!-- 상태가 0이아니면 -->
                  |&nbsp;<li><a href="/solo/admin/order_admin_a.do?os=0"><font color=gray>신규주문</font></a> | </li>&nbsp;
                  </c:otherwise>
               </c:choose>
               <c:choose>
                  <c:when test="${state.AORDER_STATE eq '1' }"> <!-- 상태가 1이면 -->
                  <li class="active"><a href="/solo/admin/order_admin_a.do?os=1" style="text-decoration:none; color:black;"><strong><font color=black>배송준비</font></strong></a> |</li>&nbsp;
                  </c:when>
                  <c:otherwise> <!-- 상태가 1이 아니면 -->
                  <li><a href="/solo/admin/order_admin_a.do?os=1"><font color=gray>배송준비</font></a> | </li>&nbsp;
                  </c:otherwise>
               </c:choose>
               <c:choose>
                  <c:when test="${state.AORDER_STATE eq '2' }"> <!-- 상태가 2이면 -->
                  <li class="active"><a href="/solo/admin/order_admin_a.do?os=2" style="text-decoration:none; color:black;"><strong><font color=black>배송중</font></strong></a> | </li>&nbsp;
                  </c:when>
                  <c:otherwise> <!-- 상태가 2가 아니면 -->
                  <li><a href="/solo/admin/order_admin_a.do?os=2"><font color=gray>배송중</font></a> | </li>&nbsp;
                  </c:otherwise>
               </c:choose>
               <c:choose>
                  <c:when test="${state.AORDER_STATE eq '3' }"> <!-- 상태가 3이면 -->
                  <li class="active"><a href="/solo/admin/order_admin_a.do?os=3" style="text-decoration:none; color:black;"><strong><font color=black>거래완료</font></strong></a> | </li>&nbsp;
                  </c:when>
                  <c:otherwise> <!-- 상태가 3이 아니면 -->
                  <li><a href="/solo/admin/order_admin_a.do?os=3"><font color=gray>거래완료</font></a> | </li>&nbsp;
                  </c:otherwise>
               </c:choose>
               </c:forEach>
            </c:when>
            
            <c:otherwise>
            <c:forEach items="${AORDER_STATE }" var="state" begin="0" end="0">
               <c:choose>
                  <c:when test="${state eq '0' }">
                  |&nbsp;<li class="active"><a href="/solo/admin/order_admin_a.do?os=0"><strong><font color=black>신규주문</font></strong></a> | </li>
                  </c:when>
                  <c:otherwise>
                  |&nbsp;<li><a href="/solo/admin/order_admin_a.do?os=0"><font color=gray>신규주문</font></a> | </li>
                  </c:otherwise>
               </c:choose>
               <c:choose>
                  <c:when test="${state eq '1' }">
                  <li class="active"><a href="/solo/admin/order_admin_a.do?os=1"><strong><font color=black>배송준비</font></strong></a> | </li>
                  </c:when>
                  <c:otherwise>
                  <li><a href="/solo/admin/order_admin_a.do?os=1"><font color=gray>배송준비</font></a> | </li>
                  </c:otherwise>
               </c:choose>
               <c:choose>
                  <c:when test="${state eq '2' }">
                  <li class="active"><a href="/solo/admin/order_admin_a.do?os=2"><strong><font color=black>배송중</font></strong></a> | </li>
                  </c:when>
                  <c:otherwise>
                  <li><a href="/solo/admin/order_admin_a.do?os=2"><font color=gray>배송중</font></a> | </li>
                  </c:otherwise>
               </c:choose>
               <c:choose>
                  <c:when test="${state eq '3' }">
                  <li class="active"><a href="/solo/admin/order_admin_a.do?os=3"><strong><font color=black>거래완료</font></strong></a> | </li>
                  </c:when>
                  <c:otherwise>
                  <li><a href="/solo/admin/order_admin_a.do?os=3"><font color=gray>거래완료</font></a> | </li>
                  </c:otherwise>
               </c:choose>
               
               
               </c:forEach>
            </c:otherwise>
         </c:choose>            
         </ul>
         
      </nav>
   </div>


   <div class="table-responsive">
      <table class="table">
         <thead>
            <tr align="center" style="background-color:#EAEAEA;">
               <th width="10%" align="center">주문날짜</th>
               <th width="10%" align="center">주문번호</th>
               <th width="10%" align="center">아이디</th>
               <th width="8%" align="center">이름</th>
               <th width="*" align="center">구매상품</th>
               <th width="10%" align="center">총 개수</th>
               <th width="10%" align="center">총 금액</th>
               <th width="12%" colspan="2" align="center">진행상황</th>
            </tr>
         </thead>
         
         <tbody align="center">
         <c:choose>
            <c:when test="${fn:length(order_a) > 0}">
               <c:forEach items="${order_a }" var="order">               
                  <tr>
                     <td>${order.ORDER_DATE}</td>
                     <td>${order.ORDER_NUM}</td>
                     <td>${order.MEM_ID}</td>
                     <td>${order.MEM_NAME}</td>
                     <c:choose>
                        <c:when test="${order.AORDER_STATE == 0 }">
                        <td>${order.GOODS_NAME }</td>
                        </c:when>
                        <c:when test="${order.AORDER_STATE == 1 }">
                        <td>${order.GOODS_NAME }<br>
                        <input type="text" id="AORDER_TRACKING" class="form-control" style="height:28px; width:200px;" /></td>
                        </c:when>
                        <c:when test="${order.AORDER_STATE == 2 }">
                        <td>${order.GOODS_NAME } <br> 송장 : ${order.AORDER_TRACKING}</td>
                        </c:when>
                        <c:when test="${order.AORDER_STATE == 3 }">
                        <td>${order.GOODS_NAME }<br> 송장 : ${order.AORDER_TRACKING}</td>
                        </c:when>
                        <c:when test="${order.AORDER_STATE == 5 }">
                        <td>${order.GOODS_NAME }</td>
                        </c:when>
                     </c:choose>
                     <td>${order.HAP_CNT}건</td>
                     <td>${order.ORDER_TCOST}원</td>
                     <c:choose>
                     <c:when test="${order.AORDER_STATE == 0 }">
                        <td><input type="button" class="btn btn-outline-dark btn-sm" onclick="order_detail(${order.AORDER_ORDER_NUM })" value="상세보기" /><br>
                        <input type="button" class="btn btn-dark btn-sm" onclick="order_state(${order.AORDER_STATE }, ${order.AORDER_ORDER_NUM })" value="상태변경" style="margin-top:2px;"/>
                        </c:when>
                     <c:when test="${order.AORDER_STATE == 1 }">
                        <td><input type="button" class="btn btn-outline-dark btn-sm" onclick="order_detail(${order.AORDER_ORDER_NUM })" value="상세보기" /><br>
                        <input type="button" class="btn btn-dark btn-sm" onclick="order_state(${order.AORDER_STATE }, ${order.AORDER_ORDER_NUM })" value="상태변경" style="margin-top:2px;"/>
                        <input type="hidden" id="AORDER_TRACKING" name="AORDER_TRACKING" value="${order.AORDER_TRACKING}"></td>
                        </c:when>
                     <c:when test="${order.AORDER_STATE == 2 }">
                        <td><input type="button" class="btn btn-outline-dark btn-sm" onclick="order_detail(${order.AORDER_ORDER_NUM })" value="상세보기" /><br>
                        <input type="button" class="btn btn-dark btn-sm" onclick="order_state(${order.AORDER_STATE }, ${order.AORDER_ORDER_NUM })" value="상태변경" style="margin-top:2px;"/>
                        </td>
                        </c:when>
                        <c:when test="${order.AORDER_STATE == 3 }">
                        <td><input type="button" class="btn btn-outline-dark btn-sm" onclick="order_detail(${order.AORDER_ORDER_NUM })" value="상세보기" /><br>
                            <strong>거래완료</strong>
                        </td>
                        </c:when>
                        <c:when test="${order.AORDER_STATE == 4 }">
                        <td><input type="button" class="btn btn-outline-dark btn-sm" onclick="order_detail(${order.AORDER_ORDER_NUM })" value="상세보기" />
                        <input type="button" class="btn btn-dark btn-sm" onclick="order_state(${order.AORDER_STATE }, ${order.AORDER_ORDER_NUM })" value="상태변경" />
                        </td>
                        </c:when>
                        <c:when test="${order.AORDER_STATE == 5 }">
                        <td><input type="button" class="btn btn-outline-dark btn-sm" onclick="order_detail(${order.AORDER_ORDER_NUM })" value="상세보기" />
                            [거래완료]
                        </td>
                        </c:when>
                     </c:choose>
                  </tr>
               </c:forEach>
            </c:when>
            <c:otherwise>
               <tr>
                  <td colspan="9">조회된 결과가 없습니다.</td>
               </tr>
            </c:otherwise>
         </c:choose>
      </tbody>
      
      </table>
      <hr>
   </div>
</div>
</div>

<!-- footer -->
<div style="height:80px;"> 
</div>
<footer style="border-top:1px solid #D5D5D5;">
<%@ include file="/WEB-INF/views/template/footer.jsp"%> 
</footer>
</body>
</html>