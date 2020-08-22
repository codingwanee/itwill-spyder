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
    String id=request.getParameter("mId");
    String name=request.getParameter("mName");
    String email=request.getParameter("mEmail");
    
    
    MemberDTO memberpwcheck=MemberDAO.getDAO().getMemberByIne(id, name, email);

    if(memberpwcheck.getmPw()==null){
    	session.setAttribute("findcheckmessage", "아이디 ,이름,이메일을 다시확인해 주세요.");
    	session.setAttribute("resultCss","block");
    	response.sendRedirect(request.getContextPath()+"/home/index.jsp?workgroup=login&work=find_password");
    	return;
    	
    }
    session.setAttribute("logincheckDTO", MemberDAO.getDAO().getMemberByIne(id, name, email));
    response.sendRedirect(request.getContextPath()+"/home/index.jsp?workgroup=login&work=find_password_reset");
    
    
    
    
    
    
    
    
    
    %>
