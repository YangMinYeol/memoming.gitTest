<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/banner.css'/>" />
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">

<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>


<link href="<c:url value='/css/goods.css'/>" rel="stylesheet">
<link href="<c:url value="/css/board.css"/>" rel="stylesheet">
<link href="<c:url value="/css/btn.css"/>" rel="stylesheet">
<link href="<c:url value="/css/card.css"/>" rel="stylesheet">


<script src="<c:url value='/js/common1.js'/>" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='../css/ui.css'/>" />

</head>
<body>

<%@ include file="/WEB-INF/views/template/header.jsp"%>

<div style="height:90px;"></div> 

<!-- 배너 -->
<!-- Slider main container -->
<div class="swiper-container" style="height:100%;">
    <!-- Additional required wrapper -->
    <div class="swiper-wrapper">
        <!-- Slides -->
        <div class="swiper-slide"><img src="https://www.benito.co.kr/SkinImg/comon/main_banner/1_202106090331584640.jpg" width="100%" height="100%"></div>
        <div class="swiper-slide"><img src="https://www.benito.co.kr/SkinImg/comon/main_banner/1_202105210211449745.jpg" width="100%" height="100%"></div>
        <div class="swiper-slide"><img src="https://www.benito.co.kr/SkinImg/comon/main_banner/1_202106100213249443.jpg" width="100%" height="100%"></div>
        <div class="swiper-slide"><img src="https://www.benito.co.kr/SkinImg/comon/main_banner/1_202105180821138996.jpg" width="100%" height="100%"></div>
    </div>
    <!-- If we need pagination -->
    <div class="swiper-pagination"></div>

    <!-- If we need navigation buttons -->
    <div class="swiper-button-prev"></div>
    <div class="swiper-button-next"></div>
</div>

<br><br>  

<hr style="align:center; width:1500px;">

<div align="center" class="container" style="width:2000px;">
   <h3>Top</h3>
   <div id="main-container">
<table class="HOT_GOODS_LIST" style="width:100%">
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
</div>

<hr style="align:center; width:1500px;">

<div align="center" class="container" style="width:2000px;">
   <h3>New</h3> 
   <div id="main-container">
<table class="NEW_GOODS_LIST" style="width:100%">
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
</div>

<hr style="align:center; width:1500px;">


<div align="center">

   <div style="display:inline-block; width:500px; padding-right:7px; border-right:1px solid #D5D5D5;" align="center">
      <div style="width:60%;">
      <a href="http://localhost:8007/solo/admin/acsBoardList.do" style="text-decoration:none; color:#000000;">
      <h3 style="margin-bottom:10px;"><b><&nbsp;&nbsp;공지사항&nbsp;&nbsp;></b></h3></a>
      </div>
      <div>
      <ul class="list-group list-group-flush">
         <c:forEach items="${Nlist}" var="Nrow">
        <li class="list-group-item">
        <a href="#this" name="Ntitle"><font color=black>${Nrow.NOTICE_TITLE}</font></a>
          <input type="hidden" id="NOTICE_NUM" value="${Nrow.NOTICE_NUM}"></li>
      </c:forEach>
      </ul>
      </div>
   </div>    
 
	<div style="display:inline-block; width:500px;" align="center">  
	<a href="http://localhost:8007/solo/board/openBoardList.do" style="text-decoration:none; color:#000000;">
	<h3 style="margin-bottom:10px;"><b><&nbsp;&nbsp;게시판&nbsp;&nbsp;></b></h3></a>
	<ul class="list-group list-group-flush">
        <c:forEach items="${list}" var="row">
        <c:if test="${session_MEMBER.MEM_NUM != null}">
        	<li class="list-group-item">
        	<a href="#this" name="Btitle"><font color=black>${row.BOARD_TITLE} [${row.TOTAL_COMMENTS}]</font></a>
          	<input type="hidden" id="BOARD_NUM" value="${row.BOARD_NUM}"></li>
		</c:if>
		<c:if test="${session_MEMBER.MEM_NUM == null}">
			<li class="list-group-item">
			<a href="#this" name="titleles"><font color=black>${row.BOARD_TITLE} [${row.TOTAL_COMMENTS}]</font></a>
			<input type="hidden" id="BOARD_NUM" value="${row.BOARD_NUM}"></li>
		</c:if>
		</c:forEach>
	</ul>
	</div> 
</div>

<div style="height:80px;"> </div>

<footer style="border-top:1px solid #D5D5D5;">
<%@ include file="/WEB-INF/views/template/footer.jsp"%> 
</footer>

<script type="text/javascript"> 
var mySwiper = new Swiper('.swiper-container', {
     // Optional parameters
     direction: 'horizontal',
     loop: true,
     
     // If we need pagination
     pagination: {
       el: '.swiper-pagination',
     },

     // Navigation arrows
     navigation: {
       nextEl: '.swiper-button-next',
       prevEl: '.swiper-button-prev',
     },
     autoplay: {
          delay: 5000,
   }
})

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

$(document).ready(function() {
   
   fn_selectGoodsList(1);
   fn_selecthotGoodsList(1);

   $("a[name='TITLE']").on("click", function(e){ //제목 //name 이 title인거
         console.log("잘들어옴");
         e.preventDefault();
         fn_openGoodsDetail($(this));
      });
   
   $("a[name='Ntitle']").on("click",function(e){
      e.preventDefault();
      fn_openNoticeDetail($(this));
   });

   $("a[name='Btitle']").on("click",function(e){
         e.preventDefault();
         fn_openBoardDetail($(this));
   });
   
   $("a[name='titleles']").on("click",function(e){
      e.preventDefault();
      alert("로그인 후 열람 가능합니다.");
      return false;
      });
});

function fn_openGoodsDetail(obj) {
   console.log("잘들어옴22");
   var comSubmit = new ComSubmit(); // 객체생성
   comSubmit.setUrl("<c:url value='/shop/goodsDetail.do' />"); // url설정
   comSubmit.addParam("IDX", obj.parent().find("#IDX").val()); // IDX; id로 값을넘김
   comSubmit.submit();   
}

function fn_openBoardDetail(obj){
    var comSubmit = new ComSubmit(); 
    comSubmit.setUrl("<c:url value='/board/openBoardDetail.do'/>");
     comSubmit.addParam("BOARD_NUM", obj.parent().find("#BOARD_NUM").val());
     comSubmit.submit();
    } 

function fn_openNoticeDetail(obj){
    var comSubmit = new ComSubmit(); 
    comSubmit.setUrl("<c:url value='/admin/openAcsDetail.do'/>");
     comSubmit.addParam("NOTICE_NUM", obj.parent().find("#NOTICE_NUM").val());
     comSubmit.submit();
    } 

function fn_selectGoodsList(pageNo) {
   var comAjax = new ComAjax();
   comAjax.setUrl("<c:url value='/shop/newGoodsList.do' />");
   comAjax.setCallback("fn_selectGoodsListCallback");
   comAjax.addParam("PAGE_INDEX", pageNo);
   comAjax.addParam("PAGE_ROW", 1);
   comAjax.ajax();

}

function fn_selectGoodsListCallback(data) {
	var total = data.TOTAL;
	var body = $(".NEW_GOODS_LIST");
	body.empty();
	if (total <= 0) {
		var str = "<tr>" + "<td colspan='4' align='center'>조회된 결과가 없습니다.</td>"
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
	var imgpath = "<img src='/solo/img/goods_upload/"+value.GOODS_IMG_THUM+"' width='200' height='210'>"
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
                    	                                       
	str += 	"<div class='card'>"
		+	"<a href='#this' name='TITLE'>"
		+	"<div class='imgswap'>"
		+	"<img src='/solo/img/goods_upload/"+img0+"' width='100%' height='100%'>" 
		+	"<img src='/solo/img/goods_upload/"+img1+"' width='100%' height='100%'>"
		+	" </div> "
		+	" <c:if test='${"+num+" ne "+pick1+"}'> "
		+ 	" <span style='background-color:#79ABFF; line-height: 27px; border-radius: 5px;'><font color='#ffffff' size='2'> "
		+	pick1 +"</font></span>"   
		+ 	" </c:if>"
		+ 	" <c:if test='${"+num+" ne "+pick2+"}'> "
		+ 	" <span style='background-color:#5587ED; line-height: 27px; border-radius: 5px;'><font color='#ffffff' size='2'> "
		+	pick2 + "</font></span>"
		+	" </c:if>"
		+ 	" <c:if test='${"+num+" ne "+pick3+" }'> "
		+ 	" <span style='background-color:blue; line-height: 27px; border-radius: 5px;'><font color='#ffffff' size='2'> "  
		+ 	pick3 + "</font></span>"
		+ 	" </c:if>"
		+	" <c:if test='${"+num+" ne "+pick4+" }'> "
		+	" <span style='background-color:#9779FF; line-height: 27px; border-radius: 5px;'><font color='#ffffff' size='2'> "  
		+ 	pick4 + "</font></span>"			+	" </c:if> <br>"
		+	" <font class='font1'>"+value.GOODS_NAME+"</font><br>"
		+	" <font class='font2'>"+numberWithCommas(value.GOODS_MPRICE)+"원</font> "   
		+ 	" <input type='hidden' id='IDX' name='IDX' value=" + value.GOODS_NUM + ">"
		+ 	" </a>"
		+	" </div>";
	});

         body.append(str);
         $("a[name='title']").on("click", function(e){ //제목 
            e.preventDefault();
            fn_openGoodsDetail($(this));
         }); 
      }
}

function fn_selecthotGoodsList(pageNo) {
      var comAjax = new ComAjax();

      //alert(${orderBy});
      comAjax.setUrl("<c:url value='/shop/bestGoodsList.do' />");
      comAjax.setCallback("fn_selecthotGoodsListCallback");
      comAjax.addParam("PAGE_INDEX", pageNo);
      comAjax.addParam("PAGE_ROW", 1);
      comAjax.ajax();
}

function fn_selecthotGoodsListCallback(data) {
	var total = data.TOTAL;
	var body = $(".HOT_GOODS_LIST");
	body.empty();
	if (total <= 0) {
		var str = "<tr>" + "<td colspan='4' align='center'>조회된 결과가 없습니다.</td>"
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
                                       
str += 	"<div class='card'>"
	+	"<a href='#this' name='TITLE'>"
	+	"<div class='imgswap'>"
	+	"<img src='/solo/img/goods_upload/"+img0+"' width='100%' height='100%'>" 
	+	"<img src='/solo/img/goods_upload/"+img1+"' width='100%' height='100%'>"
	+	" </div> "
	+	" <c:if test='${"+num+" ne "+pick1+"}'> "
	+ 	" <span style='background-color:#79ABFF; line-height: 27px; border-radius: 5px;'><font color='#ffffff' size='2'> "
	+	pick1 +"</font></span>"   
	+ 	" </c:if>"
	+ 	" <c:if test='${"+num+" ne "+pick2+"}'> "
	+ 	" <span style='background-color:#5587ED; line-height: 27px; border-radius: 5px;'><font color='#ffffff' size='2'> "
	+	pick2 + "</font></span>"
	+	" </c:if>"
	+ 	" <c:if test='${"+num+" ne "+pick3+" }'> "
	+ 	" <span style='background-color:blue; line-height: 27px; border-radius: 5px;'><font color='#ffffff' size='2'> "  
	+ 	pick3 + "</font></span>"
	+ 	" </c:if>"
	+	" <c:if test='${"+num+" ne "+ pick4 +" }'> "
	+	" <span style='background-color:#9779FF; line-height: 27px; border-radius: 5px;'><font color='#ffffff' size='2'> "  
	+ 	pick4 + "</font></span>"
	+	" </c:if> <br>"
	+	" <font class='font1'>"+value.GOODS_NAME+"</font><br>"
	+	" <font class='font2'>"+numberWithCommas(value.GOODS_MPRICE)+"원</font> "   
	+ 	" <input type='hidden' id='IDX' name='IDX' value=" + value.GOODS_NUM + ">"
	+ 	" </a>"
	+	" </div>";
	});
            
	body.append(str);
		$("a[name='title']").on("click", function(e){ //제목 
		e.preventDefault();
		fn_openGoodsDetail($(this));
		});  
	} 
}
</script>
</body>
</html>