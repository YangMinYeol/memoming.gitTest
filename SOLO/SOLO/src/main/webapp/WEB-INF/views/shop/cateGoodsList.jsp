<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>상품페이지</title>

<head>
<link href="<c:url value="/css/board.css"/>" rel="stylesheet">
<link href="<c:url value="/css/btn.css"/>" rel="stylesheet">
<link href="<c:url value='/css/goods.css'/>" rel="stylesheet">
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/js/common1.js'/>" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/ui.css'/>" />
<link href="<c:url value="/css/card.css"/>" rel="stylesheet">
<!-- bx -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>


</head>

<body>
<!-- header -->
<%@ include file="/WEB-INF/views/template/header.jsp"%>

<div style="height: 160px;"></div>

<div align="center">
   <h3>
   <c:if test="${cate eq '상의'}">Top</c:if>
   <c:if test="${cate eq '하의'}">Bottom</c:if>
   <c:if test="${cate eq '아우터'}">Outer</c:if>
   </h3> 
</div>
<div style="height: 50px;"></div>

<!-- body -->
<div style="width:1070px; margin-left:auto; margin-right:auto;">

<!-- 드롭다운 -->
<div style="display:inline-block; float:left;">
<form method="post">      
   <input type="hidden" id="path" value="${path}" />   
   <div style="margin-left:50px;">
      <div class="search">
         <select class="GOODS_CATEGORY2" name="GOODS_CATEGORY2" id="GOODS_CATEGORY2" value="${GOODS_CATEGORY2}" onchange="fn_selectGoodsList(1)">
         <c:if test="${cate eq '상의'}">
            <option value="">전체</option>
            <option value="Tee">Tee</option>
        	<option value="Blouse">Blouse</option>
         	<option value="Dress">Dress</option>
      	</c:if>
      
      	<c:if test="${cate eq '하의'}">
     		<option value="">전체</option>
     	    <option value="Pants">Pants</option>
     	    <option value="Skirts">Skirts</option>
   		</c:if>
   		
    	<c:if test="${cate eq '아우터'}">
      		<option value="">전체</option>
         	<option value="Coat">Coat</option>
        	<option value="Cardigan">Cardigan</option>
      	</c:if>
      	</select>
      </div>
   </div>
</form>
</div>

<div align="center" style="display:inline-block; float:right; margin-right:50px;">
   <table>
      <tr>
         <td>
         </td>
         <td class="font1"><a href="/solo/shop/goodsList/${category}/NewItem.do"><font size=3pt><b>신상품</b></font>&nbsp;</a></td> <td>|&nbsp;</td>
         <td class="font1"><a href="/solo/shop/goodsList/${category}/favorite.do"><font size=3pt><b>인기상품</b></font>&nbsp;</a></td> <td>|&nbsp;</td>
         <td class="font1"><a href="/solo/shop/goodsList/${category}/low.do"><font size=3pt><b>낮은가격</b></font>&nbsp;</a></td> <td>|&nbsp;</td>
         <td class="font1"><a href="/solo/shop/goodsList/${category}/high.do"><font size=3pt><b>높은가격</b></font>&nbsp;</a></td> 
      </tr>
   </table>
</div>

<div id="main-container">
<table class="GOODS_LIST" style="width:100%">
	<colgroup>
		<col width="100%" />
	</colgroup>
	<thead>
		<tr>
		</tr>
	</thead>
	<tbody>
	</tbody>
</table>

</div>
<br>
<div id="PAGE_NAVI" align="center"></div>
<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />

</div>
<div style="height:80px;"> </div>
<footer style="border-top:1px solid #D5D5D5;">
<%@ include file="/WEB-INF/views/template/footer.jsp"%> 
</footer>

<script type="text/javascript">

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

$(document).ready(function() {
   
   fn_selectGoodsList(1);
   
   $("a[name='TITLE']").on("click", function(e){ //제목 //name 이 title인거
      console.log("잘들어옴");
      e.preventDefault();
      fn_openBoardDetail($(this));
   });
});

function fn_openBoardDetail(obj) {
   console.log("잘들어옴22");
   var comSubmit = new ComSubmit(); // 객체생성
   comSubmit.setUrl("<c:url value='/shop/goodsDetail.do' />"); // url설정
   comSubmit.addParam("IDX", obj.parent().find("#IDX").val()); // IDX; id로 값을넘김
   comSubmit.submit();
}

function fn_selectGoodsList(pageNo) {
   var comAjax = new ComAjax();

   comAjax.setUrl("<c:url value='/shop/cateGoodsList/${category}/${orderBy}.do' />");
   comAjax.setCallback("fn_selectGoodsListCallback");
   comAjax.addParam("PAGE_INDEX", pageNo);
   comAjax.addParam("PAGE_ROW", 16);
   comAjax.addParam("GOODS_CATEGORY2", $('#GOODS_CATEGORY2').val());
   comAjax.ajax();
}

function fn_selectGoodsListCallback(data) {
   var total = data.TOTAL;
   var body = $(".GOODS_LIST");
   body.empty();
   if (total <= 0) {
      var str = "<tr>" + "<td colspan='4' align='center' style='margin-top:50'>조회된 결과가 없습니다.</td>" + "</tr>";
      body.append(str);
   } else {
      var params = {
         divId : "PAGE_NAVI",
         pageIndex : "PAGE_INDEX",
         totalCount : total,
         recordCount : 16,
         eventName : "fn_selectGoodsList"
      };
      gfn_renderPaging(params);
     
      var str = "";
      
      $.each(data.list, function(key, value) {
                     var imgpath = "<img src='/solo/img/goods_upload/"+value.GOODS_IMG_THUM+"' width='100%' height='100%'>"
                     var imgpath1 = value.GOODS_IMG_THUM.split(',');
                     var img0 = imgpath1[0];
                     var img1 = imgpath1[1];
                     var Pick = value.GOODS_HASH.split(',');
                     var pick1 = "";
                     var pick2 = "";
                     var pick3 = "";
                     var pick4 = "";
                     var num = "";
                     for (var i=0; i<Pick.length; i++) {
                           Pick[i];
                           if(Pick[0] == null){
                              pick1 = "";
                           }else{
                              pick1 = Pick[0];
                           }
                           if(Pick[1] == null){
                              pick2 = "";
                           }else {
                              pick2 = Pick[1];
                           }
                           if(Pick[2] == null){
                              pick3 = "";
                           }else {
                              pick3 = Pick[2];
                           }
                           if(Pick[3] == null){
                              pick4 = "";
                           }else{
                              pick4 = Pick[3];
                           }
                        }
      
                     str += "<div class='card'>"
                        +	"<a href='#this' name='TITLE'>"
                        +	"<div class='imgswap'>"
                        +	"<img src='/solo/img/goods_upload/"+img0+"' width='100%' height='100%'>" 
                        +	"<img src='/solo/img/goods_upload/"+img1+"' width='100%' height='100%'>"
                        +	" </div> "
                        +	" <c:if test='${"+num+" ne "+pick1+"}'> "
                        +	" <span style='background-color:#79ABFF; line-height: 27px; border-radius: 5px;'><font color='#ffffff' size='2'> "
                        +	pick1 +"</font></span>"   
                        +	" </c:if>"
                        +	" <c:if test='${"+num+" ne "+pick2+"}'> "
                        +	" <span style='background-color:#5587ED; line-height: 27px; border-radius: 5px;'><font color='#ffffff' size='2'> "
                        +	pick2 + "</font></span>"
                        +	" </c:if>"
                        +	" <c:if test='${"+num+" ne "+pick3+" }'> "
                        +	" <span style='background-color:blue; line-height: 27px; border-radius: 5px;'><font color='#ffffff' size='2'> "  
                        +	pick3 + "</font></span>"
                        +	" </c:if>"
                        +	" <c:if test='${"+num+" ne "+pick4+" }'> "
                        +	" <span style='background-color:#9779FF; line-height: 27px; border-radius: 5px;'><font color='#ffffff' size='2'> "  
                        +	pick4 + "</font></span>"
                        +	" </c:if> <br>"
                        +	" <font class='font1'>"+value.GOODS_NAME+"</font><br>"
                        +	" <font class='font2'>"+numberWithCommas(value.GOODS_MPRICE)+"원</font> "   
                        +	" <input type='hidden' id='IDX' name='IDX' value=" + value.GOODS_NUM + ">"
                        +	" </a>"
                        +	" </div>";
                  });

      body.append(str);
      $("a[name='title']").on("click", function(e){ //제목 
         e.preventDefault();
         fn_openBoardDetail($(this));
      });    
   }
}
</script>
</body>
</html>