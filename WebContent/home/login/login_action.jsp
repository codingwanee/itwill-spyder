
<%@page import="site.home.dao.MemberDAO"%>
<%@page import="site.home.dto.MemberDTO"%>
<%@page import="util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<% 

if(request.getMethod().equals("GET")) {
	response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
	return;
}

String id=request.getParameter("mId");
String passwd=Utility.encrypt(request.getParameter("mPw"),"SHA-256");

MemberDTO member=MemberDAO.getDAO().getMember(id);
if(member==null) {
	session.setAttribute("message", "입력한 아이디가 존재하지 않습니다.");
	session.setAttribute("id", id);
	response.sendRedirect(request.getContextPath()+"/home/index.jsp?workgroup=login&work=loginpopup");
	return;
}

if(!passwd.equals(member.getmPw())) {
	session.setAttribute("message", "입력된 아이디 또는 비밀번호가 맞지 않습니다.");
	session.setAttribute("id", id);
	response.sendRedirect(request.getContextPath()+"/home/index.jsp?workgroup=login&work=loginpopup");
	return;
}
session.setAttribute("loginMember", MemberDAO.getDAO().getMember(id));

String uri=(String)session.getAttribute("uri");
if(uri==null) {//기존 요청페이지가 없는 경우 - 메인페이지 이동
	response.sendRedirect(request.getContextPath()+"/home/index.jsp");
} else {//기존 요청페이지가 있는 경우 - 기존 요청페이지로 이동
	session.removeAttribute("uri");
	response.sendRedirect(uri);
}


%>    