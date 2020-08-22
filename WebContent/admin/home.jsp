<%@page import="site.home.dto.PQuestionDTO"%>
<%@page import="site.home.dto.NBoardDTO"%>
<%@page import="site.home.dao.PQuestionDAO"%>
<%@page import="site.home.dao.NBoardDAO"%>
<%@page import="site.admin.dao.OrderDAO"%>
<%@page import="site.home.dto.OrderDTO"%>
<%@page import="site.admin.dto.ProductDTO"%>
<%@page import="site.admin.dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%
	ProductDAO pDao = ProductDAO.getDao();
	OrderDAO oDao = OrderDAO.getDAO();
	NBoardDAO nbDao = NBoardDAO.getDAO();
	PQuestionDAO pqDao = PQuestionDAO.getDAO();

	List<ProductDTO> productList= pDao.getProductList(1, 10, "", "");
	List<OrderDTO> orderList= oDao.getAllOrderList(1, 10, "", "");
	String[] orderState = {"입금대기중","결제완료","상품준비중","상품준비완료","배송중","배송완료","취소대기","취소완료"};
	
	List<NBoardDTO> nboardList = nbDao.getNBoardList(1, 10, "", "");
	List<PQuestionDTO> pquestionList = pqDao.getPQuestionList(1, 10, "", "");
	
	
%>
<div class="home_header">
	<h1>S　P　Y　D　E　R</h1>
	<p>Administrator Site</p>
</div>

<div class="home_navbar">
	<a href="<%=request.getContextPath()%>/listProduct.spyder">상품</a>
	<a href="<%=request.getContextPath()%>/listMember.spyder">회원</a>
	<a href="<%=request.getContextPath()%>/listOrder.spyder">주문</a>
	<a href="<%=request.getContextPath()%>/listCart.spyder">장바구니</a>
	<div class="dropdown">
	<button class="dropbtn">게시판&nbsp;<i class="fa fa-caret-down"></i></button>
	<div class="dropdown-content">
      <a href="<%=request.getContextPath()%>/listPQuestion.spyder">1:1문의</a>
      <a href="<%=request.getContextPath()%>/listNBoard.spyder">Notice</a>
      <a href="<%=request.getContextPath()%>/listFBoard.spyder">FAQ</a>
    </div>
    </div>
	<a href="javascript:void(0);" class="right" onclick="openSearch();">검색</a>
	
</div>

<div class="home_row">
	<div class="home_side">
		<h2><a href="<%=request.getContextPath()%>/listNBoard.spyder">공지사항</a></h2>
		<div class="boardBox">
		<hr style="border-color:black;height:1px;">
		<%for(int i=0;i<nboardList.size();i++){ %>
		<p><%=nboardList.get(i).getNbBbsno() %>. <%=nboardList.get(i).getNbTitle() %><p>
		<hr>
		<%} %>
		</div>
		<br>
		<h2><a href="<%=request.getContextPath()%>/listPQuestion.spyder">1:1 문의사항</a></h2>
		<div class="boardBox">
		<hr style="border-color:black;height:1px;">
		<%for(int i=0;i<pquestionList.size();i++){ %>
		<p><%=pquestionList.get(i).getPqBbsno() %>. <%=pquestionList.get(i).getPqTitle() %><p>
		<hr>
		<%} %>
		</div>
	</div>
	<div class="home_main">
		<h2><a href="<%=request.getContextPath()%>/listProduct.spyder">상품목록</a></h2>
		<hr style="border-color:black;height:1px;">
		<div class="imgBox">
			<%for(int i=0;i<productList.size();i++){%>
			<div class="imgBoxInner">
			<div class="textCss"><%=productList.get(i).getpName()%></div>
			<div class="imgCss" style="background-image:url('/spyder/home/product/product_images/<%=productList.get(i).getpImg()%>')" ></div>
			</div>
			<%} %>
		</div>
		<br>
		<h2><a href="<%=request.getContextPath()%>/listOrder.spyder">주문목록</a></h2>
		<hr style="border-color:black;height:1px;">
		<table class="type02" cellspacing="0">
			<thead>
			<tr>
				<th>회원아이디</th>
				<th>금액</th>
				<th>상태</th>
			</tr>
		</thead>
		<tbody>
			<%for(int i=0;i<orderList.size();i++){ %>
			<tr>
				<td><%=orderList.get(i).getoMemberId() %></td>
				<td><%=orderList.get(i).getoTprice() %></td>
				<td><%=orderState[orderList.get(i).getoStatus()-1]%></td>
			</tr>
			<%} %>
		</tbody>
		</table>
	</div>
</div>