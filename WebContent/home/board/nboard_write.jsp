<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
table {
	margin: 0 auto;
}

td {
	text-align: left;
}

th {
	width: 70px;
	font-weight: normal; 
}
</style>
<jsp:include page="notice_base.jsp"/>
<form action="<%=request.getContextPath()%>/home/board/nboard_write_action.jsp" method="post" id="boardForm">
<table>
	<tr>
		<th>제목</th>
		<td>
			<input type="text" name="subject" id="subject" size="40">
		</td>
	</tr>
	<tr>		
		<th>내용</th>
		<td>
			<textarea rows="7" cols="60" name="content" id="board_content"></textarea>
		</td>
	</tr>
	<tr>
		<th colspan="2">
			<button type="submit">글저장</button>
			<button type="reset" id="resetBtn">다시입력</button>
		</th>
	</tr>
</table>
</form>
<div id="message" style="color: red;"></div>

<script type="text/javascript">
$("#subject").focus();

$("#boardForm").submit(function() {
	if($("#subject").val()=="") {
		$("#message").text("제목을 입력해 주세요.");
		$("#subject").focus();
		return false;
	}
	
	if($("#board_content").val()=="") {
		$("#message").text("내용을 입력해 주세요.");
		$("#board_content").focus();
		return false;
	}
});

$("#resetBtn").click(function() {
	$("#subject").focus();
	$("#message").text("");
})
</script>