<%@page import="site.home.dao.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	
	//삭제하고자 선택된 회원의 아이디들을 반환받아 저장
	// => 체크박스로 선택된 동일한 입력태그의 name 속성값을 반환
	String[] checkId=request.getParameterValues("checkId");	
	
	//전달된 회원 아이디에 대한 회원정보 삭제
	for(String cid:checkId) {
		//아이디를 전달하여 MEMBER 테이블에 저장된 회원정보를 삭제하는 DAO 클래스의 메소드 호출
		System.out.print(cid);
	    CartDAO.getDAO().removeCart(cid); 
	}
	
	//회원목록 출력페이지 이동
	response.sendRedirect(request.getContextPath()+"/home/index.jsp?workgroup=cart&work=cart_list");
%>