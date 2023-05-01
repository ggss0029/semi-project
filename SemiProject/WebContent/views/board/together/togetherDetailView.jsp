<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.udong.board.together.model.vo.TogetherBoard"%>
<%
	TogetherBoard tb = (TogetherBoard)request.getAttribute("togetherBoard");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>같이 해요</title>
</head>
<style>
	.wrap {
		position:relative;
		z-index:1;
        height: 1200px;
        width: 1500px;
        margin: auto;
	}
	
	#p1 { /*카테고리 글씨, 위치*/
		font-size: 45px;
		font-weight: 700;
		margin: 25px 0 0 30px;
		float: left;
	}
	
	#report-btn {
		float: left;
		margin: 40px 0 0 1170px;
	}
	
	#line_1 {
		position: absolute;
		border: 1px solid black;
		width: 1440px;
		height: 0px;
		top: 90px;
		margin-left: 30px;
	}
	
	#line_2 {
		border: 1px solid black;
		width: 1440px;
		height: 0px;
		margin: auto;
	}
	
	#detail-area {
		width: 1400px;
	}
</style>
<body>
	<%@ include file = "../../common/menubar.jsp" %>
	<div class="wrap">
		<div id="content">
			<p id="p1">같이 해요</p>
			<button id="report-btn" class="btn btn-basic">신고하기</button>
			<div id="line_1"></div>
			
			<table align="center" id="detail-area">
				<tr style="height:80px;">
					<td colspan="2" style="height: 50px; font-size: 30px; font-weight: 600; border-bottom: 1px solid black;"><%=tb.getBoardTitle() %></td>
				</tr>
				<tr style="border-bottom: 1px solid black; height:80px;">
					<td style="height: 50px; font-size: 20px; font-weight: 600;">>
						<a id="nicknameHover" onclick="whoareyou();"><%=tb.getBoardWriter()%></a>
					</td>
					<td style="height: 50px; font-size: 20px; font-weight: 600;" align="right"><%=tb.getCreateDate()%></td>
				</tr>
				<tr style="height: 700px">
					<td colspan="2" style="height: auto; vertical-align : top;"><br><%=tb.getBoardContent()%></td>
				</tr>
			</table>
			
			<div id="like-area">
			
			</div>
			<hr>
			
			
		</div>
	</div>
	<%@ include file = "../../common/footer.jsp" %>
</body>
</html>