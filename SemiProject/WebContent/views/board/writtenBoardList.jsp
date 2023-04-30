<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.udong.member.model.vo.Member, java.util.ArrayList, com.udong.board.common.model.vo.BoardCommon, com.udong.common.model.vo.PageInfo"%>
<%
	Member user = (Member)request.getAttribute("user");
	ArrayList<BoardCommon> list = (ArrayList<BoardCommon>)request.getAttribute("myPostList");
	PageInfo pi = (PageInfo)request.getAttribute("pageInfo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.wrap {
		position:relative;
		z-index:1;
        width: 1500px;
        height: 1000px;
        margin: auto;
	}
	
	.wrap>div {
		margin: 0 auto;
	}
	
	#content{
    	width: 1300px;
    	height: 980px;
    	position: relative;
    	
    }
    
    #pp {
		position: absolute;
		top: 45px;
		left: 54px;
		font-size: 45px;
		font-weight: 500;
	}
	
	#line_1 {
		position: absolute;
		border: 1px solid black;
		width: 100%;
		height: 0px;
		top: 130px;
/* 		left: 45px; */
	}
	
	#list-area {
		width: 90%;
		margin: 0 auto;
		margin-top: 150px;
		font-size: 17px;
		text-align: center;
	}
	
	#list-area>tbody>tr:hover {
		background-color: #F5F5F5;
        cursor: pointer;
	}
	
	#button-area {
		width: 90%;
		margin: 0 auto;
	}
</style>
</head>
<body>
	<%@ include file = "../common/menubar.jsp" %>
	<script>
		$(function() {
			<%if(user.getUserNo() == loginUser.getUserNo()) {%>
				location.href = "<%=contextPath %>/myPost.me?cPage=1";
			<%}%>
		})
	</script>

	<div class="wrap">
		<div class="content">
			<p id="pp">'<%=user.getNickname() %>'님이 작성한 게시글입니다.</p>
			<div id="line_1"></div>
			<br>
			
			<table id="list-area" border="1">
				<thead>
					<tr height="50">
						<th style="width: 10%;">No.</th>
						<th style="width: 15%">게시판</th>
						<th style="width: 50%;">제목</th>
						<th style="width: 15%;">작성일</th>
						<th style="width: 5%;">조회</th>
					</tr>
				</thead>
				<tbody>
					<%if(list.isEmpty()) {%>
						<tr height="40">
							<td colspan="5">조회된 게시글이 없습니다.</td>
						</tr>
					<%} else {%>
						<%for(BoardCommon bc : list) {%>
							<tr height="40">
								<td><%=bc.getBoardNo() %></td>
								<td><%=bc.getBoardName() %></td>
								<td><%=bc.getBoardTitle() %></td>
								<td><%=bc.getCreateDate() %></td>
								<td><%=bc.getCount() %></td>
							</tr>
						<%} %>
					<%} %>
				</tbody>
			</table>
			<br>
			
			<br><br><br><br>
			
			<div align="center" id="paging-area">
				<%if(pi.getStartPage() != 1) {%>
					<button class="btn btn-outline-dark" onclick="location.href='<%=contextPath%>/writtenBoardList.bo?nickname=<%=user.getNickname() %>&cPage=<%=pi.getStartPage()-10 %>';">&lt;&lt;</button>
				<%} %>
				<%if(pi.getCurrentPage() != 1) {%>
					<button class="btn btn-outline-dark" onclick="location.href='<%=contextPath%>/writtenBoardList.bo?nickname=<%=user.getNickname() %>&cPage=<%=pi.getCurrentPage()-1%>';">&lt;</button>
				<%} %>
				<%for(int i=pi.getStartPage();i<=pi.getEndPage();i++) {%>
					 <!-- 내가 보고있는 페이지 버튼은 비활성화 하기 -->
					 <%if(i != pi.getCurrentPage()) {%>
					 	<button class="btn btn-outline-dark" onclick="location.href='<%=contextPath%>/writtenBoardList.bo?nickname=<%=user.getNickname() %>&cPage=<%=i%>';"><%=i %></button>
					 <%} else { %> <!-- 내가 보고있는 페이지의 버튼을 누른다면 -->
					 	<button class="btn btn-outline-dark"><%=i %></button>
					 <%} %>
				<%} %>
				<%if(pi.getCurrentPage() != pi.getMaxPage()) {%>
			    	<button class="btn btn-outline-dark" onclick="location.href='<%=contextPath%>/writtenBoardList.bo?nickname=<%=user.getNickname() %>&cPage=<%=pi.getCurrentPage()+1%>';">&gt;</button>
				<%} %>
				<%if(pi.getEndPage() != pi.getMaxPage()) {%>
					<button class="btn btn-outline-dark" onclick="location.href='<%=contextPath%>/writtenBoardList.bo?nickname=<%=user.getNickname() %>&cPage=<%=pi.getStartPage()+10 %>';">&gt;&gt;</button>
				<%} %>
			</div>
			
			<script>
				$("#list-area>tbody>tr").click(function() {
					var bno = $(this).children().eq(0).text();
					var bname = $(this).children().eq(1).text();
					location.href = "<%=contextPath%>/searchBoard.bo?bno=" + bno + "&bname=" + bname;
				});
			</script>
		</div>
	</div>
	<%@ include file = "../common/footer.jsp" %>
</body>
</html>