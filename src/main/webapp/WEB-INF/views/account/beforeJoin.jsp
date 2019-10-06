<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Hamobee</title>
	<%@ include file="../include/header.jsp" %>
	<script>	
		$(function(){ 
			// 회원가입 버튼을 눌렀을 때
			$("#btnSelectRole").click(function(){
				if($("input:radio[name='role']").is(":checked")==false){
					alert("회원 유형을 선택해주세요");
					return;
				}
				document.form1.action = "${path}/account/join";
				document.form1.submit();
			});
		});
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
					<h3 class="w3-center w3-xxlarge">회원 유형</h3>
					<br>
					<form class="w3-center" name="form1" method="post">
						<input class="w3-radio" type="radio" name="role" value="performer" checked>
						<label class="w3-xlarge">연주자</label>
						</br>
						</br>
						<input class="w3-radio" type="radio" name="role" value="recruiter">
						<label class="w3-xlarge">주최자</label>
						
						</br>
						</br>
						</br>
						</br>
						<button class="w3-large w3-center w3-button w3-black w3-hover-grey" id="btnSelectRole">확인</button>
					</form>
				</div>
			</div>
		</div>
		</div>
</body>
</html>