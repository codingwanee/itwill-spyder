
<%@page import="java.text.DecimalFormat"%>
<%@page import="site.home.dao.OrderDAO"%>
<%@page import="site.home.dto.OrderDTO"%>
<%@page import="site.home.dto.OrderDetailDTO"%>
<%@page import="java.util.List"%>
<%@page import="site.home.dao.OrderDetailDAO"%>
<%@include file="/home/security/login_status.jspf" %>
<%@page import="java.util.Calendar"%>
<%@page import="site.home.dto.MemberDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=loginMember.getmId();
	
	if(id==null) {
		id="";
	} else {
		//전달된 회원 아이디에 대한 회원정보 삭제
		session.removeAttribute("id");
	}
	
	String oCode=request.getParameter("oCode");
	
	List<OrderDetailDTO> orderDetailList= OrderDetailDAO.getDAO().getOrderDetail( oCode);
	OrderDTO order=OrderDAO.getDAO().getOrder(id, oCode);
	
	String state="";
	int baesong =3000;
	int sum = 0;
/* Calendar today = Calendar.getInstance ();
today.add ( Calendar.DATE, 1 );
Date tomorrow = today.getTime ( );
SimpleDateFormat formatter = new SimpleDateFormat ( "yyyy.MM.dd");
String dateResult = formatter.format(tomorrow); */
SimpleDateFormat dateForm = new SimpleDateFormat ( "yyyy.MM.dd");
SimpleDateFormat dt = new SimpleDateFormat("yyyyy-mm-dd hh:mm:ss"); 
%>

	<div class="mypage-contents">
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
				<div class="btn-box flex-box"  style="margin-left : 270px; ">
					<button class="btn red">쇼핑정보</button>
					<button class="btn " onclick="modifybutton();">개인정보</button>
					<button class="btn " onclick="faqbutton();">고객센터</button>
				</div>
			</div>
			<div class="page-title"><%if(order.getoStatus()<=6) {%>
				<div class="page-title-n">주문 상세</div>
				<%}else{ %>
					<div class="page-title-n">취소 상세</div>
				<%} %>
				<hr>
			</div>
			<div class="order-search-result-box">
				<div class="result-box">
					<div class="order-info-title-box">
						<div class="order-date-text-n"><%=dateForm.format(dt.parse(order.getoDate())) %></div>
						<div class="order-date-text-n">
							<!-- react-text: 718 -->
							&nbsp; |
						
							주문번호 : <%=order.getoCode() %>
						</div>
					</div>
					<table class="table-n">
						<tbody>
							<tr>
								
								<td class="order-product-td">
									<div class="product-list" >
									<%for(OrderDetailDTO orderD:orderDetailList){ %>
										<div class="order-product" >
											<a href="<%=request.getContextPath()%>/home/index.jsp?workgroup=product&work=product_detail&pName=<%=orderD.getpName()%>"><div class="product-img">
													<img alt="맨즈 로고 포인트 숏슬리브 티셔츠" class="product-img" 
														src="<%=request.getContextPath()%>/home/product/product_images/<%=orderD.getpImg()%>">
												</div></a>
											<div class="product-info-table">
												<ul>
													<li><div class="product-name"><%=orderD.getpName() %></div></li>
													<li><div class="product-info">
															<ul>
																<li>
																	컬러 : <%=orderD.getpColor() %>
																	<div class="info-value"></div>
																</li>
																<li>
																	사이즈 : 
																	<div class="info-value"><%=orderD.getpSize() %></div>
																</li>
																<li><div class="info-value">
																		<%=orderD.getOdQty() %> 개
																	</div></li>
															</ul>
															<div class="price">
																<%=DecimalFormat.getInstance().format(orderD.getpPrice()) %> 원
																<!-- /react-text -->
															</div>
														</div></li>
												</ul>
											</div>
										</div>
									<%} %>
									</div>
								</td>
								<td class="order-product-td " ><div class="order-state">
										<div class="center-box">
											<%if(order.getoStatus()==1){state="입금대기중";%>
											<%}else if(order.getoStatus()==2){ state="결제완료";	%>
											<%}else if(order.getoStatus()==3){ state="상품준비중";	%>
											<%}else if(order.getoStatus()==4){ state="상품준비완료";	%>
											<%}else if(order.getoStatus()==5){ state="배송중";	%>
											<%}else if(order.getoStatus()==6){ state="배송완료";	%>
											<%}else if(order.getoStatus()==7){ state="취소 대기중";	%>
											<%}else if(order.getoStatus()==8){ state="취소 완료";}	%>
											
											
											<div class="top-text"><%=state %></div>
										</div>
									</div></td>
								<td class="order-product-td" ><div class="order-menu">
									<%if(order.getoStatus()<=6) {%>
										<div class="center-box">
											<a class="baseLink" href="<%=request.getContextPath()%>/home/index.jsp?workgroup=login&work=order_cancel&oCode=<%=order.getoCode()%>">
												<div class="order-state-button">취소신청</div>
												</a>
										</div>
										<%} %>
									</div></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="flex-box">
				<div class="bg ship ship-box" style="width: 500px">
					<h1>배송지</h1>
					<span class="line">
						<!-- react-text: 766 -->받는분<!-- /react-text -->
						<!-- react-text: 767 --> <!-- /react-text -->
						<span class="right"><%=loginMember.getmName() %></span>
					</span><span class="line">
						<!-- react-text: 770 -->연락처<!-- /react-text -->
						<!-- react-text: 771 --> <!-- /react-text -->
						<span class="right"><%=loginMember.getmPhone() %></span>
					</span><span class="line">
						<!-- react-text: 774 -->주소<!-- /react-text -->
						<!-- react-text: 775 --> <!-- /react-text -->
						<span class="right">
							<!-- react-text: 777 --><%=loginMember.getmAddress1() %><!-- /react-text -->
							<!-- react-text: 778 --> <!-- /react-text -->
							<!-- react-text: 779 --><%=loginMember.getmAddress2() %><!-- /react-text -->
					</span>
					</span>
				</div>
				<div class="bg ship ship-box" style="margin-right: 0px; float:right; width: 500px" >
					<h1>주문 결제 정보</h1>
					<span class="line">
						<!-- react-text: 783 -->상품금액<!-- /react-text -->
						<!-- react-text: 784 --> <!-- /react-text -->
						<span class="right">
							<%if(order.getoTprice()<=30000){sum=order.getoTprice()-baesong; %> 원
							<%}else{baesong=0;} %>
						</span>
					</span>
					<span class="line ft13 lineH20">
						<!-- react-text: 807 -->배송비<!-- /react-text -->
						<!-- react-text: 808 --> <!-- /react-text -->
						<span class="right">
						 	<%=baesong %> 원
						</span>
					</span>
					<span class="line red">
						총 결제금액
						<span class="right"><%=order.getoTprice() %> 원
						</span>
					</span>
				</div>
			</div>

			<div style="margin-top: 40px; text-align: center;">
				<button class="red-white-btn" onclick="orderList()">주문 목록</button>
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
function orderList() {
	window.location.href="index.jsp?workgroup=login&work=mypage&oState=0";
};



</script>
