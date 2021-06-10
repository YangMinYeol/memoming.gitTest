<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"> 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script> 
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script> 
  <script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
</head> 

<body>
<%@ include file="/WEB-INF/views/template/header.jsp"%>
<div style="height: 160px;"></div>

<div align="center">
   <h3>게시판</h3> 
</div>

<div style="height: 50px;"></div>

<div class="container" style="width:70%;">
   <!-- search bar -->
   <div style="padding:10px; display:inline-block;">
		<form id="frm" method="post" action="http://localhost:8007/solo/board/SearchBoard.do">              
        	<input type="text" name="keyword" id="keyword" class="form-control"  placeholder="" style="width:300px; display:inline-block;">
        	<input type="submit" value="검색" class="btn btn-outline-dark" style="display:inline-block; margin-bottom:5px;"/>   
		</form>
   </div>
   
   <!-- 정렬순서 -->
   <div style="display:inline-block; float:right; margin-top:18px; margin-right:5px;">
   <table>
      <tr>
         <td><a href="http://localhost:8007/solo/board/RecentlyBoard.do"><font color=black>최신순</font></a></td> <td>&nbsp;|&nbsp;</td>
         <td><a href="http://localhost:8007/solo/board/CountBoard.do"><font color=black>조회순</font></a></td>
      </tr>
   </table>
   </div>

   <table align="center" class="table table-striped table-hover" style="cellpadding:7px;">
      <thead>
      <tr>
         <td style="width:15%">
         	<div class="dropdown">
            	<a type="button" class="dropdown-toggle" data-toggle="dropdown">카테고리</a>
            <div class="dropdown-menu">
               <a class="dropdown-item" href="http://localhost:8007/solo/board/openBoardList.do">전체</a>
               <a class="dropdown-item" href="http://localhost:8007/solo/board/TopList.do">Top</a>
               <a class="dropdown-item" href="http://localhost:8007/solo/board/BottomList.do">Bottom</a>
               <a class="dropdown-item" href="http://localhost:8007/solo/board/OuterList.do">Outer</a>
               <a class="dropdown-item" href="http://localhost:8007/solo/board/etcBoard.do">Etc</a>
            </div>
         </div>
         </td>
         <td style="width:45%">제목</td>
         <td style="width:15%">작성자</td>
         <td style="width:15%">작성일</td>
         <td style="width:10%">조회수</td>
      </tr>
      </thead>
      <tbody>
      <c:choose>
         <c:when test="${fn:length(list) > 0 }">
            <c:forEach items="${list}" var="row">
               <tr>
                  <td><b>${row.BOARD_CAT}</b></td>
                  <c:if test="${session_MEMBER.MEM_NUM != null}">
                  	<td class="title"><a href="#this" name="title">                  
                  		<font color=black>${row.BOARD_TITLE} [${row.TOTAL_COMMENTS}]</font></a>
                  		<input type="hidden" id="BOARD_NUM" value="${row.BOARD_NUM}">
                  	</td>
                  </c:if>
                  
                  <c:if test="${session_MEMBER.MEM_NUM == null}">
                    <td class="title"><a href="#this" name="titleles">
	               	<font color=black>${row.BOARD_TITLE} [${row.TOTAL_COMMENTS}]</font></a>
	                    <input type="hidden" id="BOARD_NUM" value="${row.BOARD_NUM}">                
                  </c:if>
                  
                  <td>${row.MEM_NICK}</td>
                  
                  <td><fmt:formatDate pattern="yyyy/MM/dd" value="${row.BOARD_DATE}" /></td>
                  
                  <td>${row.BOARD_COUNT}</td>
               </tr>
            </c:forEach>
         </c:when>
         
      <c:otherwise>
         <tr>
            <td colspan="6"> 조회된 결과가 없습니다.</td>
         </tr>
      </c:otherwise>
      </c:choose>
      </tbody>
      </table>
      
      <hr>
      <div align="right">
      	<c:if test="${session_MEMBER.MEM_NUM != null}">
      		<button type="button" class="btn btn-outline-dark" onclick="location.href='http://localhost:8007/solo/board/openBoardWrite.do'">글 작성</button>
      	</c:if>
      </div>
      
</div>      
<!-- footer       -->
<div style="height:80px;"></div>

<%@ include file="/WEB-INF/include/include-body.jspf" %>

<footer style="border-top:1px solid #D5D5D5;">
<%@ include file="/WEB-INF/views/template/footer.jsp"%> 
</footer>

<script type="text/javascript">
$(document).ready(function(){
	$("a[name='title']").on("click",function(e){
	e.preventDefault();
	fn_openBoardDetail($(this));
});

$("a[name='titleles']").on("click",function(e){
	e.preventDefault();
	alert("로그인 후 열람 가능합니다.");
	return false;
	});
});

function fn_openBoardDetail(obj){
	var comSubmit = new ComSubmit(); 
	comSubmit.setUrl("<c:url value='/board/openBoardDetail.do'/>");
	comSubmit.addParam("BOARD_NUM", obj.parent().find("#BOARD_NUM").val());
	comSubmit.submit();
}
</script>

</body>
</html>