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
		$("#btnApply").click(function(){
			var concertId = "${map.dto.id}";
			var param={"concertId":concertId};
			$.ajax({
				type: "post",
				url: "${path}/photo_board/insertApply",
				data : param,

				error: function(){
					alert("이미 지원되었습니다.");
				},
				success: function(){
					alert("지원되었습니다.");
				}
			});
			//location.reload();
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
				<h1><b><i class="fas fa-guitar"></i> Content</b></h1>
				<div class="w3-section w3-bottombar"></div>
			</div>
		</header>

		<!-- First Photo Grid-->
		<div class="w3-row-padding">
			<div class="w3-container w3-margin-bottom">
				<div class="w3-container w3-white">
					<div class="w3-half">
						<img src="${path}/resources/images/${map.dto.image}" alt="Image" style="width:100%" class="w3-padding-16">
					</div>
					<div class="w3-half">
						<div style="margin-left:16px">
							<p>
								<b class="w3-xlarge">${map.dto.title}</b>
								<div style="text-align:right"> 작성자 : ${map.dto.name} 조회수 : ${map.dto.viewcnt}</div>
							</p>
							<p> 지역 : ${map.dto.region}</p>
							<p> 공연 일자 : ${map.dto.datetime }</p>
							<p> 모집 악기 : 
								<c:forEach items="${map.dto.instruments}" var="item">
									${item.name} &nbsp;
								</c:forEach>
							</p>
							<p> 모집 장르 : 
								<c:forEach items="${map.dto.tags}" var="item">
									${item.content} &nbsp;
								</c:forEach>
							</p>
							<p> 내용 : ${map.dto.content}</p>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Pagination -->
		<div class="w3-center w3-padding-32">
			<div class="w3-bar">
				<c:choose>
					<c:when test="${sessionScope.role=='performer'}">
						<button type="button" id="btnApply" class="w3-bar-item w3-button w3-black w3-hover-grey">지원하기</button>
						<div class="w3-bar-item w3-quarter"></div>
					</c:when>
				</c:choose>
				<a href="${path}/photoboard?curPage=${map.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}" class="w3-bar-item w3-button w3-black w3-hover-grey"> Back </a>
			</div>
		</div>

	</div>
</body>
</html>