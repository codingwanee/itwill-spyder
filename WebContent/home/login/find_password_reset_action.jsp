<%@page import="site.home.dao.MemberDAO"%>
<%@page import="util.Utility"%>
<%@page import="site.home.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%MemberDTO logincheckDTO=(MemberDTO)session.getAttribute("logincheckDTO"); 
    

if(request.getMethod().equals("GET")) {
	response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
	return;
}


request.setCharacterEncoding("UTF-8");


String pw=Utility.encrypt(request.getParameter("mPw"),"SHA-256");
String id=logincheckDTO.getmId();


MemberDTO member=new MemberDTO();
member.setmId(id);
member.setmPw(pw);

MemberDAO.getDAO().pwmodifyMember(member);

response.sendRedirect(request.getContextPath()+"/home/index.jsp?workgroup=login&work=loginpopup");






%>