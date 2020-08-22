<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spyder</title>
<link rel="stylesheet"	href="<%=request.getContextPath() %>/home/home.css">
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
<link rel="stylesheet"	href="board.css">
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
					<div class="menu-item" OnClick="location.href='<%=request.getContextPath()%>/home/index.jsp?workgroup=board&work=oneonone';" style="cursor:pointer;">1:1 문의하기</div>
					<div class="menu-item" OnClick="location.href='<%=request.getContextPath()%>/home/index.jsp?workgroup=board&work=notice';" style="cursor:pointer;">공지사항</div>
					<div class="menu-item menu-item selected">멤버십혜택</div>
				</div>
					<div class="benefit-contents">
							<div class="benefit">
							<h2 class="title">결제 금액의 5%<br>마일리지 적립</h2>
								<p class="desc">결제 금액의 5% 마일리지 적립(온라인 몰의 경우 14일 후<br>자동 적립/ 대리점의 경우<br>현장 적립)<br>* 매장의 경우 직영점과<br>대리점만 해당 됨(백화점 제외)</p>
							</div>											
							<div class="benefit">
								<h2 class="title">무료 배송<br>/무료 반품</h2>
								<p class="desc">3만원 이상 구매시<br>무료 배송과 무료 반품 혜택</p>
							</div>											
							<div class="benefit">
								<h2 class="title">신제품<br>/이벤트 정보</h2>
								<p class="desc">이메일 및 SMS 수신<br>동의자에 한해 신제품과<br>이벤트 정보 발송</p>
							</div>											
					</div>
				</div>
			</div>
</body>
</html>