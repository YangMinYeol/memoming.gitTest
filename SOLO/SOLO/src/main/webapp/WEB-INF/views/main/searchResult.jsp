<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link href="<c:url value="/css/board.css"/>" rel="stylesheet">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="<c:url value='/css/goods.css'/>" rel="stylesheet">
<link href="<c:url value="/css/card.css"/>" rel="stylesheet">
</head>
<body>
<%@ include file="/WEB-INF/views/template/header.jsp"%>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/js/common1.js'/>" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/ui.css'/>" />


<div style="height: 160px;"></div>
<div align="center">
   <h3>Search</h3> 
</div>
<div style="height: 50px;"></div>

<div style="width:1000px; margin-left:auto; margin-right:auto;" align="center">
   <div align="left">
   
   <strong>${keyword} </strong>(으)로 검색된 상품
   </div>
   <hr>
   <div align="center">
   
   <!--리스트-->
   <div id="main-container">
<table class="goods_list" style="width:100%">
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
   <div id="PAGE_NAVI" align="center"></div>
      <input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />

<input type="hidden" id="keyword" name="keyword" value="${keyword}" />
<br><br>
</div>
   
   </div>


</div>




<div style="height:80px;"> 
 
</div>

<footer style="border-top:1px solid #D5D5D5;">
<%@ include file="/WEB-INF/views/template/footer.jsp"%> 
</footer>
</body>
</html>
<script type="text/javascript">

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

$(document).ready(function() {
   
   fn_selectGoodsList(1);
   
   $("a[name='title']").on("click", function(e){ //제목 //name 이 title인거
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

   //alert(${orderBy});
   comAjax.setUrl("<c:url value='/main/mainSearch.do' />");
   comAjax.setCallback("fn_selectGoodsListCallback");
   comAjax.addParam("PAGE_INDEX", pageNo);
   comAjax.addParam("PAGE_ROW", 16);
   comAjax.addParam("keyword", $('#keyword').val());
   comAjax.ajax();
}

function fn_selectGoodsListCallback(data) {
   var total = data.TOTAL;
   var body = $(".goods_list");
   body.empty();
   
   if (total == 0) {
      var str = "<tr>" + "<td colspan='4'>조회된 결과가 없습니다.</td>"
            + "</tr>";
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
		var imgpath = "<img src='solo/img/goods_upload"+value.GOODS_IMG_THUM+"' width='100%' height='100%'>"
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
			+	"<a href='#this' name='title'>"
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
