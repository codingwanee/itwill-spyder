<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="/home/security/login_status.jspf" %>
 <script src="//code.jquery.com/jquery-latest.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="../home.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="mypage-contents">
		<div class="mypage-right-view">
			<div class="page-title">
				<div>회원탈퇴</div>
				<div class="withdraw-title-comment">
					<!-- react-text: 1643 -->
					그 동안 스파이더 쇼핑몰을 이용하시는데 불편함이 있으셨나요?
					<!-- /react-text -->
					<br>
					<!-- react-text: 1645 -->
					다음의 탈퇴 사유를 작성해주시면 더 나은 서비스를 제공하도록 노력하겠습니다.
					<!-- /react-text -->
				</div>
			</div>
			<div class="withdraw-content">
				<div class="short-line"></div>
				<div class="question_text">1. 스파이더 온라인 쇼핑몰 탈퇴 사유를 선택해주세요.(중복체크 가능)</div>
				<div class="select-answer-box">
					<ul>
						<li><div class="checks">
								<input type="checkbox" id="ex_chk0" value="on"><label for="ex_chk0">상품 품질/ 서비스의 불만족</label>
							</div></li>
						<li><div class="checks">
								<input type="checkbox" id="ex_chk1" value="on"><label for="ex_chk1">온라인 쇼핑몰 이용의 불편</label>
							</div></li>
						<li><div class="checks">
								<input type="checkbox" id="ex_chk2" value="on"><label for="ex_chk2">회원탈퇴 후 재가입을 위해</label>
							</div></li>
						<li><div class="checks">
								<input type="checkbox" id="ex_chk3" value="on"><label for="ex_chk3">이용빈도가 낮아서</label>
							</div></li>
						<li><div class="checks">
								<input type="checkbox" id="ex_chkEx" value="on"><label for="ex_chkEx"></label><span>
									<!-- react-text: 1672 -->기타<!-- /react-text -->
									<input type="text">
								</span>
							</div></li>
					</ul>
				</div>
				<div class="pt20"></div>
				<div class="short-line"></div>
				<div class="question_text">2. 스파이더 온라인 쇼핑몰에 바라는 점을 남겨주세요(선택입력)</div>
				<textarea rows="8" cols="100"></textarea>
				<div class="pt20"></div>
				<div class="info-box">
					<div class="withdraw-announce-box">
						<font class="red-font">회원탈퇴 유의사항</font><br>
						<font class="bold-font">1. 서비스 제한</font><br>
						<ul>
							<li>-회원탈퇴 시 회원전용 모든 웹 서비스 이용이 불가합니다.</li>
							<li>-거래정보가 있는 경우, 전자상거래 등에서의 소비자 보호에 관한 법률에 따라 계약 또는 청약철회에 관한 기록, 대금결제 및 재화등의 공급에 관한 기록은 5년동안 보존됩니다.</li>
							<li>-유효기간이 경과되지 않은 미사용 쿠폰 및 마일리지는 탈퇴이후 사용이 불가하오니, 반드시 사용하시기 바랍니다.</li>
							<li>-회원탈퇴 후 작성하신 상품문의 및 후기, 댓글은 삭제되지 않으며, 회원정보 삭제로 인해 작성자 본인을 확인할 수 없어 편집 및 삭제처리가 원천적으로 불가능합니다.</li>
							<li>-상품문의 및 후기, 댓글 삭제를 원하시는 경우에는 먼저 해당 게시물을 삭제하신 후 탈퇴를 신청하시기 바랍니다.</li>
							<li>-이미 결제가 완료된 건은 탈퇴로 취소되지 않습니다.</li>
						</ul>
						<br>
						<font class="bold-font">2. 회원탈퇴 후 재가입 규정</font><br>
						<!-- react-text: 1695 -->
						개인 정보 보호 정책으로 재가입은 탈퇴일 6개월 후부터 가능하오니, 기간내 재가입을 원하실 경우, 고객센터(1588-5863) 또는 1:1 문의에 연락 부탁드립니다.
						<!-- /react-text -->
					</div>
					<div class="withdraw-agreement-box">
						<div class="checks">
							<input type="checkbox" id="ex_chk6" onclick="quitcheckbox();" value="on" name="ex_chk6" ><label for="ex_chk6">회원 탈퇴 시 처리사항 안내를 확인하였음에 동의합니다.</label>
							
						</div>
					</div>
				</div>
				
				<input type="hidden" name="quitCheckResult" id="quitCheckResult" value="0">
				<div class="pt30"></div>
				<div class="check-account-password-box">
					<table class="account-info-table">
						<tbody>
							<tr>
								<td class="td-1">
									<!-- react-text: 1706 -->회원명<!-- /react-text -->
									<!-- react-text: 1707 --> <!-- /react-text -->
									<!-- react-text: 1708 --><%=loginMember.getmName() %><!-- /react-text -->
								</td>
								<td class="td-1">
									<!-- react-text: 1710 -->ID <!-- /react-text -->
									<!-- react-text: 1711 --><%=loginMember.getmId() %><!-- /react-text -->
								</td>
								<td class="td-2"></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="pt30"></div>
				<div class="withdraw-submit-button" onclick="endquit();">회원탈퇴 신청</div>
			</div>
		</div>
	</div>
<script type="text/javascript">

function quitcheckbox(){
	var check = $('[name=ex_chk6]').prop('checked');
	if(check==true){
		$("#quitCheckResult").val("1");
		
	}else{
		$("#quitCheckResult").val("0");
		
	}	
};

function endquit() {
	
	var check = $('[name=ex_chk6]').prop('checked');
	if(check==true){
		window.location.href="<%=request.getContextPath()%>/home/login/quit_action.jsp";
	}else{
		alert("회원탈퇴에 동의해주세요.");
	}
	
}

	


</script>
</body>
</html>

