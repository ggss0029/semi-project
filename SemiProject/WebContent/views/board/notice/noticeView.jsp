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
<title>공지 사항</title>
<style>
@font-face {
		    font-family: 'BMJUA';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
		}
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

#content_1>p { /*정보공유 글씨, 위치*/
	position: absolute;
	top: 40px;
	left: 52px;
	font-size: 50px;
/* 	font-weight: 700; */
	font-family: 'BMJUA';
}

#line_1 {
	position: absolute;
	border: 1px solid black;
	width: 300px;
	height: 0px;
	top: 115px;
	left: 30px;
}

#notice { /*동네 소식 글씨, 위치*/
	position: absolute;
	font-size: 35px;
	text-decoration: none;
	color: black;
	left: 52px;
	top: 130px;
	font-family: 'BMJUA';
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
	font-family: 'BMJUA';
}

#line_3 {
	position: absolute;
	border: 1px solid black;
	width: 300px;
	height: 0px;
	top: 265px;
	left: 30px;
}

#content_2>#content_2_1 { /*content2 안에 크기 지정*/
	width: 1100px;
	height: 1500px;
	border: 4px solid #C8EDC9;
	border-radius : 20px;
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

/* 게시글 테이블 */
.list-area {
	/*border: 1px solid black;*/
	text-align: center;
	margin: 150px 0 0 80px;
	font-size: 17px;
}

.list-area>tbody>tr:hover {
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
				<p>소식</p>
				<div id="line_1"></div>
				<a href="<%=contextPath%>/noticeList.bo?currentPage=1" id="notice">공지 사항</a>
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
								<th width="80">No.</th>
								<th width="465">제목</th>
								<th width="160">작성자</th>
								<th width="160">작성일</th>
								<th width="75">조회</th>
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
								<td><a id="nicknameHover"
									onclick="whoareyou();"><%=n.getNoticeWriter()%></a></td>
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
						<button class="btn btn-outline-dark"
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
						<button class="btn btn-outline-dark"
							onclick="location.href='<%=contextPath%>/noticeList.bo?currentPage=<%=i%>';"><%=i%></button>
						<%
							} else {
						%>
						<button class="btn btn-outline-dark" disabled><%=i%></button>
						<%
							}
						%>
						<%
							}
						%>

						<%
							if (pi.getCurrentPage() != pi.getMaxPage()) {
						%>
						<button class="btn btn-outline-dark" 
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