
<%@page import="java.net.URLEncoder"%>
<%@page import="site.home.dao.ProductDAO"%>
<%@page import="site.home.dto.ProductDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	/* "category" >> 이 페이지를 요청할 때 전달하는 값(form이나 쿼리문 등) */
	String category = request.getParameter("category");
	
	/* DB에서 값을 가져오는 놈 */
	List<ProductDTO> productList = ProductDAO.getDAO().getProductList(category);

%>

<link rel="stylesheet"	href="<%=request.getContextPath() %>/home/home.css">

<div id="root">
	<div data-reactroot="">
		<div class="app-children-box-140">
			<div class="category-wide-container">



				<div class="product-contents">

					<%-- 배너부분 --%>
					<div class="banner">
						<img
							src="//d319d1tzjwpwbb.cloudfront.net/app/images/2019-06-18/b7302540d004fc6c76fb07f564273067.jpg"
							alt="" class="banner-img">
						<div class="banner-menu">
							<div class="page-path">
								<a href="index.jsp"><span class="path">HOME</span></a><span
									class="path"> &gt; </span><a href="index.jsp?workgroup=product&work=product_list&category=<%=category%>"><span class="path"><%=category %></span></a><span class="path"> &gt; </span><span class="title">SPYDER PRODUCTS</span>
							</div>
						</div>
					</div>

					<div class="category-product-list-box">
						<div class="product-list">
<!-- 							<div class="best-sellers-title">BEST SELLERS</div> -->
							<div class="product-category-items">


							<%-- 신상품 --%>
							<div class="product-list">
								<div class="new-arrivals-title">
									SPYDER ITEMS
								</div>

							<%-- 신상품 리스트 출력 --%>
							<div class="product-category-items">

										<% int count=0; %>
											<%
												for (ProductDTO product : productList) {
													//System.out.println("pName : "+URLEncoder.encode(product.getpName(),"UTF-8"));
											%>
										<div class="category-item">
											
											<div class="react-reveal"
												style="animation-fill-mode: both; animation-duration: 600ms; animation-delay: 0ms; animation-iteration-count: 1; opacity: 1; animation-name: react-reveal-800263327906883-1;">
												<div class="img-box">
													<a href="index.jsp?workgroup=product&work=product_detail&pName=<%=URLEncoder.encode(product.getpName(),"UTF-8")%>&pColor=<%=product.getpColor()%>">
													<img
														src="<%=request.getContextPath() %>/home/product/product_images/<%=product.getpImg()%>"
														alt="<%=product.getpName()%>"></a>

												<div class="item-title"><%=product.getpName()%></div>
												<div class="item-price-normal"><%=product.getpPrice()%></div>
												<% count++; %>							
											</div>
												</div>
										</div>
											<%
												}
											%>
											
											
											
											<% if (count==0) { %>
												<div><div class="sorry-message">
												"상품 준비중입니다."
												</div></div>
											<% } %>

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