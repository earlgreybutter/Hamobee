<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Hamobee</title>
	<%@ include file="../include/header.jsp" %>
<script>
function btnLogin(){
	var email=$("#email").val();
	var password=$("#password").val();
	
	if(email==""){
		alert("이메일를 입력하세요");
		$("#email").focus();
		return;
	}
	if(password==""){
		alert("비밀번호를 입력하세요");
		$("#password").focus();
		return;
	}
	document.form1.action = "${path}/account/loginCheck";
	document.form1.submit();
}
</script>
</head>
<body class="w3-light-grey">
	<%@ include file="../include/side_menu.jsp" %>
	<div class="w3-display-container w3-grayscale-min slideBackground00">
	</div>
	<div class="w3-display-container w3-grayscale-min slideBackground01">
	</div>
	<div class="w3-display-container w3-grayscale-min slideBackground02">
	</div>
	
	<div class="w3-padding-large w3-display-middle" id="main_forMargin">
		<div class="w3-container w3-white w3-round-xxlarge" style="width:550px; padding:32px 16px">
			<div id="formCenter">
				<div class="w3-white w3-padding">
					<h3 class="w3-center w3-xxlarge">Login</h3>
					</br>
					<form name="form1" method="post">
					
						<table align="center">
							<tr>
								<label class="w3-large">Email</label>
								<div class="w3-rest w3-large">
									<input class="w3-input w3-border w3-round-large" style="height:60px" type="text" id="email" name="email" value="${map.email}">
								</div>
							</tr>
							<tr>
								<label class="w3-large">Password</label>
								<div class="w3-rest w3-large">
									<input class="w3-input w3-border w3-round-large" type="password" id="password" name="password" style="height:60px">  
								</div>
							<tr>
								<td colspan="2" align="center">
									<input class="w3-button w3-black w3-hover-grey w3-border" type="button" value ="로그인" onclick="btnLogin()">
								</td>
							</tr>
							<c:if test="${message=='joinSuccess'}">
								<tr>
									<td colspan="2">
										<div style="color:red;">
											회원가입이 완료되었습니다.
										</div>
									</td>
								</tr>	
							</c:if>
							<c:if test="${map.message=='loginFail'}">
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