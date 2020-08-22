
<%@page import="util.Utility"%>
<%@page import="site.home.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/home/security/login_status.jspf" %>

	<%
//입력된 비밀번호를 반환받아 저장
String passwd=Utility.encrypt(request.getParameter("passwd"), "SHA-256");
	
//입력 비밀번호와 로그인 사용자의 비밀번호를 비교하지 맞지 않을 경우 
if(!passwd.equals(loginMember.getmPw())) {
		session.setAttribute("message", "비밀번호가 맞지 않습니다.");
		out.println("<script>");
		out.println("location.href='"+request.getContextPath()+"/home/index.jsp?workgroup=login&work=modify_confirm';");
		out.println("</script>");
		return;
	}

String[] emailcut = loginMember.getmEmail().split("@");

String loginAddress1=loginMember.getmAddress1();

if(loginMember.getmAddress1()!=null && loginMember.getmAddress1().equals("")){
	loginAddress1 = loginMember.getmAddress1();
}else{
	loginAddress1="";
}
String loginAddress2=loginMember.getmAddress2();

if(loginMember.getmAddress2()!=null && loginMember.getmAddress2().equals("")){
	loginAddress2 = loginMember.getmAddress2();
}else{
	loginAddress2="";
}

%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.passwdbox {
	width: 100%;
	height: 40px;
	color: #bbb;
}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../home.css" rel="stylesheet" type="text/css">
</head>
<%
//String MemberId=(MemberDTO)session.getAttribute("loginMember").getmId();
%>
<body>
<form name="modifyForm" id="modify" action="<%=request.getContextPath() %>/home/login/modify_action.jsp" method="post">
	<div class="mypage-right-view">
		<div class="myinfo-box flex-box">
			<div class="title">마이페이지</div>
			<div class="status flex-box">
				<div class="item">
					<span class="item-title">회원등급</span><span class="item-val"><%if(loginMember.getmType()==1){ %>베이직
						<%}else if(loginMember.getmType()==9){ %>
						관리자 
						<%} %>
						</span>
				</div>
			</div>
			<div class="btn-box flex-box" style="margin-left : 270px;" >
				<button type="button" class="btn" onclick="mypagebutton();">쇼핑정보</button>
				<button type="button" class="btn red">개인정보</button>
				<button type="button" class="btn" onclick="faqbutton();">고객센터</button>
			</div>
		</div>
		<table id="benefitmenus">

				<tr>
					<a href="/mypage/mybenefit/coupon"><td class="on" style="border-left: 0px;"></td></a>
					<a href="/mypage/mybenefit/credit"><td class="on" style="border-left: 0px;">개인정보수정</td></a>
					<a href="/mypage/passwordcheck"><td class="on" style="border-left: 0px;"></td></a>
				</tr>
			</table>
		<div class="profile-edit-box">
			<label>아이디</label><input type="text" class="input-read"
				value="<%=loginMember.getmId() %>" readonly="" id="mId" name="mId" ><label>비밀번호<span class="red-msg" style="color: red">  미입력시 미변경</span></label><span
				class="red-msg" style="display: none; float: right;" id="passwdMatchMsg">비밀번호 형식에 맞게 적어주세요.</span>
			<div class="pass-box">
			<input type="password" value="" class="passwdbox" style="width: 496px" id="mPw" name="mPw">
			</div>
			<label>연락처<span
				class="red-msg" style="display: none; float: right;" id="phoneMatchmsg">연락처 형식에 맞게 적어주세요.</span></label>
			<div class="flex-box">
				<input type="text" class="profile-box phone-input mr" value="<%=loginMember.getmPhone() %>" id="mPhone" name="mPhone">
			</div>
			
			
			<label>이메일 주소 <span
				class="red-msg" style="display: none; float: right;" id="emailMatchMsg">이메일 형식에 맞게 적어주세요.</span></label>
			<div class="flex-box">
				<input type="text" class="profile-box phone-input" value="<%=emailcut[0]%>"  id="mEmail1" name="mEmail1" required=""><span
					class="at" >@</span><input type="text"
					class="profile-box phone-input mr" value="<%=emailcut[1]%>" id="mEmail2" name="mEmail2" required="">
			
			</div>
			
			<div class="flex-box">
				<div class="gender-box">
					<label>국적</label>
					<div class="Dropdown-root phone-input">
						<div class="Dropdown-control">
							<div class="Dropdown-placeholder" >대한민국</div>
						</div>
					</div>
				</div>
				<div class="birth-box">
					<label>생년월일</label>
					<div class="flex-box">
					<input type="date" style="padding: 5px;">
					</div>
					<div class="checks">
						<input type="checkbox" id="ex_chk3" value="on"><label
							for="ex_chk3" style="font-weight: normal;">생년월일과 성별 수집 및
							이용</label>
					</div>
				</div>
			</div>
			<label>주소</label>
			<div class="flex-box ">
				<input id="addr1" class="profile-box phone-input" value=" <%= loginAddress1  %>"
					readonly="" name="addr1" >
				<a class="password-change-button btn-ma" onclick="popupzipcode();" style="text-align: center; 
				padding-top: 10px; padding-bottom: 0px; height: 35px;">우편번호</a>
			</div>
			<input class="input-addr" id="addr2" value="<%=loginAddress2 %> " name="addr2">
			<!-- react-text: 2293 -->
			<!-- /react-text -->
			<a class="BaseLink"><div
					class="member-withdraw-button" onclick="quitbutton();" >회원탈퇴</div></a>
			<div class="flex-box" style="margin-top: 40px;">
				<button class="btn-white" type="reset" style="cursor: pointer;">취소</button>
				<button class="btn-red" type="submit" style="cursor: pointer;">저장</button>
			</div>
		</div>
		<div class="overlay">
			<div class="password-change-popup">
				<div class="popup-body">
					<span class="x-btn">x</span>
					<div class="pt20"></div>
					
					<div class="popup-button-box">
						<div class="popup-cancel-button">취소</div>
						<div class="popup-change-button">변경하기</div>
					</div>
				</div>
			</div>
		</div>
		<div class="overlay">
			<div class="account-change-popup">
				<div class="popup-header">
					<div class="popup-header-title">환불계좌 등록/변경</div>
				</div>
				<div class="popup-body">
					<div class="pt20"></div>
					<table class="popup-account-info-table">
						<tbody>
							<tr>
								<td class="left-td">예금주</td>
								<td class="right-td"><input type="text" placeholder="예금주"
									value=""></td>
							</tr>
							<tr>
								<td class="left-td">은행</td>
								<td class="right-td"><div class="bank-select-dropdown">
										<div class="Dropdown-root">
											<div class="Dropdown-control">
												<div class="Dropdown-placeholder">신한은행</div>
												<span class="Dropdown-arrow"></span>
											</div>
										</div>
									</div></td>
							</tr>
							<tr>
								<td class="left-td">계좌번호</td>
								<td class="right-td"><input type="text" placeholder="계좌번호"
									value=""></td>
							</tr>
						</tbody>
					</table>
					<div class="pt10"></div>
					<div class="checks">
						<input type="checkbox" id="ex_chk_acc" value="on"><label
							for="ex_chk_acc">입력한 환불계좌 정보를 수집/설정하는데 동의합니다.</label>
					</div>
					<div class="popup-button-section">
						<button class="popup-cancel-button" >취소</button>
						<button class="popup-ok-button" >확인</button>
					</div>
</form>
					<div class="account-change-announce-box">
						<!-- react-text: 2358 -->
						가상계좌를 통해 입금하신 경우, 위에 등록하신 고객님 명의의 통장으로 환불해 드립니다.
						<!-- /react-text -->
						<br>
						<!-- react-text: 2360 -->
						환불계좌의 변경은 마이페이지에서 가능합니다.
						<!-- /react-text -->
						<br>
						<!-- react-text: 2362 -->
						가상계좌 입금을 통한 주문 취소/반품의 환불은 신청일 1일 후이 PG 사를 통해 입금됩니다.
						<!-- /react-text -->
						<br>
						<br>
						<!-- react-text: 2365 -->
						그 외 문의는 고객센터 1577-5863을 통해 부탁드립니다.
						<!-- /react-text -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--autoload=false 파라미터를 이용하여 자동으로 로딩되는 것을 막습니다.-->
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js?autoload=false"></script>
<script>
    //load함수를 이용하여 core스크립트의 로딩이 완료된 후, 우편번호 서비스를 실행합니다.
    
    
    function popupzipcode() {
    	
    daum.postcode.load(function(){
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = '';
                var extraAddr = ''; 
                if (data.userSelectedType === 'R') { 
                    addr = data.roadAddress;
                } else { 

                }
                if(data.userSelectedType === 'R'){

                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }                    
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    document.getElementById("addr1").value = extraAddr;
                } else {
                    document.getElementById("addr1").value = '';
                }
                document.getElementById('addr1').value = data.zonecode;
                document.getElementById("addr1").value = addr;
                document.getElementById("addr2").focus();
            }
        }).open();
    });
		
	}
    
    function mypagebutton() {
		window.location.href="index.jsp?workgroup=login&work=mypage&oState=0";
	}
    function quitbutton() {
		window.location.href="index.jsp?workgroup=login&work=quitmembership";
	}
    
    
	
</script>
<script type="text/javascript">

$("#modify").submit(function() {	
	var submitResult=true;
	$(".red-msg").css("display","none");
	var passwdReg= /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9])(?=.*[0-9]).{8,16}$/;
	if($("#mPw").val()!="" && !passwdReg.test($("#mPw").val())) {
		$("#passwdMatchMsg").css("display","block");
		submitResult=false;
	} 
	
	var emailReg=/^([a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+(\.[-a-zA-Z0-9]+)+)*$/g;
	var temp=$("#mEmail1").val()+"@"+$("#mEmail2").val();
	if(temp=="") {
		submitResult=false;
	} else if(!emailReg.test(temp)) {
		$("#emailMatchMsg").css("display","block");
		submitResult=false;
	}

	var mPhoneReg= /\d{3}-\d{3,4}-\d{4}$/;
    if($("#mPhone").val()=="") {
		submitResult=false;
	} else if(!mPhoneReg.test($("#mPhone").val())) {
		submitResult=false;
		$("#phoneMatchmsg").css("display","block");	
	} 	
	
	return submitResult;
	
});
function faqbutton() {
	window.location.href="index.jsp?workgroup=board&work=faq";
};



</script>
</body>
</html>