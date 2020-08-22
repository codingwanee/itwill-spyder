<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
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

</style>
<link rel="stylesheet"	href="<%=request.getContextPath() %>/home/home.css">
</head>
<body>
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
						
					</div>
			</div>
		</div>
	</body>
</html>	