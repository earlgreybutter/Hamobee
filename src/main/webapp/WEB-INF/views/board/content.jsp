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
		$("#btnComment").click(function(){
			var content=$("#content").val();
			var communityId = "${map.dto.id}";
			var param={"content": content, "communityId":communityId};
			$.ajax({
				type: "post",
				url: "${path}/board/insertComment",
				data : param,
				success: function(){
					alert("댓글이 등록되었습니다.");
				}
			});
			location.reload();
		});
	});
	</script>
</head>
<body class="w3-light-grey">
	<%@ include file="../include/side_menu.jsp" %>
	<div class="w3-light-grey" id="main_content">
		<!-- Header -->
		<header>
			<div class="w3-container">
				<h1><b><i class="fas fa-list-alt w3-xxlarge"></i> Content</b></h1>
				<div class="w3-section w3-bottombar"></div>
			</div>
		</header>

		<!-- 게시물 내용 -->
		<div class="w3-row-padding">
			<div class="w3-container">
				<div class="w3-container w3-white" style="padding-bottom:64px;margin-bottom:32px">
			<!--		<div class="w3-half">
						<img src="resources/images/horse01.jpg" alt="Norway" style="width:100%" class="w3-hover-opacity w3-padding-16">
					</div>   -->
					<div class="w3-container w3-white w3-margin">
						<div style="margin-left:16px">
							<p><b><h1>${map.dto.title}</h1></b></p>
							<div><b>작성자</b> : ${map.dto.name} &nbsp;&nbsp;&nbsp;&nbsp;<b>조회수</b> : ${map.dto.viewcnt}</div>
							<p>${map.dto.content}</p>
							<div>${map.dto.timestamp}</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="w3-row-padding">
			<div class="w3-container w3-margin-bottom">
				<div class="w3-container w3-white" style="padding-top:32px">
				<!-- 댓글 입력창 -->
					<c:if test="${sessionScope.id != null}">
						<textarea row="5" class="w3-input w3-border w3-round" style="resize:none;height:100px"  id="content" 
						placeholder="댓글을 작성하세요."></textarea>
						<br/>
						<button type="button" id="btnComment" class="w3-bar-item w3-button w3-black w3-hover-grey">댓글쓰기</button>
						<hr/>
					</c:if>
				</div>
				<!-- 댓글 list창 -->
				<div class="w3-container w3-white" id="listComment">
					<c:forEach var="row" items="${map.comments}" >
						<div class="w3-container">
							<b>${row.name }</b> (${row.timestamp})<br/>
							${row.content}<br/><hr/>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>

		<!-- Pagination -->
		<div class="w3-center w3-padding-32">
			<div class="w3-bar">
				<a href="${path}/board?curPage=${map.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}" 
				class="w3-bar-item w3-button w3-black w3-hover-grey"> Back </a>
			</div>
		</div>

	</div>
</body>
</html>