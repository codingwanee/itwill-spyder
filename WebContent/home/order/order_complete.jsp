<%@page import="java.util.List"%>
<%@page import="site.home.dto.OrderDTO"%>
<%@page import="site.home.dao.OrderDAO"%>
<%@page import="site.home.dao.OrderDetailDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file= "/home/security/login_status.jspf" %>
	
<%
	String id=loginMember.getmId();
	String oCode=request.getParameter("oCode");
	System.out.println("oCode = "+oCode);
	OrderDTO order =OrderDAO.getDAO().getOrder(id,oCode);
	String state= "";
	if(order.getoStatus()==1){
	    state="예약";
	} else {
	  	state="주문";  
	}
	
%>
	<div class="order-result-account-transfer-content">
		<div class="order-flow-component">
			<span class="item ">1. 장바구니</span><span class="item ">2. 주문/결제</span><span
				class="item active">3. 주문완료</span>
		</div>
		<div class="order-result-text-1">
			<b><%=loginMember.getmName() %></b>
			<!-- react-text: 347 -->
			님의 주문이 정상적으로
			<!-- /react-text -->
			<b><%=state %></b>
			<!-- react-text: 349 -->
			되었습니다.
			<!-- /react-text -->
		</div>
		<div class="order-result-text-2">입금기한 내에 상품이 판매 종료, 품절시 예약이 취소될
			수 있습니다.</div>
		<table class="order-result-account-table ">
			<tbody>
				<tr>
					<td class="left-td"><b>입금은행</b></td>
					<td class="right-td"><img class="arrow-btn"
						src="//d319d1tzjwpwbb.cloudfront.net/desktop/icons/open_red.svg"></td>
				</tr>
				<tr>
					<td class="left-td"><ul>
							<li>주문번호</li>
							<li>입금액</li>
	
						</ul></td>
					<td class="right-td">
						<ul>
							<li>
							<%=order.getoCode() %>
							</li>
							<li>
								<!-- react-text: 372 --><%=order.getoTprice()%><!-- /react-text -->
								<font class="won">원</font>
							</li>

						</ul>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="hr-td"><hr></td>
				</tr>
			</tbody>
		</table>
		<table
			class="order-result-info-table-component order-account-info  existAddress2">
			<tbody>
				<tr>
					<td class="left-td"><b>배송정보</b></td>
					<td class="right-td"><img class="arrow-btn"
						src="//d319d1tzjwpwbb.cloudfront.net/desktop/icons/open_red.svg"></td>
				</tr>
				<tr>
					<td class="left-td"><ul>
							<li>받는분</li>
							<li>연락처1</li>
							<li>주소</li>
							<li></li>
						</ul></td>
					<td class="right-td"><ul>
							<li><%=order.getoRecipient() %></li>
							<li><%=order.getoContact() %></li>
							<li>
								<!-- react-text: 414 --><%=order.getoAddress1() %><!-- /react-text -->
								<!-- react-text: 415 --> <!-- /react-text -->
								<!-- react-text: 416 --><%=order.getoAddress2() %><!-- /react-text -->
							</li>
						</ul></td>
				</tr>
			</tbody>
		</table>
		<div class="pt30"></div>
		<div class="pt40"></div>
		<table class="order-button-table">
			<tbody>
				<tr>
					<td>
						<a class="baseLink" href="<%=request.getContextPath()%>/home/index.jsp">
							<button class="red-white-btn">계속 쇼핑하기</button>
						</a>
					</td>
					<td>
						<a class="baseLink" href="<%=request.getContextPath()%>/home/index.jsp?workgroup=login&work=buydetail&oCode=<%=order.getoCode()%>">
							<button class="red-btn">주문 상세보기</button>
						</a>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="pt30"></div>
	</div>
