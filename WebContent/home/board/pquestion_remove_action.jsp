<%@page import="site.home.dto.MemberDTO"%>
<%@page import="site.home.dao.PQuestionDAO"%>
<%@page import="site.home.dto.PQuestionDTO"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(request.getParameter("num")==null) {
		out.println("<script>");
		out.println("location.href='"+request.getContextPath()+"/home/index.jsp?workgroup=board&work=oneonone';");
		out.println("</script>");
		return;
	}
	
	request.setCharacterEncoding("UTF-8");
		
	int num=Integer.parseInt(request.getParameter("num"));
		
	PQuestionDTO board=PQuestionDAO.getDAO().getPQuestionDetail(num);
			
	MemberDTO loginMember=(MemberDTO)session.getAttribute("loginMember");
	
	
	if(loginMember==null || !loginMember.getmId().equals(board.getPqMemberid()) && loginMember.getmType()!=9) {
		out.println("<script>");
		out.println("location.href='"+request.getContextPath()+"/home/index.jsp?workgroup=board&work=oneonone';");
		out.println("</script>");
		return;
	}

	
	PQuestionDAO.getDAO().removePQuestion(num);

	out.println("<script>");
	out.println("location.href='"+request.getContextPath()+"/home/index.jsp?workgroup=board&work=oneonone';");
	out.println("</script>");
%>



