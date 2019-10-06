<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Hamobee</title>
	<%@ include file="../include/header.jsp" %>
<script>
function btnSendMail(){
	var from=$("#from").val();
	var subject=$("#subject").val();
	
	if(from==""){
		alert("이메일을 입력해주세요");
		$("#from").focus();
		return;
	}
	if(subject==""){
		alert("제목");
		$("#subject").focus();
		return;
	}

	document.form1.action = "${path}/contact/sendMail";
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
		<div class="w3-container w3-white w3-round-xxlarge" style="padding:32px 16px">
			<div id="formCenter">
				<div class="w3-white w3-padding">
					<h3 class="w3-center w3-xlarge">Send Mail</h3>
					<form name="form1" method="post">
						<table align="center">
							<tr>
								<td>보내는 사람</td>
								<td>
									<input 
									class="w3-input w3-border w3-round-large" 
									type="text" id="from" name="from" 
									placeholder="ID@yourDomain.com">
								</td>
							</tr>
							<tr>
								<td>받는 사람</td>
								<td>
									<input 
									class="w3-input w3-border w3-round-large" 
									type="text" id="to" name="to" 
									value="kys4548@gmail.com" readonly>
								</td>
							</tr>
							<tr>
								<td>제목</td>
								<td>
									<input 
									class="w3-input w3-border w3-round-large" 
									type="text" id="subject" name="subject" 
									placeholder="Subject">  
								</td>
							<tr>
							<tr>
								<td>내용</td>
								<td>
									<textarea 
									class="w3-input w3-border w3-round-large" 
									style="height:200px" cols="25" id="contents" name="contents" 
									placeholder="Content"></textarea>
								</td>
							<tr>
								<td colspan="2" align="center">
									<input type="button" value ="보내기" onclick="btnSendMail()">
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>