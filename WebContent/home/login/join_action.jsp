
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
request.setCharacterEncoding("UTF-8");
String mId=request.getParameter("mId");
String mPw=Utility.encrypt(request.getParameter("mPw"),"SHA-256");
String mEmail=request.getParameter("mEmail");
String mName=request.getParameter("mName");
String mPhone=request.getParameter("mPhone");


MemberDTO member=new MemberDTO();
member.setmId(mId);
member.setmPw(mPw);
member.setmName(mName);
member.setmEmail(mEmail);
member.setmPhone(mPhone);


MemberDAO.getDAO().addMember(member);

response.sendRedirect(request.getContextPath()+"/home/index.jsp?workgroup=login&work=loginpopup");











%>