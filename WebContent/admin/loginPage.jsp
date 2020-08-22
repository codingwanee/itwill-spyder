<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	
	System.out.println("request.getContextPath() : "+request.getContextPath());
	String message=(String)session.getAttribute("message");
	
	if(message==null){
		message="";
	}
	

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>http://www.blueb.co.kr</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/admin/css/login.css">
<!--[if lt IE 9]><script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
</head>
<body>
	<div>
		<div class="login_header">
			<div class="logo_img"></div>
			<h3>Admin Login</h3>
		</div>
		<div class="login_body">
			<form method="post" action="<%=request.getContextPath()%>/loginAdmin.spyder" class="login">
				<p>
					<label for="login">ID:</label> <input type="text" name="login_id" id="login" value="" autocomplete="off">
				</p>

				<p>
					<label for="password">Password:</label> <input type="password" name="login_password" id="password" value="" autocomplete="off">
				</p>
				<p class="login-submit">
					<button type="submit" class="login-button">Login</button>
				</p>
				<div class="textCss"><%=message %></div>
			</form>
		</div>
	</div>
</body>
</html>