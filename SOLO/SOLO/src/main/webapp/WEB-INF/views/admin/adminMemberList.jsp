<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
    
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<!-- 부트스트랩 -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/dashboard.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/justified-nav.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.5.1.js"></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>

<style>
.list_hidden{
display:none;
cursor: pointer;
}

thead>tr>th, .list_title 
{
text-align: center;
}
#PAGE_NAVI{
text-align: center;
}
</style>
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
		<li class="nav-item">
			<a class="nav-link active" href="<c:url value='/admin/openAdminMember.do'/>"><font color=black><b>회원관리</b></font></a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="<c:url value='/admin/openAdminGoods.do'/>"><font color=black><b>상품관리</b></font></a>
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
		<form id="frm" method="post" action="http://localhost:8007/solo/admin/selectMemberSearchList.do">
			<input type="text" name="keyword" id="keyword" class="form-control"  placeholder="" style="width:300px; display:inline-block;">
			<input type="submit" value="검색" class="btn btn-dark btn-sm" style="display:inline-block; margin-bottom:5px;"/>
		</form>
	</div>
	
<div>
	<table align="center" class="table table-hover" style="cellpadding:7px;" name="memList">
		<colgroup>
			<col width="10%" />
			<col width="15%" />
			<col width="15%" />
			<col width="20%" />
			<col width="15%" />
			<col width="15%" />
			<col width="10%" />
		</colgroup>
		<thead>
			<tr style="background-color:#EAEAEA;">
				<th scope="col">아이디</th>
				<th scope="col">이름</th>
				<th scope="col">닉네임</th>
				<th scope="col">이메일</th>
				<th scope="col">연락처</th>
				<th scope="col">가입날짜</th>
				<th scope="col">정지상태</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
</div>

<div id="PAGE_NAVI">
	<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
</div>

<br> 
    
	</div>
</div>
<!-- footer       -->
<div style="height:80px;"></div>
<%@ include file="/WEB-INF/include/include-body.jspf" %>
<footer style="border-top:1px solid #D5D5D5;">
<%@ include file="/WEB-INF/views/template/footer.jsp"%> 
</footer>

<script type="text/javascript">
$(document).ready(function() {
	fn_memList(1);

/* $("a[name='search']").on("click", function(e){
	e.preventDefault();
	fn_search();
	}); */

$("a[name='click']").on("click", function(e){
	e.preventDefault();
	fn_click($(this));
	});
});

function fn_click(obj){
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/admin/openAdminMemberDetail.do'/>");
	comSubmit.addParam("MEM_NUM", obj.parent().find("#MEM_NUM").val());
	comSubmit.submit();
}
  
/* function fn_search(){
	var comSubmit = new ComSubmit("frm");
	comSubmit.setUrl("<c:url value='/admin/openselectMemberSearchList.do'/>");
	comSubmit.addParam("keyword", $("#keyword").val());
	comSubmit.submit();
} */
   
function fn_memList(pageNo) { //페이징 함수
	var comAjax = new ComAjax();
	comAjax.setUrl("<c:url value='/admin/selectMemberList.do' />");
	comAjax.setCallback("fn_memListCallback"); //ajax요청 후 호출될 함수의 이름 지정
	comAjax.addParam("PAGE_INDEX", pageNo);
	comAjax.addParam("PAGE_ROW", 10);
	comAjax.ajax(); //실질적인 ajax기능 수행
}

function fn_memListCallback(data) { //콜백함수
	var total = data.TOTAL;    
	var body = $("table[name='memList']>tbody");
	body.empty();
	if (total == 0) {
		var str = "<tr>" + "<td colspan='8'>조회된 결과가 없습니다.</td>" + "</tr>";
		body.append(str);
		} else {
    		var params = {
			divId : "PAGE_NAVI",
			pageIndex : "PAGE_INDEX",
            totalCount : total,
            eventName : "fn_memList",    
		};
		gfn_renderPaging(params);
		var str = "";
		$.each(data.list,function(key, value) {
            
		str += "<tr>"
			+ "<td align='center'>"
			+ value.MEM_ID
			+ "</td>"
			+ "<td align='center'>"
			+ value.MEM_NAME
			+ "</td>" 
			+ "<td align='center'>"
			+ value.MEM_NICK
			+ "</td>"
			+ "<td align='center'>"
			+ value.MEM_EMAIL 
			+ "</td>"
			+ "<td align='center'>" 
			+ value.MEM_PHONE
			+ "</td>" 
			+ "<td align='center'>" 
			+ value.MEM_JOINDATE
			+ "</td>" 
			+ "<td align='center'>" 
			+ "<a href='#this' name='click'>"
			+ value.MEM_DEL_GB
			+ "<input type='hidden' id='MEM_NUM' name='MEM_NUM' value=" + value.MEM_NUM + ">"
			+ "</a>"
			+ "</td>" 
			+ "</tr>";
		}); 
    //이거 넣어야 데이터 들어감
	body.append(str);
	}
}
</script>
</body>
</html>