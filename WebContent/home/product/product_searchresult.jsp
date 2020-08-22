<%@page import="site.home.dao.ProductDAO"%>
<%@page import="site.home.dto.ProductDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String keyword = request.getParameter("keyword");
	
	List<ProductDTO> searchResult = ProductDAO.getDAO().getProductByKeyword(keyword);
%>
<link rel="stylesheet"	href="<%=request.getContextPath() %>/home/home.css">

<div class="banner">
	<img
		src="//d319d1tzjwpwbb.cloudfront.net/app/images/2019-06-19/038f9d284c4f38d0b025be6ae0a1d910.jpg"
		alt="" class="banner-img">
	<div class="banner-menu">
		<div class="page-path">
			<a href="/"><span class="path">Home</span></a><span class="path">
				&gt; </span><a href="/categories/295"><span class="path">BEST</span></a><span
				class="path"> &gt; </span><a href="/categories/374"><span
				class="path">SHORTS</span></a><span class="path"> &gt; </span><span
				class="title">Women</span>
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
									검색결과
								</div>


<div class="react-reveal">
	<%
		for (ProductDTO pro : searchResult) {
	%>
	<div class="img-box">
		<a
			href="index.jsp?workgroup=product&work=product_detail&pName=<%=pro.getpName()%>&pCode=<%=pro.getpCode()%>"><img
			src="//d319d1tzjwpwbb.cloudfront.net/app/images/2019-04-01/1de7c1a2f33124258bd649baab2bb15c_640.jpg"
			alt="<%=pro.getpName()%>"></a>
	</div>
	<div class="item-title"><%=pro.getpName()%></div>
	<div class="item-price-normal">
		<%=pro.getpPrice()%>원
	</div>
	<%
		}
	%>
</div>