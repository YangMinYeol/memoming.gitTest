<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE>
<html>
<head>
<meta charset="utf-8">
<title>상품 상세보기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script> -->
<script src="<c:url value='/js/common1.js'/>" charset="utf-8"></script>
<script type="text/javascript"
   src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<!-- CSS only -->
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
   integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
   crossorigin="anonymous">
<!-- JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
   integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
   crossorigin="anonymous"></script>
<script
   src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
   integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
   crossorigin="anonymous"></script>
<script
   src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
   integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
   crossorigin="anonymous"></script>
</head>
<style>

.layer {
   display: none;
}

/* css초기화 끝 */
.option_section {
   float: left;
   color: #777;
   font-weight: 400;
}

/* 상품문의 */
.board_list th {
   padding: 14px 0;
   background: url(/css/images/ico_board_th_bar.gif) no-repeat 0 center
      #f5f5f5;
   font-size: 14px;
   color: #666;
   font-weight: 400;
   text-align: center;
}

.board_list {
   width: 60%;
   margin-top: 0px;
   background: #fff;
   font-size: 15px;
   line-height: 18px;
}

.board_list2 {
   width: 60%;
   margin-top: 0px;
   background: #fff;
   font-size: 15px;
   line-height: 18px;
}

.board_list2 .tit {
   background: #fff;
   font-size: 15px;
}

.board_list2 .tit td {
   position: relative;
   padding: 20px 0;
   box-sizing: border-box;
   border-top: 1px solid #f2f2f2;
}

.td {
   position: relative;
   box-sizing: border-box;
   border-top: 1px solid #f2f2f2;
   margin-left: 100px;
}


.align_left {
   text-align: left !important;
}

.board_list2 td.align_left {
   padding: 16px 110px;
}

.board_list td {
   padding: 16px 0;
   text-align: center;
   border-bottom: 1px solid #e0e0e0;
   font-size: 14px;
   color: #444;
   vertical-align: top;
}

p.a {
   cursor: pointer;
}

/* 리뷰리스트 */
::selection {
   background: #888;
   /* color: #fff; */
   text-shadow: none;
}

.xans-product-additional div.board {
   margin: 0 auto;
   padding: 27px 0 40px;
   max-width: 1220px;
   color: #353535;
   line-height: 18px;
}

.ec-base-table.typeList table {
   border-top: 1px solid #e5e5e5;
}

.ec-base-table table {
   position: relative;
   margin: 10px 0 0;
   border: 1px solid #e5e5e5;
   border-top: 0;
   border-left: 0;
   border-right: 0;
   /* color: #fff; */
   line-height: 1.5;
}

.ec-base-table table:before {
   position: absolute;
   top: 0;
   left: 0;
   display: block;
   content: "";
   width: 100%;
   height: 1px;
   background: #e5e5e5;
}

.displaynone {
   display: none !important;
}

.ec-base-table thead th {
   padding: 12px 0;
   border-bottom: 1px solid #e5e5e5;
   color: #353535;
   vertical-align: middle;
   font-size: 12px;
   font-weight: 500;
   background: #f9f9f9;
}

.xans-product-additional div.board {
   margin: 0 auto;
   padding: 27px 0 40px;
   max-width: 1220px;
   color: #353535;
   line-height: 18px;
}

.ec-base-table th:first-child {
   border-left: 0;
}

th {
   text-align: center;
}

.td1 {
   text-align: center;
   color: #777;
   padding: 12px 0;
}

.td2 {
   color: #777;
   padding: 12px 0;
}

.desc {
   padding: 0 0 20px;
   color: #777;
   font-size: 12px;
   text-align: center;
}

.d {
   width: 100%;
   heiht: 100%;
}

body {
   /*  font-family: Verdana, Arial; */
   font-family: 'Open Sans', sans-serif;
}

a {
   text-decoration: none;
   color: #666;
}

h1 {
   text-align: center;
   padding: 50px 0;
   font-weight: normal;
   font-size: 2em;
   letter-spacing: 10px;
}

.total_price {
    color: #666;
    font-size: 14px;
     padding: 20px 0 8px; 
    text-align: right;
    box-sizing: border-box;
}

.total_cartAdd {
    color: #666;
    font-size: 14px;

    box-sizing: border-box;
}

.totals-value {
    font-size: 30px;
    color: #333;
    font-style: normal;
    font-weight: bold;
    padding-left: 12px;
    text-align: right;
}


.selected_option {
    position: relative;
    margin-top: -1px;
    padding: 20px 22px;
    border: 1px solid #e9e9e9;
    color: #333;
    font-size: 14px;
    line-height: 20px;
    overflow: hidden;
}

.product .remove-product {
    border: 0;
    padding: 4px 8px;
    background-color: #c66;
    color: #fff;
    font-family: "HelveticaNeue-Medium", "Helvetica Neue Medium";
    font-size: 12px;
    border-radius: 3px;
}

p {
   padding-top:5px;
}

</style>

<body>
<%@ include file="/WEB-INF/views/template/header.jsp"%>

<input type="hidden" id="IDX" name="IDX" value="${list.GOODS_NUM}">
   
<div style="height: 160px;"></div>
<div align="center" name="GOODS_CATEGORY1" id="GOODS_CATEGORY1" value="${GOODS_CATEGORY1}">
   <h3>
   <c:if test="${list.GOODS_CATEGORY1 eq 'Top'}">Top</c:if>
   <c:if test="${list.GOODS_CATEGORY1 eq 'Bottom'}">Bottom</c:if>
   <c:if test="${list.GOODS_CATEGORY1 eq 'Outer'}">Outer</c:if>
   </h3> 
</div>
<div style="height: 50px;"></div>
   <br>
   
   <div style="width:100%; position:relative; left:calc(50% - 600px); height:600px; display:inline">
      
      <!-- 썸네일을 디테일에 넣기 -->
      <div style="float:left; width:500;">
         <table border="0">
            <tr>
               <td><img src="/solo/img/goods_upload/${list.GOODS_IMG_THUM}" width="500" height="500" /></td>
            </tr>
         </table>
      </div>

      <div style="float:left; margin-left:30px; width:682;">
         <table border="0">

			<!-- 상품명위에 ex) BEST, NEED등을 보여줌 -->
            <tr> 
               <td><c:set var="PICK" value="${fn:split(list.GOODS_HASH,',')}" />
                  <c:forEach var="PICK1" items="${PICK}" varStatus="g">
                     <c:if test="${g.count == 1 }">
                        <span
                           style="background-color: #ff80bf; line-height: 27px; border-radius: 10px;"><font
                           color="#ffffff" size="2">&nbsp;${PICK1}&nbsp;</font></span>
                     </c:if>
                     <c:if test="${g.count == 2 }">
                        <span
                           style="background-color: #d456dc; line-height: 27px; border-radius: 10px;"><font
                           color="#ffffff" size="2">&nbsp;${PICK1}&nbsp;</font></span>
                     </c:if>
                     <c:if test="${g.count == 3 }">
                        <span
                           style="background-color: #33b7ff; line-height: 27px; border-radius: 10px;"><font
                           color="#ffffff" size="2">&nbsp;${PICK1}&nbsp;</font></span>
                     </c:if>
                  </c:forEach></td>
            </tr>

			<!-- 상품이름 -->
            <tr> 
               <td id="goodsName"><font size="5" style="box-sizing: border-box; position: relative;">${list.GOODS_NAME}</font></td>
            </tr>

			<!-- 색상개수 -->
            <tr>
               <td><font size="3">${ColorSize}color</font></td>
            </tr>

			<!-- 가격 -->
            <tr>
               <td id="price" style="font-weight: 600px; font-Size: 24px; line-height: 42px;">
                  <fmt:formatNumber value="${list.GOODS_MPRICE}" pattern="#,###" />원
               </td>
            </tr>
         </table>

		 <!-- 구분선 -->
         <table>
            <tr>
               <td><hr style="border-top: 1px solid #bbb;" width=640px>
               <td>
            </tr>
         </table>

         <table>
            <tr class="option_section">
               <td width="510px"><font size="3">배송비</font></td>
               <td><font size="3">선불3,000원</font></td>
            </tr>
         </table>

         <table>
            <tr class="option_section">
               <td width="530px"><font size="3">배송종류</font></td>
               <td><font size="3">&nbsp;국내배송</font></td>
            </tr>
         </table>

         <br>
         <!-- 여백 -->
         <br>

		 <!-- 상품옵션 -->
         <div id="item_option">
            <table>
               <tr>
                  <td><select name="ColorList" id="ColorList" class='total_cartAdd' style="width: 600px; height: 30px;">
                        <option value=""> (필수)옵션: 색상 </option>
                        <c:forEach var="ColorList" items="${Color}" varStatus="index">
                           <option value="${ColorList}">${ColorList}</option>
                        </c:forEach>
                  </select></td>
               </tr>

               <tr>
                  <td><select name="SizeList" id="SizeList" class='total_cartAdd' style="width: 600px; height: 30px;">
                        <option value=""> (필수)옵션: 사이즈 </option>
                        <c:forEach var="SizeList" items="${Size}" varStatus="index">
                           <option value="${SizeList}">${SizeList}</option>
                        </c:forEach>
                  </select></td>
               </tr>
            </table>
         </div>

		 <!-- 설정한 옵션을 보여주는 테이블 -->
         <form id="frm" name="frm" method="post">

            <div>
               <table style="border:1px;" id="dynamicTable">
                  <thead>
                  </thead>

                  <tbody id="dynamicTbody">

                  </tbody>
                  
               </table>
            </div>

         </form>
         
         <div class="totals-item totals-item-total" style="float:left; margin-left:400px;">
               <label class="total_price">총상품금액</label>&nbsp;&nbsp;
               <div class="total_price" style="float:right;">원</div>
               <div class="totals-value" id="cart-total" style="float:right;">0</div>
             </div>
         <br>
         <br>
         
         <!-- 구분선 -->
         <table>
            <tr>
               <td><hr style="border-top: 1px solid #bbb;" width=640px>
               <td>
            </tr>
         </table>

         <div align="center" style="width:90%;">
	         <button style="width: 290px; height: 58px;" class="btn btn-outline-primary" id="insertBasket" onclick="fn_InsertBasket()">장바구니</button>
	         <button style="width: 290px; height: 58px;" class="btn btn-outline-primary" id="goodsOrder" onclick="fn_GoodsOrder()">구매하기</button>
         </div>
         <br>
      </div>
   </div>
  
   <div style="clear: both;"></div>

   <div align="center">
      <ul class="nav nav-tabs" id="myTab" role="tablist" style="width: 70%">
         <li class="nav-item" role="presentation" style="width: 50%" id="f1">
         <a class="nav-link active" id="home" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true" onClick="fnMove(1)">
         <font color="black"><b>상세정보</b></font></a></li>

         <li class="nav-item" role="presentation" style="width: 50%" >
         <a id="contact-tab"  href="#contact" role="tab" aria-controls="contact" aria-selected="false" onClick="fnMove(3)">
         <font color="gray">쇼핑가이드</font></a></li>
      </ul>
      <br>
      <div class="tab-content" id="myTabContent">
         <div class="tab-pane fade show active" id="home" role="tabpanel"
            aria-labelledby="home-tab">${list.GOODS_CONTENT}</div>
         <!-- 상세정보 -->

   </div>
</div>

   <br><br><!-- 여백 --><br><br>

<div align="center">
      <ul class="nav nav-tabs" id="myTab" role="tablist" style="width: 70%">
         <li class="nav-item" role="presentation" style="width: 50%" >
         <a id="home-tab"  href="#home" role="tab" aria-controls="home2" aria-selected="false" onClick="fnMove(1)" >
         <font color="gray">상세정보</font></a></li>

         <li class="nav-item" role="presentation" style="width: 50%" id="f3">
         <a class="nav-link active" id="contact" data-toggle="tab" href="#contact2" role="tab" aria-controls="contact2" aria-selected="true" onClick="fnMove(3)">
         <font color="black"><b>쇼핑가이드</b></font></a></li>

      </ul>
	<div class="tab-content" id="myTabContent">
            
	<div class="tab-pane fade show active" id="contact" role="tabpanel" aria-labelledby="contact-tab" align="left" style="margin-left: 400px">
		<!-- 쇼핑가이드 -->
		<%@ include file="/WEB-INF/views/shop/guide.jsp"%>
	</div>
         
   </div>
</div>
<br><br>
<form id="commonForm" name="commonForm"></form>
   
<div style="height:80px;"> </div>

<footer style="border-top:1px solid #D5D5D5;">
<%@ include file="/WEB-INF/views/template/footer.jsp"%> 
</footer>

</body>
</html>

<script type="text/javascript">

function fnMove(seq){
    var offset = $('#f' + seq).offset();
    $('html').animate({scrollTop : offset.top}, 400); // 상세보기, 쇼핑가이드 스크롤 이동
}

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

var doubleSubmitFlag = false;
function doubleSubmitCheck(){
    if(doubleSubmitFlag){
        return doubleSubmitFlag;
    }else{
        doubleSubmitFlag = true;
        return false;
    }
}

$(document).ready(function() {

   fn_selectGoodsList(1); // 상품문의 페이징x

   $("#insertBasket").on("click", function(e){ // 장바구니 버튼
      e.preventDefault(); 
      fn_InsertBasket();
   });

   $("#goodsOrder").on("click", function(e){ // 구매 버튼
      e.preventDefault(); 
      fn_GoodsOrder();   
   });


});


function fn_GoodsOrder() { // 구매하기
	   if(doubleSubmitCheck()) return; // 중복클릭 방지

	   if(${session_MEMBER != null}){ // 세션이 널이아니면
	      var arraycode = document.getElementsByName("GOODS_ATT_AMOUNT"); // 문서객체중 Name값을 가져오는데 사용하는 함수 읽은 객체는 배열로 저장된다
	      var len = arraycode.length; // 길이를 저장
	      if(len==0){ // 수량이 0이면
	         alert("상품을 추가해 주세요.");
	      }else{ // 수량이 0이 아니면
	         var comSubmit = new ComSubmit("frm");
	         comSubmit.setUrl("<c:url value='/shop/goodsOrder.do'/>");
	         comSubmit.submit();
	      }
	   }else { // 세션이 널이면
	      alert("로그인 후 이용해주세요.");
	      location.href = "/solo/member/openLoginForm.do";
	   }
	   
	}

function fn_InsertBasket() { // 장바구니
   
   if(doubleSubmitCheck()) return; // 중복클릭 방지

   if(${session_MEMBER != null}){
      var arraycode = document.getElementsByName("GOODS_ATT_AMOUNT"); // 문서객체중 Name값을 가져오는데 사용하는 함수 읽은 객체는 배열로 저장된다
      var len = arraycode.length;
      if(len==0){ // 수량이 0이면
         alert("상품을 추가해 주세요.");
      }else{ // 수량이 0이 아니면
         var url = "/solo/shop/basketPopUp.do";
         var name = "popup";
         var option = "width=382, height=227, top=500, left=800, location=no";
         
         var comSubmit = new ComSubmit("frm"); // 장바구니 창
         comSubmit.setUrl("<c:url value='/shop/insertBasket.do'/>");
         window.open(url,name,option);
         comSubmit.submit();
      }
   }else {
      alert("로그인 후 이용해주세요.");
      location.href = "/solo/member/openLoginForm.do";
   }
   
}



var cnt = $('#dynamicTable table').length+1;

$('#ColorList').change(function(){
   $('#SizeList').change(function() {

   });
});

$('#SizeList').change(function() {
   
   var ColorList = $('#ColorList option:selected').val(); // 색상에서 고른값
   var SizeList = $('#SizeList option:selected').val(); // 사이즈에서 고른값
   if(SizeList != '' && ColorList == ''){ // 만약 사이즈가 널이아니고 색상이 널이면
   $("#SizeList").val('');
   alert("색상옵션을 먼저 선택하세요.");
   return false;
   } else {
      var html = "";         
      var color = $("#ColorList option:selected").val(); // 색상에서 고른 값
      var size = $("#SizeList option:selected").val(); // 사이즈에서 고른값
      var price = $("#price").val(); // 가격
      var IDX = $('#IDX').val(); // 상품번호
      
      var totalCount = ${ColorSize} * ${Sizecnt}; // 색상개수 * ?
      
      for(var i = 1; i <= totalCount+30; i++) {
          if(color == $("#nColor"+i+"").text() && size == $("#nSize"+i+"").text()) { // 만약 색상과 사이즈값이 있는값이면
              $("#ColorList").val(''); // 색상값 초기화
              $("#SizeList").val(''); // 사이즈 초기화
              alert("이미있는 상품입니다.");
              return false;
          }
      }   
      
	  /* 색상과 사이즈를 선택시 나오는 테이블 폼 */
      html = " <table class='total_cartAdd' style='border:1px solid #bdbebd; width:600px; height:100px; margin-top:0px;' class='fieldx"+cnt+"'> "
           + " <tr>"
           + " <td width='70px'>상품명 : </td>"
           + " <td> "
           + $("#goodsName").text() // 상품이름
           + " </td> "
           + " <td> "   
           + " <div id='field"+cnt+"' class='field"+cnt+"'> " // div id와 class명을 cnt가 증가함에따라 같이 증가함
           + " <div class='shopping-cart'> "
           + " <div class='product'> "
           + " <div class='product-quantity'> "
           + " <input name='GOODS_ATT_AMOUNT' type='number' value='1' min='1' style='width:50px; text-align:center; margin-left:250px; float:left;'> </div> " // 수량
           + " <div class='product-removal"+cnt+"'> "
           + " </div> "
           + " <div class='product-line-price' style='float:left; margin-left:10px;' id='price_sell' price_sell='"+${list.GOODS_MPRICE}+"' >"+numberWithCommas(${list.GOODS_MPRICE})+"</div>" // 가격란
           + " <div class='product-removal"+cnt+"'> "
           + " <button class='remove-product' style='float:left; margin-left:10px;'> " // x버튼
           + " X "
           + " </button>"
           + " </div> "
           + " </div> " 
           + " </td> "
           + " </tr> "
           + " <tr> "
           + " <td>색상 :</td> "
           + " <td id='nColor"+cnt+"'>"+color+"</td> " // 색상
           + " <td></td> "
           + " </tr> "
           + " <tr> "
           + " <td>사이즈 : </td> "
           + " <td id='nSize"+cnt+"'>"+size+"</td> " // 사이즈
           + " <td></td> "
           + " </tr> "
           + " <input type='hidden' name='GOODS_COLOR' id='GOODS_COLOR' value='"+color+"'> " // 색상
           + " <input type='hidden' name='GOODS_SIZE' id='GOODS_SIZE' value='"+size+"'> " // 사이즈
           + " <input type='hidden' name='IDX' id='IDX' value='"+${list.GOODS_NUM}+"'> " // 상품번호
           + " </table> ";
             
$("#dynamicTable").append(html);
    
if($('#field'+cnt+'')) {
	recalculateCart();
 	var hap = ${list.GOODS_MPRICE}*cnt; // 가격 * 수량
	var num = numberWithCommas(hap); // num
	$('.totals-value').text(num); // 총상품금액 값으로 num을 넣어줌
}

$("#ColorList").val('');
$("#SizeList").val('');

$('.product-removal'+cnt+' button').click( function() {
	$(this).parent().parent().parent().parent().parent().parent().parent().parent().remove(); // 부모 부모 부모... 의 값을 제거
	recalculateCart();
	});    
cnt++; // cnt 증가
} 


/* Set rates + misc */
var fadeTime = 300;

/* Assign actions */
$('.product-quantity input').change( function() { // 수량
	updateQuantity(this);
});

/* Recalculate cart */
function recalculateCart(){
	var subtotal = 0;
	$('.product').each(function () {
		subtotal += parseInt($(this).children('.product-line-price').text().replace(',',''));
	});
        
	/* Calculate totals */
	var total = subtotal;
        
	/* Update totals display */
	$('.totals-value').fadeOut(fadeTime, function() { // 총상품금액.서서히 사라지는 효과
		$('#cart-total').html(numberWithCommas(total)); // 총상품금액
		if(total == 0){
			$('.checkout').fadeOut(fadeTime);
			} else {
		$('.checkout').fadeIn(fadeTime);
		}
		$('.totals-value').fadeIn(fadeTime); // 총상품금액 서서히 드러나는 효과
	});
}


/* Update quantity */
function updateQuantity(quantityInput) {
         
	/* Calculate line price */
	var productRow = $(quantityInput).parent().parent();
	var price = ${list.GOODS_MPRICE}; // 가격
	var quantity = $(quantityInput).val(); // 수량
	var linePrice = price * quantity; // 수량 * 가격
        
	/* Update line price display and recalc cart totals */
	productRow.children('.product-line-price').each(function () {
		$(this).fadeOut(fadeTime, function() {
			$(this).text(numberWithCommas(linePrice));
			recalculateCart();
			$(this).fadeIn(fadeTime);
			});
		});
	}
}); 



   /* 수량 체인지 */
$('.add').click(function () {
   if ($(this).prev().val() < 3) {
   $(this).prev().val(+$(this).prev().val() + 1);
   }
});

$('.sub').click(function () {
   if ($(this).next().val() > 1) {
   if ($(this).next().val() > 1) $(this).next().val(+$(this).next().val() - 1);
   }
});

function fn_selectGoodsList(pageNo) {
   var comAjax = new ComAjax();
   
   comAjax.setUrl("<c:url value='/shop/goodsDetailList.do' />");
   comAjax.setCallback("fn_selectGoodsListCallback");
   comAjax.addParam("IDX", $("#IDX").val());
   comAjax.ajax();
}


function fn_selectGoodsListCallback(data) {
   var total = data.TOTAL;
   var body = $("#board_list1");
   body.empty();
   
   if (total == 0) {
      var str = "<tr>" 
             + "<td colspan='5' align='center'>조회된 결과가 없습니다.</td>"
            + "</tr>";
      body.append(str);
   } else {
      var params = {
         divId : "PAGE_NAVI",
         pageIndex : "PAGE_INDEX",
         totalCount : total,
         recordCount : 9,
         eventName : "fn_selectGoodsList"
      };
      gfn_renderPaging(params);

      var str = "";
      var cnt1 = 1;
      
      body.append(str);
	}
}

</script>