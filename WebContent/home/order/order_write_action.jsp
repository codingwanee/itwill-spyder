<%@page import="site.home.dao.CartDAO"%>
<%@page import="site.home.dao.OrderDetailDAO"%>
<%@page import="site.home.dto.OrderDetailDTO"%>
<%@page import="site.home.dto.OrderDTO"%>
<%@page import="site.home.dao.OrderDAO"%>
<%@page import="org.apache.tomcat.util.descriptor.web.LoginConfig"%>
<%@page import="site.home.dto.CartDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	if(request.getMethod().equals("GET")) {
		response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
		return;
	}
	request.setCharacterEncoding("UTF-8");

	OrderDTO order=new OrderDTO();
	
	//주문코드 생성하기
	String oCode= OrderDAO.getDAO().getCode();
	
	//주문한 장바구니 코드 가지고 오기
	String[] cId=request.getParameterValues("cId");
	

	//주문테이블 정보 받아오기
	String mId =request.getParameter("mId");
	int total =Integer.parseInt(request.getParameter("total"));
	String recipient =request.getParameter("recipient");
	String loginAddress1 =request.getParameter("loginAddress1");
	String loginAddress2 =request.getParameter("loginAddress2");
	String contact =request.getParameter("contact");
	String requests =request.getParameter("requests");
	String payment =request.getParameter("payment");
	

	order.setoCode(oCode);
	order.setoMemberId(mId);
	order.setoTprice(total);
	order.setoRecipient(recipient);
	order.setoAddress1(loginAddress1);
	order.setoAddress2(loginAddress2);
	order.setoContact(contact);
	order.setoRequests(requests);
	order.setoPayment(payment);
	
	//주문테이블에 추가하는 메소드 호출  
	OrderDAO.getDAO().addOrder(order, payment);
	 
	//주문상세 정보 받아오기
	String[] cProductCode =request.getParameterValues("cProductCode");
	String[] cQty =request.getParameterValues("cQty");
	
    OrderDetailDTO OrderDetail = new OrderDetailDTO();
    
	for(int i=0;i<=cProductCode.length-1;i++){
	    OrderDetail.setOdOrderCode(oCode);
	    OrderDetail.setOdMemberId(mId);
	    
	    OrderDetail.setOdProductCode(cProductCode[i]);
	    OrderDetail.setOdQty(Integer.parseInt(cQty[i]));
	    
	    //주문상세에 추가하는 메소드 호출
	    OrderDetailDAO.getDAO().addOrderDetail(OrderDetail);
	    
	    //주문에 따른 재고 변경(출고)
	    OrderDAO.getDAO().StockOut(Integer.parseInt(cQty[i]), cProductCode[i]);
	} 
	
	
	 //장바구니 삭제
	for(String cid:cId) {
		//아이디를 전달하여 MEMBER 테이블에 저장된 회원정보를 삭제하는 DAO 클래스의 메소드 호출
		System.out.print(cid);
	    CartDAO.getDAO().removeCart(cid); 
	} 
 	
	
	response.sendRedirect(request.getContextPath()+"/home/index.jsp?workgroup=order&work=order_complete&oCode="+oCode);
	
%>