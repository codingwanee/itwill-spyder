<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="site.home.dao.PQuestionDAO" %>
<%@ page import="site.home.dto.PQuestionDTO" %>
<%@ page import="site.home.dto.MemberDTO" %>

<%
	
	if(request.getParameter("num")==null) {
		out.println("<script>");
		out.println("location.href='"+request.getContextPath()+"/home/index.jsp?workgroup=board&work=oneonone';");
		out.println("</script>");
		return;
	}
		
	request.setCharacterEncoding("UTF-8");
		
	int num=Integer.parseInt(request.getParameter("num"));
			
	PQuestionDTO board=PQuestionDAO.getDAO().getPQuestionDetail(num);
			
	MemberDTO loginMember=(MemberDTO)session.getAttribute("loginMember");
	
	if(loginMember==null || loginMember.getmType()!=9) {
		out.println("<script>");
		out.println("location.href='"+request.getContextPath()+"/home/index.jsp?workgroup=board&work=oneonone';");
		out.println("</script>");
		return;
	}
	
	
%>
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

.nmodt {
	margin: 0 auto;
	width: 50px;
}
</style>
<jsp:include page="oneonone_base.jsp"/>
<h2 class="nmodt">답변하기</h2>
<form action="<%=request.getContextPath()%>/home/board/pquestion_answer_action.jsp" method="post" id="boardForm">
<input type="hidden" name="num" value="<%=num%>">
<select class="n-1" name="category">
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
			<input type="text" name="subject" id="subject" size="40" value="<%=board.getPqTitle() %>" readonly="readonly">
		</td>
	</tr>
	<tr>		
		<th>내용</th>
		<td>
			<textarea rows="7" cols="60" name="content" id="content" readonly="readonly"><%=board.getPqContent() %></textarea>
		</td>
	</tr>
	<tr>		
		<th>답변</th>
		<td>
			<textarea rows="7" cols="60" name="answer" id="answer"><%=board.getPqAnswer() %></textarea>
		</td>
	</tr>
	<tr>
		<th colspan="2">
			<button type="submit">답변하기</button>
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
	
	if($("#board_answer").val()=="") {
		$("#message").text("답변을 입력해 주세요.");
		$("#board_answer").focus();
		return false;
	}
});

$(".n-1").val("<%=board.getPqCategory()%>").prop("selected",true);

$("#resetBtn").click(function() {
	$("#answer").focus();
	$("#message").text("");
})
</script>