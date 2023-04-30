<%@page import="com.udong.board.notice.model.vo.Notice"%>
<%@page import="com.udong.common.model.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList" %>
<%
	ArrayList<Notice> nlist = (ArrayList<Notice>)request.getAttribute("nlist");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<!-- Popper JS -->
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
div {
	/* border: 1px solid black; */
	box-sizing: border-box;
}

.wrap {
	position: relative;
	z-index: 1;
	height: 1530px;
	width: 1500px;
	margin: auto;
}

.wrap>div {
	width: 100%;
}

#content {
	width: 100%;
	height: 76.5%;
	position: relative;
}

#content>div {
	height: 100%;
	float: left;
}

#content_1 {
	width: 25%;
	background-color: yellow;
}

#content_2 {
	width: 75%;
	/* background-color: green; */
	position: relative;
}

#content_1>p { /*정보공유 글씨, 위치*/
	position: absolute;
	top: 40px;
	left: 52px;
	font-size: 45px;
	font-weight: 700;
}

#line_1 {
	position: absolute;
	border: 1px solid black;
	width: 300px;
	height: 0px;
	top: 115px;
	left: 30px;
}

#news { /*동네 소식 글씨, 위치*/
	position: absolute;
	font-size: 35px;
	text-decoration: none;
	color: black;
	left: 52px;
	top: 130px;
}

#line_2 {
	position: absolute;
	border: 1px solid black;
	width: 300px;
	height: 0px;
	top: 190px;
	left: 30px;
}

#faq { /*살림 꿀팁 글씨, 위치*/
	position: absolute;
	font-size: 35px;
	text-decoration: none;
	color: black;
	left: 52px;
	top: 205px;
}

#line_3 {
	position: absolute;
	border: 1px solid black;
	width: 300px;
	height: 0px;
	top: 265px;
	left: 30px;
}

#recipe { /*자취 레시피 글씨, 위치*/
	position: absolute;
	font-size: 35px;
	text-decoration: none;
	color: black;
	left: 52px;
	top: 280px;
}

#line_4 {
	position: absolute;
	border: 1px solid black;
	width: 300px;
	height: 0px;
	top: 345px;
	left: 30px;
}

#content_2>div { /*content2 안에 크기 지정*/
	width: 1100px;
	height: 1500px;
	border: 1px solid skyblue;
	position: absolute;
	top: 15px;
	left: 12px;
}

#content_2_1>p { /*contente2 안에 있는 동네소식 글씨 , 위치*/
	position: absolute;
	top: 45px;
	left: 54px;
	font-size: 45px;
	font-weight: 500;
}

#line_5 {
	position: absolute;
	border: 1px solid black;
	width: 1010px;
	height: 0px;
	top: 120px;
	left: 45px;
}

#box { /*지역선택, 카테고리 들어가는 박스*/
	position: absolute;
	border: 1px solid black;
	width: 1010px;
	height: 13%;
	top: 135px;
	left: 45px;
	border-radius: 30px;
}

#b2 { /*카테고리 글씨, 위치*/
	float: left;
	font-size: 25px;
	font-weight: 600;
	margin: 30px 0 0 50px;
}

#category { /*checkbox들을 감싸고 있는 div*/
	float: left;
	font-size: 18px;
	margin: 34px 0 0 16px;
	vertical-align: super;
	accent-color: darkgray; /*체크박스 색깔 바꾸기*/
}

label {
	margin-right: 15px;
}

#line_6 {
	position: absolute;
	border: 1px solid black;
	width: 1010px;
	height: 0px;
	top: 350px;
	left: 45px;
}

/* 게시글 테이블 */
.list-area {
	/*border: 1px solid black;*/
	text-align: center;
	margin: 150px 0 0 80px;
	font-size: 17px;
}

.list-area>tbody>tr:hover {
	background-color: #C8EDC9;
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
				<p>소식</p>
				<div id="line_1"></div>
				<a href="<%=contextPath%>/noticeList.bo?currentPage=1" id="news">공지 사항</a>
				<div id="line_2"></div>
				<a href="<%=contextPath%>/faqList.bo?currentPage=1" id="faq">자주 묻는 질문</a>
				<div id="line_3"></div>
			</div>
			<div id="content_2">
				<div id="content_2_1">
					<p>공지 사항</p>
					<div id="line_5"></div>

					<table class="list-area" border="0" align="center">
						<thead
							style="height: 50px; border-top: 3px solid black; border-bottom: 3px solid black;">
							<tr>
								<th width="70">No.</th>
								<th width="440">제목</th>
								<th width="150">작성자</th>
								<th width="150">작성일</th>
								<th width="65">조회</th>
							</tr>
						</thead>
						<tbody>
							<!-- 리스트 20개씩 출력? -->
							<%
								if (nlist.isEmpty()) {
							%>
							<!-- 만약 리스트가 비어있다면 -->
							<tr>
								<td colspan="6">공지사항이 존재하지 않습니다</td>
							</tr>
							<%
								} else {
							%>
							<!-- 목록이 있으면 (반복문으로 전부 출력해주기) -->
							<%
								for (Notice n : nlist) {
							%>
							<!-- 순차적으로 전부 접근할 것이기 때문에 향상된 for문 사용 -->
							<tr style="height: 40px; border-bottom: 1px solid black;">
								<td><%=n.getNoticeNo() %></td>
								<!-- No. -->
								<td class="goDetail1"><%=n.getNoticeTitle() %></td>
								<!-- 제목 -->
								<td><a data-toggle="modal" data-target="#profile"
									onclick="profile();"><%=n.getNoticeWriter()%></a></td>
								<!-- 작성자  닉네임 -->
								<td><%=n.getCreatDate()%></td>
								<!-- 작성한 날짜 -->
								<td><%=n.getCount()%></td>
								<!-- 조회수 -->
								
							</tr>
							<%
								}
							%>
							<%
								}
							%>
							<!--  
                            <tr style="height: 40px; border-bottom:1px solid black;">
                                <td>1</td>
                                <td>첫 게시물</td>
                                <td>수지</td>
                                <td>2023-04-14</td>
                                <td>100</td>
                                <td>1004</td>
                            </tr>
                            -->
						</tbody>
					</table>
					<br>
						<%if(loginUser != null && loginUser.getUserId().equals("admin")) { %> 
	                        <div align="right" id="write_btn">
	                            <a href="<%=request.getContextPath() %>/views/board/notice/noticeInsertView.jsp" class="btn btn-light">글쓰기</a>
	                        </div>
                        <%} %>
					<br>
					<br>

					<div align="center" class="paging-area">
						<%
							if (pi.getCurrentPage() != 1) {
						%>
						<button
							onclick="location.href='<%=contextPath%>/noticeList.bo?currentPage=<%=pi.getCurrentPage() - 1%>';">&lt;</button>
						<%
							}
						%>

						<%
							for (int i = pi.getStartPage(); i <= pi.getEndPage(); i++) {
						%>
						<%
							if (i != pi.getCurrentPage()) {
						%>
						<button
							onclick="location.href='<%=contextPath%>/noticeList.bo?currentPage=<%=i%>';"><%=i%></button>
						<%
							} else {
						%>
						<button disabled><%=i%></button>
						<%
							}
						%>
						<%
							}
						%>

						<%
							if (pi.getCurrentPage() != pi.getMaxPage()) {
						%>
						<button
							onclick="location.href='<%=contextPath%>/noticeList.bo?currentPage=<%=pi.getCurrentPage() + 1%>';">&gt;</button>
						<%
							}
						%>
					</div>

<!-- 					<div id="search"> -->
<!-- 						<form action="search.do" id="search_form"> -->
<!-- 							<div id="search_text"> -->
<!-- 								<input type="search" name="keyword"> -->
<!-- 							</div> -->

<!-- 							<div id="search_btn"> -->
<!-- 								<input type="button" value="검색"> -->
<!-- 							</div> -->
<!-- 						</form> -->

<!-- 					</div> -->
				</div>
			</div>
		</div>
	</div>
	<script>
    
    $(function(){
    	//.list-area클래스 자손tbody 자손tr 클릭됐을때
	    $(".goDetail1").click(function(){
	        
	        var bno = $(this).parent().children().first().text();
	       	location.href = '<%=contextPath %>/noticeDetail.bo?bno='+bno;
	    });
    	
    });
        
   
   </script>
	<%@ include file="../../common/footer.jsp"%>
</body>
</html>