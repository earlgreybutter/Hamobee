<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<%@ include file="../include/header.jsp" %>
<script>
function member_login(){
	location.href="${path}/member/login.do";
}
function member_join(){
	location.href="${path}/member/join.do";
}
</script>
</head>
<body class="w3-light-grey">
	<%@ include file="../include/side_menu.jsp" %>
	<div id="main_content">
		<!-- Header -->
		<header>
			<div class="w3-container">
				<h1><b><i class="fas fa-list-alt"></i> Board</b></h1>
				<button class="w3-button w3-white" onclick="member_login()">Login</button>
				<button class="w3-button w3-white" onclick="member_join()">Register</button>
				<div class="w3-section w3-bottombar"></div>
			</div>
		</header>

		<!-- First Photo Grid-->
		<div class="w3-container w3-white w3-margin">
			<div class="w3-padding-16">
				<a href="" class="anchorNoDeco">
					<div class="w3-container">
						<div> <b> [0001] Title : </b><br/> </div>
						<div class="w3-quarter"> Date : 2018.09.23 </div>
						<div class="w3-quarter"> Hit : 13 </div>
						<div class="w3-quarter"> Hit : 13 </div>
						<div class="w3-quarter"> Writer : kok202 </div>
					</div>
				</a>
				<hr>
				<a href="" class="anchorNoDeco">
					<div class="w3-container">
						<div> <b> [0001] Title : </b><br/> </div>
						<div class="w3-quarter"> Date : 2018.09.23 </div>
						<div class="w3-quarter"> Hit : 13 </div>
						<div class="w3-quarter"> Hit : 13 </div>
						<div class="w3-quarter"> Writer : kok202 </div>
					</div>
				</a>
				<hr>
				<a href="" class="anchorNoDeco">
					<div class="w3-container">
						<div> <b> [0001] Title : </b><br/> </div>
						<div class="w3-quarter"> Date : 2018.09.23 </div>
						<div class="w3-quarter"> Hit : 13 </div>
						<div class="w3-quarter"> Hit : 13 </div>
						<div class="w3-quarter"> Writer : kok202 </div>
					</div>
				</a>
				<hr>
				<a href="" class="anchorNoDeco">
					<div class="w3-container">
						<div> <b> [0001] Title : </b><br/> </div>
						<div class="w3-quarter"> Date : 2018.09.23 </div>
						<div class="w3-quarter"> Hit : 13 </div>
						<div class="w3-quarter"> Hit : 13 </div>
						<div class="w3-quarter"> Writer : kok202 </div>
					</div>
				</a>
				<hr>
				<a href="" class="anchorNoDeco">
					<div class="w3-container">
						<div> <b> [0001] Title : </b><br/> </div>
						<div class="w3-quarter"> Date : 2018.09.23 </div>
						<div class="w3-quarter"> Hit : 13 </div>
						<div class="w3-quarter"> Hit : 13 </div>
						<div class="w3-quarter"> Writer : kok202 </div>
					</div>
				</a>
			</div>
		</div>
	</div>
</body>
</html>