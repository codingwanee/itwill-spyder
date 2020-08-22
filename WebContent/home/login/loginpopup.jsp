<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<%
	String message=(String)session.getAttribute("message");
	if(message==null) {
		
		message="";
	} else {
		session.removeAttribute("message");
	}
	

	
	String id=(String)session.getAttribute("id");
	if(id==null) {
		id="";
	} else {
		session.removeAttribute("id");
	}
%>


<style type="text/css">
.popup_overlay {
	background: #f7f7f7;
	bottom: 0;
	left: 0;
	/* opacity: 0;*/
	position: fixed;
	right: 0;
	top: 0;
	/* visibility: hidden;*/
	z-index: 100;
	overflow: hidden;
}

.popup_member-btn {
	background: black;
	font-size: 40px;
	text-align: center;
	border: 1px solid black;
	width: 100%;
	height: 52px;
	color: white;
}

input {
	margin-top: 5px;
	width: 100%;
	height: 46px;
}

#member {
	width: 100%;
	height: auto;
}

#loginsubmit {
	margin-top: 20px;
	width: 100%;
	height: 60px;
	background: black;
	color: white;
}

#ex_chk {
	width: 15px;
	height: 15px;
}

#loginpopup {
	width: 90%;
	margin: 0 auto;
}

.loginPop {
	width: 500px;
	margin: 0 auto;
	margin-top: 150px;
	background-color: white;
}

#sign {
	text-align: center;
}

#sub1, #sub2 {
	color: white;
	margin: 10px;
}

#suball {
	width: 504px;
	height: 130px;
	background: black;
	text-align: center;
}
</style>
<div id="loginpopup" class="popup_overlay">
	<div class="loginPop" style="overflow: hidden;">
		<div id="login">
			<div class="round" style="height: 360px">
				<div class="x-btn">
					<!--<img
							src="//d319d1tzjwpwbb.cloudfront.net/desktop/icons/x_grey.svg"
							alt="close"> -->
				</div>
				<div class="popup_member-btn">
					<a id="left" class="black">회원로그인</a>
				</div>
				<div id="member" class="" style="padding-bottom: 22px;">
					<form id="submit" id="login" name="loginForm" action="<%=request.getContextPath() %>/home/login/login_action.jsp" method="post">
						<div class="login-box">
							<input type="text" required="" placeholder="ID" name="mId" id="id" value="<%=id%>" style="width: 360px" autocomplete="off"> <br> 
							<input type="password" required="" placeholder="PASSWORD" name="mPw" id="passwd" style="width: 360px" autocomplete="off"> <br>
							<button type="submit" id="loginsubmit">Log In</button>
						</div>
					</form>
					<a class="find"><div style="text-decoration: underline; text-align: right; height: 15px; font-size: 15px; cursor: pointer;" onclick="findid();">Find ID / Password</div></a>
				</div>
			</div>
		</div>
		<div id="message" style="color: red; font-size: 15px;"><%=message %></div>
		<br>
		<div class="bottom">
			<h1 id="sign" style="cursor: pointer; padding-bottom: 60px;" onclick="singUp();">회원가입</h1>
			<p id="suball">
				<br> <br> <br> <span id="sub1"> <!-- react-text: 238 -->회원 구매 시, 결제 금액의 <!-- /react-text --> <b>5% 마일리지</b> <!-- react-text: 240 --> 적립 가능<!-- /react-text -->
				</span><br> <span id="sub2"> <!-- react-text: 243 -->3만 원 이상 구매 시 <!-- /react-text --> <b>무료 배송/무료 반품</b> <!-- react-text: 245 --> 서비스<!-- /react-text -->
				</span>
			</p>
		</div>
	</div>
</div>
<script type="text/javascript">
$("#id").focus();

$("#loginsubmit").click(function() {
	if($("#id").val()=="") {
		$("#message").text("아이디를 입력해 주세요.");
		$("#id").focus();
		return;
	}
	
	if($("#passwd").val()=="") {
		$("#message").text("비밀번호를 입력해 주세요.");
		$("#passwd").focus();
		return;
	}
	
	$("#login").submit();
});
function singUp() {
	window.location.href="index.jsp?workgroup=login&work=joinmembership";
};

function findid() {
	window.location.href="index.jsp?workgroup=login&work=find_id";
}
</script>