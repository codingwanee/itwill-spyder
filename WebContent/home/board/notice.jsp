<%@page import="java.util.List"%>
<%@page import="site.home.dto.NBoardDTO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="site.home.dao.NBoardDAO"%>
<%@page import="site.home.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Spyder</title>
<style type="text/css">

.Link {
cursor: pointer;
text-decoration: none;
}

.nboard-list {
height: auto;
margin: 0 auto;
margin-bottom: 100px;
position: relative;
width: 940px;
}


.subjectt {
    color: #000;
    font-size: 18px;
    height: 20px;
    width: 100%;
}
.subject:hover {
background: #FAE0D4;
}

.regidate {
   color: #969696;
   float: right;
   font-size: 12px;
}

.main-banner {
    position: relative;
    height: 300px;
    background-color: #000;
    font-size: 14px;
    color: #fff;
}

.banner-img {
    width: 100%;
    position: relative;
    bottom: 0;
}

.center .service-menu {
    display: table;
    text-align: center;
    font-size: 15px;
    color: #6d6d6d;
    margin: 100px auto;
    margin-bottom: 50px; 
    width: 940px;
}

.center .service-menu .menu-item {
    display: table-cell;
    vertical-align: middle;
    width: 235px;
    height: 45px;
    background: #f1f1f1;
    border-top: 1px solid #e5e5e5;
    border-right: 1px solid #e5e5e5;
    border-bottom: 1px solid #e5e5e5;
    cursor: pointer;
}
   
.banner-box {
    display: table-cell;
    width: 400px;
    padding: 20px;
    bottom: 0;
    
    
}

.banner-box:first-child {
    border-right: 2px solid;
}

.banner-inner {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%,-50%);
    text-align: center;
    display: table;
    width: 882px;
    margin: 60px auto;
}

.banner-box p {
	margin: 0;
}

.banner-box .title {
    font-size: 30px;
    font-weight: 700;
    margin-bottom: 30px;
}

.banner-box .phone {
    font-size: 20px;
    font-weight: 700;
    margin-bottom: 10px;
}

.service-menu .menu-item.selected {
    background: #fff;
    border-right: none;
}
  
.nboard-title {
    margin: 0 auto;
    width: 940px;
    color: #000000;
    font-size: 30px;
    height: 90px;
    line-height: 100px;
    position: relative;
    
}
.subject {
	border-bottom: 1px solid #e5e5e5;
    color: #333;
    font-size: 12px;
    height: auto;
    padding-top: 20px;
    padding-bottom: 20px;
    position: relative;
    width: 940px;
}

.writebutton {
    background-color: #000000;
    border: 1px solid #000000;
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    border-radius: 5px;
    color: #ffffff;
    cursor: pointer;
    font-size: 13px;
    height: 25px;
    line-height: 25px;
    text-align: center;
    width: 50px;
    margin: 0 auto;
}

</style>
<% MemberDTO loginMember=(MemberDTO)session.getAttribute("loginMember");%>
</head>
<body>
	<jsp:include page="notice_base.jsp"/>
	<% if(loginMember!=null && loginMember.getmType()==9) { %>
		<div class="writebutton">글작성</div>
	<% } %>
	<jsp:include page="nboard_list.jsp"/>
		
</body>
<script type="text/javascript">
$(".writebutton").click(function() {
	location.href="<%=request.getContextPath()%>/home/index.jsp?workgroup=board&work=nboard_write";
});
</script>
</html>