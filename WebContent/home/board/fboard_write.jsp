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
<jsp:include page="faq_base.jsp"/>
<form action="<%=request.getContextPath()%>/home/board/fboard_write_action.jsp" method="post" id="boardForm">
	<select name="category">
									<option value="상품">상품</option>
									<option value="배송">배송</option>
									<option value="AS/반품/환불">AS/반품/환불</option>
									<option value="주문/결제">주문/결제</option>
									<option value="회원혜택">회원혜택</option>
									<option value="기타">기타</option>
	</select>
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