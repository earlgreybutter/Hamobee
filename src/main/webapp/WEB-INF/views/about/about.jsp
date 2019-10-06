<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<%@ include file="../include/header.jsp" %>
</head>
<body class="w3-light-grey">
	<%@ include file="../include/side_menu.jsp" %>
	<div id="main_content">	
		<!-- Profile Section -->
		<div class="w3-container" style="padding:32px 16px">
			<h3 class="w3-center w3-xxlarge">THE PROFILE</h3>
			<div class="setCenter" style="width:500px">
				<div class="w3-card">
				<img src="resources/images/horse02.jpg" style="width:100%">
				<div class="w3-container">
					<h3>Metal duck</h3>
					<p class="w3-opacity">duckduck</p>
					<p>Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse sodales pellentesque elementum.</p>
					<p><button class="w3-button w3-light-grey w3-block">
					<a href="">
						<i class="fa fa-envelope"></i> Contact</a>
					</button>
					</p>
				</div>
				</div>
			</div>
		</div>
		
		<!-- About Section -->
		<div class="w3-container w3-light-grey" style="padding:128px 16px">
			<h3 class="w3-center">ABOUT</h3>
			<p class="w3-center w3-large">Key features of our company</p>
			<div class="w3-row-padding w3-center" style="margin-top:64px">
			<div class="w3-quarter">
				<i class="fa fa-desktop w3-margin-bottom w3-jumbo w3-center"></i>
				<p class="w3-large">Responsive</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.</p>
			</div>
			<div class="w3-quarter">
				<i class="fa fa-heart w3-margin-bottom w3-jumbo"></i>
				<p class="w3-large">Passion</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.</p>
			</div>
			<div class="w3-quarter">
				<i class="fa fa-diamond w3-margin-bottom w3-jumbo"></i>
				<p class="w3-large">Design</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.</p>
			</div>
			<div class="w3-quarter">
				<i class="fa fa-cog w3-margin-bottom w3-jumbo"></i>
				<p class="w3-large">Support</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.</p>
			</div>
			</div>
		</div>
		
		<!-- Detail Section -->
		<div class="w3-container w3-grey" style="padding:128px 16px">
			<h3 class="w3-center">애국가</h3>
			<p class="w3-center w3-large" style="margin-top:64px">
				동해물과 백두산이 마르고 닳도록 ...
			</p>
		</div>
	</div>
</body>
</html>