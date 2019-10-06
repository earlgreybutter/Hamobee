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
	$("input:radio[id='${dto.role}']").prop("checked", true);
	$("input:radio[id='${dto.gender}']").prop("checked", true);
	
		<c:forEach items="${dto.instruments}" var="item">
		$("input:checkbox[id='${item.name}']").prop("checked", true);
		</c:forEach>
		
		<c:forEach items="${dto.tags}" var="item">
		$("input:checkbox[id='${item.content}']").prop("checked", true);
		</c:forEach>
	
}
$(function(){  
	// 회원가입 버튼을 눌렀을 때
	$("#btnUpdate").click(function(){
		var email =$("#email").val();
		var password = $("#password").val();
		var name = $("#name").val();
		var age = $("#age").val();

		if(email==""){
			alert("이메일을 입력하세요");
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
		if(${dto.role.equals('performer')}){
			if($("input:checkbox[name='instrument']").is(":checked")==false){
				alert("악기를 하나 이상 선택해주세요");
				return;
			}
			if($("input:checkbox[name='tag']").is(":checked")==false){
				alert("태그를 하나 이상 선택해주세요");
				return;
			}
		}
		document.form1.action = "${path}/account/update";
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
		<div class="w3-container w3-white w3-round-xxlarge" style="width:650px; padding:32px 16px">
			<div id="formCenter">
				<div class="w3-white w3-padding">
					<h3 class="w3-center w3-xxlarge">정보수정</h3>
					<form name="form1" method="post">
						<table align="center">
							<input type="hidden" name="role" value="${dto.role}">
							<tr>
								<td>이메일</td>
								<td>
									<input
										class="w3-input w3-border w3-round-large" 
										type="text" id="email" name="email"
										placeholder="Email" value="${dto.email}" readonly>
								</td>
							</tr>
							<tr> 
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>비밀번호</td>
								<td>
									<input class="w3-input w3-border"
										type="password" id="password" name="password"
										placeholder="Password" value="${dto.password}">
								</td>
							</tr>
							<tr><td><br/></td></tr>
							<tr>
								<td>이름</td>
								<td>
									<input 
										class="w3-input w3-border w3-round-large" 
										type="text" id="name" name="name"
										placeholder="Name" value ="${dto.name}">
								</td>
							</tr>
							<tr><td><br/></td></tr>
							<tr>
								<td>나이</td>
								<td>
									<input 
										class="w3-input w3-border"  
										type="number" id="age" name="age"
										placeholder="Age" value="${dto.age}">
								</td>
							</tr>
							<tr><td><br/></td></tr>
							<tr>
								<td>성별</td>
								<td>
									<input type="radio" id="male" name="gender" value="male">남성
									&nbsp;&nbsp;&nbsp;<input type="radio" id="female" name="gender" value="female">여성
								</td>
							</tr>
							<tr><td><br/></td></tr>
							<c:choose>
								<c:when test="${dto.role.equals('performer')}">
							<tr>
								<td>악기</td>
								<td>
									<input type="checkbox" name="instrument" id="violin" value="violin">바이올린&nbsp;
									<input type="checkbox" name="instrument" id="viola" value="viola">비올라&nbsp;
									<input type="checkbox" name="instrument" id="cello" value="cello">첼로&nbsp;
									<input type="checkbox" name="instrument" id="contrabass" value="contrabass">콘트라베이스&nbsp;
									<input type="checkbox" name="instrument" id="bass" value="bass">베이스&nbsp;
									<input type="checkbox" name="instrument" id="guitar" value="guitar">기타&nbsp;
								</td>
							</tr>
							<tr>
								<td></td>
								<td>
									<input type="checkbox" name="instrument" id="flute" value="flute">플루트&nbsp;
									<input type="checkbox" name="instrument" id="oboe" value="oboe">오보에&nbsp;
									<input type="checkbox" name="instrument" id="clarinet" value="clarinet">클라리넷&nbsp;
									<input type="checkbox" name="instrument" id="bassoon" value="bassoon">바순&nbsp;
									<input type="checkbox" name="instrument" id="saxophone" value="saxophone">색소폰&nbsp;
									<input type="checkbox" name="instrument" id="horn" value="horn">호른&nbsp;
								</td>
							</tr>
							<tr>
								<td></td>
								<td>
									<input type="checkbox" name="instrument" id="trumpet" value="trumpet">트럼펫&nbsp;
									<input type="checkbox" name="instrument" id="trombone" value="trombone">트롬본&nbsp;
									<input type="checkbox" name="instrument" id="drum" value="drum">드럼&nbsp;
									<input type="checkbox" name="instrument" id="piano" value="piano">피아노&nbsp;
									<input type="checkbox" name="instrument" id="organ" value="organ">오르간&nbsp;
									<input type="checkbox" name="instrument" id="keyboard" value="keyboard">키보드&nbsp;
								</td>
							</tr>
							<tr><td><br/></td></tr>
							<tr>
								<td>태그</td>
								<td>
									<input type="checkbox" name="tag" id="rock" value="rock">락&nbsp;
									<input type="checkbox" name="tag" id="folk" value="folk">포크&nbsp;
									<input type="checkbox" name="tag" id="rnb" value="rnb">알앤비&nbsp;
									<input type="checkbox" name="tag" id="hiphop" value="hiphop">힙합&nbsp;
									<input type="checkbox" name="tag" id="jazz" value="jazz">재즈&nbsp;
									<input type="checkbox" name="tag" id="dance" value="dance">댄스&nbsp;
								</td>
							</tr>
							<tr>
								<td></td>
								<td>
									<input type="checkbox" name="tag" id="indie" value="indie">인디&nbsp;
									<input type="checkbox" name="tag" id="rap" value="rap">랩&nbsp;
									<input type="checkbox" name="tag" id="ballads" value="ballads">발라드&nbsp;
									<input type="checkbox" name="tag" id="techno" value="techno">테크노&nbsp;
									<input type="checkbox" name="tag" id="newage" value="newage">뉴에이지&nbsp;
				
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
								<td>
									<textarea class="w3-input w3-border w3-round" style="resize:none" rows="3" name="description">${dto.description}</textarea>
								</td>
							</tr>
							<tr>
								<td></td>
								<td>
									<input class="w3-large w3-center w3-button w3-black w3-hover-grey" type="button" id="btnUpdate" value="정 보 수 정">
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