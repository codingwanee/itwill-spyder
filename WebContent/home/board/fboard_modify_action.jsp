<%@page import="util.Utility"%>
<%@page import="site.home.dao.FBoardDAO"%>
<%@page import="site.home.dto.FBoardDTO"%>
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
	String category=request.getParameter("category");
		
	if(subject==null|| subject.equals("") || content==null || content.equals("")) {
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
		return;
	}
		
	FBoardDTO board=new FBoardDTO();
	board.setFbBbsno(num);
	board.setFbTitle(subject);
	board.setFbContent(content);
	board.setFbCategory(category);
			
	FBoardDAO.getDAO().modifyFBoard(board);
		
	response.sendRedirect(request.getContextPath()+"/home/index.jsp?workgroup=board&work=faq");
%>











