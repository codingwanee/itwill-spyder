<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>

	<div id="myOverlay" class="overlay">
		<span class="closebtn" onclick="closeSearch()" title="Close Overlay">×</span>
		<div class="overlay-content">
			<form id="allSearchForm" action="">
			<div class="select">
				<select id="allSearchType1" name="searchTypeMain" onchange="changeSubCategory();">
					<option value="Product" selected="selected">상품</option>
					<option value="Member">회원</option>
					<option value="Order">주문</option>
					<option value="Cart">장바구니</option>
					<option value="PQuestion">1:1문의</option>
					<option value="NBoard">Notice</option>
					<option value="FBoard">FAQ</option>
				</select>
			</div>
			<div class="select">
				<select id="allSearchType2" name="searchType" >
				</select>
			</div>
				<input type="text" id="allSearchInput" placeholder="Search.." name="searchKeyword" autocomplete="off">
				<button type="submit">
					<i class="fa fa-search"></i>
				</button>
			</form>
		</div>
	</div>

<script type="text/javascript">
/*
$(document).ready(function() { 
	
	openSearch();
	
});*/

function changeSubCategory() {
	
	var name = $("#allSearchType1 option:selected").val();
	
	//value리스트
	var categoryValueList = {
		Product : ["p_code","p_type1","p_type2","p_name","p_regidate","p_post"],
		Member : ["m_id","m_name","m_email","m_phone","m_address1","m_signdate"],
		Order : ["o_code","o_memberid","o_date","o_state"],
		Cart : ["c_id","c_memberid","c_productcode"],
		PQuestion : ["pq_bbsno","pq_memberid","pq_category","pq_title","pq_content","pq_regidate","pq_statis2"],
		NBoard : ["nb_bbsno","nb_title","nb_content","nb_regidate"],
		FBoard : ["fb_bbsno","fb_title","fb_content","fb_regidate"]
	}
	
	//text리스트
	var categoryTextList = {
			Product : ["상품코드","분류1","분류2","상품명","등록일","상태"],
			Member : ["아이디","이름","이메일","연락처","주소","가입일자"],
			Order : ["주문코드","회원아이디","주문일","상태"],
			Cart : ["번호","회원아이디","상품코드"],
			PQuestion : ["번호","회원아이디","분류","제목","내용","작성일","상태"],
			NBoard : ["번호","제목","내용","작성일"],
			FBoard : ["번호","카테고리","제목","작성일"]
		
	}

	//옵션모두삭제
	$("#allSearchType2 option").remove();
	
	//옵션추가
	$.each(categoryValueList[name], function(index, value) {
		
		$("#allSearchType2").append("<option value='"+value+"'>"+categoryTextList[name][index]+"</option>");
		console.log("name : "+name+", List Value : " + value + " "+"List Text : " + categoryTextList[name][index]);
	}); 
	
	//액션변경
	var contextPath = "<%=contextPath%>";
	var actionPath = contextPath+"/list"+name+".spyder";
	
	console.log("actionPath : "+ actionPath);
	$("#allSearchForm").attr("action",actionPath);
	
	//alert("aaa : "+$("#member_list_searchType2").val());
}

function openSearch() {
	//열때 서브카테고리 초기화
	changeSubCategory();
	document.getElementById("myOverlay").style.display = "block";
}

function closeSearch() {
	 document.getElementById("myOverlay").style.display = "none";
}

</script>