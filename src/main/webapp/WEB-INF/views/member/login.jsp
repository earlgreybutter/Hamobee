<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<%@ include file="../include/header.jsp" %>
<script>
function btnLogin(){
	var userid=$("#userid").val();
	var passwd=$("#passwd").val();
	
	if(userid==""){
		alert("아이디를 입력하세요");
		$("#userid").focus();
		return;
	}
	if(passwd==""){
		alert("비밀번호를 입력하세요");
		$("#passwd").focus();
		return;
	}
}
</script>
</head>
<body class="w3-light-grey">
	<%@ include file="../include/side_menu.jsp" %>
	<div id="main_content">
		<div class="w3-container" style="padding:32px 16px">
			<div id="formCenter">
				<div class="w3-card w3-white w3-padding">
					<h3 class="w3-center w3-xlarge">Login</h3>
					<img src="resources/images/horse02.jpg" class="setCenter w3-margin-bottom" style="width:100%">
					<form name="form1" action="${path}/member/login_check.do" method="post">
						<table align="center">
							<tr>
								<td>아이디</td>
								<td>
									<input type="text" id="userid" name="userid" 
									placeholder="ID" value="${map.dto.userid}">
								</td>
							</tr>
							<tr>
								<td>비밀번호</td>
								<td>
									<input type="password" id="passwd" name="passwd" 
									placeholder="Password" value="${map.dto.passwd}">  
								</td>
							<tr>
								<td colspan="2" align="center">
									<button onclick="btnLogin()">로그인</button>
								</td>
							</tr>
							<c:if test="${message=='join_success'}">
								<tr>
									<td colspan="2">
										<div style="color:red;">
											회원가입이 완료되었습니다.
										</div>
									</td>
								</tr>	
							</c:if>
							<c:if test="${map.message=='login_fail'}">
								<tr>
									<td colspan="2">
										<div style="color:red;">
											아이디와 비밀번호가 틀립니다.
										</div>
									</td>
								</tr>	
							</c:if>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>