<%@page import="site.admin.dto.ProductDTO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>

<%
	request.setCharacterEncoding("UTF-8");
	PrintWriter outa = response.getWriter();

	
	ProductDTO pDto = (ProductDTO)request.getAttribute("pDto");
	String message = (String) request.getAttribute("message");
%>

<div class="insert_productForm">
	
	<p>
		메세지 :
		<%=message %></p>
	<p>
		상품코드 :
		<%=pDto.getpCode()%></p>
	<p>
		카테고리1 :
		<%=pDto.getpType1()%>
		카테고리2 :
		<%=pDto.getpType2()%>
	</p>
	<p>
		상품명 : 
		<%=pDto.getpName() %>
	</p>
	<p>
		상품가격 :
		<%=pDto.getpPrice()%></p>
	<p>
		상품사이즈 :
		<%=pDto.getpSize()%>
	</p>
	<p>
		상품색상 :
		<%=pDto.getpColor()%></p>
	<p>
		상품수량 :
		<%=pDto.getpStock()%></p>
	<p>메인 이미지 :
		<%=pDto.getpImg() %>
	</p>
	<p>메인 상세이미지 :
		<%=pDto.getpImgDetail() %>
	</p>
	<p>
		게시여부 :
		<%=pDto.getpPost()%></p>
	<p>
		상품내용 :
		<%=pDto.getpDesc()%></p>
</div>