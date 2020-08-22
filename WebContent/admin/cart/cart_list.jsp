<%@page import="site.home.dto.CartDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<CartDTO> cartList = (List<CartDTO>)request.getAttribute("cartList");
	String contextPath = request.getContextPath(); 

	int currentPage = (int) request.getAttribute("page");
	int cnt = (int)request.getAttribute("cnt");
	int maxPage = (int)Math.ceil((cnt/10.0));

	String searchType = (String)request.getAttribute("searchType");
	String searchKeyword = (String)request.getAttribute("searchKeyword");

	//요청쿼리 병합
	String query = "searchType="+searchType+"&searchKeyword="+searchKeyword;
	
	System.out.println("cart_list.jsp] contextPath : "+contextPath);

	System.out.println("cart_list.jsp] currentPage : " + cnt);
	System.out.println("cart_list.jsp] cnt : " + cnt);
	System.out.println("cart_list.jsp] maxPage : " + maxPage);





%>
<div class="list_cartForm">	
	<table class="type02" cellspacing="0">
		<thead>
			<tr>
				<th>번호</th>
				<th>회원아이디</th>
				<th>상품코드</th>
				<th>수량</th>
			</tr>
		</thead>
		<tbody>
		<%if(cartList.size()==0){ %>
				<tr>
					<td colspan="4">조회된 결과가 없습니다.</td>
				</tr>
		<%}else{ %>
			<%for(int i=0;i<cartList.size();i++){ %>	
				<tr>
					<td><%=cartList.get(i).getcId()%></td>
					<td><%=cartList.get(i).getcMemberId()%></td>
					<td><%=cartList.get(i).getcProductCode()%></td>
					<td><%=cartList.get(i).getcQty()%></td>
				</tr>
			<%} %>
		<%} %>
		</tbody>
	</table>
	<div class="searchBox">
		<form id="cart_list_searchForm" action="<%=contextPath%>/listCart.spyder">
			<div class="inner-selectBox">
				<select class="inner-select" id="cart_list_searchType" name="searchType">
					<option value="c_id">번호</option>
					<option value="c_memberid">회원아이디</option>
					<option value="c_product">상품코드</option>
				</select>
			</div>
			<div class="inner-search-container">
				<input type="text" placeholder="Search.." id="cart_list_searchKeyword" name="searchKeyword" autocomplete="off">
				<button type="submit">
					<i class="fa fa-search"></i>
				</button>
			</div>
		</form>
	</div>
	<div class="list_number">
		<div>
			<p>
			<div class="list_n_menu">
			<%
					if ((currentPage + 9) % 10 == 0) {
				%>
				<span class="disabled">&lt; 이전</span>
				<%
					} else {

				%>
					
					<a href="<%=contextPath%>/listCart.spyder?page=<%=currentPage - 1%>&<%=query%>">&lt; 이전</a>
				<%
					}
				%>
				<%
					for (int i = 1; i <= maxPage; i++) {
				%>
				<%
					if (i == currentPage) {
				%>
				<span class="current"><%=i%></span>
				<%
					} else {
				%>
				<a href="<%=contextPath%>/listCart.spyder?page=<%=i%>&<%=query%>"><%=i%></a>
				<%
					}
				%>
				<%
					}
				%>
				<%
					if (currentPage == maxPage || maxPage==0) {
				%>
				<span class="disabled">다음 &gt;</span>
				<%
					} else {
				%>
				<a href="<%=contextPath%>/listCart.spyder?page=<%=currentPage + 1%>&<%=query%>">다음 &gt;</a>
				<%
					}
				%>
			</div>
			</p>
		</div>
	</div>
	<hr style="border: 0; height: 1px; background-color: #5B768F">
</div>