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
	$("#btnViewMyPosts").click(function(){
		location.href = "${path}/board?searchOption=writerId&keyword=${sessionScope.id}";
	});
});
function writeBoard(){
	var id= "${sessionScope.id}";
	if(id==""){
		alert("먼저 로그인을 해야합니다.");
		return;
	}
	location.href="${path}/board/write";
}
function accountLogin(){
	location.href="${path}/account/login";
}
function accountJoin(){
	location.href="${path}/account/beforeJoin";
}
function list(page){
	location.href="${path}/board?curPage="+page+"&searchOption=${map.searchOption}"
	+"&keyword=${map.keyword}";
}
</script>
</head>
<body class="w3-light-grey">
	<%@ include file="../include/side_menu.jsp" %>
	<div id="main_content">
		<header>
			<div class="w3-container">
				<h1>
					<b><i class="fas fa-list-alt w3-xxlarge"></i> Community</b>
				</h1>
				<div class="w3-section w3-bottombar w3-padding-16">
					<div>
					<c:choose>
						<c:when test="${sessionScope.id==null}">
								<button class="w3-button w3-white" onclick="accountLogin()">Login</button>
								<button class="w3-button w3-white" onclick="accountJoin()">Register</button>
						</c:when>
					</c:choose>
						<div style="text-align: right;">
						<c:choose>
							<c:when test="${sessionScope.id!=null}">
								<input type="button" id="btnViewMyPosts" value="내가 쓴 글보기" class="w3-bar-item w3-button w3-black w3-hover-grey">
								<div class="w3-bar-item w3-quarter"></div>
							</c:when>
						</c:choose>
						<input type="button" value="등록하기" onclick="writeBoard()" class="w3-bar-item w3-button w3-black w3-hover-grey">
						</div>
					</div>
				</div>
			</div>
			
		</header>
		&nbsp;&nbsp;&nbsp;&nbsp;${map.count}개의 게시물이 있습니다.

		<!-- First Photo Grid-->
		<div class="w3-container w3-white w3-margin">
			<div class="w3-padding-16">
				<a href="${path}/board/view?id=1
				&curPage=${map.pager.curPage}
				&searchOption=${map.searchOption}
				&keyword=${map.keyword}" class="anchorNoDeco">
					<div class="w3-container">
						<div style="color:green;"> <b> [${map.notice.id}] ${map.notice.title} </b>(${map.notice.cnt})<br/> </div>
						<div class="w3-quarter"> Date : ${map.notice.timestamp} </div>
						<div class="w3-quarter"> &nbsp; </div>
						<div class="w3-quarter"> Writer : ${map.notice.name} </div>
						<div class="w3-quarter"> Hit : ${map.notice.viewcnt} </div>
					</div>
				</a>
				<hr>
				<hr>
				<c:forEach var="row" items="${map.list }">
				<a href="${path}/board/view?id=${row.id}
				&curPage=${map.pager.curPage}
				&searchOption=${map.searchOption}
				&keyword=${map.keyword}" class="anchorNoDeco">
					<div class="w3-container">
						<div> <b> [${row.id}] ${row.title} </b>(${row.cnt})<br/> </div>
						<div class="w3-quarter"> Date : ${row.timestamp} </div>
						<div class="w3-quarter"> &nbsp; </div>
						<div class="w3-quarter"> Writer : ${row.name} </div>
						<div class="w3-quarter">
							<div class="w3-half"> 
								Hit : ${row.viewcnt}
							</div>
							<div class="w3-half">	
								<c:choose>
									<c:when test="${sessionScope.id == row.writerId}">
										<a href="${path}/board/deleteCommunity?id=${row.id}"><input type="button" value="삭제하기" class="w3-button w3-black w3-hover-grey"></a>
									</c:when>
								</c:choose>
							</div>
						</div>
					</div>
					</a>
				<hr>
				</c:forEach>
			</div>
		</div>
		
		<center>
		<form name="form1" method="post" action="${path}/board">
			<table>
				<tr>
					<td>
						<select name="searchOption">
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
						<input name="keyword" size="50" value="${map.keyword }">
						</td>
						<td>
						<input type="submit" value="조회">
						</td>
				</tr>
			</table>
		</form>
		</center>
		
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