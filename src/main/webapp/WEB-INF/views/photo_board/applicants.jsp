<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Hamobee</title>
	<%@ include file="../include/header.jsp" %>
	<script>
	function pageback(){
		history.go(-1);
	}
	</script>
</head>
<body class="w3-light-grey">
	<%@ include file="../include/side_menu.jsp" %>
	<div id="main_content">
		<!-- Header -->
		<header>
			<div class="w3-container">
				<h1>
					<b><i class="fas fa-drum w3-xxlarge"></i> Concert</b>
				</h1>
				<div class="w3-section w3-bottombar w3-padding-16">
					<div style="text-align: right;">
						<input type="button" value="뒤로가기" onclick="pageback()" class="w3-bar-item w3-button w3-black w3-hover-grey">
					</div>
				</div>
			</div>
			
		</header>
		<b class="w3-xlarge">&nbsp;&nbsp;&nbsp;&nbsp;지원자 목록입니다.</b>

		<div class="w3-container w3-margin">
			<div class="w3-padding-16">
				
				<c:forEach var="row" items="${map.applicants}">
					<div class="w3-container w3-card w3-white ">
						<table class="w3-center" style="width:100%">
							<tr>
								<td><label class="w3-large">Email</label></td>
								<td><div class="w3-large w3-panel w3-border">${row.email}</div></td>
							</tr>
							<tr>
								<td><label class="w3-large">Name</label></td>
								<td><div class="w3-large w3-panel w3-border">${row.name}</div></td>
							</tr>
							<tr>
								<td><label class="w3-large">Age</label></td>
								<td><div class="w3-large w3-panel w3-border">${row.age}</div></td>
							</tr>
							<tr>
								<td><label class="w3-large">Gender</label></td>
								<td><div class="w3-large w3-panel w3-border">${row.gender}</div></td>
							</tr>
							<tr>
								<td><label class="w3-large">Instruments</label></td>
								<td><div class="w3-large w3-panel w3-border">
									<c:forEach var="instrument" items="${row.instruments}">
										${instrument.name} &nbsp;
									</c:forEach>
								</div></td>
							</tr>
							<tr>
								<td><label class="w3-large">Tags</label></td>
								<td><div class="w3-large w3-panel w3-border">
									<c:forEach var="tag" items="${row.tags}">
										${tag.content} &nbsp;
									</c:forEach>
								</div></td>
							</tr>
							<tr>
								<td><label class="w3-large">자기소개</label></td>
								<td><div class="w3-large w3-panel w3-border">${row.description}
								</div></td>
							</tr>
						</table>
					</div>
				<hr>
				</c:forEach>
			</div>
		</div>
		

	</div>
</body>
</html>