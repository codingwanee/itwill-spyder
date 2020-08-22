<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String workgroup=request.getParameter("workgroup");
	if(workgroup==null) workgroup="main";
	
	String work=request.getParameter("work");
	if(work==null) work="mainpage";
	
	String contentPath=workgroup+"/"+work+".jsp";
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spyder</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link href="home.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%-- Header 영역 --%>
	<div id="header">
		<jsp:include page="header.jsp"/>
	</div>
	

	<%-- Content 영역 --%>
	<div id="content">
		<jsp:include page="main/mainpage.jsp"/>
	</div>


	<%-- Footer 영역 --%>
	<div id="footer">
		<jsp:include page="footer.jsp"/>
	</div>
</body>
</html>