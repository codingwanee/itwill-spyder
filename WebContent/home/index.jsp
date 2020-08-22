<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String workgroup=request.getParameter("workgroup");
	if(workgroup==null) workgroup="main";
	
	String work=request.getParameter("work");
	if(work==null) work="mainpage";

	String contentPath=workgroup+"/"+work+".jsp";
	
	//css, js 매번 새로운 파일 받기위해 시간으로 생성 후 uri ? 뒤에 
		// 쿼리스트링으로 추가해서 요청
	Date date = new Date();
	SimpleDateFormat format1 = new SimpleDateFormat("yyyyMMddHHmmss");
	
%>    
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Spyder</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link href="<%=request.getContextPath()%>/home/home.css?<%=format1.format(date)%>" rel="stylesheet" type="text/css">
<link href="home.css" rel="stylesheet" type="text/css">
<link rel="icon"  href="/spyder.ico" type="image⁄x-icon"/>
</head>
<body>
	<%-- Header 영역 --%>
	<div id="header">
		<jsp:include page="header.jsp"/>
	</div>
	
	<%-- Contents 영역 --%>	
	<div id="content">
		<jsp:include page="<%=contentPath %>"/>	
	</div>


	<%-- Footer 영역 --%>
	<div id="footer">
		<jsp:include page="footer.jsp"/>
	</div>
</body>
</html>