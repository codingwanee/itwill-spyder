<%@page import="site.home.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%MemberDTO logincheckid=(MemberDTO)session.getAttribute("logincheckid"); %>
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
				<!-- react-text: 614 -->
				아이디/비밀번호 찾기
				<!-- /react-text -->
				<span class="uk-title">Find ID/Password</span>
			</div>
			<div class="idPassInquiry-button-block">
				<div class="id-button-valid" style="display: inline-block; float:left ">ID</div>
				<div class="password-button" style="display: inline-block;" onclick="findpw();">Password</div>
				<div class="pt20"></div>
				<div>
					<div class="id-inquiry-result">
						<!-- react-text: 632 -->
						고객님의 아이디는
						<!-- /react-text -->
						<font class="idPassInquiry-text-bold"><%=logincheckid.getmId() %></font>
						<!-- react-text: 634 -->
						입니다.
						<!-- /react-text -->
					</div>
					<div class="id-inquiry-result-msg">
						<!-- react-text: 636 -->
						비밀번호는
						<!-- /react-text -->
						<a href="<%=request.getContextPath()%>/home/index.jsp?workgroup=login&work=find_password">비밀번호 찾기</a>
						<!-- react-text: 638 -->
						를 통해 재설정할 수 있습니다.
						<!-- /react-text -->
					</div>
					<div class="id-inquiry-result-msg">Please enter your email address to reset your password</div>
					<a href="index.jsp?workgroup=login&work=loginpopup"><div class="login-button">LOGIN</div></a>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	
	function findpw() {
		window.location.href="index.jsp?workgroup=login&work=find_password";

	};
	
	
	</script>
</body>
</html>