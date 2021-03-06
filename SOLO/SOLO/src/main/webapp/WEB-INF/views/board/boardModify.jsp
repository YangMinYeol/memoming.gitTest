<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script> 
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
</head>

<body>

<%@ include file="/WEB-INF/views/template/header.jsp"%>
<div style="height: 160px;"></div>

<!-- title -->
<div align="center">
   <h3>게시판</h3> 
</div>
<div style="height: 50px;"></div>

<!-- body -->
<form id="frm" name="frm" enctype="multipart/form-data">
<div class="container" id="frm" style="width:60%;">

   <div style="margin-bottom:15px;">
      <!-- 카테고리 -->
      <div style="display:inline-block; width:19%;">
         <select class="form-control" id="BOARD_CAT" name="BOARD_CAT">
            <option>${map.BOARD_CAT}</option>
            <option value="Top">Top</option>
            <option value="Bottom">Bottom</option>
            <option value="Outer">Outer</option>
            <option value="Etc">Etc</option>
         </select>
      </div>
      <input type="hidden" name="BOARD_NUM" id="BOARD_NUM" value="${map.BOARD_NUM}"/>
      
      <!-- 제목 -->
      <div style="display:inline-block; width:80%; float:right;">
         <input type="text" id="BOARD_TITLE" name="BOARD_TITLE" class="form-control" value="${map.BOARD_TITLE}" style="width:100%;">
      </div>
   </div>

   <!-- 내용 -->
   <div style="margin-bottom:15px;">
      <textarea class="form-control" id="BOARD_CONTENT" name="BOARD_CONTENT" rows="12">${map.BOARD_CONTENT}</textarea> 
   </div>
   
   <!-- 첨부파일 -->
   <div class="custom-file" style="margin-bottom:15px;">
     <input type="file" class="custom-file-input" id="customFile">
     <label class="custom-file-label" for="customFile">첨부 파일</label>
   </div>
   
   <!-- 버튼 -->
   <div align="center">
        <a href="#this" id="write"><input type="button" class="btn btn-dark" value="글 수정"></a>
      <input type="button" class="btn btn-outline-dark" value="취소" onClick="javascript:history.go(-1)">
   </div>
   
</div>
</form>

<script type="text/javascript">
   
$("#write").on("click", function(e){
	e.preventDefault();
	fn_updateBoard();
});


function fn_updateBoard(){

var comSubmit = new ComSubmit("frm");
	comSubmit.setUrl("<c:url value='/board/updateBoard.do' />");

	if (!$("#BOARD_CAT").val() || $("#BOARD_CAT").val() == '카테고리 선택') {
	alert("카테고리를 선택하세요.");
	$("#BOARD_CAT").focus();
	return false;
	}

	if (!$("#BOARD_TITLE").val()) {
	alert("제목을 입력하세요.");
	$("#BOARD_TITLE").focus();
	return false;
	}

	if (!$("#BOARD_CONTENT").val()) {
	alert("내용을 입력하세요.");
	$("#BOARD_CONTENT").focus();
	return false;
	}

	alert("게시판이 정상적으로 수정 되었습니다.");
	comSubmit.submit();

}
</script>

<%@ include file="/WEB-INF/include/include-body.jspf" %>

<!-- footer       -->
<div style="height:80px;"></div>
<footer style="border-top:1px solid #D5D5D5;">
<%@ include file="/WEB-INF/views/template/footer.jsp"%> 
</footer>

</body>
</html>