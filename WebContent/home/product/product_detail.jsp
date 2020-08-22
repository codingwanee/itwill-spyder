<%@page import="site.home.dto.MemberDTO"%>
<%@page import="sun.security.util.Length"%>
<%@page import="java.util.List"%>
<%@page import="site.home.dto.ProductDTO"%>
<%@page import="site.home.dao.ProductDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	MemberDTO loginMember = (MemberDTO) session.getAttribute("loginMember");
	
	String mid= "";
	if(loginMember!=null){
	    mid= loginMember.getmId();
	}
	
	String pName = request.getParameter("pName");
	String pColor = request.getParameter("pColor");
	
	ProductDTO pDto = ProductDAO.getDAO().getInforForDetail(pName);
	List<ProductDTO> colorList = ProductDAO.getDAO().getProductColor(pName);
	List<ProductDTO> sizeList = ProductDAO.getDAO().getProductSize(pName, pColor);
	ProductDTO img= ProductDAO.getDAO().getProductImg(pName, pColor);
	int qty = 1;


%>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/home/home.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js">
	
</script>


<div class="app-children-box-140">
	<div class="wide-container">
		<div class="product-detail-contents-renewal">
			<div class="product-detail-path">
				<a href="index.jsp?workgroup=main&work=mainpage"><span class="path">Home</span></a><span
					class="path"> &gt; </span><a
					href="index.jsp?workgroup=product&work=product_list&category=<%=pDto.getpType2() %>"><span
					class="path">
					
					<% String categoryTitle = pDto.getpType1();
					if(categoryTitle=="C"){ categoryTitle="CLOTHING"; } else { categoryTitle="ACCESSORIES"; } %>
					
					<%=categoryTitle %>
					</span></a><span class="path">
					&gt; </span> <span class="title"><%=pDto.getpName()%></span>
			</div>

			<div class="clearfix">
				<div class="product-image-grid">
<!-- 					<video class="thumbnail-image"
						src="//d319d1tzjwpwbb.cloudfront.net/app/videos/2019-03-19/02.mp4"
						type="video/mp4" height="auto" preload="true" loop="" autoplay=""
						style="float: left;"></video> -->
					<a href="#1231/0"></a>			
					<img alt=""
						src="<%=request.getContextPath() %>/home/product/product_images/<%= img.getpImg()%>"
						class="thumbnail-image">
		
							<% String imgDetail = img.getpImgDetail();%>
							<% String[] splitedPath = imgDetail.split(" | ");%>
							<% int splitedLengh = splitedPath.length; %>
						
							<% for(int i=0; i<=(splitedLengh/2)-1; i+=2) { %>
								<img alt=""	
									src="<%=request.getContextPath() %>/home/product/product_images/<%=splitedPath[i] %>"
									class="thumbnail-image">
							<% } %>
						
<!-- 					<div class="product-images-full-view false show">
						<a href="#" class="x-btn"><div class="button-wrapper">
								<img
									src="//d319d1tzjwpwbb.cloudfront.net/common/icons/x_grey.svg"
									alt="">
							</div>
							
							
							
							<div class="gallery-images">
												

								<figure class="gallery-images-item">
								</figure>
							</div></a>
					</div> -->
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

					<div class="product-detail-info">
						<form name="product_detail_Form" id="detail"
							<%-- action="<%=request.getContextPath()%>/home/cart/cart_add_action.jsp?pName=<%=pName%>&qty=<%=qty%>" --%>
							method="post">
							
						<input type="hidden" id="pName" name="pName" value="<%=pName%>">
						<input type="hidden" id="pCode" name="pCode" value="">
						<input type="hidden" id="mId" name="mId" value="<%=mid%>">
						
							<div class="product-info">
								<div class="name" id="pName"><%=pDto.getpName()%></div>
								<div class="pno-and-price">
									<span class="price" id="pPrice"><%=pDto.getpPrice()%>원</span>
								</div>
								<div class="color-variation-box">
								

										<% for(ProductDTO color:colorList) { %>										
										<a href="index.jsp?workgroup=product&work=product_detail&pName=<%=pName %>&pColor=<%=color.getpColor()%>">
										<img
										alt="<%=color.getpColor() %>" class="color-variation-image"
										src="<%=request.getContextPath()%>/home/product/product_images/<%=color.getpImg()%>"></a>
										<% } %>
										
								</div>
								<div class="size">
									<div class="text-wrap">
										사이즈 선택 <a href="#popup_sizetable" class="size-table-text">사이즈조견표</a>
									</div>
									
									<div class="product-size-selector">
										<div class="product-size-selector-box">
											<%-- <% for(ProductDTO size : sizeList) { %> --%>
											
											<%-- <span class="item  selected"><%=splitedPath %></span>--%>
											<% for(ProductDTO size:sizeList ){	%>
				
											<span id="<%=size.getpSize() %>" class="item buttonCss" ><%=size.getpSize() %></span>
											
											
											
											 <% } %>

 

										</div>
									</div>
								</div>
								<div class="quantity">
									<div class="title">수량</div>
									<div class="product-quantity-count">
										<div class="quantity-count">

											<a id="Qty_down">
												<div class="quantity-count-block">
													<img class="quantity-count-block-btn-img"
														src="//d319d1tzjwpwbb.cloudfront.net/common/icons/btn_-(gray).svg"
														alt="">
												</div>
											</a>
											<div class="quantity-count-blank"></div>

											<input type="hidden" name="qty" id="qty" value="<%=qty%>">
											<div class="quantity-count-block" id="Qty_div">
												<%=qty%>
											</div>
											<div class="quantity-count-blank"></div>

											<a id="Qty_up">
												<div class="quantity-count-block">
													<img class="quantity-count-block-btn-img"
														src="//d319d1tzjwpwbb.cloudfront.net/common/icons/btn_%2B(gray).svg"
														alt="">
												</div>
											</a>
										</div>
									</div>
								</div>
								<div class="button-box clearfix">
									<a href="#"
										onclick=<%if(loginMember==null){%> "loginpopup();">
											<% }else{%>
											"goCart();">
											<%} %>
										<div class="button cart-button">CART</div>
									</a> 
									<%-- 
									<a href="#" onclick=<%if(loginMember==null){%> "loginpopup();">
													<% }else{%>
													"goCart();">
													<%} %>
										class="baseLink"><div class="button buy-button">BUY</div></a>
										 --%>
										
								</div>
								<div class="bene-box" style="font-size: 15px; color: #080808;">
									<a class="baseLink prev-link"
										href="index.jsp?workgroup=board&work=benefit"><div
											class="desc-title">혜택</div></a>
									<div class="link-area">
										<a class="baseLink prev-link"
											href="index.jsp?workgroup=product&work=free_interest">무이자
											할부</a><span>/</span><a class="baseLink prev-link"
											href="index.jsp?workgroup=product&work=free_return">무료 반품</a>
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
							</div>
							<div style="line-height: 1.2;">
								<span style="font-size: 14px; font-family: &amp; amp;"><br></span>
							</div>
							<div style="line-height: 1.2;">
								<span style="font-size: 14px; font-family: &amp; amp;"><br></span>
							</div>
							<div style="line-height: 1.2;">
								<span style="font-family: &amp; amp;"><span
									style="font-size: 14px;"> •제조사:&nbsp;<%=pDto.getpCompany()%></span><br></span>
							</div>
							<p style="font-size: 11.1111px; line-height: 1.2;">
								<span style="font-size: 14px; font-family: &amp; amp;">•제조국:&nbsp;<%=pDto.getpCountry()%></span>
							</p>
							<p style="font-size: 11.1111px; line-height: 1.2;">
								<span style="font-size: 14px; font-family: &amp; amp;">•제조년월:&nbsp;<%=pDto.getpMndate()%></span>
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
								<span style="font-size: 14px; font-family: &amp; amp;">•고객센터:&nbsp;1588-5863</span>
							</p>
						</div>
					</div>
				</div>


			</div>
							</div>
						</form>
					</div>

				</div>
			</div>
		</div>
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
	
	
	<% for(ProductDTO size:sizeList ){	%>
	$("#<%=size.getpSize() %>").click(function () {
		
		$(".buttonCss").css("border-color","#e5e5e5");
		$(".buttonCss").css("color","#6d6d6d");
		$("#pCode").val("<%=size.getpCode()%>");
		$("#<%=size.getpSize() %>").css("border-color","#ca0000");
		$("#<%=size.getpSize() %>").css("color","#ca0000");
	});
	<%}%>
	
	
	
	function loginpopup() {
		window.location.href="index.jsp?workgroup=login&work=loginpopup";

	};
	
	function goCart(){
		
		if($("#pCode").val()===null || $("#pCode").val()===""){
			alert("사이즈를 선택하세요.");
			return;
		}else{
			if(confirm("장바구니에 넣으시겠습니까 ? ")){
				$("#detail").attr("method","post");
				$("#detail").attr("action","<%=request.getContextPath()%>/home/cart/cart_add_action.jsp");
				
				$("#detail").submit();
			}else{
				return;	
			}
		}
		
		
	}
	
	function goOrder(){
		if(confirm("구매하시겠습니까 ?")){
			$("#detail").attr("method","post");
			$("#detail").attr("action","<%=request.getContextPath()%>/home/cart/cart_add_action.jsp");
			window.close();
			$("#detail").submit();
		}else{
			return;	
		}
	}
</script>




