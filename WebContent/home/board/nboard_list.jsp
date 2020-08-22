<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="site.home.dao.NBoardDAO"%>
<%@page import="site.home.dto.NBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	List<NBoardDTO> boardList=NBoardDAO.getDAO().getAllNBoardList();
	
	String currentDate=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	
%>
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


.nboard-title {
    margin: 0 auto;
    width: 940px;
    color: #000000;
    font-size: 30px;
    height: 90px;
    line-height: 100px;
    position: relative;
    
}
</style>


<div class="nboard-list">
		
		<% for(NBoardDTO board:boardList) { %>
			<% if(board.getNbStatus()==0) {//일반글 %>
		<a class="Link" href="<%=request.getContextPath()%>/home/index.jsp?workgroup=board&work=nboard_detail&num=<%=board.getNbBbsno()%>">
		<div class="subject"><div class="subjectt"><%=board.getNbTitle() %><div class="regidate"><%=board.getNbRegidate().substring(0, 10) %></div></div></div></a>
			<% } else {//삭제글 %>
		<% } 
		continue;	
		} %>
		
</div>