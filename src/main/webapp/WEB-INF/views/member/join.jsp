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
		$("#btnJoin").click(function(){
			var name=$("#name").val();
			var userid=$("#userid").val();
			var passwd=$("#passwd").val();
			var email=$("#email").val();
			//var role= $("input[name=role]:checked").val();
			//var gender=$("#input[name=gender]:checked").val();
			var age=$("#age").val();
			
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
			if(name==""){
				alert("이름을 입력하세요");
				$("name").focus();
				return;
			}
			if(age==""){
				alert("나이를 입력하세요");
				$("age").focus();
				return;
			}
			if(email==""){
				alert("이메일을 입력하세요");
				$("#email").focus();
				return;
			}
			
			var message="${map.message}";
			// "" -> 중복조회 안함
			// "id_error" -> 중복조회시 아이디 중복됨
			// "id"success" -> 중복조회시 아이디 중복안됨
			
			var beforeid=$("#beforeid").val();
			
			if(message=="" || beforeid!=userid){
				alert("아이디 중복확인을 해주세요");
				$("#userid").focus();
				return;
			}
			//아이디 중복확인을 안한경우와 중복확인을 했지만 다시 변경한 경우 방지
			if(message=="id_error"){
				alert("아이디가 중복되었습니다.");
				$("#userid").focus();
				return;
			}
			//아이디가 중복되는경우 방지
			
			document.form1.action="${path}/member/insert.do";
			document.form1.submit();
		});
		
		$("#btnIdDoubleCheck").click(function(){
			var userid=$("#userid").val();
			
			if(userid==""){
				alert("아이디를 입력하세요");
				$("#userid").focus();
				return;
			}
			//userid에 아무것도 입력하지 않고 중복확인을 눌렀을때 방지
			
			document.form1.action="${path}/member/id_doublecheck.do";
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
					<h3 class="w3-center w3-xlarge">회원가입</h3>
					<img src="resources/images/horse02.jpg" class="setCenter w3-margin-bottom" style="width:100%">
					<form name="form1" method="post">
						<table align="center">
						
							<tr>
								<td>회원 유형&nbsp;&nbsp;</td>
								<td>
									<input type="radio" name="role" value="Performer" checked>연주자   
									&nbsp;&nbsp;&nbsp;
									<input type="radio" name="role" value="AAA"> 주최자   
							 	</td>
							</tr>
							<tr><td><br></td></tr>
							<tr>
								<td>아이디</td>
								<td>
									<input type="text" id="userid" name="userid" 
									placeholder="ID" value="${map.dto.userid}">
								</td>
								<td>
									<button type="button" id="btnIdDoubleCheck">중복확인</button>
								</td>
							</tr>
							<tr>
								<td></td>
								<td>
									<c:if test="${map.message=='id_success'}">
										<span style="color:red;">
											사용가능한 아이디입니다.
										</span>
									</c:if>
									<c:if test="${map.message=='id_error'}">
										<span style="color:red;">
											이미사용중인 아이디입니다.
										</span>
									</c:if>
									<br/>
								</td>
							</tr>
							<tr>
								<td>비밀번호</td>
								<td>
									<input type="password" id="passwd" name="passwd" 
									placeholder="Password" value="${map.dto.passwd}"> 
							 	</td>
							 </tr>
							 <tr><td><br></td></tr>
							<tr>
								<td>이름</td>
								<td>
									<input type="text" id="name" name="name" 
									placeholder="Name" value="${map.dto.name}">
								</td>
							</tr>
							<tr>
								<td>나이</td>
								<td>
									<input type="text" id="age" name="age" 
									placeholder="Age">
								</td>
							</tr>
							<tr><td><br></td></tr>
							 <tr>
								<td>성별</td>
								<td>
									<input type="radio" name="gender" value="MALE" checked>남성
									&nbsp;&nbsp;&nbsp;
									<input type="radio" name="gender" value="FEMALE">여성
							 	</td>
							 </tr>
							 <tr><td><br></td></tr>
							 <tr>
							 	<td>이메일</td>
							 	<td>
							 		<input type="text" id="email" name="email" 
							 		placeholder="Email" value="${map.dto.email}">
							 	</td>
							 </tr>
							 <tr><td><br></td></tr>
							 <tr>
								<td>자기소개</td>
								<td>
									<textarea  name="description" cols="21" rows="5"></textarea>
							 	</td>
							 </tr>
							 <tr>
							 	<td colspan="2" align="center">
							 		<input type="button" id="btnJoin" value="회원가입">
							 	</td>
							 </tr>
						</table>
						<input type="hidden" name= "beforeid" id="beforeid" value="${map.dto.userid}">
					</form>
				</div>
			</div>
		</div>
		</div>
</body>
</html>