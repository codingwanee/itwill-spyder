<%@page import="site.home.dto.MemberDTO"%>
<%@page import="util.Utility"%>
<%@page import="site.home.dao.NBoardDAO"%>
<%@page import="site.home.dto.NBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(request.getMethod().equals("GET")) {
		response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
		return;
	}

	request.setCharacterEncoding("UTF-8");
		
	String subject=Utility.stripTag(request.getParameter("subject"));
	String content=Utility.stripTag(request.getParameter("content"));
		
	if(subject==null|| subject.equals("") || content==null || content.equals("")) {
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
		return;
	}
	
	int num=NBoardDAO.getDAO().getBoardNum();
	
	MemberDTO loginMember=(MemberDTO)session.getAttribute("loginMember");
		
	NBoardDTO board=new NBoardDTO();
	board.setNbBbsno(num);
	board.setNbTitle(subject);
	board.setNbContent(content);	
		
	NBoardDAO.getDAO().addNBoard(board);
		
	response.sendRedirect(request.getContextPath()+"/home/index.jsp?workgroup=board&work=notice");
%>