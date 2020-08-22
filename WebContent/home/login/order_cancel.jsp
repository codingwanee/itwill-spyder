<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="site.home.dao.OrderDAO"%>
<%@page import="site.home.dto.OrderDTO"%>
<%@page import="site.home.dao.OrderDetailDAO"%>
<%@page import="site.home.dto.OrderDetailDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file= "/home/security/login_status.jspf" %>
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
	
	SimpleDateFormat dt = new SimpleDateFormat("yyyyy-MM-dd"); 
	SimpleDateFormat dateForm = new SimpleDateFormat ( "yyyy.MM.dd");
	
	String state="";
	
/* Calendar today = Calendar.getInstance ();
today.add ( Calendar.DATE, 1 );
Date tomorrow = today.getTime ( );
SimpleDateFormat formatter = new SimpleDateFormat ( "yyyy.MM.dd");
String dateResult = formatter.format(tomorrow); */
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
			<div class="page-title">
				<div class="page-title-n">주문 상세</div>
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
						<%for(OrderDetailDTO orderD:orderDetailList){ %>
							<div class="cancel-order-product-item-n">
								<img alt="<%=orderD.getpName()%>" class="product-img"
									src="<%=request.getContextPath() %>/home/product/product_images/<%=orderD.getpImg()%>">
								<div class="product-info">
									<span class="name"><%=orderD.getpName() %></span><span class="price">
										<!-- react-text: 1398 --><%=orderD.getpPrice()%><!-- /react-text -->
										<!-- react-text: 1399 -->원<!-- /react-text -->
									</span><span class="var" style="margin-top: 28px;">
										<!-- react-text: 1401 -->컬러<!-- /react-text -->
										<!-- react-text: 1402 -->: <!-- /react-text -->
										<!-- react-text: 1403 --><%=orderD.getpColor() %><!-- /react-text -->
									</span><span class="var">
										<!-- react-text: 1405 -->사이즈<!-- /react-text -->
										<!-- react-text: 1406 -->: <!-- /react-text -->
										<!-- react-text: 1407 --><%=orderD.getpSize() %><!-- /react-text -->
									</span><span class="var">
										<!-- react-text: 1409 --><%=orderD.getOdQty() %><!-- /react-text -->
										<!-- react-text: 1410 --> <!-- /react-text -->
										<!-- react-text: 1411 -->개<!-- /react-text -->
									</span>
								</div>
								<div class="price-box">
									<span>
										<!-- react-text: 1414 --><%=DecimalFormat.getInstance().format(order.getoTprice()) %><!-- /react-text -->
										<!-- react-text: 1415 -->원<!-- /react-text -->
									</span>
								</div>
							</div>
						</div>
						<%} %>
						<div class="pt50"></div>
						<div style="">
						<%if(order.getoStatus()<=6) {%>
						<div class="center-box" style=" display: inline-block; margin-left: 42%; ">
							<a class="baseLink" href="<%=request.getContextPath()%>/home/login/cancel_action.jsp?oCode=<%=order.getoCode()%>&id=<%=id%>">
								<div id="btn_cancel">취소신청</div>
							</a>
						</div>
						<%} %>
						</div>
					</div>
				</div>
			</div>
<script type="text/javascript">
<%-- function cancel(){
	window.location.href="<%=request.getContextPath()%>/home/login/cancel_action.jsp?	
} --%>
</script>
			
