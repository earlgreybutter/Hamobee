<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Hamobee</title>
<%@ include file="../include/header.jsp"%>
<script>


$(function(){
	$("#accountLogin").click(function(){
		location.href="${path}/account/login";
		});
	$("#accountJoin").click(function(){
		location.href="${path}/account/beforeJoin";
	});
	$("#writePhotoBoard").click(function(){
		var role = "${sessionScope.role}";

		if (role != "recruiter") {
			alert("recruiter만 글을 쓸 수 있습니다.");
			return;
		}
		location.href = "${path}/photo_board/write";
	});
	$("#btnViewMyPosts").click(function(){
		location.href = "${path}/photoboard?searchOption=writerId&keyword=${sessionScope.id}";
	});
});
function list(page){
	location.href="${path}/photoboard?curPage="+page+"&searchOption=${map.searchOption}"
	+"&keyword=${map.keyword}";
}

</script>
</head>
<body class="w3-light-grey">
	<%@ include file="../include/side_menu.jsp"%>
	<div class="w3-light-grey" id="main_content">
		<!-- Header -->
		<header>
			<div class="w3-container">
				<h1>
					<b><i class="fas fa-drum w3-xxlarge"></i> Concert</b>
				</h1>
				<div class="w3-section w3-bottombar w3-padding-16">
					<div>
					<c:choose>
						<c:when test="${sessionScope.id==null}">
								<button class="w3-button w3-white" id="accountLogin">Login</button>
								<button class="w3-button w3-white" id="accountJoin">Register</button>
						</c:when>
					</c:choose>
						<div style="text-align: right;">
						<c:choose>
							<c:when test="${sessionScope.role=='recruiter'}">
								<input type="button" id="btnViewMyPosts" value="내가 쓴 글보기" class="w3-bar-item w3-button w3-black w3-hover-grey">
								<div class="w3-bar-item w3-quarter"></div>
							</c:when>
						</c:choose>
						<input type="button" value="등록하기" id="writePhotoBoard" class="w3-bar-item w3-button w3-black w3-hover-grey">
						</div>
					</div>
				</div>
			</div>
		</header>
		&nbsp;&nbsp;&nbsp;&nbsp;${map.count}개의 게시물이 있습니다.
		<div class="w3-center ">
			<div class="w3-bar">
				<div class="w3-container">
					
					<div class="w3-third">
						<div class=" w3-margin w3-left-align w3-card w3-white" style="height:600px">
							<a href="${path}/photo_board/view?id=1
							&curPage=${map.pager.curPage}
							&searchOption=${map.searchOption}
							&keyword=${map.keyword}" class="anchorNoDeco">
								<img src="${path}/resources/images/${map.notice.image}" alt="Image" style="width:100%;height:400px" class="w3-hover-opacity">
							</a>
							<div class="w3-container w3-white">
								<font color="green"><p><b> [${map.notice.id}] ${map.notice.title}</b>    Hit : ${map.notice.viewcnt}</p></font>
								<p>Writer : ${map.notice.name}</p>
								<p>${map.notice.timestamp}</p>
							</div>
						</div>
					</div>
					<div class="w3-third">
						<c:forEach var="row" items="${map.list }" varStatus="status">
							<div class="w3-margin w3-left-align w3-card w3-white" style="height:600px">
								<a href="${path}/photo_board/view?id=${row.id}
								&curPage=${map.pager.curPage}
								&searchOption=${map.searchOption}
								&keyword=${map.keyword}" class="anchorNoDeco">
									<img src="${path}/resources/images/${row.image}" alt="Image" style="width:100%;height:400px" class="w3-hover-opacity">
								</a>
								<div class="w3-container w3-white">
									<p><b> [${row.id}] ${row.title}</b>    Hit : ${row.viewcnt}</p>
									<p>Writer : ${row.name}</p>
									<p>${row.timestamp}</p>
									<div class="w3-container w3-right">
										<c:choose>
											<c:when test="${sessionScope.role=='recruiter' and sessionScope.id == row.writerId}">
												<a href="${path}/photo_board/viewApplicants?id=${row.id}"><input type="button" value="지원자 보기" class="w3-button w3-black w3-hover-grey"></a>
												<a href="${path}/photo_board/deleteConcert?id=${row.id}"><input type="button" value="삭제하기" class="w3-button w3-black w3-hover-grey"></a>
											</c:when>
										</c:choose>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>

		
		<center>
		<form name="form1" method="post" action="${path}/photoboard">
			<table>
				<tr>
					<td>
						<select name="searchOption" style="height:50px">
						<c:choose>
						<c:when test="${map.searchOption =='name'}">
							<option value="all">이름+제목+내용</option>
							<option value="name" selected>이름</option>
							<option value="content">내용</option>
							<option value="title">제목</option>
						</c:when>
						<c:when test="${map.searchOption =='content'}">
							<option value="all">이름+제목+내용</option>
							<option value="name">이름</option>
							<option value="content" selected>내용</option>
							<option value="title">제목</option>
						</c:when>
						<c:when test="${map.searchOption =='title'}">
							<option value="all">이름+제목+내용</option>
							<option value="name">이름</option>
							<option value="content">내용</option>
							<option value="title" selected>제목</option>
						</c:when>
						<c:otherwise>
							<option value="all" selected>이름+제목+내용</option>
							<option value="name">이름</option>
							<option value="content">내용</option>
							<option value="title">제목</option>
						</c:otherwise>
						
						
						</c:choose>
						</select>
						</td>
						<td>
						<input class="w3-input w3-border" style="height:50px" name="keyword" size="50" value="${map.keyword }">
						</td>
						<td>
						<input class="w3-button"  style="height:50px" type="submit" value="조회">
						</td>
				</tr>
			</table>
		</form>
		</center>

		<!-- Pagination -->
		<div class="w3-center w3-padding-32">
			<div class="w3-bar">
				<c:if test="${map.pager.curBlock > 1}">
					<a href="javascript:list('1')" class="w3-bar-item w3-button w3-hover-black">≪</a>
				</c:if>
				<c:if test="${map.pager.curBlock >1}">
					<a href="javascript:list('${map.pager.prevPage }')" class="w3-bar-item w3-button w3-hover-black">[이전]</a>
				</c:if>
				<c:forEach var="num" begin="${map.pager.blockBegin }" end="${map.pager.blockEnd}">
					<c:choose>
						<c:when test="${num == map.pager.curPage}">
							<a href="javascript:list('${num}')" style="color:red;" class="w3-bar-item w3-button w3-hover-black">${num }</a>
						</c:when>
						<c:otherwise>
							<a href="javascript:list('${num}')" class="w3-bar-item w3-button w3-hover-black">${num}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${map.pager.curBlock <= map.pager.totBlock}">
					<a href="javascript:list('${map.pager.nextPage }')" class="w3-bar-item w3-button w3-hover-black">[다음]</a>
				</c:if>
				<c:if test="${map.pager.curPage <= map.pager.totPage}">
					<a href="javascript:list('${map.pager.totPage }')" class="w3-bar-item w3-button w3-hover-black">≫</a>
				</c:if>
			</div>
		</div>

	</div>
</body>
</html>