<%@page import="site.home.dto.MemberDTO"%>
<%@page import="site.home.dto.ProductDTO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="site.home.dao.CartDAO"%>
<%@page import="java.util.List"%>
<%@page import="site.home.dto.CartDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file= "/home/security/login_status.jspf" %>
<%
	String id=loginMember.getmId();
	
	if(id==null) {
		id="";
	} else {
		session.removeAttribute("id");
	}

	List<CartDTO> cartList=CartDAO.getDAO().getCartList(id);
	
	int total = 0;
	int sum = 0;
	int besong = 0;
	
	int qty_check =0;
	int sum_check =0;
	
	String del_sel = "0";
	
%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"> 
</script>
<link rel="stylesheet"	href="<%=request.getContextPath() %>/home/home.css">

			
			<!-- 장바구니 내용(body) -->
			<div class="app-children-box-100">
				<div class="wide-container">
					<div class="cart-contents">
					
						<!-- 장바구니 내정보  -->
						<div class="myinfo-box flex-box">
							<div class="title">장바구니</div>
							<div class="status flex-box" style="width: 35%;">
							
							</div>
							<div class="order-flow">
								<span class="item active">
									1.장바구니
								</span><span class="item ">
									2.주문/결제
								</span><span class="item ">
									3.주문완료
								</span>
							</div>
						</div>
							
						<form name="cartForm" id="cartForm">
						<!-- 전체 선택 체크 박스 -->
						<div class="checks-cart">
							<input type="checkbox" id="allCheck">
						</div>
						<span>전체 선택</span>
						<div class="cart-item-delete" id="removeBtn" >삭제</div>
							
						<!-- 장바구니 테이블 -->
						<div class="cart-list-section">
							<div class="header">
								<table>
									<tbody>
										<tr>
											
											<td class="header-title-1">상품정보</td>
											<td class="header-title-2">수량</td>
											<td class="header-title-3">상품금액</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="contents">
								
								<!-- 장바구니 상품 리스트 1 -->
								<% for(CartDTO cart:cartList) {%>
								<div class="cart-product-item">
									<div class="product-info">
										<div class="test-disable"></div>
										<div class="checkbox checks-cart">
											
											<input type="checkbox" name="checkId" value="<%=cart.getcId()%>" class="check" >
										</div>
										<div class="product-img">
											<a href="<%=request.getContextPath()%>/home/index.jsp?workgroup=product&work=product_detail&pName=<%=cart.getpName()%>&pColor=<%=cart.getpColor()%>">
											<img alt="<%=cart.getpName()%>" src="<%=request.getContextPath() %>/home/product/product_images/<%=cart.getpImg()%>" style="cursor: pointer;">
											</a>
										</div>
										<div class="cart-info-box">
											<div class="name"><%=cart.getpName() %></div>
											<div class="price">
												<%=DecimalFormat.getInstance().format(cart.getpPrice())%>원
											</div>
											<div class="spec">
												<ul>
													<li>
														컬러: <%=cart.getpColor()%>
													</li>
													<li>
														사이즈: <%=cart.getpSize()%>
													</li>
												</ul>
											</div>
											<%-- <a href="<%=request.getContextPath()%>/home/cart/cart_remove_action.jsp?cId=<%=cart.getcId()%>&cMemberId=<%=cart.getcMemberId()%>">
											<div class="delete-button" id="removeBtn_slt">삭제</div>
											</a> --%>
										</div>
									
										<div class="quantity-box">
											<div class="quantity-count">
												<!-- 감소 버튼  -->
												<%if(cart.getcQty()==1){  %>												
												<div  class="quantity-count-block">
													<img class="quantity-count-block-btn-img"
														src="<%=request.getContextPath() %>/home/cart/cart_images/minus2.png"
														alt="">
												</div>
												<% } else {  %>
												<a href ="<%=request.getContextPath()%>/home/cart/cart_modify_action.jsp?qty_check=1&cProductCode=<%=cart.getcProductCode()%>&cMemberId=<%=cart.getcMemberId()%>">
												<div  class="quantity-count-block">
													<img class="quantity-count-block-btn-img"
														src="<%=request.getContextPath() %>/home/cart/cart_images/minus2.png"
														alt="">
												</div>
												</a>
												<% } %>	
												
																							
												<div class="quantity-count-blank"></div>
												<div class="quantity-count-block"><%=cart.getcQty() %></div>
												<div class="quantity-count-blank"></div>
												
												
												<!-- 증가 버튼 -->
												<a href ="<%=request.getContextPath()%>/home/cart/cart_modify_action.jsp?qty_check=0&cProductCode=<%=cart.getcProductCode()%>&cMemberId=<%=cart.getcMemberId()%>">
												<div id="upBtn" class="quantity-count-block">
													<img class="quantity-count-block-btn-img"
														src="<%=request.getContextPath() %>/home/cart/cart_images/plus2.png"
														alt="">
												</div>
												</a>
											</div>
										</div>
									</div>
									<div class="product-price" >
										<div class="price-box">
											<div class="price">
												<% sum=cart.getpPrice()*cart.getcQty(); %>
												<%if(sum<=0){sum =cart.getpPrice()*1; }%>

												<%=DecimalFormat.getInstance().format(sum)%>
												<% sum=0; %> 
											</div>
											<div class="won">원</div>
										</div>
									</div>
								</div>
								<% total=total+(cart.getpPrice()*cart.getcQty());  %>
								<%} %>
							</div>	
						</div>
						<div class="cart-order-info-up">
							<div class="title">
								총 상품금액
								<b><%=DecimalFormat.getInstance().format(total)%></b>
								원 + 배송비
								<%if(besong<2500 && total<=30000 && total!=0){  besong = 2500;} %>
								
								<b><%=DecimalFormat.getInstance().format(besong)%></b>
								원 = 총 주문금액
								<%total=total+besong; %>
								<b><%=DecimalFormat.getInstance().format(total)%></b>
								원
								<!-- /react-text -->
							</div>  
						</div>
						<div class="cart-order-desc">
							<!-- react-text: 748 -->
							* 3만원 이상 구매시, 무료 배송입니다. 3만원 이하 구매시 2500원의 배송비가 부과 됩니다.
							<!-- /react-text -->
							<br>
							<!-- react-text: 750 -->
							* 2가지 이상 상품 구매 시, 재고 상태에 따라 분리 배송 가능합니다.
							<!-- /react-text -->
							<br>
							<!-- react-text: 752 -->
							* 실 결제되는 상품 금액과 배송비는 주문하기에서 쿠폰 적용에 따라 달라집니다.
							<!-- /react-text -->
						</div>
							<div id="message" style="color: red; font-size: 15px; margin: 0 auto; text-align: center;"></div>
						<div class="cart-button-section">
							<a href="<%=request.getContextPath()%>/home/index.jsp">
								<div class="cart-button cart-shopping-button">Continue</div>
							</a>
							
							<div class="cart-button cart-member-order-button" id="order_write">Buy</div>						
						</div>
						</form>
					</div>
				</div>
			</div>
<script type="text/javascript">
$("#allCheck").change(function () {
	if($(this).is(":checked")) {
		$(".check").prop("checked",true);
	} else {
		$(".check").prop("checked",false);
	}	
});


//장바구니 전체 삭제 또는 선택 삭제
$("#removeBtn").click(function() {
	$("#cartForm").attr("method","post");
	$("#cartForm").attr("action","<%=request.getContextPath()%>/home/cart/cart_remove_action.jsp");
	$("#cartForm").submit();
});

$("#order_write").click(function() {
	if($(".check").filter(":checked").size()==0) {
		$("#message").text("선택한 상품이 없습니다.");
		return;
	}
	$("#cartForm").attr("method","post");
	$("#cartForm").attr("action","<%=request.getContextPath()%>/home/index.jsp?workgroup=order&work=order_write");
	$("#cartForm").submit();
});



</script>
