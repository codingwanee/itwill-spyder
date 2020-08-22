<%@page import="site.home.dto.MemberDTO"%>
<%@page import="site.home.dao.PQuestionDAO"%>
<%@page import="site.home.dto.PQuestionDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	if(request.getMethod().equals("GET")) {
		response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
		return;
	}

	request.setCharacterEncoding("UTF-8");
		
	String subject=request.getParameter("subject");
	String content=request.getParameter("content");
	String category=request.getParameter("category");
		
	if(subject==null|| subject.equals("") || content==null || content.equals("")) {
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
		return;
	}	
	
	MemberDTO loginMember=(MemberDTO)session.getAttribute("loginMember");
	
	int num=PQuestionDAO.getDAO().getBoardNum();
			
	PQuestionDTO board=new PQuestionDTO();
	board.setPqBbsno(num);
	board.setPqTitle(subject);
	board.setPqMemberid(loginMember.getmId());
	board.setPqContent(content);
	board.setPqCategory(category);
			
	PQuestionDAO.getDAO().addPQuestion(board);
		
	response.sendRedirect(request.getContextPath()+"/home/index.jsp?workgroup=board&work=oneonone");
%>