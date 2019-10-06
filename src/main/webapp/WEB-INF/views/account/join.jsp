<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Hamobee</title>
	<%@ include file="../include/header.jsp" %>
	<script>
	window.onload = function(){
		$("input:radio[id='${map.dto.gender}']").prop("checked", true);
	}
	
		$(function(){ 
			// 회원가입 버튼을 눌렀을 때
			$("#btnJoin").click(function(){
				
				var email =$("#email").val();
				var password = $("#password").val();
				var name = $("#name").val();
				var age = $("#age").val();
				var role = "${role}";

				if(email==""){
					alert("이메일을 입력하세요");
					$("#email").focus();
					return;
				}
				var message = "${map.message}";
				// "" -> 중복조회 안함
				// "emailFail" -> 중복조회시 이메일 중복됨
				// "emailSuccess" -> 중복조회시 아이디 중복안됨
				var beforeEmail = $("#beforeEmail").val();
				
				if(message=="" || beforeEmail != email){
					alert("이메일 중복확인을 해주세요");
					$("#eamil").focus();
					return;
				}
				//아이디 중복확인을 안한경우와 중복확인을 했지만 다시 변경한 경우 방지
				
				if(message == "emailFail"){
					alert("이메일이 중복되었습니다");
					$("#email").focus();
					return;
				}
				if(password==""){
					alert("비밀번호를 입력하세요");
					$("#password").focus();
					return;
				}
				if(name==""){
					alert("이름을 입력하세요");
					$("#name").focus();
					return;
				}
				if(age==""){
					alert("나이를 입력하세요");
					$("#age").focus();
					return;
				}
				if($("input:radio[name='gender']").is(":checked")==false){
					alert("성별을 선택해주세요");
					return;
				}

				
				if(${map.dto.role.equals('performer')}){
					if($("input:checkbox[name='instrument']").is(":checked")==false){
						alert("악기를 하나 이상 선택해 주세요");
						return;
					}
					if($("input:checkbox[name='tag']").is(":checked")==false){
						alert("태그를 하나 이상 선택해 주세요");
						return;
					}
				}
				
				
				document.form1.action = "${path}/account/insert";
				document.form1.submit();
			});
			
			
			// 중복확인 버튼을 눌렀을 때
			$("#btnEmailDoubleCheck").click(function(){
				var email = $("#email").val();
				var age = $("#age").val();
				
				if(email==""){
					alert("이메일을 입력하세요");
					$("#email").focus();
					return;
				}
				//email에 아무것도 입력하지 않고 중복확인을 눌렀을 때 방지
				
				if(age==""){
					document.form1.age.value = "0";
				}
				//age는 int형이라 값을 안넣어주면 에러발생
				
				document.form1.action="${path}/account/emailDoubleCheck";
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
		<div class="w3-container w3-white w3-round-xxlarge" style="width:650px;padding:32px 16px">
			<div id="formCenter">
				<div class="w3-white w3-padding">
					<h3 class="w3-center w3-xxlarge">회원가입</h3>
					<form name="form1" method="post">
					<input type="hidden" name="role" value="${map.dto.role}">
						<table align="center">
							<tr>
								<td style="width:100px">이메일</td>
								<td>
									<input class="w3-input w3-border w3-round-large" type="text" id="email" name="email" value="${map.dto.email}" placeholder="Email">
								</td>
								<td>
									<input class="w3-center w3-button w3-black w3-hover-grey" type="button" id="btnEmailDoubleCheck" value="중복확인">
								</td>
							</tr>
							<tr> 
								<td></td>
								<td>
									<c:if test="${map.message=='emailSuccess'}">
										<span style="color:red;">
											사용가능한 이메일입니다.
										</span>
									</c:if>
									<c:if test="${map.message == 'emailFail'}">
										<span style="color:red;">
											이미사용중인 이메일입니다.
										</span>
									</c:if>
									<br/>
								</td>
							</tr>
							<tr>
								<td>비밀번호</td>
								<td colspan="2">
									<input class="w3-input w3-border" type="password" id="password" name="password" value="${map.dto.password}" placeholder="Password">
								</td>
							</tr>
							<tr><td><br/></td></tr>
							<tr>
								<td>이름</td>
								<td colspan="2">
									<input
										class="w3-input w3-border w3-round-large" 
										type="text" id="name" name="name"
										placeholder="Name" value ="${map.dto.name}">
								</td>
							</tr>
							<tr><td><br/></td></tr>
							<tr>
								<td>나이</td>
								<td colspan="2">
									<input
										class="w3-input w3-border"  
										type="number" id="age" name="age"
										placeholder="Age" value="${map.dto.age}">
								</td>
							</tr>
							<tr><td><br/></td></tr>
							<tr>
								<td>성별</td>
								<td colspan="2">
									<input type="radio" id="male" name="gender" value="male">남성
									&nbsp;&nbsp;&nbsp;<input type="radio" id="female" name="gender" value="female">여성
								</td>
							</tr>
							<tr><td><br/></td></tr>
							<c:choose>
								<c:when test="${map.dto.role.equals('performer')}">
							<tr>
								<td>악기</td>
								<td colspan="2">
									<input type="checkbox" name="instrument" value="violin">바이올린&nbsp;
									<input type="checkbox" name="instrument" value="viola">비올라&nbsp;
									<input type="checkbox" name="instrument" value="cello">첼로&nbsp;
									<input type="checkbox" name="instrument" value="contrabass">콘트라베이스&nbsp;
									<input type="checkbox" name="instrument" value="bass">베이스&nbsp;
									<input type="checkbox" name="instrument" value="guitar">기타&nbsp;
								</td>
							</tr>
							<tr>
								<td></td>
								<td colspan="2">
									<input type="checkbox" name="instrument" value="flute">플루트&nbsp;
									<input type="checkbox" name="instrument" value="oboe">오보에&nbsp;
									<input type="checkbox" name="instrument" value="clarinet">클라리넷&nbsp;
									<input type="checkbox" name="instrument" value="bassoon">바순&nbsp;
									<input type="checkbox" name="instrument" value="saxophone">색소폰&nbsp;
									<input type="checkbox" name="instrument" value="horn">호른&nbsp;
								</td>
							</tr>
							<tr>
								<td></td>
								<td colspan="2">
									<input type="checkbox" name="instrument" value="trumpet">트럼펫&nbsp;
									<input type="checkbox" name="instrument" value="trombone">트롬본&nbsp;
									<input type="checkbox" name="instrument" value="drum">드럼&nbsp;
									<input type="checkbox" name="instrument" value="piano">피아노&nbsp;
									<input type="checkbox" name="instrument" value="organ">오르간&nbsp;
									<input type="checkbox" name="instrument" value="keyboard">키보드&nbsp;
								</td>
							</tr>
							<tr><td><br/></td></tr>
							<tr>
								<td>태그</td>
								<td colspan="2">
									<input type="checkbox" name="tag" value="rock">락&nbsp;
									<input type="checkbox" name="tag" value="folk">포크&nbsp;
									<input type="checkbox" name="tag" value="rnb">알앤비&nbsp;
									<input type="checkbox" name="tag" value="hiphop">힙합&nbsp;
									<input type="checkbox" name="tag" value="jazz">재즈&nbsp;
									<input type="checkbox" name="tag" value="dance">댄스&nbsp;
									
								</td>
							</tr>
							<tr>
								<td></td>
								<td colspan="2">
									<input type="checkbox" name="tag" value="indie">인디&nbsp;
									<input type="checkbox" name="tag" value="rap">랩&nbsp;
									<input type="checkbox" name="tag" value="ballads">발라드&nbsp;
									<input type="checkbox" name="tag" value="techno">테크노&nbsp;
									<input type="checkbox" name="tag" value="newage">뉴에이지&nbsp;
				
								</td>
							</tr>
							<tr><td><br/></td></tr>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="instrument" value="none">
								<input type="hidden" name="tag" value="none">
							</c:otherwise>
						</c:choose>
							<tr>
								<td>자기소개</td>
								<td colspan="2">
									<textarea class="w3-input w3-border w3-round" style="resize:none" rows="3" name="description">${map.dto.description}</textarea>
								</td>
							</tr>
							<tr>
								<td colspan="3" align="center">
									<input class="w3-large w3-center w3-button w3-black w3-hover-grey" type="button" id="btnJoin" value="회원가입">
								</td>
							</tr>
						</table>
						<input type="hidden" name= "beforeEmail" id="beforeEmail" value="${map.dto.email}">
					</form>
				</div>
			</div>
		</div>
		</div>
</body>
</html>