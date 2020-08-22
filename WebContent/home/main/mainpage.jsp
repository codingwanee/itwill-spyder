<%@page import="java.net.URLEncoder"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="site.home.dto.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="site.home.dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String category = request.getParameter("category");

	List<ProductDTO> productlist = ProductDAO.getDAO().getAllProductList();
%>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="/js/owl.carousel.min.js"></script>



	<div class="app-children-box-140">
		<div class="wide-container" style="padding: 0px;">
			<div class="main-contents">
				<div class="main-top-banner-section">
					<div style="opacity: 1; display: block;"
						class="owl-carousel spyder-carousel owl-theme indicator-large">
						<div class="owl-wrapper-outer">
							<div class="owl-wrapper"
								style="width: 15468px; left: 0px; display: block; transition: all 0ms ease 0s; transform: translate3d(-3867px, 0px, 0px); transform-origin: 4511.5px center; perspective-origin: 4511.5px center;">
								<div class="owl-item" style="width: 1289px;">
									<div class="main-top-banner-bg">
										<div class="main-top-banner">
											<div class="banner-content">
												<div>
													<img
														src="//d319d1tzjwpwbb.cloudfront.net/app/images/2019-06-27/6b461b81620476a2749ec3d0fa1d6c66.jpg"
														alt="<font style=&quot;color:#FFFFFF;font-family: FFDINWebProBold;&quot;>EILEK<br>LOW<br>
													</font>

												</div>
												<div class="banner-desc">
													<div class="banner-product-name">
														<div>
															<font
																style="color: #FFFFFF; font-family: FFDINWebProBold;">EILEK<br>LOW<br></font>
														</div>
													</div>
													<div class="banner-button-box">
														<div class="banner-button-1">
															<a class="baseLink" target="_self"
																href="/product/1509?color=WHT"><div
																	class="btn-white">
																	<font style="font-weight: 800;">SHOP </font>
																</div></a>
														</div>
														<div class="banner-button-2">
															<a class="baseLink" target="_self" href="index.jsp?workgroup=product&work=product_detail&pName=에일렉 로우&pColor=WH"><div
																	class="btn-white">
																	<font style="font-weight: 800;">MORE </font>
																</div></a>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="owl-item" style="width: 1289px;">
									<div class="main-top-banner-bg">
										<div class="main-top-banner">
											<div class="banner-content">
												<div>
													<img
														src="//d319d1tzjwpwbb.cloudfront.net/app/images/2019-06-11/99dd58933c6a3fc8adcb22fdae09d1f2.jpg"
														alt="<font style=&quot;color:#080808;font-family: FFDINWebProBold;&quot;>2019
													SS<br>SHORTS<br>COLLECTION<br> </font>">
												</div>
												<div class="banner-desc">
													<div class="banner-product-name">
														<div>
															<font
																style="color: #080808; font-family: FFDINWebProBold;">2019
																SS<br>SHORTS<br>COLLECTION<br>
															</font>
														</div>
													</div>
													<div class="banner-button-box">
														<div class="banner-button-1">
															<a class="baseLink" target="_self"
																href="index.jsp?workgroup=product&work=product_detail&pName=하이퍼 볼트&pColor=WH"><div
																	class="btn-white">SHOP</div></a>
														</div>
														<div class="banner-button-2">
															<a class="baseLink" target="_self" href="index.jsp?workgroup=product&work=product_list&category=SH"><div
																	class="btn-white">MORE</div></a>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="owl-item" style="width: 1289px;">
									<div class="main-top-banner-bg">
										<div class="main-top-banner">
											<div class="banner-content">
												<a href="/mdpick/2019SS_RUNNING_COLLECTION"><img
													src="//d319d1tzjwpwbb.cloudfront.net/app/images/2019-06-07/1f0a576bbce0afbc245c173522797519.jpg"
													alt="<font style=&quot;color:#ffffff;font-family: FFDINWebProBold;&quot;>2019
													SS<br>RUNNING<br>COLLECTION</font>"></a>
												<div class="banner-desc">
													<div class="banner-product-name">
														<div>
															<font
																style="color: #ffffff; font-family: FFDINWebProBold;">2019
																SS<br>RUNNING<br>COLLECTION
															</font>
														</div>
													</div>
													<div class="banner-button-box">
														<div class="banner-button-1">
															<a class="baseLink" target="_self" href="/categories/250"><div
																	class="btn-white">SHOP</div></a>
														</div>
														<div class="banner-button-2">
															<a class="baseLink" target="_self"
																href="/mdpick/2019SS_RUNNING_COLLECTION"><div
																	class="btn-white">MORE</div></a>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="owl-item" style="width: 1289px;">
									<div class="main-top-banner-bg">
										<div class="main-top-banner">
											<div class="banner-content">
												<div>
													<img
														src="//d319d1tzjwpwbb.cloudfront.net/app/images/2019-05-17/779af9df52da028a817320d8d0e0c0fd.jpg"
														alt="<font style="&quot;color:#080808;font-family: FFDINWebProBold;&quot;">T-SHIRTS<br>COLLECTION<br>
													</font>">
												</div>
												<div class="banner-desc">
													<div class="banner-product-name">
														<div>
															<font
																style="color: #080808; font-family: FFDINWebProBold;">T-SHIRTS<br>COLLECTION<br></font>
														</div>
													</div>
													<div class="banner-button-box">
														<div class="banner-button-1">
															<a class="baseLink" target="_self" href="index.jsp?workgroup=product&work=product_list&category=TT"><div
																	class="btn-white">
																	<font style="font-weight: 800;">SHOP </font>
																</div></a>
														</div>
														<div class="banner-button-2">
															<a class="baseLink" target="_self" href="index.jsp?workgroup=product&work=product_detail&pName=�떚�뀛痢�"><div
																	class="btn-white">
																	<font style="font-weight: 800;">MORE </font>
																</div></a>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="owl-item" style="width: 1289px;">
									<div class="main-top-banner-bg">
										<div class="main-top-banner">
											<div class="banner-content">
												<div>
													<img
														src="//d319d1tzjwpwbb.cloudfront.net/app/images/2019-05-17/e8d099c3c3e5ed0d20a8edae8ab68a8f.jpg"
														alt="<font style=&quot;color:#080808;font-family: FFDINWebProBold;&quot;>2019
													SS<br>RASHGUARD<br> </font>">
												</div>
												<div class="banner-desc">
													<div class="banner-product-name">
														<div>
															<font
																style="color: #080808; font-family: FFDINWebProBold;">2019
																SS<br>RASHGUARD<br>
															</font>
														</div>
													</div>
													<div class="banner-button-box">
														<div class="banner-button-1">
															<a class="baseLink" target="_self"
																href="/product/1480?color=PTN"><div
																	class="btn-white">
																	<font style="font-weight: 800;">SHOP </font>
																</div></a>
														</div>
														<div class="banner-button-2">
															<a class="baseLink" target="_self"
																href="/mdpick/19ss_rashguard"><div class="btn-white">
																	<font style="font-weight: 800;">MORE </font>
																</div></a>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="owl-item" style="width: 1289px;">
									<div class="main-top-banner-bg">
										<div class="main-top-banner">
											<div class="banner-content">
												<div>
													<img
														src="//d319d1tzjwpwbb.cloudfront.net/app/images/2019-05-09/0e2043e1c006af9f7ca90c4f6d9a0d1a.jpg"
														alt="<font style=&quot;color:#ffffff;font-family: FFDINWebProBold;&quot;>PRO-TACK<br>STEEL<br>
													</font>">
												</div>
												<div class="banner-desc">
													<div class="banner-product-name">
														<div>
															<font
																style="color: #ffffff; font-family: FFDINWebProBold;">PRO-TACK<br>STEEL<br></font>
														</div>
													</div>
													<div class="banner-button-box">
														<div class="banner-button-1">
															<a class="baseLink" target="_self" href="product/1011"><div
																	class="btn-white">SHOP</div></a>
														</div>
														<div class="banner-button-2">
															<a class="baseLink" target="_self" href="/mdpick/protack"><div
																	class="btn-white">MORE</div></a>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="owl-controls clickable">
							<div class="owl-pagination">
								<div class="owl-page">
									<span class=""></span>
								</div>
								<div class="owl-page">
									<span class=""></span>
								</div>
								<div class="owl-page">
									<span class=""></span>
								</div>
								<div class="owl-page active">
									<span class=""></span>
								</div>
								<div class="owl-page">
									<span class=""></span>
								</div>
								<div class="owl-page">
									<span class=""></span>
								</div>
							</div>
							<div class="owl-buttons">
								<div class="owl-prev">
									<img style="width: 29px"
										src="//d319d1tzjwpwbb.cloudfront.net/desktop/icons/icon_left_arrow.svg">
								</div>
								<div class="owl-next">
									<img style="width: 29px"
										src="//d319d1tzjwpwbb.cloudfront.net/desktop/icons/icon_right_arrow.svg">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="main-center-section">
					<div class="main-center-section">
						<div>
							<style>
.btn-white {
	width: 150px;
	height: 40px;
	line-height: 40px;
	background-color: #ffffff;
	color: #080808;
	font-size: 16px;
	font-weight: 300;
	text-align: center;
	vertical-align: middle;
	display: inline-block;
}
</style>
							<div>
								<div class="main-center-desktop">
									<h1 class="main-center-title">desktop</h1>


									<br>
									<div class="main-section-4" style="font-size: 0;">
										<div style="position: relative;" class="zoom-wrap">
											<font style="font-weight: 700"> <a
												href="index.jsp?workgroup=product&work=product_detail&pName=<%=URLEncoder.encode("블랙 위도우 런","UTF-8") %>&pColor=BK" target="_self"
												style="line-height: 1.42857;"><img
													style="width: 100%; height: auto"
													src="//d319d1tzjwpwbb.cloudfront.net/app/images/2019-05-28/68d9c7a36708b4e2337e088ad80c7c65.jpg"
													class="zoom-out"></a> &gt;<a
												href="index.jsp?workgroup=product&work=product_detail&pName=<%=URLEncoder.encode("블랙 위도우 런","UTF-8") %>&pColor=BK" target="_self"
												style="line-height: 1.42857;"><img style="height: auto"
													src="//d319d1tzjwpwbb.cloudfront.net/app/images/2019-05-28/68d9c7a36708b4e2337e088ad80c7c65.jpg"
													class="zoom-in"></a> <font style="font-weight: 700">
											</font></font>
											<div
												style="position: absolute; left: 2.7%; top: 5%; color: #ffffff;">
												<font style="font-weight: 700"><font
													style="font-weight: 700">
														<div style="line-height: 1.2; font-size: 30px;">
															BLACK WIDOW <br>RUN
														</div>



														<div style="margin-top: 30px;">
															<a href="index.jsp?workgroup=product&work=product_detail&pName=<%=URLEncoder.encode("블랙 위도우 런","UTF-8") %>&pColor=BK" target="_self"
																style="line-height: 1.42857; margin-right: 15px;">
																<div class="btn-white"
																	style="float: left; margin-right: 25px;">SHOP</div>



															</a> <a href="index.jsp?workgroup=product&work=product_list&category=SH" target="_self"
																style="line-height: 1.42857;">
																<div class="btn-white"
																	style="float: left; margin-right: 25px;">MORE</div>



															</a>
														</div>



												</font></font>
											</div>



										</div>



									</div>



									<div class="main-section-4" style="font-size: 0;">
										<div style="position: relative;" class="zoom-wrap">
											<font style="font-weight: 700"> <a
												href="index.jsp?workgroup=product&work=product_detail&pName=<%=URLEncoder.encode("유니섹스 레터링 반팔 티셔츠","UTF-8") %>&pColor=WH" target="_self"
												style="line-height: 1.42857;"><img
													style="width: 100%; height: auto"
													src="//d319d1tzjwpwbb.cloudfront.net/app/images/2019-06-24/ec5e90ab5febbe5d45c9602ec1054cdb.jpg"
													class="zoom-out"></a> &gt;<a
												href="index.jsp?workgroup=product&work=product_detail&pName=<%=URLEncoder.encode("유니섹스 레터링 반팔 티셔츠","UTF-8") %>&pColor=WH" target="_self"
												style="line-height: 1.42857;"><img style="height: auto"
													src="//d319d1tzjwpwbb.cloudfront.net/app/images/2019-06-24/ec5e90ab5febbe5d45c9602ec1054cdb.jpg"
													class="zoom-in"></a> <font style="font-weight: 700">
											</font></font>
											<div
												style="position: absolute; left: 2.7%; top: 5%; color: #080808;">
												<font style="font-weight: 700"><font
													style="font-weight: 700">
														<div style="line-height: 1.2; font-size: 30px;">
															UNISEX LETTERING<br>T-SHIRT
														</div>



														<div style="margin-top: 30px;">
															<a href="index.jsp?workgroup=product&work=product_detail&pName=<%=URLEncoder.encode("유니섹스 레터링 반팔 티셔츠","UTF-8") %>&pColor=WH" target="_self"
																style="line-height: 1.42857; margin-right: 15px;">
																<div class="btn-white"
																	style="float: left; margin-right: 25px;">SHOP</div>



															</a> <a href="index.jsp?workgroup=product&work=product_list&category=TT" target="_self"
																style="line-height: 1.42857;">
																<div class="btn-white"
																	style="float: left; margin-right: 25px;">MORE</div>



															</a>
														</div>



												</font></font>
											</div>



										</div>



									</div>



									<div>
										<div class="main-section-4" style="font-size: 0;"
											id="main-sec-left">
											<div style="position: relative;" class="zoom-wrap">
												<font style="font-weight: 700"> <a
													href="index.jsp?workgroup=product&work=product_detail&pName=<%=URLEncoder.encode("하이퍼 볼트","UTF-8") %>&pColor=WH" target="_self"
													style="line-height: 1.42857;"><img
														style="width: 100%; height: auto"
														src="//d319d1tzjwpwbb.cloudfront.net/app/images/2019-06-27/467181c6b962bfb25823841bb3ebee7f.jpeg
"
														width="50%" class="zoom-out"></a> &gt;
														
														
														<a
													href="index.jsp?workgroup=product&work=product_detail&pName=<%=URLEncoder.encode("하이퍼 볼트","UTF-8") %>&pColor=WH" target="_self"
													style="line-height: 1.42857;"><img style="height: auto"
														src="//d319d1tzjwpwbb.cloudfront.net/app/images/2019-06-27/467181c6b962bfb25823841bb3ebee7f.jpeg"
														width="50%" class="zoom-in"></a> <font
													style="font-weight: 700"> </font></font>
												<div
													style="position: absolute; left: 4.7%; top: 5%; color: #080808;">
													<font style="font-weight: 700"><font
														style="font-weight: 700">
															<div style="line-height: 1.2; font-size: 30px;">HYPER VOLT</div>



															<div style="margin-top: 30px;">
																<a href="index.jsp?workgroup=product&work=product_detail&pName=<%=URLEncoder.encode("하이퍼 볼트","UTF-8") %>&pColor=WH" target="_self"
																	style="line-height: 1.42857; margin-right: 15px;">
																	<div class="btn-white"
																		style="float: left; margin-right: 25px;">SHOP</div>



																</a> <a href="index.jsp?workgroup=product&work=product_list&category=SH" target="_self"
																	style="line-height: 1.42857;">
																	<div class="btn-white"
																		style="float: left; margin-right: 25px;">MORE</div>



																</a>
															</div>



													</font></font>
												</div>



											</div>



										</div>




										<div class="main-section-4" style="font-size: 0;"
											id="main-sec-right">
											<div style="position: relative;" class="zoom-wrap">
												<font style="font-weight: 700"> <a
													href="index.jsp?workgroup=product&work=product_list&category=EC" target="_self"
													style="line-height: 1.42857;"><img
														style="width: 100%; height: auto"
														src="//d319d1tzjwpwbb.cloudfront.net/app/images/2019-06-27/d984f5a200fa0dd10d3fd4f5c40f723f.jpeg"
														class="zoom-out"></a> &gt;<a
													href="index.jsp?workgroup=product&work=product_list&category=EC" target="_self"
													style="line-height: 1.42857;"><img style="height: auto"
														src="//d319d1tzjwpwbb.cloudfront.net/app/images/2019-06-27/d984f5a200fa0dd10d3fd4f5c40f723f.jpeg"
														class="zoom-in"></a> <font style="font-weight: 700">
												</font></font>
												<div
													style="position: absolute; left: 4.7%; top: 5%; color: #ffffff;">
													<font style="font-weight: 700"><font
														style="font-weight: 700">
															<div style="line-height: 1.2; font-size: 30px;">VARIOUS ITEMS</div>



															<div style="margin-top: 30px;">
																<a href="index.jsp?workgroup=product&work=product_list&category=EC" target="_self"
																	style="line-height: 1.42857; margin-right: 15px;">
																	<div class="btn-white"
																		style="float: left; margin-right: 25px;">SHOP</div>



																</a> <a href="index.jsp?workgroup=product&work=product_list&category=EC" target="_self"
																	style="line-height: 1.42857;">
																	<div class="btn-white"
																		style="float: left; margin-right: 25px;">MORE</div>



																</a>
															</div>



													</font></font>
												</div>



											</div>



										</div>



									</div>



									<div class="main-section-1">
										<ul class="layout-ul">



											<li class="layout-li">
												<div class="layout-box">
													<div class="img-box">
														<a href="/categories/147"><img
															src="//d319d1tzjwpwbb.cloudfront.net/app/images/2019-04-10/5a370d1004527835aeb09d930681b75e.jpg"
															alt="PERFORMANCE ITEM"></a>
														<p class="center-button">CLOTHING</p>



														<div class="button-box">
															<div class="button-wrap">
																<p class="title">
																	<a href="#">CLOTHING</a>
																</p>



																<ul class="left">



																	<li><a href="index.jsp?workgroup=product&work=product_list&category=TT">TOP &amp;	T-SHIRTS</a></li>



																	<li><a
																		href="index.jsp?workgroup=product&work=product_list&category=SP">SHORTS
																			&amp; PANTS</a></li>



																	<li><a href="index.jsp?workgroup=product&work=product_list&category=RG">RASHGUARD</a></li>





																	<a href="http://www.spyder.co.kr/categories/212"
																		style="color: rgb(35, 82, 124); text-decoration-line: underline; outline: 0px; cursor: pointer;"></a>
																</ul>



																<ul class="right">



																	<li><a href="index.jsp?workgroup=product&work=product_list&category=SV">SLEEVELESS</a></li>



																	<li><a href="index.jsp?workgroup=product&work=product_list&category=BT"> BRATOP </a></li>




																</ul>



															</div>



														</div>



													</div>



												</div>



											</li>



											<li class="layout-li">
												<div class="layout-box">
													<div class="img-box">
														<a href="/categories/147"><img
															src="//d319d1tzjwpwbb.cloudfront.net/app/images/2019-04-10/dbe47423a4602fa6bce9f0624ba0ee12.jpg"
															alt="PERFORMANCE ITEM"></a>
														<p class="center-button">ACCESSORIES</p>



														<div class="button-box">
															<div class="button-wrap">
																<p class="title">
																	<a href="#">ACCESSORIES</a>
																</p>



																<ul class="left">



																	<li><a href="index.jsp?workgroup=product&work=product_list&category=SH">SHOES</a></li>



																	<li><a
																		href="index.jsp?workgroup=product&work=product_list&category=BG">BAGS </a></li>



																	<li><a href="index.jsp?workgroup=product&work=product_list&category=HT">HATS </a></li>



																</ul>



																<ul class="right">


																	<li><a href="index.jsp?workgroup=product&work=product_list&category=SK">SOCKS </a></li>



																	<li><a href="index.jsp?workgroup=product&work=product_list&category=EC">ETC</a></li>



																</ul>



															</div>



														</div>



													</div>



												</div>



											</li>



										</ul>



									</div>



									<!-- 異붽�遺�遺� -->
									<!--<div style="position:relative;"><font style="font-weight:700"> <img style="width:100%;height:auto" src="//d319d1tzjwpwbb.cloudfront.net/app/images/2018-09-28/2f25ce85f3e57851ca783d7a1e4b7ba5.jpg" "=""> <font style="font-weight:700"> </font></font> <div style="position:absolute;left:2.7%;top:5%;color:#FFFFFF;"><font style="font-weight:700"><font style="font-weight:700"> <div style="line-height: 1.2;font-size:30px;">CYCLE <br>ESSENTIAL ITEMS</div>



 <div style="margin-top: 30px;"> <a href="/mdpick/2018fw_cycleinner" target="_self" style="line-height: 1.42857;margin-right:15px;"> <div class="btn-white" style="float: left; margin-right: 25px;">MORE</div>



 </a> <a href="/product/1109?color=BLK" target="_self" style="line-height: 1.42857;"> <div class="btn-white" style="float: left;margin-right: 25px;">SHOP</div>



 </a> </div>



 &#45;&#45;&gt; </font></font></div>



 </div>



-->
								</div>



							</div>



							<div class="main-center-mobile">
								<h1 class="main-center-title">mobile</h1>



								<!--PERFORMANCE DOWN JACKET COLLECTION-->
								<div class="">
									<a class="baseLink" href="/mdpick/19ss_running"></a>
								</div>



								<div class="main-section-3" style="padding-top: 10px;">
									<div class="">
										<div class="top-banner-item-container">
											<a class="baseLink" href="/product/1492?color=WHT"> <img
												class="top-banner-img"
												src="//d319d1tzjwpwbb.cloudfront.net/app/images/2019-05-28/aeb7a7c3c21d086ac9a4752350419b30.jpg"
												alt="top-banner"></a>
											<div class="top-banner-title">
												BLACK WIDOW<br>RUN
											</div>



											<table class="top-banner-button-table">



												<tbody>



													<tr>



														<td class="td-left"><a class="baseLink"
															href="/product/1492?color=WHT">
																<div class="home-product-btn button-left">SHOP</div>



														</a></td>



														<td class="td-right"><a class="baseLink"
															href="/categories/255">
																<div class="home-product-btn button-right">MORE</div>



														</a></td>



													</tr>



												</tbody>



											</table>



										</div>



									</div>



								</div>



								<div class="main-section-3" style="padding-top: 10px;">
									<div class="">
										<div class="top-banner-item-container">
											<a class="baseLink" href="/product/1488?color=WHT"> <img
												class="top-banner-img"
												src="//d319d1tzjwpwbb.cloudfront.net/app/images/2019-06-24/693566628c6647b94be93d7d4d5edbd3.jpg"
												alt="top-banner"></a>
											<div class="top-banner-title">
												UNISEX LETTERING<br>T-SHIRT
											</div>



											<table class="top-banner-button-table">



												<tbody>



													<tr>



														<td class="td-left"><a class="baseLink"
															href="/product/1488?color=WHT">
																<div class="home-product-btn button-left">SHOP</div>



														</a></td>



														<td class="td-right"><a class="baseLink"
															href="/categories/203">
																<div class="home-product-btn button-right">MORE</div>



														</a></td>



													</tr>



												</tbody>



											</table>



										</div>



									</div>



								</div>


								<div class="main-section-3" style="padding-top: 10px;">
									<div class="">
										<div class="top-banner-item-container">
											<a class="baseLink" href="index.jsp?workgroup=product&work=product_detail&pName=<%=URLEncoder.encode("티스퍼 런","UTF-8") %>"> <img
												class="top-banner-img"
												src="//d319d1tzjwpwbb.cloudfront.net/app/images/2019-06-27/e094b18ce7a7db68d75d8fdc856f12a4.jpeg"
												alt="top-banner"></a>
											<div class="top-banner-title">HYPER VOLT</div>



											<table class="top-banner-button-table">



												<tbody>



													<tr>



														<td class="td-left"><a class="baseLink"
															href="index.jsp?workgroup=product&work=product_detail&category">
																<div class="home-product-btn button-left">SHOP</div>



														</a></td>



														<td class="td-right"><a class="baseLink"
															href="/mdpick/hyper_bolt">
																<div class="home-product-btn button-right">MORE</div>



														</a></td>



													</tr>



												</tbody>



											</table>



										</div>



									</div>



								</div>

								<div class="main-section-3" style="padding-top: 10px;">
									<div class="">
										<div class="top-banner-item-container">
											<a class="baseLink" href="/categories/34"> <img
												class="top-banner-img"
												src="//d319d1tzjwpwbb.cloudfront.net/app/images/2019-04-15/45facb56f62ffaf845317a38b33c99df.jpeg"
												alt="top-banner"></a>
											<div class="top-banner-title">CYCLE NEW ITEM</div>
											<table class="top-banner-button-table">
												<tbody>

													<tr>
														<td class="td-left"><a class="baseLink"
															href="/categories/34">
																<div class="home-product-btn button-left">SHOP</div>
														</a></td>
														<td class="td-right"><a class="baseLink"
															href="/mdpick/19ss_cycle_new">
																<div class="home-product-btn button-right">MORE</div>
														</a></td>
													</tr>
												</tbody>



											</table>



										</div>



									</div>



								</div>



								<div class="main-section-1">
									<div class="category">
										<a href="/categories/198"><img
											src="//d319d1tzjwpwbb.cloudfront.net/app/images/2019-04-10/45accf9a2423ffea859218eb077e7a72.jpg"
											alt="">
											<p>MEN</p> </a>
									</div>



									<div class="category">
										<a href="/categories/3"><img
											src="//d319d1tzjwpwbb.cloudfront.net/app/images/2019-04-10/2efc382fc0e7d1a57af23020ddd3bbce.jpg"
											alt="">
											<p>WOMEN</p> </a>
									</div>



									<div class="category">
										<a href="/categories/4"><img
											src="//d319d1tzjwpwbb.cloudfront.net/app/images/2019-04-10/327c2b6d3a6ea3b108ef1f7b58c0d8d1.jpg"
											alt="">
											<p>SPORTS</p> </a>
									</div>



								</div>



							</div>



						</div>



					</div>
				</div>

				<div class="main-category-section">
					<div class="title new-arrivals-title">NEW ARRIVALS</div>
					<div class="product-category-items">
						<div class="category-item">
							<div class="react-reveal">
								<%	for (ProductDTO pro : productlist) { %>
<%-- 								<%	productlist.get(0).getpName() %> --%>
								<div class="img-box">
									<a
										href="index.jsp?workgroup=product&work=product_detail&pName=<%=URLEncoder.encode(pro.getpName(),"UTF-8")%>&pColor=<%=pro.getpColor()%>"><img
										src="<%=request.getContextPath() %>/home/product/product_images/<%=pro.getpImg() %>"
										alt=""></a>
								<div class="item-title"><%=pro.getpName()%></div>
								<div class="item-price-normal">
									<%=DecimalFormat.getCurrencyInstance().format(pro.getpPrice()) %>원
								</div>
								</div>
								<%
									}
								%>
							</div>
						</div>
					</div>
				</div>
				<div class="pt70"></div>
			</div>
		</div>
	</div>
	
<script>
	$(document).ready(function(){
	  $('.owl-pagination').owlCarousel();
	});
</script>

