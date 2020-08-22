<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/admin/security/login_status.jspf" %>
<%
	request.setCharacterEncoding("UTF-8");   

	String gotPage=(String)request.getAttribute("contentPage");
	String workPlace=(String)request.getAttribute("workPlace");
    
	
	System.out.println("index.jsp] gotPage : "+gotPage);
	System.out.println("index.jsp] workPlace : "+workPlace);
	
	
    String header=null;
    String inner_header=null;
    String inner_contents=null;

	if(gotPage!=null){
		if(gotPage.equals("product_list.jsp")){
	    	inner_header = workPlace +"/product_header.jsp";
	    	inner_contents = workPlace + "/product_list.jsp";
	    
	    }else if(gotPage.equals("product_insert.jsp")){
	    	inner_header = workPlace +"/product_header.jsp";
	    	inner_contents = workPlace +"/product_insert.jsp";
	    
	    }else if(gotPage.equals("product_insert_result.jsp")){	  
	    	inner_header = workPlace +"/product_header.jsp";
	    	inner_contents = workPlace +"/product_insert_result.jsp";
	    	
	    }else if(gotPage.equals("product_modify.jsp")){
	    	inner_header = workPlace +"/product_header.jsp";
	    	inner_contents = workPlace +"/product_modify.jsp";
	    	
	    }else if(gotPage.equals("member_list.jsp")){
	    	inner_header = workPlace +"/member_header.jsp";
	    	inner_contents = workPlace +"/member_list.jsp";
	    
	    }else if(gotPage.equals("order_list.jsp")){
	    	inner_header = workPlace +"/order_header.jsp";
	    	inner_contents = workPlace +"/order_list.jsp";
	    
	    }else if(gotPage.equals("cart_list.jsp")){
	    	inner_header = workPlace +"/cart_header.jsp";
	    	inner_contents = workPlace +"/cart_list.jsp";
	    
	    }else if(gotPage.equals("pquestion_list.jsp")){
	    	inner_header = workPlace +"/pquestion_header.jsp";
	    	inner_contents = workPlace +"/pquestion_list.jsp";
	    
	    }else if(gotPage.equals("fboard_list.jsp")){
	    	inner_header = workPlace +"/fboard_header.jsp";
	    	inner_contents = workPlace +"/fboard_list.jsp";
	    
	    }else if(gotPage.equals("nboard_list.jsp")){
	    	inner_header = workPlace +"/nboard_header.jsp";
	    	inner_contents = workPlace +"/nboard_list.jsp";
	    
	    }else{
	    	header = "home.jsp";
	    }
	}else{
		header = "home.jsp";
	}
      
	//컨텍스트 경로 얻기
	 String path = request.getContextPath();
	 System.out.println("index.jsp] getContextPath : "+path);
	 
	 //css, js 매번 새로운 파일 받기위해 시간으로 생성 후 uri ? 뒤에 
	// 쿼리스트링으로 추가해서 요청
	 Date date = new Date();
	 SimpleDateFormat format1 = new SimpleDateFormat("yyyyMMddHHmmss");
	 System.out.println("index.jsp] css js path : "+format1.format(date));

	 
%>
<!DOCTYPE html>
<html lang="ko" class="no-js">
<head>
<meta http-equiv="Page-Enter" content="blendTrans(Duration='0.1')">
<meta http-equiv="Page-Exit" content="blendTrans(Duration='0.1')">
<meta charset="UTF-8">
<title>관리자페이지</title>

<link rel="stylesheet" type="text/css" media="all" href="<%=path%>/admin/css/spyder.css?<%=format1.format(date)%>" />
<script type="text/javascript" src="<%=path%>/admin/js/spyder.js?<%=format1.format(date)%>"></script>

<!-- 컨텍스트를이용해서 절대경로지정해야 함 아래로 경로지정시 404에러 -->
<!-- 내부 CSS 링크 -->
<!-- <link rel="stylesheet" href="css/spyder.css" type="text/css"/> -->
<!-- 내부 JS 링크 -->
<!-- <script src="js/spyder.js"></script> -->


<!-- 아이콘 CSS/JS 링크 -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/ef0c5be5a0.js"></script>

<!-- 폰트 CSS 링크 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">

<!-- 제이쿼리 링크 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>


</head>
<body>
	<div id="top">
		<jsp:include page="layout_header.jsp" flush="false"></jsp:include>
	</div>
	<div id="left">
		<jsp:include page="layout_side.jsp" flush="false"></jsp:include>
	</div>
	<div id="mainouter">
		<div id="jb-container_home">
			<%if(header!=null){ %>
			<jsp:include page="<%=header%>"></jsp:include>
			<%}%>
		</div>
		<div id="jb-container">
			<div id="jb-header">
				<%if(inner_header!=null){ %>
				<jsp:include page="<%=inner_header%>"></jsp:include>
				<%}%>
			</div>
			<div id="jb-content">
				<%if(inner_contents!=null){ %>
				<jsp:include page="<%=inner_contents%>"></jsp:include>
				<%}%>
			</div>
			<div id="jb-footer">
				<jsp:include page="footer.jsp" ></jsp:include>
			</div>
		</div>
		<jsp:include page="search_list.jsp" ></jsp:include>
	</div>
	<!-- 자바스크립트에서 컨텍스트경로 히든값으로 넘김 -->
	<input type="hidden" value="<%=path%>" id="contextPath">
</body>
<%System.out.println("============================================"); %>
</html>