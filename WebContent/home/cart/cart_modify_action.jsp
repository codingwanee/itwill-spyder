<%@page import="site.home.dao.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");

	
	String cMemberId = request.getParameter("cMemberId");
	String cProductCode = request.getParameter("cProductCode");
	int qty_check = Integer.parseInt(request.getParameter("qty_check"));

	
	//cart 테이블 수량 변경 메소드 호출
	CartDAO.getDAO().modifyCart(cMemberId, cProductCode, qty_check);
	
	
	response.sendRedirect(request.getContextPath()+"/home/index.jsp?workgroup=cart&work=cart_list");
%>