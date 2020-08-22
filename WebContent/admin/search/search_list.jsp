<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<div class="list_searchForm">
	<div id="myOverlay" class="overlay">
		<span class="closebtn" onclick="closeSearch()" title="Close Overlay">×</span>
		<div class="overlay-content">
			<form id="allSearchForm" action="">
				<select id="member_list_searchType1" name="searchTypeMain" onchange="changeSubCategory();">
					<option value="Product" selected="selected">상품</option>
					<option value="Member">회원</option>
					<option value="Order">주문</option>
					<option value="Cart">장바구니</option>
					<option value="PQuestion">1:1문의</option>
					<option value="NBoard">Notice</option>
					<option value="FBoard">FAQ</option>
				</select>
				<select id="member_list_searchType2" name="searchType" >
				</select>
				<input type="text" placeholder="Search.." name="searchKeyword">
				<button type="submit">
					<i class="fa fa-search"></i>
				</button>
			</form>
		</div>
	</div>
</div>

