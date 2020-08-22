<%@page import="java.util.List"%>
<%@page import="site.admin.dto.ProductDTO"%>
<%@page import="site.admin.dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String uri = request.getRequestURI();
	String contextPath = request.getContextPath();
	System.out.println("product_list.jsp] uri : "+uri);
	System.out.println("product_list.jsp] conextPath : "+contextPath);
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

	List<ProductDTO> productList = (List<ProductDTO>) request.getAttribute("productList");

	int currentPage = (int) request.getAttribute("page");
	int cnt = (int) request.getAttribute("cnt");
	int maxPage = (int) Math.ceil((cnt / 10.0));
	
	String searchType = (String)request.getAttribute("searchType");
	String searchKeyword = (String)request.getAttribute("searchKeyword");
	
	String actionType = (String)request.getAttribute("actionType");
	
	//요청쿼리 병합
	String query = "searchType="+searchType+"&searchKeyword="+searchKeyword;
	
	System.out.println("product_list.jsp] path : "+path);
	
	System.out.println("product_list.jsp] currentPage : " + cnt);
	System.out.println("product_list.jsp] cnt : " + cnt);
	System.out.println("product_list.jsp] maxPage : " + maxPage);
%>
<div class="list_productForm">
	<div class="selectBox">
		<div class="custom-select" style="width: 200px;">
			<select id="listProductCategory">
				<option value="">ALL</option>
				<option value="C">─ CLOTHING</option>
				<option value="TT">&nbsp&nbsp| TOP&T-SHIRTS</option>
				<option value="SP">&nbsp&nbsp| SHORTS&PANTS</option>
				<option value="RG">&nbsp&nbsp| RASHGUARD</option>
				<option value="SV">&nbsp&nbsp| SLEEVELESS</option>
				<option value="BT">&nbsp&nbsp| BRATOP</option>
				<option value="A">─ ACCESSORIES</option>
				<option value="SH">&nbsp&nbsp| SHOES</option>
				<option value="BG">&nbsp&nbsp| BAGS</option>
				<option value="HT">&nbsp&nbsp| HATS</option>
				<option value="SC">&nbsp&nbsp| SOCKS</option>
				<option value="EC">&nbsp&nbsp| ETC</option>
			</select>
		</div>
	</div>

	<table class="type09" cellspacing='0'>
		<thead>
			<tr>
				<th>상품코드</th>
				<th>분류1</th>
				<th>분류2</th>
				<th>이미지</th>
				<th>상품이름</th>
				<th>상품등록일</th>
				<th>게시상태</th>
				<th>게시</th>
			</tr>
		</thead>
		<tbody>
		<%if(productList.size()==0){ %>
			<tr>
				<td colspan="8">조회된 결과가 없습니다.</td>
			</tr>
		<%}else{ %>
			<%for (int i = 0; i < productList.size(); i++) {%>
			<tr>
				<td><%=productList.get(i).getpCode()%></td>
				<td><%=productList.get(i).getpType1()%></td>
				<td><%=productList.get(i).getpType2()%></td>
				<td>
					<img src="<%=contextPath%>/home/product/product_images/<%=productList.get(i).getpImg()%>">
				</td>
				<td><a href="javascript:void(0);" onclick="productModifyFromList(this);" id="<%=productList.get(i).getpCode()%>" ><%=productList.get(i).getpName()%></a></td>
				<td><%=productList.get(i).getpRegiDate().substring(0, 19)%></td>
				<td>
					<%if (productList.get(i).getpPost() == 0) {%>
					NO
					<%} else {%>
					YES
					<%}%>
				</td>
				<td>
					<%if (productList.get(i).getpPost() == 0) {%>
					<button class="post_button" id="<%=productList.get(i).getpCode()%>-<%=productList.get(i).getpPost()%>" onclick="changePost(this);">게시하기</button>
					<%} else {%>
					<button class="post_button" id="<%=productList.get(i).getpCode()%>-<%=productList.get(i).getpPost()%>" onclick="changePost(this);">게시해제</button>
					<%}%>
				</td>
			</tr>
			<%}%>
		<%} %>
		</tbody>
	</table>
	<div class="searchBox">
		<form id="prodcut_list_searchForm" action="<%=contextPath%>/listProduct.spyder">
			<div class="inner-selectBox">
				<select class="inner-select" id="prodcut_list_searchType" name="searchType">
					<option value="p_code">상품코드</option>
					<option value="p_type1">분류1</option>
					<option value="p_type2">분류2</option>
					<option value="p_name">상품명</option>
					<option value="p_regidate">등록일</option>
					<option value="p_post">상태</option>
				</select>
			</div>
			<div class="inner-search-container">
				<input type="text" placeholder="Search.." id="prodcut_list_searchKeyword" name="searchKeyword" autocomplete="off">
				<button type="submit">
					<i class="fa fa-search"></i>
				</button>
			</div>
			<input type="hidden" id="searchForm_actionType" name="actionType" value="">
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
					
					<a href="<%=contextPath%>/listProduct.spyder?page=<%=currentPage - 1%>&<%=query%>">&lt; 이전</a>
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
				<a href="<%=contextPath%>/listProduct.spyder?page=<%=i%>&<%=query%>"><%=i%></a>
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
				<a href="<%=contextPath%>/listProduct.spyder?page=<%=currentPage + 1%>&<%=query%>">다음 &gt;</a>
				<%
					}
				%>
			</div>
			</p>
		</div>
	</div>
	<hr style="border: 0; height: 1px; background-color: #5B768F">
</div>
<script type="text/javascript">
$(".list_productForm").ready(function(){
	
	var searchKeyword = "<%=searchKeyword%>";
	var actionType = "<%=actionType%>";
	
	//리스트에서 카테고리로 선택시
	if(searchKeyword!==null && searchKeyword!=="" && actionType==="listCategory" ){
		$("#listProductCategory").val(searchKeyword).prop("selected", true);
	}
});
</script>