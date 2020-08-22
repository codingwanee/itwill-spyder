<%@page import="java.util.Date"%>
<%@page import="site.home.dao.OrderDetailDAO"%>
<%@page import="site.home.dto.OrderDetailDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="site.home.dto.OrderDTO"%>
<%@page import="site.home.dao.OrderDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/home/security/login_status.jspf" %>
<%
	String id=loginMember.getmId();
	
	if(id==null) {
		id="";
	} else {
		session.removeAttribute("id");
	}
	
	int oState= Integer.parseInt(request.getParameter("oState"));
	
	System.out.println("oState = "+oState);
	
	List<OrderDTO> orderList = OrderDAO.getDAO().getOrderList(id, oState);

	SimpleDateFormat dt = new SimpleDateFormat("yyyyy-MM-dd"); 
	SimpleDateFormat dateForm = new SimpleDateFormat ( "yyyy.MM.dd");
	
	

	
	
	String state="";
	int cnt=0;
%>
<link href="../home.css" rel="stylesheet" type="text/css">
<style type="text/css">
.search-button2 {
	border: 1px solid #6d6d6d;
	cursor: pointer;
	display: inline-block;
	margin-left: 20px;
	font-weight: 300;
	padding: 7px 0;
	margin-top: 2px;
	text-align: center;
	vertical-align: top;
	width: 78px;
	font-size: 13px;
	color: #6d6d6d;
	transform: translateY(-10%);
	background-color: white;
}
</style>

	<div class="mypage-right-view">
							<div id="popup" class="overlay">
								<div class="delivery-info-content">
									<div class="close-button">X</div>
									<div class="popup-title">배송기본정보</div>
									<table class="delivery-customer-table">
										<tbody>
											<tr>
												<td class="left-td td-padding-top">보내는 분</td>
												<td class="right-td td-padding-top">이상문</td>
											</tr>
											<tr>
												<td class="left-td">주소</td>
												<td class="right-td">서울시 관악구 봉천동(도로명 주소)</td>
											</tr>
											<tr>
												<td class="left-td">상품정보</td>
												<td class="right-td">스파이더기본티셔츠 외 2건</td>
											</tr>
											<tr>
												<td class="left-td">택배사</td>
												<td class="right-td">일양택배(1588-9988</td>
											</tr>
											<tr>
												<td class="left-td td-padding-bottom">운송장번호</td>
												<td class="right-td td-padding-bottom">1234565</td>
											</tr>
										</tbody>
									</table>
									<table class="delivery-info-table">
										<tbody>
											<tr>
												<td class="header-td td-1">날짜</td>
												<td class="header-td td-1">배송단계</td>
												<td class="header-td td-1">현재위치</td>
												<td class="header-td td-1">배송상태</td>
												<td class="header-td td-1">배송기사 연락처</td>
											</tr>
											<tr>
												<td class="normal-td td-1">
													<!-- react-text: 2002 -->2016-09-26<!-- /react-text -->
													<br>
												<!-- react-text: 2004 -->00:00<!-- /react-text --></td>
												<td class="normal-td td-2">인수전</td>
												<td class="normal-td td-3">하남</td>
												<td class="normal-td td-4">집하입고</td>
												<td class="normal-td td-5">
													<!-- react-text: 2009 -->이산욱<!-- /react-text -->
													<br>
												<!-- react-text: 2011 -->0101111111<!-- /react-text --></td>
											</tr>
											<tr>
												<td class="normal-td td-1">
													<!-- react-text: 2014 -->2016-09-26<!-- /react-text -->
													<br>
												<!-- react-text: 2016 -->00:00<!-- /react-text --></td>
												<td class="normal-td td-2">집하완료</td>
												<td class="normal-td td-3">하남</td>
												<td class="normal-td td-4">터미널입고</td>
												<td class="normal-td td-5">
													<!-- react-text: 2021 -->이산욱<!-- /react-text -->
													<br>
												<!-- react-text: 2023 -->0101111111<!-- /react-text --></td>
											</tr>
											<tr>
												<td class="normal-td td-1">
													<!-- react-text: 2026 -->2016-09-26<!-- /react-text -->
													<br>
												<!-- react-text: 2028 -->00:00<!-- /react-text --></td>
												<td class="normal-td td-2">배송중</td>
												<td class="normal-td td-3">하남</td>
												<td class="normal-td td-4">터미널출고</td>
												<td class="normal-td td-5">
													<!-- react-text: 2033 -->이산욱<!-- /react-text -->
													<br>
												<!-- react-text: 2035 -->0101111111<!-- /react-text --></td>
											</tr>
										</tbody>
									</table>
									<span class="delivery-announce">배송단계안내</span>
									<table class="delivery-announce-table">
										<tbody>
											<tr>
												<td class="left-td">집화입고</td>
												<td class="right-td">택배사가 배송할 상품을 인계하였습니다.</td>
											</tr>
											<tr>
												<td class="left-td">상품이동중</td>
												<td class="right-td">고객님의 인근 터미널/간선으로 이동 중입니다.</td>
											</tr>
											<tr>
												<td class="left-td">배송지도착</td>
												<td class="right-td">고객님의 인근 터미널/간선에 도착하였습니다.</td>
											</tr>
											<tr>
												<td class="left-td">배송출발</td>
												<td class="right-td">고객님의 인근 터미널/간선에서 고객님의 인수처로 출발하였습니다.</td>
											</tr>
											<tr>
												<td class="left-td">배송완료</td>
												<td class="right-td">고객님이 상품을 인수하였습니다.</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
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
			<div class="btn-box flex-box" style="margin-left : 270px; ">
				<button class="btn red">쇼핑정보</button>
				<button class="btn" onclick="modifybutton();">개인정보</button>
				<button class="btn" onclick="faqbutton();">고객센터</button>
			</div>
		</div>
		
		
		
		
		<input type="hidden" name="orderCheck" value="<%=oState%>">	
		<div class="flex-box">
			<button id="order_ok" class="top-menu-btn on" style="border-left: 0px;" onclick="orderOk()">주문/배송</button>
			<button id="cancel" class="top-menu-btn off" style="border-right: 0px;" onclick="ordercancel()">취소/반품</button>
		</div>
		<%for(OrderDTO order:orderList) { %>
		<div class="result-box">
			<div style="display: block">
				<div class="order-title-box">
					<span class="order-title">
					 <%=dateForm.format(dt.parse(order.getoDate())) %> | 주문번호 <%=order.getoCode() %>
					</span>
					<a class="baseLink baseLinkColor" href="<%=request.getContextPath()%>
						/home/index.jsp?workgroup=login&work=buydetail&oCode=<%=order.getoCode() %>">
						<span class="order-detail">주문상세</span>
					</a>
				</div>
				<div class="item-box">
						<%	
							OrderDetailDTO odList = OrderDetailDAO.getDAO().getOrderDetailImg(id,order.getoCode());
							
						%>
					<div class="box1">
						<%System.out.println("order.getoCode() = "+order.getoCode()); %>
						<%System.out.println("getOrderDetailbyId = "+odList.getpImg()); %>
						<img src="<%=request.getContextPath()%>/home/product/product_images/<%=odList.getpImg()%>">
					</div>
					<div class="box2">
						<span class="title"><%= odList.getpName()%></span><span class="info" style="margin-top: 15px;">
							<!-- react-text: 852 -->컬러<!-- /react-text -->
							<!-- react-text: 853 --> : <!-- /react-text -->
							<!-- react-text: 854 --><%= odList.getpColor()%><!-- /react-text -->
						</span><span class="info">
							사이즈 : <%= odList.getpSize()%>
						</span><%-- <span class="info">
							종류 : 
							<%for(int j=0;j<odList.size();j++){ 
								
								if(odList.get(j).getOdProductCode()!=null || !odList.get(j).getOdProductCode().equals(""))
								{cnt++;}
							%>
							<%System.out.println("odListSize = "+odList.size()); %>
							<%} %>
							<%=cnt %>
							<%cnt=0; %> 
							개
						</span> --%><span class="price fontDinBold">
							<!-- react-text: 866 --><%= odList.getpPrice()%><!-- /react-text -->
							<!-- react-text: 867 -->원<!-- /react-text -->
						</span>
					</div>
					<div class="box3">
						<div class="center-box">
							<%if(order.getoStatus()==1){state="입금대기중";%>
							<%}else if(order.getoStatus()==2){ state="결제완료";	%>
							<%}else if(order.getoStatus()==3){ state="상품준비중";	%>
							<%}else if(order.getoStatus()==4){ state="상품준비완료";	%>
							<%}else if(order.getoStatus()==5){ state="배송중";	%>
							<%}else if(order.getoStatus()==6){ state="배송완료";	%>
							<%}else if(order.getoStatus()==7){ state="취소 대기중";	%>
							<%}else if(order.getoStatus()==8){ state="취소 완료";}	%>
											
							<div class="stat"><%=state %></div>
						</div>
					</div>
					<div class="box3" style="padding-left: 20px;">
						<%if(order.getoStatus()<=6) {%>
						<div class="center-box">
							<a class="baseLink" href="<%=request.getContextPath()%>/home/index.jsp?workgroup=login&work=order_cancel&oCode=<%=order.getoCode()%>">
							<button class="btn">취소신청</button></a>
						</div>
						<%} %>
					</div>
				</div>
			</div>
		<%--------------------------------------------------------------------------------------------------------------------------------------------------------%>
			
		</div>
		<%} %>
		<div class="pt70"></div>
		<div class="sub-title">
			<span>주문/배송 상태 안내</span>
		</div>
		<div class="result-box" style="text-align: center;">
			<div class="circle-area">
				<div class="circle-box circle-grey">
					<div class="title">입금대기중</div>
				</div>
				<span> <!-- react-text: 2137 -->익일 자정까지<!-- /react-text --> <br>
					<!-- react-text: 2139 -->미입금 시,<!-- /react-text --> <br> <!-- react-text: 2141 -->주문취소<!-- /react-text --></span>
			</div>
			<div class="circle-area">
				<div class="circle-box circle-grey">
					<div class="title">주문완료</div>
				</div>
				<span> <!-- react-text: 2146 -->입금확인<!-- /react-text --> <br>
					<!-- react-text: 2148 -->및 결제 완료상태<!-- /react-text --> <br> <!-- react-text: 2150 -->주문취소<!-- /react-text -->
					<br> <!-- react-text: 2152 -->/배송지변경 가능<!-- /react-text --></span>
			</div>
			<div class="circle-area">
				<div class="circle-box circle-red">
					<div class="title">상품준비중</div>
				</div>
				<span> <!-- react-text: 2157 -->배송을 위한 상품을<!-- /react-text -->
					<br> <!-- react-text: 2159 -->포장중<!-- /react-text --> <br>
					<!-- react-text: 2161 -->주문취소불가<!-- /react-text --></span>
			</div>
			<div class="circle-area">
				<div class="circle-box circle-red">
					<div class="title">배송준비완료</div>
				</div>
				<span> <!-- react-text: 2166 -->송장출력후<!-- /react-text --> <br>
					<!-- react-text: 2168 -->배송대기상태<!-- /react-text --></span>
			</div>
			<div class="circle-area">
				<div class="circle-box circle-red">
					<div class="title">배송완료</div>
				</div>
				<span> <!-- react-text: 2173 -->배송시작상태<!-- /react-text --> <br>
					<!-- react-text: 2175 -->송장확인가능<!-- /react-text --></span>
			</div>
			<div class="circle-area">
				<div class="circle-box circle-blk">
					<div class="title">수령확인</div>
				</div>
				<span> <!-- react-text: 2180 -->마일리지 적립<!-- /react-text --> <br>
					<!-- react-text: 2182 -->/반품신청 가능<!-- /react-text --></span>
			</div>
		</div>
		<div class="stat-color">
								<div class="grey">주문취소가능</div>
								<div class="red">주문취소불가</div>
								<div class="blk">
									<!-- react-text: 2187 -->마일리지적립<!-- /react-text/ -->
									<br>
									<!-- react-text: 2189 -->/반품신청가능<!-- /react-text -->
								</div>
							</div>
						</div>
<script type="text/javascript">
function modifybutton() {
	window.location.href="index.jsp?workgroup=login&work=modify_confirm";
};
function faqbutton() {
	window.location.href="index.jsp?workgroup=board&work=faq";
};

function orderOk() {
	window.location.href="index.jsp?workgroup=login&work=mypage&oState=0";
	$("#order_ok").removeClass("off");
	$("#order_ok").addClass("on");
	$("#cancel").removeClass("on");
	$("#cancel").addClass("off");
}

function ordercancel() {
	window.location.href="index.jsp?workgroup=login&work=mypage&oState=7";
	$("#cancel").removeClass("off");
	$("#cancel").addClass("on");
	$("#order_ok").removeClass("on");
	$("#order_ok").addClass("off");
}


</script>

