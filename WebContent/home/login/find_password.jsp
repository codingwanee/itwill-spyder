<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
   
    String checkid=(String)session.getAttribute("findcheckmessage"); 
    String result=(String)session.getAttribute("resultCss");
    session.invalidate();

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
				아이디/비밀번호 찾기
				<!-- /react-text -->
				<span class="uk-title">Find ID/Password</span>
			</div>
			<div class="idPassInquiry-button-block">
			<div>
				<div class="id-button" style="float: left" onclick="findid();">ID</div>
				<div class="password-button-valid" style="float: left">Password</div>
				<div class="pt20"></div>
				</div>
				<form  action="<%=request.getContextPath() %>/home/login/find_password_action.jsp" method="post"  >
					<input type="text" class="idPassInquiry-id-box" required="" placeholder="아이디 ID" value="" name="mId" id="mId">
					<br>
					<input type="text" class="idPassInquiry-id-box" required="" placeholder="이름 Name" value="" name="mName" id="mName">
					<br>
					<input type="text" class="idPassInquiry-id-box" required="" placeholder="이메일 주소 Email address" value="" name="mEmail" id="mEmail">
					
					<div class="idPassInquiry-text">
						<!-- react-text: 188 -->
						가입 당시 입력한 이메일 주소를 통해 비밀번호를 재설정 할 수 있습니다.
						<!-- /react-text -->					
						<!-- react-text: 190 -->
						이메일 주소를 잊어버리신 경우에는 고객센터(1588-5863)에 연락바랍니다.
						<!-- /react-text -->
						<!-- react-text: 192 -->
						Please enter your email address to reset your password.
						<!-- /react-text -->
					</div>
    				<div style="color: red; font-size: 15px ; display: none;" name="findcheckmessage" class="findcheckmessage">아이디,이름,이메일주소를 확인 해주세요.</div>
					<button class="idPassInquiry-next-button" type="submit">RESET</button>					
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	function findid() {
		window.location.href="index.jsp?workgroup=login&work=find_id";
	};
	
	 $(".findcheckmessage").css("display","hidden"); 
	 $(".findcheckmessage").css("display","<%=result%>"); 
	function findpw() {
		window.location.href="index.jsp?workgroup=login&work=find_password";

	};
	
	</script>

</body>
</html>