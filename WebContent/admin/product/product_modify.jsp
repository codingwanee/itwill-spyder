<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String[] color_name = {"BK", "WH", "GY", "RD", "OR", "YL", "GR", "BU", "NY", "PK", "PR" };

String uri = request.getRequestURI();
String[] uriArr = uri.split("/");
String path = "";
for (int i = 0; i < uriArr.length - 1; i++) {
	path = path + uriArr[i] + "/";
}

String pCode=request.getParameter("product_list_pcode");

if(pCode==null){
	pCode="";
}

System.out.println("product_modify.jsp] path : "+path);
%>
<input type="hidden" id="path" value="<%=path%>">
<input type="hidden" id="state" value="0">
<div class="modify_productForm">
<form action="<%=request.getContextPath()%>/modifyProductResult.spyder" method="post" enctype="multipart/form-data" id="modifyProductResult">
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
						<input type="text" name="product_code" id="modifyProduct_codeText" autocomplete="off" value="<%=pCode%>">
						<span class="b02_simple_rollover" id="check_code_btn" onclick="checkProductCode();">확인</span>
						<span class="check_code_msg"></span>
					</td>
						
				</tr>
				<tr>
					<td>카테고리</td>
					<td>
						<select name="product_category1" id="modifyProduct_category1" onchange="changeEvent_category('modify');" disabled="disabled">
							<option value="" selected="selected">선택</option>
							<option value="C">옷</option>
							<option value="A">악세사리</option>
						</select>
						<select name="product_category2" id="modifyProduct_category2" style="display: none;" disabled="disabled">
						</select>
					</td>
				</tr>
				<tr>
					<td>상품명</td>
					<td>
						<input type="text" name="product_name" autocomplete="off" id="modifyProduct_name">
					</td>
				</tr>
				<tr>
					<td>가격</td>
					<td>
						<input type="text" name="product_price" autocomplete="off" id="modifyProduct_price" style="width: 80px;">&nbsp원
					</td>
				</tr>
				<tr>
					<td>사이즈</td>
					<td>
						<select name="product_size" id="modifyProduct_size" disabled="disabled">
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
						<select name="product_color"  id="modifyProduct_color" disabled="disabled">
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
						<input type="text" name="product_stock" id="modifyProduct_stock" autocomplete="off" style="width: 60px;">&nbsp개
					</td>
				</tr>
				<tr>
					<td>이미지</td>
					<td>
						<div class="modifyForm_container">
							<div class="modifyForm_imgBox" id="imgBox_id1">
								<img src="<%=path%>images/default_img.jpg" id="preview_img1">
							</div>
						</div>
						<hr>
						<div class="modifyForm_container2">
							<div class="modifyForm_imgFindBox" id="imgFindBox_id1">
								<span class="filetype">
									<input type="text" name="product_img1" class="file-text" readonly="readonly" id="file-text_id1" ><span class="file-btn">찾아보기</span>
									<span class="file-select">
										<input type="file" class="input-file" size="40" name="product_imgPath1" id="input-file_id1">
									</span>
								</span><span class="b02_simple_rollover" id="delete_btn_img1" onclick="deleteImgFileTag(this);">삭제</span>
							</div>
						</div>
						<div class="b01_simple_rollover" onclick="insertImgFileTag('modify');">이미지 추가</div>
					</td>
				</tr>
				<tr>
					<td>게시여부</td>
					<td>
						Y<input type="radio" name="product_post" id="modifyProduct_post" value="1">
						N<input type="radio" name="product_post" id="modifyProduct_post" value="0">
					</td>
				</tr>
				<tr>
					<td>제조회사</td>
					<td><input type="text" name="product_company" id="modifyProduct_company" autocomplete="off" style="width: 150px;">생략가능</td>
				</tr>
				<tr>
					<td>제조국</td>
					<td><input type="text" name="product_country" id="modifyProduct_country" autocomplete="off" style="width: 150px;">생략가능</td>
				</tr>
				<tr>
					<td>제조년월</td>
					<td><input type="date" name="product_mndate" id="modifyProduct_mndate" value="1999-01-01" autocomplete="off" style="width: 150px;">생략가능</td>
				</tr>
				<tr>
					<td>소재</td>
					<td><input type="text" name="product_material" id="modifyProduct_material" autocomplete="off" style="width: 150px;">생략가능</td>
				</tr>
				<tr>
					<td>설명</td>
					<td>
						<textarea rows="20" cols="120" name="product_desc" id="modifyProduct_desc"></textarea>
					</td>
				<tr>
					<td colspan="2">
						<a href="#" onclick="modifyProductResult();" class="insertForm_submitBtn dark-blue">등록하기</a>
					</td>
				</tr>
			</tbody>

		</table>
		<input type="hidden" name="sideMenu" value="product_modify_result.jsp" id="redirectHidden">
	</form>
</div>
<script>
$(document).ready(function(){
	
	//리스트에서 클릭해서 넘어온경우 체크 바로실행
	if($("#modifyProduct_codeText").val()!==null && $("#modifyProduct_codeText").val()!=="" ){
		checkProductCode();
	}
});
</script>