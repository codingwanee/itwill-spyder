<%@page import="site.home.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%MemberDTO logincheckDTO=(MemberDTO)session.getAttribute("logincheckDTO"); 


%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../home.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="wide-container">
		<div class="idPassInquiry-contents">
			<div class="idPassInquiry-subject">
				<!-- react-text: 11 -->
				비밀번호 재설정
				<!-- /react-text -->
				<span style="font-size: 20px;">Reset Password</span>
			</div>
			<div class="password-reset-text">회원님의 계정 비밀번호를 재설정해주세요.</div>
			<div class="pt10"></div>
			<div class="login-line"></div>
			<div class="pt20"></div>
			<form id="pwreset" action="<%=request.getContextPath() %>/home/login/find_password_reset_action.jsp" method="post">
				<input type="password" class="idPassInquiry-id-box" required="" placeholder="비밀번호 Password" id="mPw" name="mPw">
				<input type="password" class="idPassInquiry-id-box" required="" placeholder="비밀번호 확인 Confirm Password" id="remPw" name="remPw">
				<div class="password-reset-text">비밀번호는 8~20자로 영문 숫자 특수기호 조합으로 입력해주세요.</div>
				<div class="password-reset-text">Please enter your password in 8 ~ 20 alphanumeric characters.</div>
				<div class="pt20"></div>
				<button class="idPassInquiry-next-button" type="submit">SUBMIT</button>
			</form>
		</div>
	</div>
</body>
<script type="text/javascript">
$("#pwreset").submit(function() {	
	var submitResult=true;
	var passwdReg= /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9])(?=.*[0-9]).{8,16}$/;
	if(!passwdReg.test($("#mPw").val())) {
		alert("비밀번호는 8~20자로 영문 숫자 특수기호 조합으로 입력해주세요.")
		submitResult=false;
	}else if($("#mPw").val()!=$("#remPw").val()){
	 	alert("비밀번호확인이 비밀번호와 일치하지 않습니다 ")	
	 	submitResult=false;
	} 
	return submitResult;
	
});

	
	
</script>
</html>