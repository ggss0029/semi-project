<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.udong.board.free.model.vo.FreeBoard"%>
<%
	ArrayList<FreeBoard> list = (ArrayList<FreeBoard>) request.getAttribute("FreeList");
int totalPage = (int) request.getAttribute("totalPage");
int currentPage = (int) request.getAttribute("currentPage");
int minPage = (int) request.getAttribute("minPage");
int maxPage = (int) request.getAttribute("maxPage");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>자유 게시판</title>
<style>
@font-face {
	font-family: 'BMJUA';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

div {
	/* border: 1px solid black; */
	box-sizing: border-box;
}

.wrap {
	height: 1530px;
	position: relative;
	z-index: 1;
	width: 1500px;
	margin: auto;
}

.wrap>div {
	width: 100%;
}

#content {
	width: 100%;
	height: 100%;
	position: relative;
}

#content>div {
	height: 100%;
	float: left;
}

#content_1 {
	width: 25%;
	background-color: #C8EDC9;
}

#content_2 {
	width: 75%;
	/* background-color: green; */
	position: relative;
}
#share {
	position: absolute;
	top: 40px;
	left: 52px;
	font-size: 50px;
	/* 	font-weight: 700; */
	font-family: 'BMJUA';;
}

#content_title {
	position: absolute;
	top: 45px;
	left: 54px;
	font-size: 45px;
	font-weight: 500;
	font-family: 'BMJUA';
}

#line_5 {
	position: absolute;
	border: 1px solid black;
	width: 1010px;
	height: 0px;
	top: 120px;
	left: 45px;
}


#userListbtn {
	margin: 10px;
	padding: 20px 20px;
}

#Freelist {
	text-align: center;
	margin: 150px 0 0 80px;
	font-size: 17px;
}

.Freechk {
	width: 161px;
	height: 50px;
	position: absolute;
	left: 50%;
	margin-left: -200px;
	bottom: 5%;
}

.search.do {
	position: absolute;
}

.search_content {
	width: 500px;
	height: 50px;
	border: 1px solid gray;
	position: absolute;
	left: 64%;
	bottom: 5%;
	transform: translate(-50%, 0%);
}

.search_btn {
	right: 15%;
	bottom: 20%;
	position: absolute;
	transform: translate(-50%, 0%);
}

#Freelist>tbody>tr:hover {
	background-color: #DEF5DE;
	cursor: pointer;
}

/* 글쓰기 버튼 */
#write_btn {
	margin: 0 70px;
}
</style>
</head>
<body>
	<%@ include file="../../common/menubar.jsp"%>
	<div class="wrap">
		<div id="content">
			<div id="content_1">
				<p id="share">자유 게시판</p>
			</div>

			<div id="content_2">
				<div id="content_2_1">
					<p id="content_title">자유 게시판</p>
					<div id="line_5"></div>
					<!-- <table align="center">
                    <select id="search_type" name="search_type" class="Freechk">
                        <option id="search_share" value="search_share">제목+내용</option>
                        <label>
                            <input type="search" id="search_content" class="search_content" >
                            <button type="button" id="search_btn" class="btn btn-secondary" 
                            style="right: 11%;
                            width: 83px;
                            height: 50px;
                            bottom: 5%;
                            position: absolute;
                            transform: translate(-50%, 0%);">검색</button> 
                        </label>
                	</select>
               </table> -->
					<table id="Freelist" border="0" align="center">

						<thead
							style="height: 50px; border-top: 3px solid black; border-bottom: 3px solid black;">
							<tr>
								<th width="70;">NO.</th>
								<th width="440;">제목</th>
								<th width="150;">작성자</th>
								<th width="150;">작성일</th>
								<th width="65;">조회</th>
								<th width="65">추천수</th>
							</tr>
						</thead>

						<%
							for (FreeBoard board : list) {
						%>
						<tbody>
							<tr data-board-no='<%=board.getBoardNo()%>'>
								<td><%=board.getBoardNo()%></td>
								<td class="goDetail1"><%=board.getBoardTitle()%></td>
								<td><a id="nicknameHover" onclick="profile();"><%=board.getBoardWriter()%></a></td>
								<td><%=board.getCreateDate()%></td>
								<td><%=board.getCount()%></td>
								<td><%=board.getLikeCnt()%></td>
							</tr>
						</tbody>
						<%
							}
						%>

					</table>
					<br>
					<!--사용자 버튼-->
					<%
						if (loginUser != null) {
					%>
					<div align="right" id="write_btn">
						<a onclick="goWrite();" class="btn btn-light">글쓰기</a>
					</div>
					<%
						}
					%>
					<script>
				        function goWrite(){
							var boardName = $(document).find("title").eq(0).text();
				        	location.href="<%=contextPath%>/insert.bo?boardName="+boardName;
						};
			        </script>
					<br>
					<br>

					<div align="center" class="paging-area">
						<%
							if (currentPage > 10) {
						%>
						<!-- 이전 버튼  10번 페이지 이전에는 뒤로갈게 없어서 나오지않는 비노출-->
						<button
							onclick='location.href="<%=request.getContextPath()%>/FreeBoardList.bo?page=<%=currentPage - 10%>";'>&lt;</button>
						<%
							}
						%>
						<%
							for (int i = minPage; i <= maxPage; i++) {
						%>
						<%
							if (currentPage == i) {
						%>
						<button style="cursor: default"><%=i%></button>
						<%
							} else {
						%>
						<button
							onclick='location.href="<%=request.getContextPath()%>/FreeBoardList.bo?page=<%=i%>";'><%=i%></button>
						<%
							}
						%>
						<%
							}
						%>
						<%
							if (totalPage != maxPage) {
						%>
						<button
							onclick='location.href="<%=request.getContextPath()%>/FreeBoardList.bo?page=<%=maxPage + 1%>";'>&gt;</button>
						<%
							}
						%>
					</div>


				</div>
			</div>
		</div>
	</div>
	<%@ include file="../../common/footer.jsp"%>
</body>
<script>
	//나중에 검색+내용 검색기능 다시구현해보기
	/*$(function(){
		 $("#search_btn").click(function(e){
			var searchType = $("#search_type").val();
			var content = $("#search_content").val();
			if(searchType == "search_share"){
				location.href = contextPath +  "/FreeBoardList.bo?boardTitle=" + content 
						+ "&boardContent=" + content;
			}
		}); */
			
		/* if(loginUser != null){
			$("#write_btn").show();	
		}else{
			$("#write_btn").hide();			
		};
	});
	 */
		//게시글 클릭시 게시글 디테일뷰
		$(function(){
		    	//.list-area클래스 자손tbody 자손tr 클릭됐을때
			    $(".goDetail1").click(function(){
			        
			        var boardNo = $(this).parent().children().first().text();
			        
			        location.href = "<%=contextPath%>" + "/FreeDetail.bo?boardNo=" + boardNo; 
			    });
		    	
		    });
		
// 		$("#Freelist > tbody > tr").click(function(){
// 			var boardNo = $(this).data("board-no");
<%-- 			location.href = "<%= contextPath%>" + "/FreeDetail.bo?boardNo=" + boardNo;    --%>
// 		});

	
	
	
	
</script>


</html>