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
	$("#btnPhoto_boardInsert").click(function(){
		var title=$("#title").val();
		var datetime =$("#datetime").val();
		var file1 = $("#file1").val();
			
		if(title==""){
			alert("제목을 입력하세요");
			$("#title").focus();
			return;
		}
		if(datetime==""){
			alert("공연날짜를 입력하세요");
			$("#datetime").focus();
			return;
		}
		if(file1==""){
			alert("이미지를 넣어주세요");
			$("#file1").focus();
			return;
		}
		if($("input:checkbox[name='instrument']").is(":checked")==false){
			alert("악기를 하나 이상 선택해 주세요");
			return;
		}
		if($("input:checkbox[name='tag']").is(":checked")==false){
			alert("태그를 하나 이상 선택해 주세요");
			return;
		}
		document.form1.action="${path}/photo_board/insert";
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
					<img src="${path}/resources/images/title_hamobee.png" class="setCenter w3-margin-bottom" style="width:30%">
					<form name="form1" action="${path}/photo_board/insert" method="post" 
					enctype="multipart/form-data">
						<table align="center">
						
							<tr>
								<div class="w3-large">제목</div>
								<div class="w3-rest w3-large">

									<input 
										class="w3-input w3-border w3-round-large" style="height:60px"
										type="text" id="title" name="title"  size="80"
										placeholder="Title">
								</div>
							</tr>
							<tr>
								<div class="w3-large w3-margin-top">공연날짜</div>
								<div class="w3-rest w3-large">
									<input 
									 class="w3-input w3-border w3-round-large" style="height:60px"
									type="datetime-local" id="datetime" name="datetime">
								</div>
							</tr>
							<tr>
								<div class="w3-large w3-margin-top">첨부파일</div>
								<div class="w3-rest w3-large">
									<input 
									 class="w3-input w3-border w3-round-large" style="height:60px"
									type="file" id="file1" name="file1" 
									placeholder="Image"> 
							 	</div>
							 </tr>
							<tr>
								<div class="w3-large w3-margin-top">지역</div>
							</tr>
							<tr>
								<div 
								 class="w3-large" style="height:60px">
									<select name="region">
										<option value="서울">서울</option>
										<option value="경기도">경기도</option>
										<option value="강원도">강원도</option>
										<option value="충청북도">충청북도</option>
										<option value="충청남도">충청남도</option>
										<option value="경상북도">경상북도</option>
										<option value="경상남도">경상남도</option>
										<option value="전라북도">전라북도</option>
										<option value="전라남도">전라남도</option>
										<option value="제주도">제주도</option>
									</select>
								</div>
							</tr>
							<tr>
								<div class="w3-large w3-margin-top">악기</div>
								<div class="w3-large w3-rest"">
									<input type="checkbox" name="instrument" value="violin">바이올린&nbsp;
									<input type="checkbox" name="instrument" value="viola">비올라&nbsp;
									<input type="checkbox" name="instrument" value="cello">첼로&nbsp;
									<input type="checkbox" name="instrument" value="contrabass">콘트라베이스&nbsp;
									<input type="checkbox" name="instrument" value="bass">베이스&nbsp;
									<input type="checkbox" name="instrument" value="guitar">기타&nbsp;
								</div>
							</tr>
							<tr>
								<div class="w3-rest w3-large">
									<input type="checkbox" name="instrument" value="flute">플루트&nbsp;
									<input type="checkbox" name="instrument" value="oboe">오보에&nbsp;
									<input type="checkbox" name="instrument" value="clarinet">클라리넷&nbsp;
									<input type="checkbox" name="instrument" value="bassoon">바순&nbsp;
									<input type="checkbox" name="instrument" value="saxophone">색소폰&nbsp;
									<input type="checkbox" name="instrument" value="horn">호른&nbsp;
								</div>
							</tr>
							<tr>
								<div class="w3-rest w3-large">
									<input type="checkbox" name="instrument" value="trumpet">트럼펫&nbsp;
									<input type="checkbox" name="instrument" value="trombone">트롬본&nbsp;
									<input type="checkbox" name="instrument" value="drum">드럼&nbsp;
									<input type="checkbox" name="instrument" value="piano">피아노&nbsp;
									<input type="checkbox" name="instrument" value="organ">오르간&nbsp;
									<input type="checkbox" name="instrument" value="keyboard">키보드&nbsp;
								</div>
							</tr>
							<tr>
								<div class="w3-large w3-margin-top">태그</div>
								<div class="w3-rest w3-large">
									<input type="checkbox" name="tag" value="rock">락&nbsp;
									<input type="checkbox" name="tag" value="folk">포크&nbsp;
									<input type="checkbox" name="tag" value="rnb">알앤비&nbsp;
									<input type="checkbox" name="tag" value="hiphop">힙합&nbsp;
									<input type="checkbox" name="tag" value="jazz">재즈&nbsp;
									<input type="checkbox" name="tag" value="dance">댄스&nbsp;
								</div>
							</tr>
							<tr>
								<div class="w3-rest w3-large">
									<input type="checkbox" name="tag" value="indie">인디&nbsp;
									<input type="checkbox" name="tag" value="rap">랩&nbsp;
									<input type="checkbox" name="tag" value="ballads">발라드&nbsp;
									<input type="checkbox" name="tag" value="techno">테크노&nbsp;
									<input type="checkbox" name="tag" value="newage">뉴에이지&nbsp;
				
								</div>
							</tr>
							 <tr>
							 	<div class="w3-large w3-margin-top">내용</div>
								<div class="w3-large">
									<textarea  class="w3-input w3-border w3-round-large" style="height:200px;resize:none" name="content" cols="80" placeholder="내용을 입력하세요"></textarea>
							 	</div>
							 </tr>
							 <tr>
							 	<td colspan="2" align="center">
							 		<input type="button" id="btnPhoto_boardInsert" value="등록하기" class="w3-button w3-black w3-hover-grey">
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