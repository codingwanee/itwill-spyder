<%@page import="site.home.dao.OrderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	/* if(request.getMethod().equals("GET")) {
		response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
		return;
	} */
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String oCode = request.getParameter("oCode");
	
	
	//cart 테이블 수량 변경 메소드 호출
	OrderDAO.getDAO().modifyOrder(oCode);
	
	
	response.sendRedirect(request.getContextPath()+"/home/index.jsp?workgroup=login&work=mypage&oState=0");


%>