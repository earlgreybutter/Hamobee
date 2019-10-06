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
	$("#btnPhoto_boardInsert").click(function(){
		var title=$("#title").val();
		if(title==""){
			alert("제목을 입력하세요");
			$("#title").focus();
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
					<h3 class="w3-center w3-xlarge">등록하기</h3>
					<img src="resources/images/horse02.jpg" class="setCenter w3-margin-bottom" style="width:100%">
					<form name="form1" action="${path}/photo_board/insert" method="post">
						<table align="center">
						
							<tr>
								<td>제목</td>
								<td>
									<input type="text" id="title" name="title"  size="80"
									placeholder="Title">
								</td>
							</tr>
							<tr><td><br></td></tr>
							<tr>
								<td>첨부파일</td>
								<td>
									<input type="text" id="image" name="image" 
									placeholder="Image"> 
							 	</td>
							 </tr>
							 <tr><td><br></td></tr>
							<tr>
								<td>지역</td>
								<td>
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
								</td>
							</tr>
							<tr><td><br></td></tr>
							 <tr>
								<td>내용</td>
								<td>
									<textarea  name="content" cols="80" rows="5"placeholder="내용을 입력하세요"></textarea>
							 	</td>
							 </tr>
							 <tr>
							 	<td colspan="2" align="center">
							 		<input type="button" id="btnPhoto_boardInsert" value="등록하기">
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