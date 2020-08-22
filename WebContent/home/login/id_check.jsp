<%@page import="site.home.dao.MemberDAO"%>
<%@page import="site.home.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
if(request.getParameter("mId")==null){
	response.sendError(HttpServletResponse.SC_BAD_REQUEST);
	return;
	
}
String id=request.getParameter("mId");

MemberDTO member=MemberDAO.getDAO().getMember(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
<style type="text/css">
div {
	text-align: center;
	margin: 10px;
}

.id {
	color: red;
}
</style>
</head>
<body>
<%if (member==null){%>
<div>입력한 <span class="id">[<%=id%>]</span>는 사용 가능한 아이디입니다.<br>&nbsp;</div>
<div><button type="button" onclick="windowClose();">아이디 사용</button></div>
<% } else {//아이디 사용 불가능 %>
	<div id="message">입력한 <span class="mId">[<%=id%>]</span>는 이미 사용중인 아이디입니다.<br>
	다른 아이디를 입력하고 [확인]을 눌러 주세요.</div>
	<div>
	<form name="form" onsubmit="submitCheck();">
		<input type="text" name="mId">
		<button type="submit">확인</button>	
	</form>	
	</div>	
	<% } %>
	<script type="text/javascript">
	function windowClose(){
	opener.joinForm.id.value="<%=id%>";
	opener.joinForm.idCheckResult.value="1";
	window.close();
	}
	function submitCheck() {
		var id=form.id.value;
		if(id=="") {
			document.getElementById("message").innerHTML="아이디를 입력해 주세요.<br>&nbsp;";
			document.getElementById("message").style="color:red;";
			return false;
		}
		
		var idReg=/^[a-z]+[a-z0-9]{4,10}$/;
		if(!idReg.test(id)) {
			document.getElementById("message").innerHTML="영문자와 숫자로 4자이상 10자이하로 입력해주세요. ";
			document.getElementById("message").style="color:red;";
			return false;
		}
		
		return true;
	}
	
	
	
	</script>
	
</body>
</html>