<%@page import="site.home.dto.MemberDTO"%>
<%@page import="site.home.dao.FBoardDAO"%>
<%@page import="site.home.dto.FBoardDTO"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="site.home.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%	
	if(request.getParameter("num")==null) {
		out.println("<script>");
		out.println("location.href='"+request.getContextPath()+"/home/index.jsp?workgroup=board&work=faq';");
		out.println("</script>");
		return;
	}
	
	request.setCharacterEncoding("UTF-8");
		
	int num=Integer.parseInt(request.getParameter("num"));
		
	FBoardDTO board=FBoardDAO.getDAO().getFBoardDetail(num);
			
	if(board==null || board.getFbStatus()==1) {
		out.println("<script>");
		out.println("location.href='"+request.getContextPath()+"/site/index.jsp?workgroup=board&work=faq';");
		out.println("</script>");
		return;
	}
	
	MemberDTO loginMember=(MemberDTO)session.getAttribute("loginMember");
		
	if(loginMember==null || loginMember.getmType()!=9) {
		out.println("<script>");
		out.println("location.href='"+request.getContextPath()+"/site/index.jsp?workgroup=board&work=faq';");
		out.println("</script>");
		return;
	}
		
	FBoardDAO.getDAO().removeFBoard(num);
		
	out.println("<script>");
	out.println("location.href='"+request.getContextPath()+"/home/index.jsp?workgroup=board&work=faq';");
	out.println("</script>");
%>




