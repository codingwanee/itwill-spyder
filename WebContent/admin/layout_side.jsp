<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<div class="sidenav">
	<a href="javascript:void(0);" onclick="eventHandler(this);" id="side_Home">
		<i class="fa fa-fw fa-home" style="margin-right: 5px"></i>Home<i class="fa fa-angle-right"></i>
	</a>
	<a href="javascript:void(0);" onclick="eventHandler(this);" id="side_Product">
		<i class="fa fa-fw fa-wrench" style="margin-right: 5px"></i>Product<i class="fa fa-angle-right"></i>
	</a>
	<a href="javascript:void(0);" onclick="eventHandler(this);" id="side_Member">
		<i class="fa fa-fw fa-user" style="margin-right: 5px"></i>Member<i class="fa fa-angle-right"></i>
	</a>
	<a href="javascript:void(0);" onclick="eventHandler(this);" id="side_Order">
		<i class="fa fa-fw fa-credit-card" style="margin-right: 5px"></i>Order<i class="fa fa-angle-right"></i>
	</a>
	<a href="javascript:void(0);" onclick="eventHandler(this);" id="side_Cart">
		<i class="fa fa-fw fa-shopping-cart" style="margin-right: 5px"></i>Cart<i class="fa fa-angle-right"></i>
	</a>
	<button class="dropdown-btn" id="side_btn_dropdown" onclick="eventHandler(this);">
		<i class="fa fa-fw fa-clipboard" style="margin-right: 5px"></i>Board<i class="fa fa-caret-down"></i>
	</button>
	<div class="dropdown-container">
		<a href="javascript:void(0);" onclick="eventHandler(this);" id="side_PQuestion">Personal Question</a>
		<a href="javascript:void(0);" onclick="eventHandler(this);" id="side_NBoard">Notice</a>
		<a href="javascript:void(0);" onclick="eventHandler(this);" id="side_FBoard">FAQ</a>
	</div>
	<a href="javascript:void(0);" class="openBtn" onclick="openSearch();" id="side_Search">
		<i class="fa fa-fw fa-search" style="margin-right: 5px"></i>Search<i class="fa fa-angle-right"></i>
	</a>
</div>

<!-- 페이지 이동 폼값 -->
<form action="" method="" id="redirectForm">
	<input type="hidden" name="" id="redirectHidden"  value="">
	<input type="hidden" name="product_list_pcode" id="product_list_pcode" value="">
</form>