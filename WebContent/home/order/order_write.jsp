<%@page import="site.home.dto.OrderDTO"%>
<%@page import="site.home.dao.OrderDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="site.home.dao.MemberDAO"%>
<%@page import="javafx.scene.control.Alert"%>
<%@page import="site.home.dao.CartDAO"%>
<%@page import="site.home.dto.CartDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file= "/home/security/login_status.jspf" %>
	
<%
	if(request.getMethod().equals("GET")) {
		response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
		return;
	}
	String id=loginMember.getmId();
	
	if(id==null) {
		id="";
	} else {
		//전달된 회원 아이디에 대한 회원정보 삭제
		session.removeAttribute("id");
	}
	String[] checkId=request.getParameterValues("checkId");	

	

/* 	int qty=Integer.parseInt(request.getParameter("qty")); */
	
	List<CartDTO> cartList=CartDAO.getDAO().getCartbyOrder(checkId);
	OrderDTO order=OrderDAO.getDAO().getOrderREQUESTS(id);

	String loginAddress1="";
	String loginAddress2="";
	String recipient ="";
	String contact = "";
	String requests="";

	int sum = 0;
	int total = 0;
	int besong = 0;
	boolean onOff=true;

		if(order.getoAddress1()!=null && !order.getoAddress1().equals("")){
			loginAddress1 = order.getoAddress1();
		}
		
		if(order.getoAddress2()!=null && !order.getoAddress2().equals("")){
			loginAddress2 = order.getoAddress2();
		}
		
		if(order.getoRecipient()!=null && !order.getoRecipient().equals("")){
		    recipient = order.getoRecipient();
		}
		
		if(order.getoContact()!=null && !order.getoContact().equals("")){
		    contact = order.getoContact();
		}
		
		if(order.getoRequests()!=null && !order.getoRequests().equals("")){
		    requests = order.getoRequests();
		}


	


%>

<div class="app-children-box-100">
	<form id="order_write" target="checkout" method="POST">
		<div class="wide-container">
			<div id="popup" class="overlay">
			
			</div>
			<div class="cart-contents">
				<div class="pt50"></div>
				<div class="myinfo-box flex-box">
					<div class="title">주문/결제</div>
					<div class="status flex-box" style="width: 30%;">

					</div>
					<div class="order-flow">
						<span class="item ">
							1. 장바구니
						</span><span class="item active">
							2. 주문/결제
						</span><span class="item ">
							3. 주문완료
						</span>
					</div>
				</div>
				<div class="cart-list-section">
					<div class="header">
						<table>
							<tbody>
								<tr>
									<td class="header-title-1-pay">상품정보</td>
									<td class="header-title-2-leftBorder">상품금액</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="contents">
					
						<%--장바구니 리스트 출력 --%>
						<%for(CartDTO cart:cartList){ %>
						
						<input type="hidden" name="cQty" value="<%=cart.getcQty() %>">	
						<input type="hidden" name="cId" value="<%=cart.getcId() %>">	
						<input type="hidden" name="cProductCode" value="<%=cart.getcProductCode() %>">	
						

						
						<div class="cart-product-item">
							<div class="product-info" style="width: 795px;">
								<div class="product-img-pay">
									<div class="img-box">
										<img alt="<%=cart.getpName()%>"
											src="<%=request.getContextPath() %>/home/product/product_images/<%=cart.getpImg()%>">
									</div>
								</div>
								<div class="confirmed-box-pay">
									<div class="confirmed-name"><%=cart.getpName() %></div>
									<div class="confirmed-product-price">
										<span class="price"><%=cart.getpPrice() %></span>
										<span class="won">
										원
										</span>
									</div>
									<div class="confirmed-detail">
										<ul>
											<li>
											 	컬러 : <%=cart.getpColor()%> 
											</li>
											<li>
												사이즈 : <%=cart.getpSize()%>
											</li>
											<li><%=cart.getcQty() %>개</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="product-price-pay">
								<div class="price-box">
									<%sum = cart.getcQty()* cart.getpPrice();%>
									<div class="price"><%=DecimalFormat.getInstance().format(sum) %></div>
									<div class="won">원</div>
									<%total = total+sum;%>
									<%sum = 0; %>
								</div>
							</div>
						</div>
						<%} %>
					</div>
				</div>
				
				
						<input type="hidden" name="mId" value="<%=loginMember.getmId() %>">	
						
							
				<div class="member-order">
					<div class="pt50"></div>
					<div class="flex-box">
						<div class="n-order-box">
							<h1>주문고객/배송지 정보</h1>
							<div class="flex-box">
								<div class="sub-title">
									<span>이름</span><span style="margin-top: 0px;">연락처</span>
								</div>
								<div class="sub-val">
									<span><%=loginMember.getmName() %></span>
									<span style="margin-top: 4px;">
										<%=loginMember.getmPhone()%> / <%=loginMember.getmEmail()%>
									</span>
								</div>  
							</div>
							
							
							<div class="flex-box" style="margin-top: 26px; margin-bottom: 16px;">
								
								<div class="on " id="recentAdress"  onclick="recentAdress_action()">
									<span>최근 배송지</span>
								</div>
								
								<div class="off " id="newAdress" onclick="newAdress_action()" style="width: 50%; cursor: pointer;">
									<span>새로운 배송지</span>
								</div>
							</div>
							
							
							<span class="title">받는분</span>
							<input type="text" name="recipient" id="recipient" class="input-wide" placeholder="" value="<%=recipient %>">
							
							<div style="display: none; margin-top: 10px;">
								<span class="title">이메일</span><input type="text" class="input-wide" placeholder="">
							</div>
							
							<span class="title mt20">주소</span>
							
							<div class="flex-box">
								<input type="text" id="loginAddress1" class="input-addr" value="<%=loginAddress1 %>"
									readonly="" name="loginAddress1" placeholder="주소">
								<a onclick="popupzipcode();"><div class="button"  style="margin-right: -6px;">우편번호</div></a>
							</div>
							
							<input type="text" name="loginAddress2" id="loginAddress2" class="input-wide" value="<%=loginAddress2%>" placeholder="상세주소" >
							<div>
								<span class="title mt20">연락처</span>
								<input type="text" name="contact" id="contact"  class="input-wide" placeholder="010-1234-5678" value="<%=contact%>">
							</div>
							
							<span class="title mt20">배송시 요청사항</span>
							<textarea class="message" id="requests" name="requests" maxlength="50" placeholder="" ><%=requests %></textarea>
						</div>
						
						
						<div class="n-order-box-r">
							
							<!-- order.css =>  element.style에서 margin-top 10삭제  -->
							
							<div class="benefit-box" style="min-height: 155px;">
								<h1>최종 결제 금액</h1>
								<div class="flex-box">
									<div class="paregrahp-l">
										<span class="big">
											<!-- react-text: 2782 -->주문 상품 금액<!-- /react-text -->
											<span class="fl-r">
												<!-- react-text: 2784 --><%=total%><!-- /react-text -->
												<!-- react-text: 2785 -->원<!-- /react-text -->
										</span>
										</span>
										<span class="small">
										<%if(besong<2500 && total<=30000 && total!=0){  besong = 2500;} %>										
											배송비
											<span class="fl-r">
												<%=DecimalFormat.getInstance().format(besong)%>원
											</span>
										</span>
										<span class="big red">
											<!-- react-text: 2802 -->총 결제 금액<!-- /react-text -->
											<span class="fl-r">
												<%total=total+besong; %>		
												<%=DecimalFormat.getInstance().format(total)%>원
																						
												<input type="hidden" name="total" value="<%=total %>">	
											</span>
										</span>
									</div>
								</div>
							</div>
								<input type="hidden" id="payment" name="payment" value="Credit_checkCard">
							<div class="benefit-box" style="margin-top: 10px;">
								<h1>결제수단</h1>
								<div class="pay-method-tab">
									<span id="Credit_checkCard" class="item active" onclick="payment(this.id)">
										<span class="text">신용/체크카드</span>
									</span>
									<span id="Virtual" class="item " onclick="payment(this.id)">
										<span class="text">가상계좌</span>
									</span>
									<span id="Escrow" class="item " onclick="payment(this.id)">
										<span class="text">가상계좌(에스크로)</span>
									</span>
									<span id="Visa" class="item " onclick="payment(this.id)">
										<span class="text">Visa / Master /JCB</span>
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="rule-agreement-block">
					<table class="agreement-table">
						<tbody>
							<tr>
								<td colspan="2" class="agree-title">결제 대행서비스 약관 및 개인정보 제공
									주의사항에 동의합니다.</td>
								<td class="right-td"><div class="checks" style="margin-top: 5px;">
									<input type="checkbox" id="ex_chk" value="on" class="check">
									<label for="ex_chk"></label>
									</div></td>
							</tr>
						</tbody>
					</table>
					<div class="agreement-content">
						<div class="payagreement-content">
							<h2 style="font-size: 15px;">주문동의</h2>
							<!-- react-text: 2835 -->
							주문할 상품의 상품명, 상품가격, 배송정보를 확인하였으며, 구매에 동의합니다.
							<!-- /react-text -->
							<br>
							<!-- react-text: 2837 -->
							(전자상거래법 제 8조 2항)
							<!-- /react-text -->
							<br>
							<p>개인정보의 수집 및 이용 안내</p>
							<p>1. 개인정보의 처리 목적</p>
							<p>글로벌브랜드그룹코리아유한회사('https://www.spyder.co.kr'이하 ‘스파이더 온라인
								몰’)는 개인정보를 다음의 목적을 위해 처리합니다. 처리한 개인정보는 다음의 목적이외의 용도로는 사용되지 않으며
								이용 목적이 변경될 시에는 사전동의를 구할 예정입니다.</p>
							<ul>
								<li>가. 홈페이지 회원가입 및 관리</li>
								<li>회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별·인증, 회원자격 유지·관리, 제한적
									본인확인제 시행에 따른 본인확인, 서비스 부정이용 방지, 만14세 미만 아동 개인정보 수집 시 법정대리인 동의
									여부 확인, 각종 고지·통지, 고충처리, 분쟁 조정을 위한 기록 보존 등을 목적으로 개인정보를 처리합니다.</li>
								<li>나. 민원사무 처리</li>
								<li>민원인의 신원 확인, 민원사항 확인, 사실조사를 위한 연락·통지, 처리결과 통보 등을 목적으로
									개인정보를 처리합니다.</li>
								<li>다. 재화 또는 서비스 제공</li>
								<li>물품배송, 서비스 제공, 청구서 발송, 콘텐츠 제공, 맞춤 서비스 제공, 본인인증, 연령인증,
									요금결제·정산, 채권추심 등을 목적으로 개인정보를 처리합니다.</li>
								<li>라. 마케팅 및 광고에의 활용</li>
								<li>신규 서비스(제품) 개발 및 맞춤 서비스 제공, 이벤트 및 광고성 정보 제공 및 참여기회 제공 ,
									인구통계학적 특성에 따른 서비스 제공 및 광고 게재 , 서비스의 유효성 확인 등을 목적으로 개인정보를 처리합니다.</li>
							</ul>
							<p>2. 개인정보 파일 현황</p>
							<p>개인정보 파일명 : 스파이더 온라인 몰 회원정보</p>
							<ul>
								<li>- 개인정보 항목 : 이메일, 휴대전화번호, 비밀번호, 로그인ID, 성별, 생년월일, 이름, 서비스
									이용 기록, 접속 로그, 쿠키, 접속 IP 정보, 결제기록, 법정대리인 이름, 법정대리인 자택 전화번호,
									법정대리인 자택 주소, 법정대리인 휴대전화번호</li>
								<li>- 수집방법 : 홈페이지, 제휴사로부터 제공 받음</li>
								<li>- 보유근거 : 주문상품 배송에 활용, 회원에 대한 각종 편의 서비스 제공, 관계사별 서비스 및
									이벤트 제공 (SMS/전자우편(E-mail)/DM/TM 등), 제휴행사 및 서비스 홍보를 위한 마케팅 자료 활용,
									업무에 관련된 통계자료 작성 및 서비스 개발</li>
								<li>- 보유기간 : 5년</li>
								<li>- 관련법령 : 계약 또는 청약철회 등에 관한 기록 : 5년</li>
							</ul>
							<p>3. 개인정보의 처리 및 보유 기간</p>
							<ul>
								<li>① 글로벌브랜드그룹코리아유한회사('https://www.spyder.co.kr'이하 ‘스파이더
									온라인 몰’)는 법령에 따른 개인정보 보유·이용기간 또는 정보주체로부터 개인정보를 수집시에 동의 받은 개인정보
									보유,이용기간 내에서 개인정보를 처리,보유합니다.</li>
								<li>② 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.</li>
								<li>가.[홈페이지 회원가입 및 관리]</li>
								<li>홈페이지 회원가입 및 관리와 관련한 개인정보는 수집.이용에 관한 동의일로부터 5년까지 위 이용목적을
									위하여 보유.이용됩니다.</li>
								<li>-보유근거 : 개인정보보호법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률</li>
								<li>-관련법령 : 계약 또는 청약철회 등에 관한 기록 : 5년</li>
								<li>나. [재화 또는 서비스 제공]</li>
								<li>재화 또는 서비스 제공와 관련한 개인정보는 수집.이용에 관한 동의일로부터 5년까지 위 이용목적을
									위하여 보유.이용됩니다.</li>
								<li>-보유근거 : 개인정보보호법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률</li>
								<li>-관련법령 : 대금결제 및 재화 등의 공급에 관한 기록 : 5년</li>
							</ul>
							<p>4. 개인정보의 제3자 제공에 관한 사항</p>
							<ul>
								<li>① 글로벌브랜드그룹코리아유한회사('https://www.spyder.co.kr'이하 ‘스파이더
									온라인 몰’)는 정보주체의 동의, 법률의 특별한 규정 등 개인정보 보호법 제17조 및 제18조에 해당하는 경우에만
									개인정보를 제3자에게 제공합니다.</li>
								<li>② 글로벌브랜드그룹코리아유한회사('https://www.spyder.co.kr'이하 ‘스파이더
									온라인 몰’)는 다음과 같이 개인정보를 제3자에게 제공하고 있습니다.</li>
								<li>가. INICIS, 서울보증보험(주), KAKAO</li>
								<li>- 개인정보를 제공받는 자 : KCP, 서울보증보험(주), KAKAO</li>
								<li>- 제공받는 자의 개인정보 이용목적 : 휴대전화번호, 성별, 생년월일, 이름, 회원가입여부</li>
								<li>- 제공받는 자의 보유.이용기간: 지체없이 파기</li>
								<li>나. []일양택배]</li>
								<li>- 개인정보를 제공받는 자 : 일양택배</li>
								<li>- 제공받는 자의 개인정보 이용목적 : 수령자 이름, 연락처, 주소</li>
								<li>- 제공받는 자의 보유.이용기간: 5년</li>
							</ul>
							<p>5. 개인정보처리 위탁</p>
							<ul>
								<li>① 글로벌브랜드그룹코리아유한회사('https://www.spyder.co.kr'이하 ‘스파이더
									온라인 몰’)는 원활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다.</li>
								<li>가. [본인인증 및 결제대행, 주문자에게 결제정보 전달]</li>
								<li>- 위탁받는 자 (수탁자) : INICIS, KAKAO</li>
								<li>- 위탁하는 업무의 내용 : 구매 및 요금 결제, 물품배송 또는 청구서 등 발송,
									본인인증(금융거래, 금융서비스), 회원제 서비스 이용에 따른 본인확인</li>
								<li>- 위탁기간 : 5년</li>
								<li>나. []보증보험 가입]</li>
								<li>- 위탁받는 자 (수탁자) : 서울보증보험(주)</li>
								<li>- 위탁하는 업무의 내용 : 쇼핑몰 보증보험 가입 및 가입대상 확인</li>
								<li>- 위탁기간 : 5년</li>
								<li>다. [재화의 배송]</li>
								<li>- 위탁받는 자 (수탁자) : 일양택배</li>
								<li>- 위탁하는 업무의 내용 : 물품배송 또는 청구서 등 발송</li>
								<li>- 위탁기간 : 5년</li>
								<li>② 글로벌브랜드그룹코리아유한회사('https://www.spyder.co.kr'이하 ‘스파이더
									온라인 몰’)는 위탁계약 체결시 개인정보 보호법 제25조에 따라 위탁업무 수행목적 외 개인정보 처리금지,
									기술적․관리적 보호조치, 재위탁 제한, 수탁자에 대한 관리․감독, 손해배상 등 책임에 관한 사항을 계약서 등
									문서에 명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다.</li>
								<li>③ 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보 처리방침을 통하여 공개하도록
									하겠습니다.</li>
							</ul>
						</div>
					</div>
				</div>
				<br>
				<div class="order-guide">
					[배송안내]
					<br>
					* 2가지 이상의 상품을 주문하신 경우 당사 재고 사정으로 각기 배송이 될 수 있는 점 양해 부탁드립니다.
					<br>
					<br>
					<br>
				</div>
				<div class="cart-button-section">
					<div class="cart-button cart-shopping-button" onclick="shopping()">계속 쇼핑하기</div>
					<div id="order_buy" onclick="orderClick()" class="cart-button cart-member-order-button">결제하기</div>
				</div>
			</div>
		</div>
	</form>
</div>

<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js?autoload=false"></script>

<script type="text/javascript">






function orderClick() {
	
	
    if($("#recipient").val()=="") {
		alert("받을 분을 입력해주세요.");
		return;
	}	
	

    if($("#loginAddress1").val()=="") {
		alert("우편번호를 입력 해 주세요.");
		return;
	}
	
    if($("#loginAddress2").val()=="") {
		alert("상세주소를 입력 해 주세요.");
		return;
	}
    
	var mPhoneReg= /\d{3}-\d{3,4}-\d{4}$/;
    if($("#contact").val()=="") {
		alert("연락처를 입력 해 주세요 ");
		return;
	} else if(!mPhoneReg.test($("#contact").val())) {
		alert("연락처를 010-1234-5678 형식으로 입력해주세요. ");
		return;
	} 
	
	if($(".check").filter(":checked").size()==0) {
		alert("결제 약관 및 주의사항에 동의해 주세요.");
		return;
	}
	
	
	$("#order_write").attr("method","post");
	$("#order_write").attr("action","<%=request.getContextPath()%>/home/order/order_write_action.jsp");
	$("#order_write").submit();
	window.location.href = '<%=request.getContextPath()%>/home/index.jsp';
	
	
	window.close();
	
}

function payment(checkId) {
	$("#Credit_checkCard").removeClass("active");
	$("#Virtual").removeClass("active");
	$("#Escrow").removeClass("active");
	$("#Visa").removeClass("active");
	$("#"+checkId).addClass("active");
	$("#payment").val(checkId);
}


function recentAdress_action() {
	$("#loginAddress1").val("<%=loginAddress1%>");
	$("#loginAddress2").val("<%=loginAddress2%>");
	$("#recipient").val("<%=recipient%>");
	$("#contact").val("<%=contact%>");
	$("#requests").val('<%=requests.replace("\r\n", "<br>")%>'.replace("<br>","\r\n"));
	$("#recentAdress").removeClass("bg-off");
	$("#recentAdress").addClass("bg-on");
	$("#newAdress").removeClass("bg-on");
	$("#newAdress").addClass("bg-off");
}

function newAdress_action() {
	$("#loginAddress1").val("");
	$("#loginAddress2").val("");
	$("#requests").val("");
	$("#newAdress").removeClass("bg-off");
	$("#newAdress").addClass("bg-on");
	$("#recentAdress").removeClass("bg-on");
	$("#recentAdress").addClass("bg-off");
}





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
                    document.getElementById("loginAddress1").value = extraAddr;
                } else {
                    document.getElementById("loginAddress1").value = '';
                }
                document.getElementById('loginAddress1').value = data.zonecode;
                document.getElementById("loginAddress1").value = addr;
                document.getElementById("loginAddress2").focus();
            }
        }).open();
    });
}


	

</script>









