<%@page import="site.home.dto.CartDTO"%>
<%@page import="site.home.dao.CartDAO"%>
<%@page import="site.home.dto.MemberDTO"%>
<%@page import="site.home.dto.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	if(request.getMethod().equals("GET")) {
		response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
		return;
	}
	String cCode= CartDAO.getDAO().getCode();
	
	request.setCharacterEncoding("UTF-8");
		
	String id = request.getParameter("mId");
	
	String cProductCode = request.getParameter("pCode");
	int cQty = Integer.parseInt(request.getParameter("qty"));
	
	CartDTO cart = new CartDTO();
	
	cart.setcMemberId(id);
	cart.setcProductCode(cProductCode);
	cart.setcQty(cQty);
	
	CartDAO.getDAO().addCart(cart);

	
	response.sendRedirect(request.getContextPath()+"/home/index.jsp?workgroup=order&work=order_write");
%>