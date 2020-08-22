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
				<div class="id-button-valid" style="float: left">ID</div>
				<div class="password-button" style="float: left" onclick="findpw();">Password</div>
				</div>
				<div class="pt20"></div>
				<form action="<%=request.getContextPath() %>/home/login/find_id_action.jsp" method="post">
					<input type="text" class="idPassInquiry-id-box" required="" placeholder="이름 Name" value="" id="mName" name="mName">
					<input type="text" class="idPassInquiry-id-box" required="" placeholder="이메일 주소 Email Address" value="" id="mEmail" name="mEmail">
					<br>
					
					<div style="color: red; font-size: 15px; display: none;" name="findcheckmessage" class="findcheckmessage" ><%=checkid%></div>
					
					
					<div class="idPassInquiry-text">
						<!-- react-text: 21 -->
						가입 당시 입력한 이메일 주소를 통해 아이디를 찾을 수 있습니다.
						<!-- /react-text -->
						<br>
						<!-- react-text: 23 -->
						이메일 주소를 잊어버리신 경우에는 고객센터(1588-5863)에 연락바랍니다.
						<!-- /react-text -->
						<br>
						<!-- react-text: 25 -->
						Please enter your email address to find your ID.
						<!-- /react-text -->
					</div>
					<button class="idPassInquiry-next-button" type="submit">SUBMIT</button>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	
	 $(".findcheckmessage").css("display","<%=result%>"); 
	function findpw() {
		window.location.href="index.jsp?workgroup=login&work=find_password";

	};
	
	</script>

</body>
</html>