<%@page import="site.home.dao.MemberDAO"%>
<%@page import="site.home.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
request.setCharacterEncoding("UTF-8");
if(request.getMethod().equals("GET")) {
	response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
	return;
}

String name=request.getParameter("mName");
String email=request.getParameter("mEmail");


MemberDTO membercheck=MemberDAO.getDAO().getMemberByKeyword(name, email);
if(membercheck.getmId()==null) {
	session.setAttribute("findcheckmessage", "이름과 이메일을 다시확인해 주세요.");
	session.setAttribute("resultCss","block");
	response.sendRedirect(request.getContextPath()+"/home/index.jsp?workgroup=login&work=find_id");
	return;
}

session.setAttribute("logincheckid", MemberDAO.getDAO().getMemberByKeyword(name, email));
response.sendRedirect(request.getContextPath()+"/home/index.jsp?workgroup=login&work=find_id_check");

%>    