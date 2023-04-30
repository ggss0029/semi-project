<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
div {
	/* border: 1px solid black; */
	box-sizing: border-box;
}

.wrap {
	height: 2000px;
	width: 1500px;
	margin: auto;
}

.wrap>div {
	width: 100%;
}

#header {
	height: 13.5%;
	border: 1px solid black;
}

#content {
	width: 100%;
	height: 76.5%;
	position: relative;
	border: 1px solid black;
	/* background-color: red; */
}

#content_1 {
	/* margin-top: 76.5px;  */
	margin-top: 50px;
	height: 90%;
	width: 90%;
	/* background-color: yellow; */
}

#boardContent {
	width: 100%;
}

#doWrite {
	border-bottom: 1px solid black;
	font-size: 60px;
	text-align: left;
	padding: 15px 0px 20px 10px;
}

#categoryBar>div {
	float: left;
	margin-top: 5px;
}

#btns>button {
	width: 100px;
	height: 50px;
	font-size: 17px;
	font-weight: 500;
	margin: 0px 10px;
}
</style>
</head>
<body>
	<%@include file="../../common/menubar.jsp"%>
	<div class="wrap">
		<div id="content" align="center">
			<div id="content_1">
				<div id="doWrite">공지사항 작성</div>
				<br>
				<form id="enroll-form" name="form" action="<%=contextPath %>/noticeInsert.bo" method="post">
				<input type="hidden" name="userNo" value="<%=loginUser.getUserNo() %>">
					<div id="writeTitle">
						<input type="text" name="title" placeholder="제목을 입력하세요."
							style="width: 1348px; height: 60px; font-size: 18px;" required>
					</div>

					<div id="contentArea">
						<textarea name="content" id="boardContent" cols="30" rows="25"
							style="resize: none; font-size: 20px;" placeholder="내용을 입력해주세요."></textarea>
					</div>
					<br>

					<div id="btns" align="center">
						<button type="submit" id="submitBtn" class="btn btn-outline-secondary">등록</button>
						<button onclick="history.back();" class="btn btn-outline-secondary">취소</button>
						<!-- history.back() : 이전페이지로 돌아가는 함수 -->
					</div>
				</form>


			</div>
		</div>
	</div>
</body>
</html>