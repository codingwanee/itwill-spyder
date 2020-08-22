<%@page import="site.home.dao.ProductDAO"%>
<%@page import="site.home.dto.ProductDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String category = request.getParameter("category");
	if (category == null) category = null;
	
	//List<ProductDTO> productList = ProductDAO.getDAO().getProductList(category);
	List<ProductDTO> productList = ProductDAO.getDAO().getProductList("WOMEN");
%>

<div id="root">
	<div data-reactroot="">
		<div class="app-children-box-140">
			<div class="category-wide-container">
<!-- 				<div id="loginpopup" class="overlay">
					<div class="loginPop">
						<div id="login">
							<div class="round">
								<div class="x-btn">
									<img
										src="//d319d1tzjwpwbb.cloudfront.net/desktop/icons/x_grey.svg"
										alt="close">
								</div>
								<div class="member-btn">
									<button id="left" class="white">회원</button>
									<button id="right" class="black">비회원</button>
								</div>
								<div id="member" class="display-none"
									style="padding-bottom: 22px;">
									<form>
										<div class="login-box">
											<input type="text" required="" placeholder="ID"><input
												type="password" required="" placeholder="PASSWORD">
											<button type="submit">Log In</button>
										</div>
									</form>
									<div class="remember">
										<div class="rec_checks" style="display: inline; float: left;">
											<input type="checkbox" id="ex_chk" value="on"><label
												for="ex_chk">Remember me</label>
										</div>
										<a class="find" href="/auth/forgot/id"><div style="text-decoration: underline;">Find ID / Password</div></a>
									</div>
								</div>
								<div id="guest">
									<button class="tempuser-btn" id="buy">구매하기</button>
									<span class="check-order" id="shipping">주문/배송 조회</span><br>
									<br> <br> <span id="selectLang"
										style="visibility: hidden;">en</span><span class="check-order"
										id="changeLang">Click here to view in English</span>
								</div>
							</div>
<<<<<<< .mine
							<div class="bottom">
								<h1 id="sign" style="cursor: pointer;">회원가입</h1>
								<p>
									<span id="sub1"> <!-- react-text: 716 -->회원 구매 시, 결제 금액의
										<!-- /react-text --> <b>5% 마일리지</b> <!-- react-text: 718 -->
										적립 가능<!-- /react-text -->
									</span><br> <span id="sub2"> <!-- react-text: 721 -->3만 원
										이상 구매 시 <!-- /react-text --> <b>무료 배송/무료 반품</b>
										서비스<!-- /react-text -->
									</span>
								</p>
							</div>
			</div>
						<div id="order" class="display-none">
							<div class="round">
								<div class="x-btn">
									<img
										src="//d319d1tzjwpwbb.cloudfront.net/desktop/icons/x_grey.svg"
										alt="close">
								</div>
								<h1>주문/배송 조회</h1>
								<div class="search-box">
									<span>주문자명</span><input type="text" id="oName"
										placeholder="Name">
								</div>
								<div class="search-box">
									<span>휴대폰 번호</span><input type="text" id="oTel"
										placeholder="Mobile Phone">
								</div>
								<div class="search-box">
									<span>주문번호</span><input type="text" id="oId"
										placeholder="Order Number">
								</div>
								<div class="popup_info">
									react-text: 739
									주문번호 분실시, 고객센터 1588-5863
									/react-text
									<br>
									react-text: 741
									또는 1:1 문의로 연락 부탁드립니다.
									/react-text
								</div>
								<div class="search-box">
									<button class="white">취소</button>
									<button class="black">확인</button>
								</div>
							</div>
						</div>
					</div>
				</div> -->




				<%-- 상품리스트 출력 부분 --%>
				<div class="product-contents">

						<div class="banner">
							<img
								src="//d319d1tzjwpwbb.cloudfront.net/app/images/2019-06-18/b7302540d004fc6c76fb07f564273067.jpg"
								alt="" class="banner-img">
							<div class="banner-menu">
								<div class="page-path">
									<a href="/"><span class="path">Home</span></a><span
										class="path"> &gt; </span><a href="/categories/295"><span
										class="path">BEST</span></a><span class="path"> &gt; </span><a
										href="/categories/373"><span class="path">TOP &amp;
											T-SHIRTS</span></a><span class="path"> &gt; </span><span class="title">Men</span>
								</div>
							</div>
						</div>
					<%-- 베스트 셀러 --%>
					<div class="category-product-list-box">
						<div class="product-list">
							<div class="best-sellers-title">BEST SELLERS</div>
							<div class="product-category-items">

								<%-- 베스트셀러 상품 리스트 출력 --%>
								<%
									for (ProductDTO product : productList) {
								%>
								<div class="category-item">
									<div class="react-reveal"
										style="animation-fill-mode: both; animation-duration: 600ms; animation-delay: 0ms; animation-iteration-count: 1; opacity: 1; animation-name: react-reveal-800263327906883-1;">
										<div class="img-box">

											<a href="#" id="aaa" onclick="pageChange(this);">
											<img
												src="//d319d1tzjwpwbb.cloudfront.net/app/images/2019-07-05/f33929171a43ed78e2eb375dfabe3620_640.gif"
												alt="맨즈 로고 포인트 숏슬리브 티셔츠"></a>


											<div class="cart-box">
												<%-- 상품별 사이즈 출력 --%>
												<!-- 	<div class="size-table-wrap">
													<ul class="size-list">
														<li class="size-item  ">095 (M)</li>
														<li class="size-item  ">100 (L)</li>
														<li class="size-item  ">105 (XL)</li>
														<li class="size-item  ">110 (XXL)</li>
													</ul>
												</div> -->
												<div>
													<button class="cart-btn">Add to cart</button>
												</div>
											</div>
										</div>
										<div class="item-title"><%=product.getpName()%></div>
										<div class="item-price-normal">	<%=product.getpPrice()%>원
										</div>
									</div>
								</div>

									<%
										}
									%>


								<%-- 신상품 --%>
							<div class="product-list">
								<div class="new-arrivals-title">
									<!-- react-text: 862 -->
									Men
									<!-- /react-text -->
									<div class="category-dropdown">
										<div class="Dropdown-root">
											<div class="Dropdown-control" aria-haspopup="listbox">
												<div class="Dropdown-placeholder">신상품</div>
												<div class="Dropdown-arrow-wrapper">
													<span class="Dropdown-arrow"></span>
												</div>
											</div>
										</div>
									</div>
								</div>

							<%-- 신상품 리스트 출력 --%>
							<div class="product-category-items">
										<div class="category-item">
											<%
												for (ProductDTO product : productList) {
											%>
											<div class="react-reveal"
												style="animation-fill-mode: both; animation-duration: 600ms; animation-delay: 0ms; animation-iteration-count: 1; opacity: 1; animation-name: react-reveal-800263327906883-1;">
												<div class="img-box">
													<a href="index.jsp?work=product&workgroup=product_detail">
													<img
														src="//d319d1tzjwpwbb.cloudfront.net/app/images/2019-07-15/aa2f33917522477b0ebf48666875e67f_640.png"
														alt="유니섹스 섬머 그래픽 티셔츠"></a>
													<div class="cart-box">
														<div><button class="cart-btn">Add to cart</button></div>
													</div>
												</div>
												<div class="item-title"><%=product.getpName()%></div>
												<div class="item-price-normal">
													<%=product.getpPrice()%>
												</div>
											</div>
											<%
												}
											%>
										</div>
										<form action="index.jsp?work=product&workgroup=product_detail">
											<input id="type1" name="type1" value="">
											<input id="type2" name="type2" value="">
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>

		</div>
	</div>
	
	<script type="text/javascript">
	function pageChange(evt) {
		var id = evt.id
		alert(id);
		
		$("type1").val(id);
		
		
		
		submit
		
		//location.href
	}
	</script>