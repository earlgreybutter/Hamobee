<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<%@ include file="../include/header.jsp" %>
	
<script>

	$(function(){
		$("#btnEdit").click(function(){
			var name=$("#name").val();
			var userid=$("#userid").val();
			var passwd=$("#passwd").val();
			var email=$("#email").val();
			
			if(name==""){
				alert("이름을 입력하세요");
				$("name").focus();
				return;
			}
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
			if(email==""){
				alert("이메일을 입력하세요");
				$("#email").focus();
				return;
			}
			
			var beforepasswd=$("#beforepasswd").val();
			
			if(beforepasswd!=passwd){
				alert("비밀번호가 틀립니다.");
				$("#passwd").focus();
				return;
			}
			

			document.form1.action="${path}/member/update.do";
			document.form1.submit();
		});
	});
</script>
	
</head>
<body class="w3-light-grey">
	<%@ include file="../include/side_menu.jsp" %>
	<div id="main_content">
		<div class="w3-container" style="padding:32px 16px">
			<div id="formCenter">
				<div class="w3-card w3-white w3-padding">
					<h3 class="w3-center w3-xlarge">정보 수정</h3>
					<img src="resources/images/horse02.jpg" class="setCenter w3-margin-bottom" style="width:100%">
					<form name="form1" method="post">
						<table align="center">
							<tr>
								<td>이름</td>
								<td>
									<input type="text" id="name" name="name" 
									placeholder="Name" value="${dto.name}">
								</td>
							</tr>
							
							<tr>
								<td>아이디</td>
								<td>
									<input type="text" id="userid" name="userid" 
									value="${dto.userid}" readonly>
								</td>
							</tr>
	
							<tr>
								<td>비밀번호</td>
								<td>
									<input type="password" id="passwd" name="passwd" 
									placeholder="Password"> 
							 	</td>
							 </tr>
							 <tr>
							 	<td>이메일</td>
							 	<td>
							 		<input type="text" id="email" name="email" 
							 		placeholder="Email" value="${dto.email}">
							 	</td>
							 </tr>
							 <tr>
							 	<td colspan="2" align="center">
							 		<input type="hidden" id="beforepasswd" value="${dto.passwd}">
							 		<input type="button" id="btnEdit" value="정보수정">
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