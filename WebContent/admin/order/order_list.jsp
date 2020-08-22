<%@page import="site.home.dto.OrderDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<OrderDTO> orderList = (List<OrderDTO>)request.getAttribute("orderList");
	
	String contextPath = request.getContextPath(); 

	int currentPage = (int) request.getAttribute("page");
	int cnt = (int)request.getAttribute("cnt");
	int maxPage = (int)Math.ceil((cnt/10.0));

	String searchType = (String)request.getAttribute("searchType");
	String searchKeyword = (String)request.getAttribute("searchKeyword");

	//요청쿼리 병합
	String query = "searchType="+searchType+"&searchKeyword="+searchKeyword;

	String[] orderState = {"입금대기중","결제완료","상품준비중","상품준비완료","배송중","배송완료","취소대기","취소완료"};
	
	String[] buttonName = {"입금확인","상품준비","준비완료","배송","수취확인","완료","취소","처리완료"};
	
	System.out.println("order_list.jsp] contextPath : "+contextPath);

	System.out.println("order_list.jsp] currentPage : " + cnt);
	System.out.println("order_list.jsp] cnt : " + cnt);
	System.out.println("order_list.jsp] maxPage : " + maxPage);

	

%>
<div class="list_orderForm">
	<table class="type02" cellspacing="0">
		<thead>
			<tr>
				<th>주문코드</th>
				<th>회원아이디</th>
				<th>주문일</th>
				<th>총액</th>
				<th>상태</th>
				<th>변경</th>
			</tr>
		</thead>
		<tbody>
		<form id="order_list_form" action="<%=request.getContextPath()%>/listOrder.spyder" method="post">
		<%if(orderList.size()==0){ %>
				<tr>
					<td colspan="6">조회된 결과가 없습니다.</td>
				</tr>
		<%}else{ %>
			<%for(int i=0;i<orderList.size();i++){ %>	
				
				<tr>
					<td><%=orderList.get(i).getoCode()%></td>
					<td><%=orderList.get(i).getoMemberId()%></td>
					<td><%=orderList.get(i).getoDate().substring(0, 10)%></td>
					<td><%=String.format("%,d", orderList.get(i).getoTprice())%></td>
					<td><%=orderState[orderList.get(i).getoStatus()-1]%></td>
					<td>
						<%if(orderList.get(i).getoStatus()==6 || orderList.get(i).getoStatus()==8){ %>
							<button type="button" id="<%=orderList.get(i).getoCode()%>" 
							class="button" onclick="" disabled="disabled" style="background:gray">
							<%=buttonName[orderList.get(i).getoStatus()-1] %></button>
						<%}else{%>
						<button type="button" id="<%=orderList.get(i).getoCode()%>" class="button" onclick="changeState(this);">
						<%=buttonName[orderList.get(i).getoStatus()-1] %></button>
						<%} %>
					</td>
					
				</tr>
				<input type="hidden" id="orderCode" name="orderCode" value=""></input>
			<%} %>
		<%} %>
		</form>
		</tbody>
	</table>
	<div class="searchBox">
		<form id="order_list_searchForm" action="<%=contextPath%>/listOrder.spyder">
			<div class="inner-selectBox">
				<select class="inner-select" id="order_list_searchType" name="searchType">
					<option value="o_code">주문코드</option>
					<option value="o_memberid">회원아이디</option>
					<option value="o_date">주문일</option>
					<option value="o_state">상태</option>
				</select>
			</div>
			<div class="inner-search-container">
				<input type="text" placeholder="Search.." id="order_list_searchKeyword" name="searchKeyword" autocomplete="off">
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
					
					<a href="<%=contextPath%>/listOrder.spyder?page=<%=currentPage - 1%>&<%=query%>">&lt; 이전</a>
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
				<a href="<%=contextPath%>/listOrder.spyder?page=<%=i%>&<%=query%>"><%=i%></a>
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
				<a href="<%=contextPath%>/listOrder.spyder?page=<%=currentPage + 1%>&<%=query%>">다음 &gt;</a>
				<%
					}
				%>
			</div>
			</p>
		</div>
	</div>
	<hr style="border: 0; height: 1px; background-color: #5B768F">
</div>
<script type="text/javascript">
function changeState(evt) {
	var id = evt.id;
	//alert("id : "+id);
	$("#orderCode").val(id);
	$("#order_list_form").submit();
}

</script>