
<%@page import="site.home.dao.MemberDAO"%>
<%@page import="site.home.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
if(request.getParameter("mPhone")==null){
	response.sendError(HttpServletResponse.SC_BAD_REQUEST);
	return;
	
}
String phone=request.getParameter("mPhone");

MemberDTO member=MemberDAO.getDAO().getMemberByPhone(phone);

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

.phone{
	color: red;
}
</style>
</head>
<body>
 <%if (member==null){%>
<div>입력한 <span class="phone">[<%=phone%>]</span>는 사용 가능한 번호입니다.<br>&nbsp;</div>
<div><button type="button" onclick="windowClose();">번호 사용</button></div>
<% } else {//아이디 사용 불가능 %>
	<div id="message">입력한 <span class=phone>[<%=phone%>]</span>는 이미 사용중인 번호입니다.<br>
	다른 전화번호를 입력하고 [확인]을 눌러 주세요.</div>
	<div>
	<form name="form" onsubmit="submitCheck();">
		<input type="text" name="mPhone">
		<button type="submit">확인</button>	
	</form>	
	</div>	
	<% } %>
	<script type="text/javascript">
	function windowClose(){
	opener.joinForm.mPhone.value="<%=phone%>";
	opener.joinForm.phoneCheckResult.value="1";
	window.close();
	}
	function submitCheck() {
		var id=form.id.value;
		if(id=="") {
			document.getElementById("message").innerHTML="전화번호를 입력해 주세요.<br>&nbsp;";
			document.getElementById("message").style="color:red;";
			return false;
		}
		
		var idReg= /^\d{3}-\d{3,4}-\d{4}$/;
		if(!idReg.test(id)) {
			document.getElementById("message").innerHTML="000-0000-0000 형식으로 해주세요 ";
			document.getElementById("message").style="color:red;";
			return false;
		}
		
		return true;
	}
	
	
	
	</script>
	
</body>
</html>