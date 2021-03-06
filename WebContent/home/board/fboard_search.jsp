<%@page import="site.home.dao.FBoardDAO"%>
<%@page import="site.home.dto.FBoardDTO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>


<style type="text/css">
.content {
    border-bottom: 1px solid #e5e5e5;
    background-color: #fafafa;
    color: #444444;
    font-size: 13px;
    font-weight: 300;
    height: auto;
    padding: 20px 40px 20px 117px;
    margin-bottom: 10px;
}

.question-text {
    border-bottom: 1px solid #e5e5e5;
    cursor: pointer;
    font-size: 14px;
    height: 60px;
    line-height: 60px;
    position: relative;
    width: 100%;
    display: inline-block;
}

.category {
    display: inline-block;
    width: 117px;
    color: #333;
    font-size: 15px;
    height: 50px;
    line-height: 50px;
    text-align: left;
}

.open {
	cursor: pointer;
    top: 24px;
    right: 20px;
    position: absolute;
    width: 22px;
}
</style>
		

<%
	String fbTitle=request.getParameter("fbTitle");
	List<FBoardDTO> boardList=FBoardDAO.getDAO().getFBoardTitle(fbTitle);
	
%>
<jsp:include page="faq_base.jsp"/>
<div class="fboard-list">
		<% for(FBoardDTO board:boardList) { %>
			<% if(board.getFbStatus()==0) {//일반글 %>
				<div class="faq-item">
			<div class="question-text" id="<%=board.getFbBbsno()%>">
					<img class="open" src="//d319d1tzjwpwbb.cloudfront.net/desktop/icons/icon_dropdown_grey.svg" alt="openbutton">
				<div class="category"><%=board.getFbCategory() %></div>
						<%=board.getFbTitle() %>
			</div>
					<div class="content" style="display:none" id="content_<%=board.getFbBbsno()%>">
						<%=board.getFbContent().replace("\n", "<br>") %>
					</div>
		</div>
			<% } else {//삭제글 %>
		<% } 
		continue;	
		} %>
		
</div>
<script type="text/javascript">


$(".question-text").click(function() {
	var num=$(this).attr("id");
	$("#content_"+num).toggle();
	
});


</script>