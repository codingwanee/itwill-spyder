<%@page import="site.home.dao.FBoardDAO"%>
<%@page import="site.home.dto.FBoardDTO"%>
<%@page import="site.home.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%	
	if(request.getParameter("num")==null) {
		out.println("<script>");
		out.println("location.href='"+request.getContextPath()+"/home/index.jsp?workgroup=board&work=faq';");
		out.println("</script>");
		return;
	}
		
	request.setCharacterEncoding("UTF-8");
	
	int num=Integer.parseInt(request.getParameter("num"));
			
	FBoardDTO board=FBoardDAO.getDAO().getFBoardDetail(num);
		
	if(board==null || board.getFbStatus()==1) {
		out.println("<script>");
		out.println("location.href='"+request.getContextPath()+"/site/index.jsp?workgroup=board&work=faq';");
		out.println("</script>");
		return;
	}
		
	MemberDTO loginMember=(MemberDTO)session.getAttribute("loginMember");
		 
	if(loginMember==null || loginMember.getmType()!=9) {
		out.println("<script>");
		out.println("location.href='"+request.getContextPath()+"/site/index.jsp?workgroup=board&work=faq';");
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

.fmodt {
	margin: 0 auto;
	width: 50px;
}
</style>
<jsp:include page="faq_base.jsp"/>
<h2 class="fmodt">글수정</h2>
<form action="<%=request.getContextPath()%>/home/board/fboard_modify_action.jsp" method="post" id="boardForm">
<input type="hidden" name="num" value="<%=num%>">
	<select name="category" class="n-1">
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
			<input type="text" name="subject" id="subject" size="40" value="<%=board.getFbTitle() %>">
		</td>
	</tr>
	<tr>		
		<th>내용</th>
		<td>
			<textarea rows="7" cols="60" name="content" id="board_content"><%=board.getFbContent() %></textarea>
		</td>
	</tr>
	<tr>
		<th colspan="2">
			<button type="submit">글수정</button>
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

$(".n-1").val("<%=board.getFbCategory()%>").prop("selected",true);

$("#resetBtn").click(function() {
	$("#subject").focus();
	$("#message").text("");
})
</script>