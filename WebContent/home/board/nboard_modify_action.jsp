<%@page import="util.Utility"%>
<%@page import="site.home.dao.NBoardDAO"%>
<%@page import="site.home.dto.NBoardDTO"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	if(request.getMethod().equals("GET")) {
		response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
		return;
	}

	request.setCharacterEncoding("UTF-8");
		
	int num=Integer.parseInt(request.getParameter("num"));
	
	String subject=Utility.stripTag(request.getParameter("subject"));
	String content=Utility.stripTag(request.getParameter("content"));
		
	if(subject==null|| subject.equals("") || content==null || content.equals("")) {
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
		return;
	}
	
	NBoardDTO board=new NBoardDTO();
	board.setNbBbsno(num);
	board.setNbTitle(subject);
	board.setNbContent(content);
		
	NBoardDAO.getDAO().modifyNBoard(board);
	
	response.sendRedirect(request.getContextPath()+"/home/index.jsp?workgroup=board&work=nboard_detail&num="+num);
%>











