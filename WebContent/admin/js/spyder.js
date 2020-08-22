
//로드시
window.onload = function() {

	//새로고침시 화면깜빡임 최소화
	(function(H){H.className=H.className.replace(/\bno-js\b/,'js')})(document.documentElement)

	sideVar(); //사이드바 JS
	selectItem(); // 상품 카테고리 JS
	fileUpload(); // 상품 등록 이미지 업로드 JS

	changeCss(window.location.pathname); // 페이지 변경시 JS
	
	/*
	window.location.href - 현재 페이지의 href (URL) 반환
	window.location.hostname - 웹 호스트의 도메인 네임 반환
	window.location.pathname - 현재 페이지의 경로와 파일 이름 반환
	window.location.protocol - 사용하는 웹 프로토콜 반환 (http:// 혹은 https://)
	window.location.assign - 새 document 로드

	 */
	
}

/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/

//모든 메뉴 이벤트 등록
function eventHandler(evt) {
	var id = evt.id;

	$(id).on("click", changeForm(id));

}


//상품리스트 상품 클릭시 이벤트
function productModifyFromList(evt){
	var pcode = evt.id;
	
	$("#product_list_pcode").val(pcode);
	
	changeForm("list_product_modify");
	
}

//#상품카테고리 변경시 이벤트
function listProductCategory(){
	var value=$("#listProductCategory option:selected").val();
	var form = document.getElementById("prodcut_list_searchForm");
	var type ="p_type2";
	if(value==="C" || value==="A"){
		type ="p_type1";
	}
	
	if(value!==""){
		$("#prodcut_list_searchType").val(type);
		$("#prodcut_list_searchKeyword").val(value);
		//액션타입 저장, 셀렉박스-listCategory
		$("#searchForm_actionType").val("listCategory");
	}
	form.submit();

}

//상품등록 등록버튼이벤트
function insertProductResult(){
	var form = document.getElementById("insertProductResult");

	form.submit();
}

//상품수정 등록버튼이벤트
function modifyProductResult() {
	var form = document.getElementById("modifyProductResult");
	
	if($("#state").val()==="1"){
		alert("인증완료");
		/*
		alert($("#modifyProduct_size_min").val());
		alert($("#modifyProduct_size_num").val());
		alert($("#modifyProduct_size_unit").val());
		*/
		$("#modifyProduct_codeText").removeAttr('disabled');
		$("#modifyProduct_size").removeAttr('disabled');
		$("#modifyProduct_color").removeAttr('disabled');
		
		form.submit();
	}else{
		alert("확인을 눌러주세요");
	}
	
	
}


//게시하기/해제 이벤트 (Ajax)
function changePost(evt) {
	var id = evt.id;
	var no = id.substring(id.length, id.length-1);
	
	var allData = { "pCode": id, "pPost": no };
	var contextPath = $("#contextPath").val();
	
	//alert("parent id : "+$(evt.id).attr("id"));
	//alert("id : "+id+"\n no : "+no);
	
	$.ajax({
        url:contextPath+"/listProduct.spyder",
        type:'GET',
        data: allData,
        dataType: "text",
        success:function(data){
           // alert("완료! : "+data);
            //window.opener.location.reload();
            //self.close();
            location.reload();

            //$("html").load("/web/admin/product/product_list.jsp");
        },
        error:function(jqXHR, textStatus, errorThrown){
            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
            self.close();
        }
    });
	
}

//상품코드 검색 이벤트(ajax)
function checkProductCode() {
	var pCodeText = $("#modifyProduct_codeText").val();

	// 서버에 보낼 name/value 형태로 담는다. https://zero-gravity.tistory.com/241
	var allData = { "pCodeText": pCodeText };
	
	var contextPath = $("#contextPath").val();
	
	$.ajax({
        url:contextPath+"/modifyProductAjax.spyder",
        type:'POST',
        data: allData,
        dataType: "json",
        //async: false,
        success:function(data){
        	
        	//parseJSON : JSON 문자열을 JavaScript object 로 반환합니다. https://findfun.tistory.com/418
        	var objArray = $.parseJSON(data.gson);
        	
        	$.each(objArray, function(key, val){
        		console.log('key:' + key + ' / ' + 'value:' + val);
        	});

        	/*
        	$.each(data, function(key, val){
                console.log('key:' + key + ' / ' + 'value:' + val);
            });*/
        	
        	$(".check_code_msg").removeClass("check_code_msgShow");
        	
        	//값이 정의 되어있으면 아래 실행
        	if(typeof objArray.pCode!=="undefined"){
        		changeInfoProductModify(objArray);
        		
        		
        	}else{//가져온 데이터에 값이 없을경우에는 초기화
        		changeClearProductModify();
        		
        	}
        	
        	//코드옆에 메세지 출력
        	$(".check_code_msg").text(data.msg);
        	$(".check_code_msg").addClass("check_code_msgShow");
        	
     
        },
        error:function(jqXHR, textStatus, errorThrown){
            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
            self.close();
        }
    });
	
}

//상품수정(modify) 페이지 상품조회시 값 입력 JS
function changeInfoProductModify(objArray) {
	
	//form 상태값변경
	$("#state").val("1");
	
	var conPath=$("#contextPath").val();
	console.log("js]contextPath : "+path);
	
	
	var pathStr = conPath+"/home/product/product_images/";
	
	//이미지 디테일 스플릿
	if(typeof objArray.pImgDetail!=="undefined"){
		
		var imgArray = objArray.pImgDetail.split('|');
		
		for (var i=0;i<imgArray.length-1;i++) {
	    	var imgDetail = imgArray[i].trim();
	    	var detailPath = pathStr+imgDetail;
	    	insertImgFileTag('modify');
	    	$("#preview_img"+(i+2)).attr("src",detailPath);
	    	$("#file-text_id"+(i+2)).val(imgDetail);
	    }
		
	};
	
	
	$("#modifyProduct_codeText").attr("disabled",true);
	$("#check_code_btn").text("변경");
	$("#check_code_btn").attr("onclick",  "changeClearProductModify();");
	
	
	
	//카테고리란 가져온값으로 설정
	$("#modifyProduct_category1").val(objArray.pType1).prop("selected", true);
	
	//CSS 변경함수 한번 호출해주고
	changeEvent_category("modify");
	
	$("#modifyProduct_category2").val(objArray.pType2).prop("selected", true);
	
	console.log("objArray.pSize : "+objArray.pSize);
	console.log("objArray.pColor : "+objArray.pColor);
	
	$("#modifyProduct_name").val(objArray.pName);
	$("#modifyProduct_price").val(objArray.pPrice);
	$("#modifyProduct_size").val(objArray.pSize).prop("selected", true);
	$("#modifyProduct_color").val(objArray.pColor).prop("selected", true);
	$(".colorBox").css("background-color",getColorCode(objArray.pColor));
	$(".colorText").text(getColorCode(objArray.pColor));
	
	$("#modifyProduct_stock").val(objArray.pStock);
	
	$("#preview_img1").attr("src",pathStr+objArray.pImg);
	$("#file-text_id1").val(objArray.pImg);
	
	$(":radio[name='product_post']").val(objArray.pPost).prop("checked", true);
	$("#modifyProduct_desc").val(objArray.pDesc);
	
	$("#modifyProduct_company").val(objArray.pCompany);
	$("#modifyProduct_country").val(objArray.pCountry);
	$("#modifyProduct_mndate").val(objArray.pMndate.substring(0,10));
	$("#modifyProduct_material").val(objArray.pMaterial);
	
	
}
//상품수정 초기화이벤트
function changeClearProductModify(){
	
	//form상태값 변경
	$("#state").val("0");

	//초기화
	$("#modifyProduct_codeText").attr("disabled", false);
	$("#check_code_btn").text("확인");
	$("#check_code_btn").attr("onclick", "checkProductCode();");
	$(".check_code_msg").text("");
	
	var conPath=$("#contextPath").val();
	var pathStr = conPath+"/home/product/product_images/";
	
	//var imgArray = objArray.pImgDetail.split('|');
	
	var imgFormNum = $(".modifyForm_container").children().length;
	
	for (var i=0;i<imgFormNum-1;i++) {
    	
    	$("#imgBox_id"+(i+2)).remove();
    	$("#imgFindBox_id"+(i+2)).remove();
    }
	
	
	$("#modifyProduct_category1").val("");
	
	changeEvent_category("modify");
	
	$("#modifyProduct_name").val("");
	$("#modifyProduct_price").val("");
	$("#modifyProduct_size").val(80).prop("selected", true);
	
	
	
	$("#modifyProduct_color").val("#000000").prop("selected", true);
	$(".colorBox").css("background-color", "#000000");
	$(".colorText").text("#000000");
	
	$("#modifyProduct_stock").val("");
	
	$("#preview_img1").attr("src",pathStr+"default_img.jpg");
	$("#file-text_id1").val("");
	
	
	$(":radio[name='product_post']").prop("checked", false);

	$("#modifyProduct_desc").val("");
	
	$("#modifyProduct_company").val("");
	$("#modifyProduct_country").val("");
	$("#modifyProduct_mndate").val("");
	$("#modifyProduct_material").val("");
	

}

function getColorCode(name){
	var color_name = ["BK", "WH", "GY", "RD", "OR", "YL", "GR", "BU", "NY", "PK", "PR" ];
	var color_code = ["#000000",
		"#FFFFFF",
		"#A6A6A6",
		"#FF0000",
		"#FF5E00",
		"#FFE400",
		"#1DDB16",
		"#0100FF",
		"#002266",
		"#FF00DD",
		"#5F00FF"];
	
	var i = color_name.indexOf(name);

	return color_code[i];
}


/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
//상품등록페이지 이벤트

//상품등록페이지 이미지 추가버튼시 이벤트
function insertImgFileTag(temp) {
	var con= temp+"Form";
	
	var con1_no = $("."+con+"_container").children().length;//이미지 미리보기 갯수
	var con2_no = $("."+con+"_container2").children().length;//파일찾기 갯수
	var path = $("#path").val(); //히든값으로 넘긴 경로 얻어오기
	
	var con1_tagInner1="<img src='"+path+"images/default_img.jpg' id='preview_img"+(con1_no+1)+"'>";
	var con1_tagBox="<div class='"+con+"_imgBox' id='imgBox_id"+(con1_no+1)+"'>"+con1_tagInner1+"</div>";
	
	var con2_tagInner1="<input type='text' name='product_img"+(con2_no+1)+"' class='file-text' readonly='readonly' id='file-text_id"+(con2_no+1)+"'>";
	var con2_tagInner2="<span class='file-btn'>찾아보기</span>";
	var con2_tagInner3_1="<input type='file' class='input-file' size='40' name='product_imgPath"+(con2_no+1)+"' id='input-file_id"+(con2_no+1)+"'>";
	var con2_tagInner3="<span class='file-select'>"+con2_tagInner3_1+"</span>";
	var con2_tagInner4="<span class='filetype'>" + con2_tagInner1 + con2_tagInner2 + con2_tagInner3+"</span>";
	var con2_tagInner5="<span class='b02_simple_rollover' id='delete_btn_img"+(con2_no+1)+"' onclick='deleteImgFileTag(this);'>삭제</span>";
	var con2_tagBox= "<div class='"+con+"_imgFindBox' id='imgFindBox_id"+(con1_no+1)+"'>"+con2_tagInner4+con2_tagInner5+"</div>";
	
	$("."+con+"_container").append(con1_tagBox);
	$("."+con+"_container2").append(con2_tagBox);
	
	//파일업로드 함수 재호출
	fileUpload();
}

//이미지 삭제버튼 이벤트
function deleteImgFileTag(evt) {
	var con1_no = $(".insertForm_container").children().length;//이미지 미리보기 갯수
	var con2_no = $(".insertForm_container2").children().length;//파일찾기 갯수
	
	var length = evt.id.length;
	var selected_no = evt.id.substr(length-1,1);
	
	//이미지
	$("#imgBox_id"+selected_no).remove();
	
	//파일찾기폼
	$("#imgFindBox_id"+selected_no).remove();
	
}

//사이즈 변경 이벤트
function changeEvent_size() {
	changeEvent_code();
	
	
	var con_tagInner;
	var con_tagBox;
	var con;
	
}


//상품등록 카테고리 CSS 변경 이벤트
function changeEvent_category(temp) {
	
	var cArrText = ["TOP&T-SHIRTS","SHORTS&PANTS","RASHGUARD","SLEEVELESS","BRATOP"];
	var cArrVal = ["TT","SP","RG","SV","BT"];
	
	var aArrText = ["SHOES","BAGS","HATS","SOCKS","ETC"];
	var aArrVal = ["SH","BG","HT","SK","EC"];
	
	

	//호출된 페이지 + id값 병합
	var cateId1 = "#"+temp+"Product_category1";
	var cateId2 = "#"+temp+"Product_category2";
	//alert(tempId);
	
	if(temp==="modify"){
		$(cateId1).attr("disabled",true);
		$(cateId2).attr("disabled",true);
	}
	
	$(cateId2).empty();//카테2 모두초기화

	if($(cateId1).val()==="C"){
		for(var i=0; i<cArrText.length; i++){

			$(cateId2).append('<option value="'+ cArrVal[i] +'">' + cArrText[i] + '</option>');

		}
		$(cateId2).show();
		if(temp==="insert"){
			changeEvent_code();
		}

	}else if($(cateId1).val()==="A"){
		for(var i=0; i<aArrText.length; i++){

			$(cateId2).append('<option value="'+ aArrVal[i] +'">' + aArrText[i] + '</option>');

		}
		$(cateId2).show();
		if(temp==="insert"){
			changeEvent_code();
		}
	}else{
		//$(cateId2+" option").remove(); //카테2란 삭제
		$(cateId2).hide();//카테1 숨김
		$("#"+temp+"Product_codeText").val("");//코드란 초기화
	}
	
	
	
}


//상품코드 자동완성
function changeEvent_code() {
	var category1 = $("#insertProduct_category1").val();
	var category2 = $("#insertProduct_category2").val();
	var color = $("#insertProduct_color option:selected").text();
	var size = $("#insertProduct_size").val();
	//var sizeNum = $("#insertProduct_size_num").val();
	//var sizeUnit = $("#insertProduct_size_unit").val();
	/*
	alert(
			"category1 : "+category1 + 
			"\n category2 : "+category2+
			"\n color : "+color+
			"\n sizeMin : "+sizeMin+
			"\n sizeNum : "+sizeNum+
			"\n sizeUnit : "+sizeUnit
	);*/
	if(parseInt(size)<100){
		size = "0"+size;
	};
	
	
	var code = category1 + category2 + color + size+"-";
	
	
	$("#insertProduct_codeText").val(code);
	
	
}

//컬러박스 변경
function changeEvent_color() {
	var selected_value = getColorCode($("#insertProduct_color option:selected").text());
	var colorBox = $(".colorBox");
	var colorText = $(".colorText");

	
	colorBox.css("background-color", selected_value);
	colorText.text(selected_value);
	changeEvent_code();
	
	
}

/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
//페이지 변경시 CSS 변경
function changeCss(path){

	var logoPath = $("#imgPath").val()+"images/icon_spyder_logo.png";
	var iconPath = $("#imgPath").val()+"images/search.jpg";
	
	var arrowImgPath = $("#imgPath").val()+"images/arrow.jpg";

	$(".header").css("background-image","url('"+logoPath+"')");
	$(".header input[type=text]").css("background-image","url('"+iconPath+"')");
	
	
	//컨텍스트 경로 히든값 얻어오기
	var contextPath = $("#contextPath").val();
	//alert("contextPath : "+contextPath);
	
	
	
	//index페이지가 아닐시 => 첫호출시
	if(path!==contextPath+"/admin/index.jsp"){
		init(); //모든 CSS display:none 처리
		
		$(".sidenav a").hover(function(e) {
			if($(".sidenav a").hasClass("active")){
				$(this).css("color", "#D1DBBD");
			}else{
				$(this).css("color", "white");
			}
			  
		}, function(){
			if($(".sidenav a").hasClass("active")){
				$(this).css("color", "#BFBFBF");
			}else{
				$(this).css("color", "white");
			}
		});
		
	}else{
		$("#side_Home").addClass("active");
	}
	

	//home페이지 요청시
	if (path === contextPath+"/index.spyder" || path === contextPath+"/loginAdmin.spyder") {

		$("#jb-container_home").css("display", "block");
		$("#side_Home").addClass("active");
		$("#top_Home").addClass("active");


	}
	
	//상품리스트 CSS
	if (path === contextPath+"/listProduct.spyder") {

		$("#jb-container").css("display", "block");
		$(".inner_header").css("display", "block");
		$(".list_productForm").css("display", "block");
		$("#innerTab_product_list").addClass("active");

		$("#side_Product").addClass("active");
		
		
		$(".inner-select").css("background-image","url('"+arrowImgPath+"')");

	}
	
	//상품등록 CSS
	if(path === contextPath+"/insertProduct.spyder"){

		$("#jb-container").css("display", "block");
		$(".inner_header").css("display", "block");
		$(".insert_productForm").css("display", "block");
		$("#innerTab_product_insert").addClass("active");

		$("#side_Product").addClass("active");

	}
	
	//상품등록 결과 CSS
	if (path === contextPath+"/insertProductResult.spyder") {

		$("#jb-container").css("display", "block");
		$(".inner_header").css("display", "block");
		$(".insert_productForm").css("display", "block");
		$("#innerTab_product_insert").addClass("active");

		$("#side_Product").addClass("active");

	}
	
	//상품수정 CSS
	if (path === contextPath+"/modifyProduct.spyder") {

		$("#jb-container").css("display", "block");
		$(".inner_header").css("display", "block");
		$(".modify_productForm").css("display", "block");
		$("#innerTab_product_modify").addClass("active");

		$("#side_Product").addClass("active");
	}
	
	//상품수정 결과 CSS
	if (path === contextPath+"/modifyProductResult.spyder") {

		$("#jb-container").css("display", "block");
		$(".inner_header").css("display", "block");
		$(".modify_productForm").css("display", "block");
		$("#innerTab_product_modify").addClass("active");

		$("#side_Product").addClass("active");
	}
	
	
	//회원리스트 CSS
	if (path === contextPath+"/listMember.spyder") {

		$("#jb-container").css("display", "block");
		$(".inner_header").css("display", "block");
		$(".list_memberForm").css("display", "block");
		$("#innerTab_member_list").addClass("active");

		$("#side_Member").addClass("active");
		
		$(".inner-select").css("background-image","url('"+arrowImgPath+"')");
	}
	
	//주문리스트 CSS
	if (path === contextPath+"/listOrder.spyder"){
		$("#jb-container").css("display", "block");
		$(".inner_header").css("display", "block");
		$(".list_orderForm").css("display", "block");
		$("#innerTab_order_list").addClass("active");
		
		$("#side_Order").addClass("active");
		
		$(".inner-select").css("background-image","url('"+arrowImgPath+"')");
	}
	
	//장바구니리스트 CSS
	if (path === contextPath+"/listCart.spyder"){
		$("#jb-container").css("display", "block");
		$(".inner_header").css("display", "block");
		$(".list_cartForm").css("display", "block");
		$("#innerTab_cart_list").addClass("active");
		
		$("#side_Cart").addClass("active");
		
		$(".inner-select").css("background-image","url('"+arrowImgPath+"')");
	}

	//PQ 게시판리스트 CSS
	if (path === contextPath+"/listPQuestion.spyder") {

		$("#jb-container").css("display", "block");
		$(".inner_header").css("display", "block");
		$(".list_boardForm").css("display", "block");
		$("#innerTab_PQuestion_list").addClass("active");

		$(".dropdown-container").css("display","block");
		$("#side_PQuestion").addClass("active");
		
		$(".inner-select").css("background-image","url('"+arrowImgPath+"')");
	}
	
	//FB 게시판리스트 CSS
	if (path === contextPath+"/listFBoard.spyder") {

		$("#jb-container").css("display", "block");
		$(".inner_header").css("display", "block");
		$(".list_boardForm").css("display", "block");
		$("#innerTab_FBoard_list").addClass("active");

		$(".dropdown-container").css("display","block");
		$("#side_FBoard").addClass("active");
		
		$(".inner-select").css("background-image","url('"+arrowImgPath+"')");
	}
	
	//NB 게시판리스트 CSS
	if (path === contextPath+"/listNBoard.spyder") {

		$("#jb-container").css("display", "block");
		$(".inner_header").css("display", "block");
		$(".list_boardForm").css("display", "block");
		$("#innerTab_NBoard_list").addClass("active");

		$(".dropdown-container").css("display","block");
		$("#side_NBoard").addClass("active");
		
		$(".inner-select").css("background-image","url('"+arrowImgPath+"')");
	}
	

}

//메뉴 클릭시 화면 변경 이벤트
function changeForm(id) {
	var form = document.getElementById("redirectForm");
	var hidden = document.getElementById("redirectHidden");
	form.method = "POST";//액션속성 설정
	hidden.name = "sideMenu";//히든값 name 설정
	
	var contextPath = $("#contextPath").val();
	//alert("contextPath : "+contextPath);
	
	//홈
	if(id === "side_Home" || id === "top_Home" || id === "top_Logo") {
		form.action = contextPath+"/index.spyder"; //요청 서블릿
		hidden.value = "home.jsp"; //응답 JSP
		form.submit();
	}
	
	//상품리스트
	if(id === "side_Product" || id === "innerTab_product_list") {
		form.action = contextPath+"/listProduct.spyder";
		hidden.value = "product_list.jsp";
		form.submit();

	}
	
	//상품등록
	if(id === "innerTab_product_insert") {
		form.action = contextPath+"/insertProduct.spyder";
		hidden.value = "product_insert.jsp";
		form.submit();
	}
	
	//상품수정
	if(id ==="innerTab_product_modify" || id==="list_product_modify"){
		form.action = contextPath+"/modifyProduct.spyder";
		hidden.value = "product_modify.jsp";
		form.submit();
	}

	//회원리스트
	if(id === "side_Member" || id === "innerTab_member_list") {
		form.action = contextPath+"/listMember.spyder";
		hidden.value = "member_list.jsp";
		form.submit();
	}
	
	//주문리스트
	if(id === "side_Order" || id === "innerTab_order_list") {
		form.action = contextPath+"/listOrder.spyder";
		hidden.value = "order_list.jsp";
		form.submit();
	}
	
	//장바구니리스트
	if(id === "side_Cart" || id === "innerTab_cart_list") {
		form.action = contextPath+"/listCart.spyder";
		hidden.value = "cart_list.jsp";
		form.submit();
	}

	//PQ 게시판 리스트
	if(id === "side_PQuestion" || id === "innerTab_PQuestion_list") {
		form.action = contextPath+"/listPQuestion.spyder";
		hidden.value = "pquestion_list.jsp";
		form.submit();
	}
	
	//FAQ 게시판 리스트
	if(id === "side_FBoard" || id === "innerTab_FBoard_list") {
		form.action = contextPath+"/listFBoard.spyder";
		hidden.value = "fboard_list.jsp";
		form.submit();
	}
	
	//Notice 게시판 리스트
	if(id === "side_NBoard" || id === "innerTab_NBoard_list") {
		form.action = contextPath+"/listNBoard.spyder";
		hidden.value = "nboard_list.jsp";
		form.submit();
	}

}



//CSS display:none All
function init() {
	
	$("#side_Home").removeClass("active");
	$("#top_Home").removeClass("active");

	for (var i = 0; i < $(".sidenav").children().length; i++) {

		$(".sidenav").children().eq(i).css("background-color",
		"#242B3A");
		$(".sidenav").children().eq(i).css("color", "#BFBFBF");

	}

	for (var i = 0; i < $("#mainouter").children().length; i++) {
		$("#mainouter").children().eq(i).css("display", "none");
	}

	for (var i = 0; i < $("#jb-header").children().length; i++) {
		$("#jb-header").children().eq(i).css("display", "none");
	}

	for (var i = 0; i < $("#jb-content").children().length; i++) {
		$("#jb-content").children().eq(i).css("display", "none");
	}

	for (var i = 0; i < $(".inner_topnav").find("a").length; i++) {
		$(".inner_topnav").find("a").eq(i).removeClass("active");
	}
}

//드롭다운 JS
function sideVar() {
	var dropdown = document.getElementsByClassName("dropdown-btn");
	var i;

	for (i = 0; i < dropdown.length; i++) {
		dropdown[i].addEventListener("click", function() {
			this.classList.toggle("active");
			var dropdownContent = this.nextElementSibling;
			if (dropdownContent.style.display === "block") {
				dropdownContent.style.display = "none";
			} else {
				dropdownContent.style.display = "block";
			}
		});
	}
}

//카테고리 목록 JS
function selectItem() {
	var x, i, j, selElmnt, a, b, c;
	/*look for any elements with the class "custom-select":*/
	x = document.getElementsByClassName("custom-select");
	for (i = 0; i < x.length; i++) {
		selElmnt = x[i].getElementsByTagName("select")[0];
		/*for each element, create a new DIV that will act as the selected item:*/
		a = document.createElement("DIV");
		a.setAttribute("class", "select-selected");
		a.innerHTML = selElmnt.options[selElmnt.selectedIndex].innerHTML;
		x[i].appendChild(a);
		/*for each element, create a new DIV that will contain the option list:*/
		b = document.createElement("DIV");
		b.setAttribute("class", "select-items select-hide");
		for (j = 0; j < selElmnt.length; j++) {
			/*for each option in the original select element,
					create a new DIV that will act as an option item:*/
			c = document.createElement("DIV");
			c.innerHTML = selElmnt.options[j].innerHTML;
			c.addEventListener(
					"click",
					function(e) {
						
						/*when an item is clicked, update the original select box,
										and the selected item:*/
						var y, i, k, s, h;
						s = this.parentNode.parentNode
						.getElementsByTagName("select")[0];
						h = this.parentNode.previousSibling;
						for (i = 0; i < s.length; i++) {
							if (s.options[i].innerHTML == this.innerHTML) {
								s.selectedIndex = i;
								h.innerHTML = this.innerHTML;
								y = this.parentNode
								.getElementsByClassName("same-as-selected");
								for (k = 0; k < y.length; k++) {
									y[k]
									.removeAttribute("class");
								}
								this.setAttribute("class",
								"same-as-selected");
								break;
							}
						}
						h.click();
						
						//리스트 체인지 이벤트
						listProductCategory();
					});
			b.appendChild(c);
		}
		x[i].appendChild(b);
		a.addEventListener("click", function(e) {
			/*when the select box is clicked, close any other select boxes,
					and open/close the current select box:*/
			
			e.stopPropagation();
				
			closeAllSelect(this);
			this.nextSibling.classList.toggle("select-hide");
			this.classList.toggle("select-arrow-active");
			
		});
	}

	function closeAllSelect(elmnt) {
		/*a function that will close all select boxes in the document,
				except the current select box:*/
		var x, y, i, arrNo = [];
		x = document.getElementsByClassName("select-items");
		y = document.getElementsByClassName("select-selected");
		for (i = 0; i < y.length; i++) {
			if (elmnt == y[i]) {
				arrNo.push(i)
			} else {
				y[i].classList.remove("select-arrow-active");
			}
		}
		for (i = 0; i < x.length; i++) {
			if (arrNo.indexOf(i)) {
				x[i].classList.add("select-hide");
			}
		}
	}
	/*if the user clicks anywhere outside the select box,
			then close all select boxes:*/
	document.addEventListener("click", closeAllSelect);
}


//파일 업로드 JS
function fileUpload() {
	//상품등록 파일업로드 제이쿼리
	var $fileBox = $('.filetype');
	$fileBox.each(function(index, item) {
		/*[each]
		 // 인덱스는 말 그대로 인덱스 
		 // item 은 해당 선택자인 객체를 나타냅니다. 
		 $(item).addClass('li_0' + index); 
		 // item 과 this는 같아서 일반적으로 this를 많이 사용합니다. 
		 // $(this).addClass('li_0' + index);
		 => 위 코드를 실행하면 li 의 클래스에 li_00, li_01, li_02 가 추가되어 있을 것입니다.
		출처: https://webclub.tistory.com/455 [Web Club]
		 */
		var $fileUpload = $(this).find("#input-file_id"+(index+1));
		var $fileText = $(this).find("#file-text_id"+(index+1));

		$fileUpload.on("change", function(e) {
			
			var fileName = $(this).val().replace(/^.*\\/, "");
			
			readURL(index,this);//이미지미리보기 함수
			$fileText.attr("readonly", "readonly").val(fileName);

		});
	});
}
//이미지미리보기 함수
function readURL(index,input) {
	var reader="";
	var str="";
	if (input.files && input.files[0]) {
		reader = new FileReader();
		reader.onload = function(e) {
			$("#preview_img"+(index+1)).attr("src", e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}

}