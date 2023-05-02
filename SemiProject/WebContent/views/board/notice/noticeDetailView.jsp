<%@page import="com.udong.board.common.model.vo.BoardCommon"%>
<%@page import="com.udong.board.notice.model.vo.Notice"%>
<%@page import="com.udong.board.notice.model.vo.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	Notice n = (Notice)request.getAttribute("notice");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 사항</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<style>
div {
	/* border: 1px solid black; */
	box-sizing: border-box;
}

.wrap {
	position:relative;
	z-index:1;
	width: 1500px;
	height: auto;
	overflow: hidden;
	margin: auto;
}

#p1 { /*카테고리 글씨, 위치*/
	font-size: 45px;
	font-weight: 700;
	margin: 25px 0 0 30px;
	float: left;
}

#report_btn {
	float: left;
	margin: 60px 0 0 1170px;
}

#line_1 {
	position: absolute;
	border: 1px solid black;
	width: 1440px;
	height: 0px;
	top: 90px;
	margin-left: 30px;
}

table {
	width: 1400px;
	
	
}

#line_3 {
	border: 1px solid black;
	width: 1440px;
	height: 0px;
	margin: auto;
}

#profile {
	font-decoration: none;
	color: black;
}

.like-area {
	/* display: flex; */
	align-items: center;
	width: 100%;
	margin: 10px 0 0 50px;
}

.like-area .like {
	cursor: pointer;
	display: flex;
	margin-top: 5px;
	font-size: 19px;
	font-weight: 500;
}

tbody>#tr2 {
	height: 50px;
}
</style>
</head>
<body>
	<%@ include file="../../common/menubar.jsp"%>

	<div class="wrap">
<!-- 		<div id="header"> -->
<!-- 			<div id="header_1"></div> -->
<!-- 			<div id="menubar"></div> -->
<!-- 		</div> -->
		<div id="content">
			<p id="p1">공지 사항</p>
			<div id="line_1"></div>

			<table border="0" align="center" id="detail-area">
				<tr style="height:80px;">
					<td colspan="2"
						style="height: 50px; font-size: 30px; font-weight: 600; border-bottom: 1px solid black;"><%=n.getNoticeTitle()%></td>
				</tr>
				<tr style="border-bottom: 1px solid black; height:80px;">
					<td style="height: 50px; font-size: 20px; font-weight: 600; ">
						<a id="nicknameHover" onclick="whoareyou();"><%=n.getNoticeWriter()%></a>
					</td>
					
					<td style="height: 50px; font-size: 20px; font-weight: 600;"
						align="right"><%=n.getCreatDate()%></td>
				</tr>
				<tr style="height: 700px; border-bottom: 1px solid black;">
					<td colspan="2" style="height: auto; vertical-align : top ">
					<br>
					<!-- 줄바꿈 처리 -->
					<p style="white-space: pre-line;"><%=n.getNoticeContent() %></p>
					
					</td>
					
				</tr>
			</table>
					
				<%
					if (loginUser != null && loginUser.getUserId().equals("admin")) {
				%>
				<div class="board_btn" style="float: right; margin-right: 70px">
					<button
						onclick="location.href = '<%=contextPath%>/noticeUpdate.bo?bno=<%=n.getNoticeNo()%>'"
						class="btn btn-secondary">수정</button>
					<button
						onclick="location.href = '<%=contextPath%>/noticeDelete.bo?bno=<%=n.getNoticeNo()%>'"
						class="btn btn-dark">삭제</button>
				</div>
				<%
					}
				%>
				<br clear="both">
				<!--뭔가 넓어짐-->
			</div>
		</div>
		<br><br>
	<%@ include file = "../../common/footer.jsp" %>
</body>
</html>