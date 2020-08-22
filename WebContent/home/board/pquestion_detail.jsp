<%@page import="site.home.dto.MemberDTO"%>
<%@page import="site.home.dao.PQuestionDAO"%>
<%@page import="site.home.dto.PQuestionDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style type="text/css">
.ncenter {
	height: auto;
	margin: 0 auto;
	margin-bottom: 100px;
	position: relative;
	width: 940px;
	border-top: 1px solid #e5e5e5;
	border-bottom: 1px solid #e5e5e5;
	color: #333333;
	font-size: 12px;
	padding-top: 20px;
	padding-bottom: 20px;
	position: relative;
}

.nsubject {
	color: #000000;
	font-size: 18px;
	height: 20px;
	margin-bottom: 10px;
	width: 100%;
}

.ncontent {
	font-size: 12px;
}

.subject {
	border-bottom: 1px solid #e5e5e5;
	color: #333;
	font-size: 12px;
	height: auto;
	padding: 20px;
	position: relative;
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
	transform: translate(-50%, -50%);
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

.regidate {
	color: #969696;
	float: right;
	font-size: 12px;
	margin-top: 0px;
	padding: 10px;
	vertical-align: top;
}

.removebutton {
	background-color: #000000;
	float: right;
	margin-right: 5px;
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
	margin-top: 80px;
}

.modifybutton {
	background-color: #000000;
	float: right;
	margin-right: 5px;
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
	margin-top: 80px;
}

.listbutton {
	background-color: #000000;
	float: right;
	margin-right: 5px;
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
	margin-top: 80px;
	
}

.answer {
	font-size: 17px;
	font-weight: bold;
	border-top: 1px solid #e5e5e5;
	border-bottom: 1px solid #e5e5e5;
	margin-top: 50px;
}
.answerbutton {
	background-color: #000000;
	float: right;
	margin-right: 5px;
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
	margin-top: 80px;
	
}
</style>
<%
	if (request.getParameter("num") == null) {
		out.println("<script>");
		out.println(
				"location.href='" + request.getContextPath() + "/home/index.jsp?workgroup=board&work=oneonone';");
		out.println("</script>");
		return;
	}
%>

<%
	int nbBbsno = Integer.parseInt(request.getParameter("num"));
	PQuestionDTO board = PQuestionDAO.getDAO().getPQuestionDetail(nbBbsno);
	MemberDTO loginMember=(MemberDTO)session.getAttribute("loginMember");
%>

<jsp:include page="oneonone_base.jsp"/>
<div class="ncenter">
	<div class="ngel">
		<div class="regidate">
			<%=board.getPqRegidate().substring(0, 10)%>
		</div>
		<div class="nsubject">
			<%=board.getPqTitle()%>
		</div>
		<div class="ncontent">
			<%=board.getPqContent().replace("\n", "<br>")%>
		</div>
	</div>
		<div class="answer">
			<%=board.getPqAnswer().replace("\n", "<br>")%>
		</div>
	<div class="removebutton">삭제</div>
	<div class="modifybutton" id="mdf">수정</div>
	<div class="listbutton">목록</div>
	<% if(loginMember!=null && loginMember.getmType()==9) { %>
	<div class="answerbutton">답변하기</div>
	<% } %>
  </div>
<script>

if("<%=board.getPqStatus2()%>"==="답변완료") {
document.getElementById("mdf").style.display="none";
} else {
	document.getElementById("mdf").style.display="block";	
}


$(".removebutton").click(function() {
	if(confirm("질문을 삭제하시겠습니까?")==true) {
	location.href="<%=request.getContextPath()%>/home/index.jsp?workgroup=board&work=pquestion_remove_action&num=<%=board.getPqBbsno()%>";
	} else {
		return false;
	}
});
$(".modifybutton").click(function() {
	location.href="<%=request.getContextPath()%>/home/index.jsp?workgroup=board&work=pquestion_modify&num=<%=board.getPqBbsno()%>";
});
$(".listbutton").click(function() {
	location.href="<%=request.getContextPath()%>/home/index.jsp?workgroup=board&work=oneonone";
});
$(".answerbutton").click(function() {
	location.href="<%=request.getContextPath()%>/home/index.jsp?workgroup=board&work=pquestion_answer&num=<%=board.getPqBbsno()%>";
});
</script>