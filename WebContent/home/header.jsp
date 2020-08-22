<%@page import="site.home.dto.MemberDTO"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	MemberDTO loginMember = (MemberDTO) session.getAttribute("loginMember");
%>

<div class="header-fixed">
	<div class="header-wide-container">
		<div class="header-main-menus-area null">
			<div class="header-sliding-menu"></div>
			<div class="header-wrap">
				<div class="header-box">
					<a class="header-item" href="index.jsp"><img class="header-logo" src="//d319d1tzjwpwbb.cloudfront.net/desktop/icons/icon_spyder_logo.svg" alt="Spider"></a>


					<div class="header-main-menus">
						<ul id="menuList">
							<li><div class="header-menu-button-content">
									<div class="header-menu-button" id="submenu-198">SEE ALL</div>
									<div class="dropdown-content">

										<div class="dropdown-menu-column">
											<ul>								
												<li><br></li>
												<li><a href="index.jsp?workgroup=product&work=product_list&category=TT">Top&T-shirts</a></li>
												<li><a href="index.jsp?workgroup=product&work=product_list&category=SP">Shorts&Pants</a></li>
												<li><a href="index.jsp?workgroup=product&work=product_list&category=RG">RASHGUARD</a></li>
												<li><a href="index.jsp?workgroup=product&work=product_list&category=SV">SLEEVELESS</a></li>
												<li><a href="index.jsp?workgroup=product&work=product_list&category=BT">BRA-TOP</a></li>
											</ul>
										</div>
										<div class="dropdown-menu-column">
											<ul>
												<li><a href="index.jsp?workgroup=product&work=product_list&category=SH">SHOES</a></li>
												<li><a href="index.jsp?workgroup=product&work=product_list&category=BG">BAGS</a></li>
												<li><a href="index.jsp?workgroup=product&work=product_list&category=HT">HATS</a></li>
												<li><a href="index.jsp?workgroup=product&work=product_list&category=SK">SOCKS</a></li>
												<li><a href="index.jsp?workgroup=product&work=product_list&category=EC">ETC</a></li>
											</ul>
										</div>
									</div>
								</div></li>

							<li><div class="header-menu-button-content">
									<div class="abcabc">
										<div class="header-menu-button" id="submenu-198">CLOTHING</div>
										<div class="dropdown-content">
											<div class="dropdown-menu-column">
												<ul>
												<li><br></li>						
													<li><a href="index.jsp?workgroup=product&work=product_list&category=TT">Top&T-shirts</a></li>
													<li><a href="index.jsp?workgroup=product&work=product_list&category=SP">Shorts&Pants</a></li>
													<li><a href="index.jsp?workgroup=product&work=product_list&category=RG">RASHGUARD</a></li>
													<li><a href="index.jsp?workgroup=product&work=product_list&category=SV">SLEEVELESS</a></li>
													<li><a href="index.jsp?workgroup=product&work=product_list&category=BT">BRA-TOP</a></li>
												<li><br></li>
												</ul>
											</div>
										</div>
									</div>
								</div></li>

							<li><div class="header-menu-button-content">
									<div class="header-menu-button" id="submenu-198">ACCESSORIES</div>
									<div class="dropdown-content">
									<div class="dropdown-menu-column-wrap">
										<div class="dropdown-menu-column">
											<ul>
												<li><br></li>
												<li><a href="index.jsp?workgroup=product&work=product_list&category=SH">SHOES</a></li>
												<li><a href="index.jsp?workgroup=product&work=product_list&category=BG">BAGS</a></li>
												<li><a href="index.jsp?workgroup=product&work=product_list&category=HT">HATS</a></li>
												<li><a href="index.jsp?workgroup=product&work=product_list&category=SK">SOCKS</a></li>
												<li><a href="index.jsp?workgroup=product&work=product_list&category=EC">ETC</a></li>
<li><br></li>
											</ul>
										</div>
									</div>
								</div></li>

						</ul>
					</div>


					<!-- aaa.html에서 긁어온 것

<div class="dropdown-menu-wrap">

	첫번째 메뉴 : CLOTHING
	<div class="dropdown">
		<span>CLOTHING</span>
		<div class="dropdown-content">
		
			좌측공백 구간
			<div class="gongbek"> </div>

			드롭다운 메뉴
			<div class="dropdwon-menu-zone">
				드롭다운 메뉴출력 (1) : CLOTHING
				<div class="dropdown-menu-column">
					<ul>
						<li class="ulli-head">CLOTHING</li>
						<li><br></li>
						<li><a href="index.jsp?workgroup=prdouct&work=product_list">Top&T-shirts</a></li>
						<li>Shorts&Pants</li>
						<li>Outer</li>
					</ul>
				</div>
				드롭다운 메뉴출력 (2) : SHOES
				<div class="dropdown-menu-column">
					<ul>
						<li class="ulli-head">SHOES</li>
						<li><br></li>
						<li>Running</li>
						<li>Cycle</li>
						<li>Baseball</li>
					</ul>
				</div>
				드롭다운 메뉴출력 (3) : ACCESSORIES
				<div class="dropdown-menu-column">
					<ul>
						<li class="ulli-head">ACCESSORIES</li>
						<li><br></li>
						<li>Bag</li>
						<li>Hat</li>
						<li>ETC</li>
					</ul>
				</div>

			</div>
			오른쪽 이미지 출력 구간
			<div class="image-wrap">
				첫 번째 이미지
				<div class="image-in-dropdownmenu">
					<img width="200"
						src="//d319d1tzjwpwbb.cloudfront.net/app/images/2019-06-04/4919dda61316afd9bdf6d4c7d0a271a2_640.jpg"
						alt="go mypage" class="img-mypage">
				</div>
				두 번째 이미지
				<div class="image-in-dropdownmenu">
					<img width="200"
						src="//d319d1tzjwpwbb.cloudfront.net/app/images/2019-05-07/d31beea6306cd58bcb8d50256d958eea_640.jpg"
						alt="go mypage" class="img-mypage">
				</div>
			</div>

		</div>
	</div>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		두번째 메뉴 : SHOES
	<div class="dropdown">
		<span>SHOES</span>
		<div class="dropdown-content">
			<div class="gonbek"></div>
			<ul>
				<li class="ulli-head">CLOTHING</li>
				<li>b</li>
				<li>c</li>
				<li>d</li>
			</ul>
		</div>
	</div>

	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	
		세번째 메뉴 : ACCESSORIES
	<div class="dropdown">
		<span>ACCESSORIES</span>
		<div class="dropdown-content">
			<ul>
				<li class="ulli-head">CLOTHING</li>
				<li>b</li>
				<li>c</li>
				<li>d</li>
			</ul>
		</div>
	</div>
</div>

 -->
<!-- 					<div class="header-searchbox-wrap false">
						<form action="index.jsp?work=product&workgroup=product_searchresult&keyword=keyword" accept-charset="utf-8" name="product_searchresult" method="get">
							<input type="textbox" class="header-searchbox">
							<div class="click-area"></div>
						</form>
					</div> -->
					<div class="header-left-menus" style="height: 45px;"></div>
					<div class="header-right-menus">
						<div class="top_box">
							<div class="menu-item top_item_a">
								
								<span>
								<%if (loginMember == null) {//비로그인상태%> 
								<a href="index.jsp?workgroup=login&work=joinmembership">SIGN UP</a>
								/ <a href="index.jsp?workgroup=login&work=loginpopup">LOGIN</a>
								<%} else {//로그인 상태 %>
									<%if (loginMember.getmType()==9){ %>
									<a href="<%=request.getContextPath()%>/admin/loginPage.jsp">[ 관리자페이지 ]</a> / 
									<% } %>
								<a href="#" onclick="mypagebutton();"><%=loginMember.getmName() %></a> /
								<a href="#" onclick="logout();">LOGOUT</a>
								<% } %>
								</span>
								
							</div>
							
						</div>
						<a href="index.jsp?workgroup=login&work=mypage&oState=1" class="baseLink"> <img src="//d319d1tzjwpwbb.cloudfront.net/desktop/icons/icon_mypage_grey.svg" alt="go mypage" class="img-mypage">
						</a> <a href="index.jsp?workgroup=cart&work=cart_list" class="baseLink"> <img src="//d319d1tzjwpwbb.cloudfront.net/desktop/icons/icon_cart_grey.svg" alt="go cart" class="img-cart"></a> <font class="baseLink menu-item" style="position: absolute; right: 0px; text-transform: uppercase; font-size: 8px; margin: 0px; top: 6px;"></font>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>



<script>
	function logout() {
		window.location.href = "login/logout_action.jsp";
	}

	function logout() {
		window.location.href = "login/logout_action.jsp";
	}
	function mypagebutton() {
		window.location.href = "index.jsp?workgroup=login&work=mypage&oState=0";
	}
</script>