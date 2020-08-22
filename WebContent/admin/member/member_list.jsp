<%@page import="java.util.List"%>
<%@page import="site.home.dao.MemberDAO"%>
<%@page import="site.home.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
List<MemberDTO> memberList = (List<MemberDTO>)request.getAttribute("memberList");
String contextPath = request.getContextPath();

int currentPage = (int) request.getAttribute("page");
int cnt = (int)request.getAttribute("cnt");
int maxPage = (int)Math.ceil((cnt/10.0));

String searchType = (String)request.getAttribute("searchType");
String searchKeyword = (String)request.getAttribute("searchKeyword");

//요청쿼리 병합
String query = "searchType="+searchType+"&searchKeyword="+searchKeyword;
	
System.out.println("member_list.jsp] contextPath : "+contextPath);

System.out.println("member_list.jsp] currentPage : " + cnt);
System.out.println("member_list.jsp] cnt : " + cnt);
System.out.println("member_list.jsp] maxPage : " + maxPage);

%>

<div class="list_memberForm">
	<table class="type02" cellspacing="0">
		<thead>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>이메일</th>
				<th>연락처</th>
				<th>주소</th>
				<th>가입일자</th>
			</tr>
		</thead>
		<tbody>
			<%if(memberList.size()==0){ %>
				<tr>
					<td colspan="6">조회된 결과가 없습니다.</td>
				</tr>
			<%}else{ %>
				<%for(int i=0;i<memberList.size();i++){ %>
				<tr>
					<td><%=memberList.get(i).getmId()%></td>
					<td><%=memberList.get(i).getmName()%></td>
					<td><%=memberList.get(i).getmEmail()%></td>
					<td><%=memberList.get(i).getmPhone()%></td>
					<td>
					<%if(memberList.get(i).getmAddress1()==null || memberList.get(i).getmAddress1().trim().equals("")){ %>
					<%="없음" %>
					<%}else{ %>
					<%=memberList.get(i).getmAddress1()+" "+memberList.get(i).getmAddress2()%>
					<%} %>
					</td>
					<td><%=memberList.get(i).getmSigndate().substring(0,10)%></td>
				</tr>
				<%} %>
			<%} %>
		</tbody>
	</table>
	<div class="searchBox">
		<form id="member_list_searchForm" action="<%=contextPath%>/listMember.spyder">
			<div class="inner-selectBox">
				<select class="inner-select" id="member_list_searchType" name="searchType">
					<option value="m_id">아이디</option>
					<option value="m_name">이름</option>
					<option value="m_email">이메일</option>
					<option value="m_phone">연락처</option>
					<option value="m_address1">주소</option>
					<option value="m_signdate">가입일자</option>
				</select>
			</div>
			<div class="inner-search-container">
				<input type="text" placeholder="Search.." id="member_list_searchKeyword" name="searchKeyword" autocomplete="off">
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
					
					<a href="<%=contextPath%>/listMember.spyder?page=<%=currentPage - 1%>&<%=query%>">&lt; 이전</a>
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
				<a href="<%=contextPath%>/listMember.spyder?page=<%=i%>&<%=query%>"><%=i%></a>
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
				<a href="<%=contextPath%>/listMember.spyder?page=<%=currentPage + 1%>&<%=query%>">다음 &gt;</a>
				<%
					}
				%>
			</div>
			</p>
		</div>
	</div>
	<hr style="border: 0; height: 1px; background-color: #5B768F">
</div>