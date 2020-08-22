<%@page import="site.home.dto.FBoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<FBoardDTO> fboardList = (List<FBoardDTO>)request.getAttribute("fboardList");
	String contextPath = request.getContextPath(); 

	int currentPage = (int) request.getAttribute("page");
	int cnt = (int)request.getAttribute("cnt");
	int maxPage = (int)Math.ceil((cnt/10.0));

	String searchType = (String)request.getAttribute("searchType");
	String searchKeyword = (String)request.getAttribute("searchKeyword");

	//요청쿼리 병합
	String query = "searchType="+searchType+"&searchKeyword="+searchKeyword;
	
	System.out.println("fboard_list.jsp] contextPath : "+contextPath);

	System.out.println("fboard_list.jsp] currentPage : " + cnt);
	System.out.println("fboard_list.jsp] cnt : " + cnt);
	System.out.println("fboard_list.jsp] maxPage : " + maxPage);





%>
<div class="list_boardForm">	
	<table class="type02" cellspacing="0">
		<thead>
			<tr>
				<th>번호</th>
				<th>카테고리</th>
				<th>제목</th>
				<th>작성일</th>
			</tr>
		</thead>
		<tbody>
		<%if(fboardList.size()==0){ %>
				<tr>
					<td colspan="4">조회된 결과가 없습니다.</td>
				</tr>
		<%}else{ %>
			<%for(int i=0;i<fboardList.size();i++){ %>	
				<tr>
					<td><%=fboardList.get(i).getFbBbsno()%></td>
					<td><%=fboardList.get(i).getFbCategory()%></td>
					<td><%=fboardList.get(i).getFbTitle()%></td>
					<td><%=fboardList.get(i).getFbRegidate().substring(0,10)%></td>
				</tr>
			<%} %>
		<%} %>
		</tbody>
	</table>
	<div class="searchBox">
		<form id="fboard_list_searchForm" action="<%=contextPath%>/listFBoard.spyder">
			<div class="inner-selectBox">
				<select class="inner-select" id="fboard_list_searchType" name="searchType">
					<option value="fb_bbsno">번호</option>
					<option value="fb_title">카테고리</option>
					<option value="fb_content">제목</option>
					<option value="fb_regidate">작성일</option>
				</select>
			</div>
			<div class="inner-search-container">
				<input type="text" placeholder="Search.." id="fboard_list_searchKeyword" name="searchKeyword" autocomplete="off">
				<button type="submit">
					<i class="fa fa-search"></i>
				</button>
			</div>
		</form>
	</div>
	<div class="list_number">
		<div>
			<p>
			<div class="list_n_menu">
			<%
					if ((currentPage + 9) % 10 == 0) {
				%>
				<span class="disabled">&lt; 이전</span>
				<%
					} else {

				%>
					
					<a href="<%=contextPath%>/listFBoard.spyder?page=<%=currentPage - 1%>&<%=query%>">&lt; 이전</a>
				<%
					}
				%>
				<%
					for (int i = 1; i <= maxPage; i++) {
				%>
				<%
					if (i == currentPage) {
				%>
				<span class="current"><%=i%></span>
				<%
					} else {
				%>
				<a href="<%=contextPath%>/listFBoard.spyder?page=<%=i%>&<%=query%>"><%=i%></a>
				<%
					}
				%>
				<%
					}
				%>
				<%
					if (currentPage == maxPage || maxPage==0) {
				%>
				<span class="disabled">다음 &gt;</span>
				<%
					} else {
				%>
				<a href="<%=contextPath%>/listFBoard.spyder?page=<%=currentPage + 1%>&<%=query%>">다음 &gt;</a>
				<%
					}
				%>
			</div>
			</p>
		</div>
	</div>
	<hr style="border: 0; height: 1px; background-color: #5B768F">
</div>