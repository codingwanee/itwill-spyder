<%@page import="site.home.dto.MemberDTO"%>
<%@page import="site.home.dao.NBoardDAO"%>
<%@page import="site.home.dto.NBoardDTO"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="site.home.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	if(request.getParameter("num")==null) {
		out.println("<script>");
		out.println("location.href='"+request.getContextPath()+"/home/index.jsp?workgroup=board&work=notice';");
		out.println("</script>");
		return;
	}
		
	request.setCharacterEncoding("UTF-8");
		
	int num=Integer.parseInt(request.getParameter("num"));
		
	NBoardDTO board=NBoardDAO.getDAO().getNBoardDetail(num);
	
	
	if(board==null || board.getNbStatus()==1) {
		out.println("<script>");
		out.println("location.href='"+request.getContextPath()+"/site/index.jsp?workgroup=board&work=notice';");
		out.println("</script>");
		return;
	}
		
	MemberDTO loginMember=(MemberDTO)session.getAttribute("loginMember");
		
	if(loginMember==null || loginMember.getmType()!=9) {
		out.println("<script>");
		out.println("location.href='"+request.getContextPath()+"/site/index.jsp?workgroup=board&work=notice';");
		out.println("</script>");
		return;
	}
		
	NBoardDAO.getDAO().removeNBoard(num);
		
	out.println("<script>");
	out.println("location.href='"+request.getContextPath()+"/home/index.jsp?workgroup=board&work=notice';");
	out.println("</script>");
%>




