<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String[] color_name = {"BK", "WH", "GY", "RD", "OR", "YL", "GR", "BU", "NY", "PK", "PR" };

	String uri = request.getRequestURI();
	String[] uriArr = uri.split("/");
	String path = "";
	for (int i = 0; i < uriArr.length - 1; i++) {
		path = path + uriArr[i] + "/";
	}
	
	/*
	request.getRequestURI() 함수 = 프로젝트 + 파일경로까지 가져옵니다.
	예)  http://localhost:8080/project/list.jsp
	[return]        /project/list.jsp  를 가져옵니다. 
	*/
	
	/*
	CREATE TABLE product (
	   p_code VARCHAR2(50) PRIMARY KEY,
	   p_type1 VARCHAR2(50),
	   p_type2 VARCHAR2(50),
	   p_name VARCHAR2(200),
       p_price number,
       p_color VARCHAR2(100),
       p_size VARCHAR2(100),
       p_stock number,
       p_desc VARCHAR2(1000),
       p_company VARCHAR2(100),
       p_country VARCHAR2(100),
       p_mndate date,
       p_material VARCHAR2(100),
       p_img VARCHAR2(100),
       p_imgdetail VARCHAR2(2000),
       p_post number,
	   p_regiDate date
);
	
	*/
%>
<input type="hidden" id="path" value="<%=path%>">
<div class="insert_productForm">
	<form action="<%=request.getContextPath()%>/insertProductResult.spyder" method="post" enctype="multipart/form-data" id="insertProductResult">
		<table class="type01" cellspacing='0'>
			<thead>
				<tr>
					<th>분류</th>
					<th>내용</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>상품코드</td>
					<td>
						<input type="text" name="product_code" autocomplete="off" id="insertProduct_codeText" readonly="readonly">
					</td>
				</tr>
				<tr>
					<td>카테고리</td>
					<td>
						<select name="product_category1" id="insertProduct_category1" onchange="changeEvent_category('insert');">
							<option value="" selected="selected">선택</option>
							<option value="C">옷</option>
							<option value="A">악세사리</option>
						</select>
						<select name="product_category2" id="insertProduct_category2" style="display: none;" onchange="changeEvent_code();">
						</select>
					</td>
				</tr>
				<tr>
					<td>상품명</td>
					<td>
						<input type="text" name="product_name" autocomplete="off">
					</td>
				</tr>
				<tr>
					<td>가격</td>
					<td>
						<input type="text" name="product_price" autocomplete="off" style="width: 80px;">&nbsp원
					</td>
				</tr>
				<tr>
					<td>사이즈</td>
					<td>
						<!-- <span style="vertical-align: middle; margin-top: 3px"></span> -->
						<select name="product_size" id="insertProduct_size" onchange="changeEvent_code();">
							<option value="Free">Free</option>
							<%
								for (int i = 80; i <= 300; i += 5) {
							%>
							<option value="<%=i%>"><%=i%></option>
							<%
								}
							%>
						</select>
					</td>
				</tr>
				<tr>
					<td>색상</td>
					<td>
						<select name="product_color"  id="insertProduct_color" onchange="changeEvent_color();">
							<%
								for (int i = 0; i < color_name.length; i++) {
							%>
							<option value="<%=color_name[i]%>"><%=color_name[i]%></option>
							<%
								}
							%>
						</select>
						<span class="colorBox"></span>
						<span class="colorText">#000000</span>
					</td>
				</tr>
				<tr>
					<td>재고</td>
					<td>
						<input type="text" name="product_stock" id="insertProduct_stock1" autocomplete="off" style="width: 60px;">
						<span>개</span>
					</td>
				</tr>
				<tr>
					<td>이미지</td>
					<td>
						<div class="insertForm_container">
							<div class="insertForm_imgBox" id="imgBox_id1">
								<img src="<%=path%>images/default_img.jpg" id="preview_img1">
							</div>
						</div>
						<hr>
						<div class="insertForm_container2">
							<div class="insertForm_imgFindBox" id="imgFindBox_id1">
								<span class="filetype">
									<input type="text" class="file-text" readonly="readonly" id="file-text_id1" ><span class="file-btn">찾아보기</span>
									<span class="file-select">
										<input type="file" class="input-file" size="40" name="product_imgPath1" id="input-file_id1">
									</span>
								</span><span class="b02_simple_rollover" id="delete_btn_img1" onclick="deleteImgFileTag(this);">삭제</span>
							</div>
						</div>
						<div class="b01_simple_rollover" onclick="insertImgFileTag('insert');">이미지 추가</div>
					</td>
				</tr>
				<tr>
					<td>게시여부</td>
					<td>
						Y<input type="radio" name="product_post" value="1" checked="checked"> N<input type="radio" value="0" name="product_isPost">
					</td>
				</tr>
				<tr>
					<td>제조회사</td>
					<td><input type="text" name="product_company" id="insertProduct_company" autocomplete="off" style="width: 150px;">생략가능</td>
				</tr>
				<tr>
					<td>제조국</td>
					<td><input type="text" name="product_country" id="insertProduct_country" autocomplete="off" style="width: 150px;">생략가능</td>
				</tr>
				<tr>
					<td>제조년월</td>
					<td><input type="date" name="product_mndate" id="insertProduct_country" value="1999-01-01" autocomplete="off" style="width: 150px;">생략가능</td>
				</tr>
				<tr>
					<td>소재</td>
					<td><input type="text" name="product_material" id="insertProduct_material" autocomplete="off" style="width: 150px;">생략가능</td>
				</tr>
				<tr>
					<td>설명</td>
					<td>
						<textarea rows="20" cols="120" name="product_desc"></textarea>
					</td>
				<tr>
					<td colspan="2">
						<a href="#" onclick="insertProductResult();" class="insertForm_submitBtn dark-blue">등록하기</a>
					</td>
				</tr>
			</tbody>

		</table>
		<input type="hidden" name="sideMenu" value="product_insert_result.jsp" id="redirectHidden">
	</form>
</div>