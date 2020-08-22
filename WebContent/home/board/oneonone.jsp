<%@page import="java.util.List"%>
<%@page import="site.home.dao.PQuestionDAO"%>
<%@page import="site.home.dto.PQuestionDTO"%>
<%@page import="site.home.dto.MemberDTO" %>
<%@include file="/home/security/login_status.jspf" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<%
	
	List<PQuestionDTO> boardList=PQuestionDAO.getDAO().getAllPQuestionList(loginMember.getmId());
	
		
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
</style>
<link rel="stylesheet"	href="<%=request.getContextPath() %>/home/home.css">
</head>
<body>
<form action="<%=request.getContextPath()%>/home/board/pquestion_write_action.jsp" method="post" id="boardForm">
	<div id="root">								
		<div class="center">
			<div class="main-banner">
				<img class="banner-img" src=https://d319d1tzjwpwbb.cloudfront.net/desktop/pages/cs/cs-banner-desktop.jpg alt="">	
					<div class="banner-inner">
					<div class="banner-box">
					<p class="title">SPYDER SERVICE CENTER</p>
					<p class="desc">안녕하세요! 스파이더 고객 만족 센터 입니다.</p>
					<p class="desc">궁금하신 사항을 선택하세요!</p>
					</div>
					<div class="banner-box">
					<p class="phone">1588-5863</p>
					<p class="desc">1번 온라인 주문/배송 문의</p>
					<p class="desc">2번  AS 접수/현황 문의</p><br>
					<p class="desc">평일 AM 9시~ PM 5시 (점심시간 12시~1시)</p>
					</div>			
					</div>			
			</div>
				<div class="service-menu">
					<div class="menu-item" OnClick="location.href='<%=request.getContextPath()%>/home/index.jsp?workgroup=board&work=faq';" style="cursor:pointer;">FAQ 자주 묻는 질문</div>
					<div class="menu-item menu-item selected">1:1 문의하기</div>
					<div class="menu-item" OnClick="location.href='<%=request.getContextPath()%>/home/index.jsp?workgroup=board&work=notice';" style="cursor:pointer;">공지사항</div>
					<div class="menu-item" OnClick="location.href='<%=request.getContextPath()%>/home/index.jsp?workgroup=board&work=benefit';" style="cursor:pointer;">멤버십혜택</div>
				</div>
					<div class="service-center">					
							<div class="form-box">
								<div class="oneonone-summery">
									<ul class="oneul" style="font-size: 12px;">
										<li>- 문의하신 질문은 <strong>평일 9시~6시 사이에 응답드립니다.</strong></li>
										<li>- 반품/교환의 경우 꼭! 나의 주문 내역에서 반품 신청 접수를 해주세요.</li>
										<li>- 반품 접수 후 2~3일이내 택배사에서 연락 후 방문수거를 진행합니다. 3일후 택배사 연락이 없는 경우 1:1 문의에 남겨주세요.</li>
									</ul>
								</div>
							</div>
							<div class="help-page">
								<div class="box a">									
									<p>질문유형</p>
									<select class="n-1" name="category">
									<option value="상품">상품</option>
									<option value="배송">배송</option>
									<option value="AS/반품/환불">AS/반품/환불</option>
									<option value="주문/결제">주문/결제</option>
									<option value="회원혜택">회원혜택</option>
									<option value="기타">기타</option>
									</select>
									<p>제목</p>
									<input type="text" name="subject" class="contact-ip-title">
									<p>내용</p>
									<textarea class="n-2" name="content"></textarea>
									<button class="submit-btn" type="submit" style="cursor: pointer;">문의하기</button>
								</div>
								<div class="box b">
									<h1 class="one-list-title">나의 Q&amp;A</h1>
									<table class="onetable">
										<tbody class="onetbody">
											<tr class="cs-list-subtitle">
												<th class="c-list-sub">질문유형</th>
												<th class="c-list-title">제목</th>
												<th class="c-list-date">작성일</th>
												<th class="c-list-sub">처리상태</th>
												</tr>
												<% for(PQuestionDTO board:boardList) { %>
												<tr class="cs_list_item" style="cursor:pointer;" onClick="location.href='<%=request.getContextPath()%>/home/index.jsp?workgroup=board&work=pquestion_detail&num=<%=board.getPqBbsno()%>';">
													<td><%=board.getPqCategory()%></td>
													<td><%=board.getPqTitle() %></td>
													<td><%=board.getPqRegidate().substring(0,10) %></td>
													<td><%=board.getPqStatus2() %></td>													
												</tr>
												<% } %>
										</tbody>
									</table>
											<% if(loginMember!=null && loginMember.getmType()==9) { %>
												<div class="pqlist" onclick="location.href='<%=request.getContextPath()%>/home/index.jsp?workgroup=board&work=pquestion_list_admin'">[관리자] - 모든 문의 확인</div>
											<% } %>
								</div>
							</div>
					</div>
				</div>
			</div>
	</form>
</body>
</html>