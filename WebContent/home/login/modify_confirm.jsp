<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/home/security/login_status.jspf"%>
<link href="../home.css" rel="stylesheet" type="text/css">
<%
	String message = (String) session.getAttribute("message");
	if (message == null) {
		message = "";
	} else {
		session.removeAttribute("message");
	}
%>
<div class="app-children-box-100">
	<div class="mypage-contents">
		<div class="mypage-right-view">
			<div class="myinfo-box flex-box">
				<div class="title">마이페이지</div>
				<div class="status flex-box" style="float: left
				">
					<div class="item" style="float:">
						<span class="item-title">회원등급</span><span class="item-val"><%if(loginMember.getmType()==1){ %>베이직
						<%}else if(loginMember.getmType()==9){ %>
						관리자 
						<%} %>
						</span>
					</div>
				</div>
				<div class="btn-box flex-box" style="margin-left : 270px; ">
					<button class="btn " onclick="mypagebutton();">쇼핑정보</button>
					<button class="btn red">개인정보</button>
					<button class="btn " onclick="faqbutton();">고객센터</button>
				</div>
			</div>
			<table id="benefitmenus">
				<tr>
					<a href="/mypage/mybenefit/coupon"><td class="on" style="border-left: 0px;"></td></a>
					<a href="/mypage/mybenefit/credit"><td class="on" style="border-left: 0px;">개인정보수정</td></a>
					<a href="/mypage/passwordcheck"><td class="" style="border-left: 0px;"></td></a>
				</tr>
			</table>
			<div class="profile-content-n">
				<span class="profile-b">비밀번호 확인</span><span class="profile-bb">회원님의 소중한 정보보호를 위해 비밀번호를 재확인 하고 있습니다</span>
				<div class="flex-box" style="margin-top: 40px;">
					<div class="pass-title">
						<span>비밀번호</span>
					</div>
					<form name="passwdForm" action="<%=request.getContextPath()%>/home/index.jsp?
					workgroup=login&work=modifymembership" method="post" onsubmit="return submitCheck();">
						<input type="password" name="passwd" class="password-input-n">
					<button type="submit" class="pass-btn" style="height: 45px">확인</button>
					</form>
				</div>
					<p id="passwdcheckmessage" style="color: red; font-size: 20px;"><%=message%></p>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	passwdForm.passwd.focus();

	function submitCheck() {
		if (passwdForm.passwd.value == "") {
			passwdForm.passwd.focus();
			document.getElementById("passwdcheckmessage").innerHTML = "비밀번호를 입력해 주세요.";
			return false;
		}
		return true;
	};
	function mypagebutton() {
		window.location.href="index.jsp?workgroup=login&work=mypage&oState=0";
	};
	function faqbutton() {
		window.location.href="index.jsp?workgroup=board&work=faq";
	};

	
</script>
