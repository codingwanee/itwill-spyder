<%@page import="java.util.List"%>
<%@page import="site.home.dto.ProductDTO"%>
<%@page import="site.home.dao.ProductDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String pName = request.getParameter("pName");
	String pCode = request.getParameter("pCode");
	if (pCode == null)
		pCode = "123";
	ProductDTO product = ProductDAO.getDAO().getProductByCode(pCode);
	//String pCode = request.getParameter("p_Code");
	/* if (pCode == null)
		pCode = "0"; */
	ProductDTO pDto = ProductDAO.getDAO().getInforForDetail(pName);

	session.setAttribute("prodcutInfo", ProductDAO.getDAO().getProductByCode(pCode));
	int qty = 1;
%>
<link rel="stylesheet"	href="<%=request.getContextPath() %>/home/home.css">


<%-- 카테고리 타이틀 네비게이션 --%>
<div class="app-children-box-140">
	<div class="wide-container">
		<div class="product-detail-contents-renewal">
			<div class="product-detail-path">
				<a href="index.jsp"><span class="path">Home</span></a> <span
					class="path"> &gt; </span> <a
					href="index.jsp?workgroup=product&work=product_list&category=<%=pDto.getpType2()%>">
					<span class="path"><%=pDto.getpType1()%></span>
				</a> <span class="path"> &gt; </span> <span class="title"><%=pDto.getpName()%></span>
			</div>

			<%-- 좌측 상품 이미지 부분  --%>
			<div class="clearfix">
				<div class="product-image-grid ">

					<%-- 상품 세부이미지(여러장) 출력 --%>
					<a href="#1231/0"> <img
						src="//d319d1tzjwpwbb.cloudfront.net/app/images/2019-04-16/6359045459003c768895bcd24fd1322f.jpg"
						class="thumbnail-image">
						<div class="product-images-full-view false show">
							<a href="#" class="x-btn"><div class="button-wrapper">
									<img
										src="//d319d1tzjwpwbb.cloudfront.net/common/icons/x_grey.svg"
										alt="">
								</div>

								<div class="gallery-images">
									<figure class="gallery-images-item" id="1231/0">
										<img alt="" src="<%=pDto.getpImgDetail()%>">
									</figure>
								</div></a>
						</div>
				</div>
				<div class="product-detail-right-contents">
					<img class="loading-snipet-product"
						src="//d319d1tzjwpwbb.cloudfront.net/common/icons/loading_snipet.svg"
						style="display: none;">
					<div id="popup_sizetable" class="overlay">
						<div class="size-table-content">
							<div class="size-table-view">
								<img class="close-button"
									src="//d319d1tzjwpwbb.cloudfront.net/desktop/icons/x_red.svg"
									alt="close">
								<div class="table-box">
									<img
										src="//d319d1tzjwpwbb.cloudfront.net/desktop/pages/product/size-table_new.jpg"
										alt="size-table">
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>

	<%-- 우측 상세설명 메뉴 --%>
	<div class="product-detail-info">
		<div class="product-info">

			<div class="name"><%=pDto.getpName()%></div>
			<div class="pno-and-price">
				<span class="product-no"><%=pDto.getpCode()%> <%=pDto.getpColor()%>
				</span><span class="price"><%=pDto.getpPrice()%>원 </span>
			</div>
			<div class="color-variation-box">
				<img alt="BLK" class="color-variation-image-selected"
					src="//d319d1tzjwpwbb.cloudfront.net/app/images/2019-04-16/6359045459003c768895bcd24fd1322f_640.jpg">
				<img alt="WHT" class="color-variation-image"
					src="//d319d1tzjwpwbb.cloudfront.net/app/images/2019-04-16/3b2d557d702ca9198ae71ec621cc3721_640.jpg">
			</div>
			<div class="size">
				<div class="text-wrap">
					<!-- react-text: 2630 -->
					사이즈 선택
					<!-- /react-text -->
					<a href="#popup_sizetable" class="size-table-text">사이즈조견표</a>
				</div>
				<div class="product-size-selector">
					<div class="product-size-selector-box">
						<span class="item  selected">095 (M)</span> <span class="item  ">100
							(L)</span> <span class="item  ">105 (XL)</span> <span class="item  ">110
							(XXL)</span> <span class="item  ">115 (3XL)</span>
					</div>
				</div>
			</div>
			<div class="quantity">
				<div class="title">수량</div>
				<div class="product-quantity-count">
					<div class="quantity-count">
						<div class="quantity-count-block">
							<img class="quantity-count-block-btn-img"
								src="//d319d1tzjwpwbb.cloudfront.net/common/icons/btn_-(gray).svg"
								alt="">
						</div>
						<div class="quantity-count-blank"></div>
						<div class="quantity-count-block">1</div>
						<div class="quantity-count-blank"></div>
						<div class="quantity-count-block">
							<img class="quantity-count-block-btn-img"
								src="//d319d1tzjwpwbb.cloudfront.net/common/icons/btn_%2B(gray).svg"
								alt="">
						</div>
					</div>
				</div>
			</div>

			<div class="button-box clearfix">
				<a href="index.jsp?workgroup=cart&work=cart_list" class="baseLink"><div
						class="button cart-button">CART</div></a> <a
					href="index.jsp?workgroup=order&work=order_list" class="baseLink"><div
						class="button buy-button">BUY</div></a>
			</div>
			<div class="bene-box" style="font-size: 15px; color: #080808;">
				<a class="baseLink prev-link" href="/cs/benefit"><div
						class="desc-title">혜택</div></a>
				<div class="link-area">
					<a class="baseLink prev-link" href="/CardInfo">무이자 할부</a><span>/</span><a
						class="baseLink prev-link" href="/events/171">무료 반품</a>
				</div>
			</div>

			<div class="product-detail-description">
				<div class="desc-block active">
					<div class="desc-title">상품 상세 정보</div>
					<div class="desc-content">
						<div class="desc1-cl">
							<div style="line-height: 1.2;">

								<span
									style="font-size: 14px; font-weight: bold; font-family: &amp; amp;">
									<%=pDto.getpName()%>
								</span>
							</div>
							<div class="desc">
								<div style="line-height: 1.2;">
									<span style="font-family: &amp; amp;"><span
										style="font-size: 14px; font-weight: bold;"><br></span></span>
								</div>
								<%=pDto.getpDesc() %>
							</div>
							<div style="line-height: 1.2;">
								<span style="font-size: 14px; font-family: &amp; amp;"><br></span>
							</div>
							<div style="line-height: 1.2;">
								<span style="font-family: &amp; amp;"></span><span
									style="font-size: 14px;"><%=pDto.getpDesc()%></span>
							</div>
							<div style="line-height: 1.2;">
								<span style="font-family: &amp; amp;"><br></span>
							</div>
							<div style="line-height: 1.2;">
								<span style="color: rgb(0, 0, 0); font-family: &amp; amp;"><a
									href="/products/1219"><img
										src="//d319d1tzjwpwbb.cloudfront.net/app/images/2019-01-10/59f395b663a0418f53ba00afc102b61b.jpg"
										style="width: 100%;"></a><br></span>
							</div>
							<div style="line-height: 1.2;">
								<span style="font-size: 14px; font-family: &amp; amp;"><br></span>
							</div>
							<div style="line-height: 1.2;">
								<span style="font-size: 14px; font-family: &amp; amp;"><br></span>
							</div>
							<div style="line-height: 1.2;">
								<span style="font-family: &amp; amp;"><span
									style="font-size: 14px;"> •제조사:<%=pDto.getpCompany()%></span><br></span>
							</div>
							<p style="font-size: 11.1111px; line-height: 1.2;">
								<span style="font-size: 14px; font-family: &amp; amp;">•제조국:<%=pDto.getpCountry()%></span>
							</p>
							<p style="font-size: 11.1111px; line-height: 1.2;">
								<span style="font-size: 14px; font-family: &amp; amp;">•제조년월:<%=pDto.getpMndate()%></span>
							</p>
							<p style="line-height: 1.2;">
								<span style="font-family: &amp; amp;"><span
									style="font-size: 11.1111px;"></span><span
										style="font-size: 14px;">•소재:&nbsp;<%=pDto.getpMaterial()%></span>
							</p>

							<p style="line-height: 1.2;">
								<span style="font-family: &amp; amp;"><span
									style="font-size: 14px;"></span><span style="font-size: 14px;"></span><span
									style="font-size: 14px;"></span><span style="font-size: 14px;"></span><span
									style="font-size: 14px;"></span></span>
							</p>
							<p style="line-height: 1.2;">
								<span style="font-size: 14px; font-family: &amp; amp;">•고객센터:1588-5863</span>
							</p>
						</div>
					</div>
				</div>
				<div class="desc-block ">
					<div class="desc-title">배송/반품/교환 안내</div>
					<div class="desc-content">
						<div style="line-height: 1.4;">
							<p
								style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; line-height: 1.5; font-size: 15px;">
								<b>배송안내</b>
							</p>
							<p
								style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; line-height: 1.5; font-size: 14px; margin-bottom: 11px;">
								<br> • 3만 원 이상 구매 시 무료 배송 / 무료 반품 혜택을 누리실 수 있습니다.<br>
								<br> • 3만 원 이상 구매 시 무료 배송이며, 3만 원 이하는 2,500원이 부과됩니다.<br>
								<br> • 배송은 결제 후 3일 이내, 발송 완료 등록 및 발송 완료 문자 메시지를 받으신 후 고객님께
								배달 완료되기까지 1~2일 정도 소요됩니다.<br> <br> • 토요일, 공휴일이나 택배사 또는
								고객님의 사정이 있을 경우 배송이 지연될 수 있습니다.<br> <br> • 상품이 발송되기
								전까지는 배송지를 변경할 수 있습니다. <br> <br> • 상품의 발송 현황은 마이페이지> 주문
								배송조회에서 확인하실 수 있으며 주문상세 내역에서 받는 분 정보를 변경하실 수 있습니다.<br> <br>
								• 본인이 입력하신 핸드폰 번호나 이메일로도 주문 내용을 전송해 드립니다.<br> <br>

							</p>

							<p
								style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; line-height: 1.5; font-size: 15px;">
								<b>A/S 안내</b>
							</p>
							<p
								style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; line-height: 1.5; font-size: 14px; margin-bottom: 11px;">
								<br>
							</p>

							<p
								style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; line-height: 1.5; font-size: 14px; margin-bottom: 11px;">
								<br> • 구매하신 상품에 하자가 있을 경우 1:1 문의나 근처 매장에 방문하시어 접수 가능합니다. <br>
								<br> • 수선이 완료된 후 제품 발송비는 과실 주체에 따라 택배비용이 고객님께 부과될 수 있습니다. <br>
								<br> • 수선비는 스파이더 소비자 상담실에서 판정하며 판정 결과는 품질보증기간 및 내용 연수 경과
								여부, 제품하자 여부, 소비자 과실 여부에 따라 결정됩니다. <br> <br> • A/S 유상
								수선 판정 후 유상 수선비는접수 매장 또는 수선처에 직접 계좌이체를 통해 결제하실 수 있습니다. <br>
								<br> • 고객님이 A/S 접수 후 평균 14일 이내에 처리되는 것을 원칙으로 하고 있으나 사정에 의해
								약간씩 지연 또는 단축될 수 있습니다. <br> <br>
							</p>
							<p
								style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; line-height: 1.5; font-size: 14px; margin-bottom: 11px;">
								<br>
							</p>
							<p
								style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; line-height: 1.5; font-size: 15px;">
								<b>반품/교환안내</b>
							</p>
							<p
								style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; line-height: 1.5; font-size: 14px; margin-bottom: 11px;">
								<br> • [로그인, 마이페이지, 교환/ 반품/취소 신청] 페이지에서 신청해주셔야 합니다.<br>
								<br> • 사유에 따라 왕복 배송비가 부과됩니다. 단, 다음과 같은 경우 교환/반품이 불가능할 수
								있습니다.<br> <br> 1. 교환/반품 신청 기간이 지난 경우<br> <br>
								2. 포장을 개봉하였거나 포장이 훼손되어 (상품의 태그 분리/ 분실, 비닐포장 훼손, 신발 박스 훼손 등)
								상품가치가 현저히 감소한 경우<br> <br> 3. 구매자의 책임 있는 사유로 상품 등이 멸실
								또는 훼손된 경우<br> <br> 4. 구매자의 사용 또는 일부 소비에 의하여 상품가치가 현저히
								감소한 경우<br> <br> 5. 기간의 경과에 의하여 재판매가 곤란할 정도로 상품가치가 현저히
								감소한 경우<br> <br> 6. 주문 확인 후 상품 제작에 들어가는 주문 제작 상품인 경우<br>
								<br> 7. 복제가 가능한 상품 등의 포장을 훼손한 경우<br> <br> <br>
								<br> <br> <br> •교환<br> <br> 다른 사이즈 또는
								다른 상품으로 교환을 원할 경우에는 맞교환 서비스가 없으므로 취소/반품 후 재 주문을 하셔야 합니다.
							</p>

						</div>
					</div>
				</div>

			</div>

		</div>
	</div>
	<div class="cart-popup hide">
		<div class="cart-contents"></div>
	</div>
	<div class="cart-popup hide">
		<div class="cart-contents"></div>
	</div>
</div>


<script type="text/javascript">
	$("#Qty_up").click(function() {
		var qty = parseInt($("#qty").val());
		qty++;
		$("#Qty_div").text(qty);
		$("#qty").val(qty);
	});

	$("#Qty_down").click(function() {
		var qty = parseInt($("#qty").val());
		if (qty != 1) {
			qty--;
			$("#Qty_div").text(qty);
			$("#qty").val(qty);
		}
	});
</script>
