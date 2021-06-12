<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>

<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script> 
</head>

<body>
<%@ include file="/WEB-INF/views/template/header.jsp"%>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>

<!-- header -->
<div style="height: 160px;"></div>
<div align="center">
   <h3>Admin</h3> 
</div>
<div style="height: 30px;"></div>

<!-- body -->
<div align="center" style="width:1000px; margin-left:auto; margin-right:auto;">

   <ul class="nav nav-tabs">
      <li class="nav-item">
       <a class="nav-link" href="<c:url value='/admin/openAdminMember.do'/>"><font color=black><b>회원관리</b></font></a>
     </li>
     <li class="nav-item">
       <a class="nav-link active" href="<c:url value='/admin/aGoodsList.do'/>"><font color=black><b>상품관리</b></font></a>
     </li>
     <li class="nav-item">
       <a class="nav-link" href="<c:url value='/report/openAdminReport.do'/>"><font color=black><b>신고관리</b></font></a>
     </li>
     <li class="nav-item">
       <a class="nav-link" href="<c:url value='/admin/acsBoardList.do'/>"><font color=black><b>공지관리</b></font></a>
     </li>
   </ul>
<div class="container" style="margin-top:20px;">

   <!-- search bar -->
   <div style="padding:10px; float:right; display:inline-block;">
      <form id="frm" method="post" action="http://localhost:8007/solo/admin/SearchAgoods.do">
         <input type="text" name="keyword" id="keyword" class="form-control"  placeholder="" style="width:300px; display:inline-block;">
        <input type="submit" value="검색" class="btn btn-dark btn-sm" style="display:inline-block; margin-bottom:5px;"/>
    </form>
   </div>

   <table align="center" class="table table-hover" style="cellpadding:7px;">
      <thead>
      <tr style="background-color:#EAEAEA;">
         <th style="width:13%" colspan="2">
         <div class="dropdown">
            <a type="button" class="dropdown-toggle" data-toggle="dropdown">전 체</a>
            <div class="dropdown-menu">
               <a class="dropdown-item" href="http://localhost:8007/solo/admin/allList.do">전 체</a>
               <a class="dropdown-item" href="http://localhost:8007/solo/admin/adminTopList.do">Top</a>
               <a class="dropdown-item" href="http://localhost:8007/solo/admin/adminBottomList.do">Bottom</a>
               <a class="dropdown-item" href="http://localhost:8007/solo/admin/fdsafd.do">Outer</a>           
            </div>
         </div>
         </th>
         <th style="width:10%">상품번호</th>
         <th style="width:*">상품명</th>
         <th style="width:15%">카테고리1</th>
         <th style="width:15%">카테고리2</th>
         <th style="width:10%">원 가</th>
         <th style="width:10%">회원가</th>
         <th style="width:10%">비회원가</th>
      </tr>
      </thead>
      <tbody>
      <c:choose>
         <c:when test="${fn:length(list) > 0 }">
            <c:forEach items="${list}" var="row">
               <tr>
				<td><a href="#this" name="mdf"><input type="button" class="btn btn-outline-dark btn-sm" value="수정">
					<input type="hidden" name="GOODS_NUM" id="GOODS_NUM" value="${row.GOODS_NUM}"></a></td>
				<td><a href="#this" name="delete1"><input type="button" class="btn btn-outline-dark btn-sm" value="삭제">
					<input type="hidden" name="GOODS_NUM" id="GOODS_NUM" value="${row.GOODS_NUM}"></a></td>
				<td align="center">${row.GOODS_NUM}</td>
				<td>${row.GOODS_NAME}</td>
				<td>${row.GOODS_CATEGORY1}</td>
				<td>${row.GOODS_CATEGORY2}</td>
				<td>${row.GOODS_CPRICE}</td>
				<td>${row.GOODS_MPRICE}</td>
				<td>${row.GOODS_NMPRICE}</td>
              </tr>
            </c:forEach>
         </c:when>
         
      <c:otherwise>
         <tr>
            <td colspan="9"> 조회된 결과가 없습니다.</td>
         </tr>
      </c:otherwise>
      
      </c:choose>
      </tbody>
      </table>
      <hr>
      <div align="right">
      <button type="button" class="btn btn-dark btn-sm" onclick="location.href='http://localhost:8007/solo/shop/openGoodsWrite.do'">상품 등록</button>
      </div>  
   </div>   
</div>
<br>

<script type="text/javascript">
$(document).ready(function(){
	$("a[name='delete1']").on("click",function(e){
	e.preventDefault();
	fn_delete($(this));
	});

	$("a[name='mdf']").on("click",function(e){
	e.preventDefault();
	fn_update($(this));
	});
});

function fn_delete(obj){
	var comSubmit = new ComSubmit();
	var CONFIRM = confirm("정말로 삭제하시겠습니까?");
	if(CONFIRM==true){ 
	comSubmit.setUrl("<c:url value='/admin/deleteAdminGoods.do'/>");
	comSubmit.addParam("GOODS_NUM", obj.parent().find("#GOODS_NUM").val());
	comSubmit.submit();
	alert("상품이 삭제 되었습니다.");
	}
}

function fn_update(obj) {
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/admin/goodsModifyForm.do'/>");
	comSubmit.addParam("IDX",  obj.parent().find("#GOODS_NUM").val());
	comSubmit.submit();
}
</script>   

<!-- footer       -->
<div style="height:80px;">
<%@ include file="/WEB-INF/include/include-body.jspf" %>
<footer style="border-top:1px solid #D5D5D5;">
<%@ include file="/WEB-INF/views/template/footer.jsp"%> 
</footer>

</div>
</body>
</html>