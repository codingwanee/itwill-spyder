
<%@page import="site.home.dao.MemberDAO"%>
<%@page import="util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/home/security/login_status.jspf"%>

<%
if(request.getMethod().equals("GET")) {
	response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
	return;
}

request.setCharacterEncoding("UTF-8");

String id=request.getParameter("mId");
String passwd=request.getParameter("mPw");
//비밀번호가 입력되어 전달된 경우 - 새로운 비밀번호 사용
if(passwd!=null && !passwd.equals("")) {
	passwd=Utility.encrypt(request.getParameter("mPw"),"SHA-256");
} else {//비밀번호가 입력되지 않은 경우 - 기존 비밀번호 사용
	passwd=loginMember.getmPw();		
}
String mPhone=request.getParameter("mPhone");
String mEmail=request.getParameter("mEmail1")+"@"+request.getParameter("mEmail2");
String mAddress1=request.getParameter("addr1");
String mAddress2=request.getParameter("addr2");



//DTO 인스턴스를 생성하고 입력값으로 필드값 변경
MemberDTO member=new MemberDTO();
member.setmId(id);
member.setmPhone(mPhone);
member.setmPw(passwd);
member.setmEmail(mEmail);
member.setmAddress1(mAddress1);
member.setmAddress2(mAddress2);

//회원정보를 전달하여 MEMBER 테이블에 저장된 회원정보를 변경하는 DAO 클래스의 메소드 호출
MemberDAO.getDAO().modifyMember(member);

//변경된 회원정보를 이용하여 세션에 인증정보(회원정보) 재공유
session.setAttribute("loginMember", MemberDAO.getDAO().getMember(id));	

//회원정보 상세 출력페이지 이동
response.sendRedirect(request.getContextPath()+"/home/index.jsp?workgroup=login&work=mypage&oState=0");




%>