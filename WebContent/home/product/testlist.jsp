<%@page import="site.home.dao.ProductDAO"%>
<%@page import="site.home.dto.ProductDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String category = request.getParameter("category"); //"category" >> 이 페이지를 요청할 때 전달하는 값(form이나 쿼리문 등)
	if (category == null) category = null;
	
	List<ProductDTO> productList = ProductDAO.getDAO().getProductList(category);
	//List<ProductDTO> productList = ProductDAO.getDAO().getProductList("WOMEN");//DB에서 값을 가져오는 놈
%>

<div id="root">
	<div data-reactroot="">
		<div class="app-children-box-140">
			<div class="category-wide-container">



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

					<div class="category-product-list-box">
						<div class="product-list">
							<div class="best-sellers-title">BEST SELLERS</div>
							<div class="product-category-items">


							<%-- 신상품 --%>
							<div class="product-list">
								<div class="new-arrivals-title">
									Men
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
													<a href="index.jsp?work=product&workgroup=testdetail&">
													<img
														src="//d319d1tzjwpwbb.cloudfront.net/app/images/2019-07-15/aa2f33917522477b0ebf48666875e67f_640.png"
														alt="유니섹스 섬머 그래픽 티셔츠"></a>

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