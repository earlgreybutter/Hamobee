<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">


<div>
	<!-- 네비게이션 역할을 하는 링크 그룹을 담을 때 사용 -->
	<nav class="w3-sidebar w3-bar-block w3-small w3-hide-small w3-center"> 
		<a href="${path}/" class="w3-bar-item w3-button w3-padding-large w3-white">
			<i class="fa fa-home w3-xxlarge"></i>
			<p>HOME</p>
		</a>
		<a href="${path}/about" class="w3-bar-item w3-button w3-padding-large w3-white">
			<i class="fas fa-info-circle w3-xxlarge"></i>
			<p>ABOUT</p>
		</a>
		<a href="${path}/photoboard" class="w3-bar-item w3-button w3-padding-large w3-white">
			<i class="fas fa-drum w3-xxlarge"></i>
			<p>CONCERT</p>
		</a>
		<a href="${path}/board" class="w3-bar-item w3-button w3-padding-large w3-white">
			<i class="fas fa-list-alt w3-xxlarge"></i>
			<p>BOARD</p>
		</a>
		<a href="${path}/contact" class="w3-bar-item w3-button w3-padding-large w3-white">
			<i class="fa fa-envelope w3-xxlarge"></i>
			<p>CONTACT</p>
		</a>
	</nav>
	
	<!-- Navbar on small screens (Hidden on medium and large screens) -->
	<div class="w3-top w3-hide-large w3-hide-medium" id="myNavbar">
		<div class="w3-bar w3-white w3-center w3-small">
			<a href="#" class="w3-bar-item w3-button" style="width:20% !important">HOME</a>
			<a href="#" class="w3-bar-item w3-button" style="width:20% !important">ABOUT</a>
			<a href="#" class="w3-bar-item w3-button" style="width:20% !important">PRODUCT</a>
			<a href="#" class="w3-bar-item w3-button" style="width:20% !important">BOARD</a>
			<a href="#" class="w3-bar-item w3-button" style="width:20% !important">CONTACT</a>
		</div>
	</div>
	<div class="w3-container" id="hideWhenNotMobile"></div>
</div>