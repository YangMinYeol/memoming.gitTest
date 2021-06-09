<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
</head>

<body>
<%@ include file="/WEB-INF/views/template/header.jsp" %>
<div style="height: 160px;"></div>
	<form id="frm1" name="frm1" method="post">
		
		<div class="container">
		
			<div align="center" style="margin-bottom: 10px;">
				<h4>신고하기</h4>
			</div>
			
			<div style="margin-bottom: 10px;">
				<span><strong>회원 닉네임</strong></span>&nbsp; <span>${map.MEM_NICK}</span>
				<input type="hidden" name="COMMENTS_NUM" id="COMMENTS_NUM"
					value="${map.COMMENTS_NUM}" /> <input type="hidden"
					name="COMMENTS_WRITER" id="COMMENTS_WRITER"
					value="${map.COMMENTS_WRITER}" /> <input type="hidden"
					name="BOARD_NUM" id="BOARD_NUM" value="${map.BOARD_NUM}" /> <input
					type="hidden" name="MEM_NUM" id="MEM_NUM"
					value="${session_MEMBER.MEM_NUM}" />
			</div>
			
			<div>
				<span><strong>신고 사유</strong></span>
				<textarea class="form-control" id="REPORT_COMMENT"
					name="REPORT_COMMENT" rows="5" placeholder="신고 사유를 입력해주세요."
					style="margin-top: 5px; width: 100%;"></textarea>
			</div>
			
			<div align="center" style="margin-top: 20px;">
				<a href="#this" id="report"><button class="btn btn-warning">신고</button></a>
				<input type="button" class="btn btn-outline-warning" value="취소" onclick="location.href='http://localhost:8007/solo/board/openBoardList.do'">
			</div>
		</div>
	</form>
<script type="text/javascript">
$(document).ready(function() {
	
	$("#clo").on("click", function(e) {
	e.preventDefault();
	selfClose();
	});

	$("#report").on("click", function(e) {
	e.preventDefault();
	fn_report();
	});

});

function fn_report() {
	var comSubmit = new ComSubmit("frm1");
	comSubmit.setUrl("<c:url value='/report/insertCommentReport.do'/>");
	if (!$("#REPORT_COMMENT").val()) {
		alert("내용을 입력하세요.");
		$("#REPORT_COMMENT").focus();
		return false;
	}
	alert("신고가 접수 되었습니다.");
	comSubmit.submit();
}

function selfClose() {
	self.close();
}
</script>

<div style="height:400px;"></div>
<footer style="border-top:1px solid #D5D5D5;">
<%@ include file="/WEB-INF/views/template/footer.jsp"%> 
</footer>

<%@ include file="/WEB-INF/include/include-body.jspf"%>
</body>
</html>