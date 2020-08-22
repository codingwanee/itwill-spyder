<%@page import="site.home.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="/home/security/login_status.jspf" %>
<%

MemberDAO.getDAO().removeMember(loginMember.getmId());



response.sendRedirect(request.getContextPath()+"/home/login/logout_action.jsp");





%>