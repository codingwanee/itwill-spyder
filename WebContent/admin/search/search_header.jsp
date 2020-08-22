<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="inner_header">
	<h1>검색리스트</h1>
	<hr style="padding: 0">
	<div class="inner_topnav">
		<a class="active" href="javascript:void(0);"
			onclick="eventHandler(this);" id="innerTab_Search_Product">상품</a> <a
			href="javascript:void(0);" onclick="eventHandler(this);"
			id="innerTab_Search_Memeber">회원</a> <a href="javascript:void(0);"
			onclick="eventHandler(this);" id="innerTab_Search_Order">주문</a> <a
			href="javascript:void(0);" onclick="eventHandler(this);"
			id="innerTab_Search_Cart">장바구니</a>
		<div class="dropdown">
			<button class="dropbtn">
				게시판&nbsp;<i class="fa fa-caret-down"></i>
			</button>
			<div class="dropdown-content">
				<a href="#">1:1문의</a> <a href="#">Notice</a> <a href="#">FAQ</a>
			</div>
		</div>
	</div>
</div>