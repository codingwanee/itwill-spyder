<%@page import="java.util.List"%>
<%@page import="site.home.dao.PQuestionDAO"%>
<%@page import="site.home.dto.PQuestionDTO"%>
<%@page import="site.home.dto.MemberDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<%
	
	List<PQuestionDTO> boardList=PQuestionDAO.getDAO().getAllPQuestionListAdmin();
	MemberDTO loginMember=(MemberDTO)session.getAttribute("loginMember");
	if(loginMember.getmType()!=9) {
		out.println("<script>");
		out.println("location.href='"+request.getContextPath()+"/site/index.jsp?workgroup=board&work=oneonone';");
		out.println("</script>");
		return;
	}
	
%>
<head>
<meta charset="UTF-8">
<title>Spyder</title>
<style>

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

.pqlist {
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
	width: 350px;
	margin-top: 40px;
	margin: 0 auto;
}

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
    color: #000000;
    font-size: 18px;
    height: 20px;
    margin-bottom: 10px;
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
</style>
<link rel="stylesheet"	href="<%=request.getContextPath() %>/home/home.css">
</head>
<body>
<jsp:include page="oneonone_base.jsp"/>
	<div class="nboard-list">
		
		<% for(PQuestionDTO board:boardList) { %>
		<a class="Link" href="<%=request.getContextPath()%>/home/index.jsp?workgroup=board&work=pquestion_detail&num=<%=board.getPqBbsno()%>">
		<div class="subject"><div class="subjectt"><%=board.getPqTitle() %><div class="regidate"><%=board.getPqMemberid()%><%=board.getPqCategory() %><%=board.getPqRegidate().substring(0, 10) %><%=board.getPqStatus2() %></div></div></div></a>
		<% } %>
</div>
</body>
</html>