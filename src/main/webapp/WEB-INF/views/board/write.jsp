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
	$("#btnBoardInsert").click(function(){
		var title=$("#title").val();
		if(title==""){
			alert("제목을 입력하세요");
			$("#title").focus();
			return;
		}
		document.form1.action="${path}/board/insert";
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
				<div class="w3-white w3-padding">
					<img src="${path}/resources/images/title_hamobee.png" class="setCenter w3-margin-bottom" style="width:30%">
					<form name="form1" action="${path}/photo_board/insert" method="post">
						<table align="center">
						
							<tr>
								<label class="w3-large">Title</label>
								<div class="w3-rest w3-large">
									<input 
										class="w3-input w3-border w3-round-large" 
										type="text" id="title" name="title"
										placeholder="Title">
								</div>
								
							</tr>
							<tr><td><br></td></tr>
							 <tr>
								<label class="w3-large">Content</label>
								<div class="w3-rest w3-large">
									<textarea class="w3-input w3-border w3-round" style="resize:none" rows="7" name="content" placeholder="내용을 입력하세요"></textarea>
							 	</div>
							 </tr>
							 <tr>
							 	<td colspan="2" align="center">
							 		<input type="button" id="btnBoardInsert" value="등록하기" class="w3-bar-item w3-button w3-black w3-hover-grey">
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