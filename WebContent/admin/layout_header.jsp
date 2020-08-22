<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

String uri = request.getRequestURI();
String[] uriArr=uri.split("/");
String imgPath ="";
for(int i=0;i<uriArr.length-1;i++){
	 imgPath = imgPath + uriArr[i] +"/";
}

%>
<input type="hidden" id="imgPath" value="<%=imgPath%>">
<div class="header">
	<a href="javascript:void(0);" onclick="eventHandler(this);" id="top_Logo" class="logo">Adminstrator</a>
	<input type="text" name="search" id="header_search" placeholder="Search.." onkeypress="if( event.keyCode==13 ){openSearchBefore();}" autocomplete="off">
	<div class="header-right">
		<a class="active" id="top_Home" href="javascript:void(0);" onclick="eventHandler(this);">Home</a>
		<a href="javascript:void(0);" onclick="goSpyderSite();">Spyder Site</a>
		<a href="javascript:void(0);" onclick="logout();">Log-Out</a>
	</div>
</div>

<script type="text/javascript">
	function openSearchBefore() {
		var temp = $("#header_search").val();
		$("#header_search").val("");
		
		openSearch();
		$("#allSearchInput").val(temp);
		$("#allSearchInput").focus();
	}
	
	function goSpyderSite() {
		window.location.href = "<%=request.getContextPath()%>/home/index.jsp";
	}
	
	function logout() {
		window.location.href = "<%=request.getContextPath()%>/logoutAdmin.spyder";
	}

</script>