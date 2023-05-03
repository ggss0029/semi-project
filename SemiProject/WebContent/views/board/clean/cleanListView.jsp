<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, com.udong.board.clean.model.vo.CleanBoard"%>
<%@page import="com.udong.common.model.vo.PageInfo"%>
<%
	ArrayList<CleanBoard> clist = (ArrayList<CleanBoard>) request.getAttribute("clist");
PageInfo pi = (PageInfo) request.getAttribute("pi");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>살림 꿀팁</title>
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

#news { /*동네 소식 글씨, 위치*/
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

#clean { /*살림 꿀팁 글씨, 위치*/
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

#recipe { /*자취 레시피 글씨, 위치*/
	position: absolute;
	font-size: 35px;
	text-decoration: none;
	color: black;
	left: 52px;
	top: 280px;
	font-family: 'BMJUA';
}

#line_4 {
	position: absolute;
	border: 1px solid black;
	width: 300px;
	height: 0px;
	top: 345px;
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
	margin: 380px 0 0 80px;
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

/* 하단 검색창 */
#search {
	width: 600px;
	height: 150px;
	position: relative; /*검색창을 가운데로 옮기기 위한 기준잡기*/
}

#search_form {
	/* border: 2px solid blue; */
	width: 80%;
	height: 20%;
	position: absolute;
	right: 0px;
	left: 310px;
	top: 10px;
	bottom: 0px;
}

#search_form>div {
	height: 100%;
	float: left;;
}

#search_text {
	width: 80%;
}

#search_btn {
	width: 20%;;
}

#search_form input {
	width: 100%;
	height: 100%;
}
</style>
</head>
<body>
	<%@ include file="../../common/menubar.jsp"%>
	<div class="wrap">
		<div id="content">
			<div id="content_1">
				<p>정보 공유</p>
				<div id="line_1"></div>
				<a href="<%=contextPath%>/newsList.bo?currentPage=1" id="news">동네
					소식</a>
				<div id="line_2"></div>
				<a href="<%=contextPath%>/cleanList.bo?currentPage=1" id="clean">살림
					꿀팁</a>
				<div id="line_3"></div>
<!-- 				<a href="" id="recipe">자취 레시피</a> -->
<!-- 				<div id="line_4"></div> -->
			</div>
			<div id="content_2">
				<div id="content_2_1">
					<p>살림 꿀팁</p>
					<div id="line_5"></div>

					<div id="box">
						<p id="b2">카테고리</p>
						<form name="form" method="post" action="">
							<input type="hidden" name="currentPage"
								value="<%=pi.getCurrentPage()%>">
							<div id="category">
								<input type="checkbox" class="check" id="cleaning" value="청소"> <label for="cleaning">청소</label>
								<input type="checkbox" class="check" id="cook" value="요리"><label for="cook">요리</label>
								<input type="checkbox" class="check" id="mymoney" value="내돈내산"><label for="mymoney">내돈내산</label> 
								<input type="checkbox" class="check" id="hotdeal" value="핫딜 공유"> <label for="hotdeal">핫딜 공유</label>
								<input type="checkbox" class="check" id="other" value="기타"> <label for="other">기타</label>
							</div>
							<br>
							<br> <br>
							<br>
							<br>

							<div align="center">
								<button type="reset" class="btn btn-light">초기화</button>
								<button type="button" class="btn btn-primary" onclick="cleanSearch();">검색</button>
							</div>
						</form>
					</div>
					<div id="line_6"></div>

					<table class="list-area" border="0" align="center">
						<thead
							style="height: 50px; border-top: 3px solid black; border-bottom: 3px solid black;">
							<tr>
								<th width="80">No.</th>
								<th width="465">제목</th>
								<th width="160">작성자</th>
								<th width="160">작성일</th>
								<th width="75">조회</th>
<!-- 								<th width="65">좋아요</th> -->
							</tr>
						</thead>
						<tbody>
							<!-- 리스트 20개씩 출력? -->
							<%
								if (clist.isEmpty()) {
							%>
							<!-- 만약 리스트가 비어있다면 -->
							<tr>
								<td colspan="6">글이 존재하지 않습니다</td>
							</tr>
							<%
								} else {
							%>
							<!-- 목록이 있으면 (반복문으로 전부 출력해주기) -->
							<%
								for (CleanBoard cb : clist) {
							%>
							<!-- 순차적으로 전부 접근할 것이기 때문에 향상된 for문 사용 -->
							<tr style="height: 40px; border-bottom: 1px solid black;">
								<td><%=cb.getBoardNo()%></td>
								<!-- No. -->
								<td class="goDetail1"><%=cb.getBoardTitle()%></td>
								<!-- 제목 -->
								<td><a id="nicknameHover"
									onclick="whoareyou();;"><%=cb.getBoardWriter()%></a></td>
								<!-- 작성자  닉네임 -->
								<td><%=cb.getCreateDate()%></td>
								<!-- 작성한 날짜 -->
								<td><%=cb.getCount()%></td>
								<!-- 조회수 -->
<%-- 								<td><%=cb.getLikeCount()%></td> --%>
								<!-- 좋아요한 수 -->
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
					<%
						if (loginUser != null) {
					%>
					<div align="right" id="write_btn">
                            	<a onclick="goWrite();" class="btn btn-light">글쓰기</a>
                            	<script>
	                                function goWrite(){
	                                	var boardName = $(document).find("title").eq(0).text();
	                                	location.href="<%=contextPath %>/insert.bo?boardName="+boardName;
	                                };
                            	</script>
					</div>
					<%} %>
					<br>
					<br>

					<div align="center" class="paging-area">
						<%
							if (pi.getCurrentPage() != 1) {
						%>
						<button class="btn btn-outline-dark"
							onclick="location.href='<%=contextPath%>/cleanList.bo?currentPage=<%=pi.getCurrentPage() - 1%>';">&lt;</button>
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
							onclick="location.href='<%=contextPath%>/cleanList.bo?currentPage=<%=i%>';"><%=i%></button>
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
							onclick="location.href='<%=contextPath%>/cleanList.bo?currentPage=<%=pi.getCurrentPage() + 1%>';">&gt;</button>
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
// 	    $(".goDetail1").click(function(){
	        
// 	        var bno = $(this).parent().children().first().text();
	        
<%-- 	       	location.href = '<%=contextPath %>/cleanDetail.bo?bno='+bno; --%>
// 	    });
    	
		$(".list-area>tbody").on("click","tr",function(){
			var bno = $(this).children().first().text();
			location.href = '<%=contextPath %>/cleanDetail.bo?bno='+bno;
		});
    	
    });
    
    function cleanSearch() {
    	var str = ""
    	$("input[class=check]:checked").each(function() {
    		str += "CC=" + $(this).val() + "&";
    	});
    	
    		$.ajax({
    			url : "cleanCategoryList.bo?"+str,
    			type : "post",
    			success : function(clist) {
    				$(".list-area").children("tbody").children().remove();
    				$(".paging-area").children().remove();
    				if(clist[0] == null) {
    					alert("검색된 게시글이 없습니다.");
    				}else {
    					var str = "";
    					var str2 = "";
    					var str3 = "";
    					if(clist.length > 9) {
    						for(var i = 0; i < clist.length; i++) {
    							if(i < 10) {
    								str += "<tr style='height: 40px; border-bottom:1px solid black;'>"
    									+ "<td>"+ clist[i].boardNo +"</td>"
    									+ "<td class='goDetail1'>"+ clist[i].boardTitle +"</td>"
    									+ "<td><a id='nicknameHover' onclick='hoareyou();'>"+ clist[i].boardWriter +"</a></td>"
    									+ "<td>"+ clist[i].createDate +"</td>"
    									+ "<td>"+ clist[i].count +"</td>"
    									+ "<td>"+ clist[i].likeCount +"</td>"
    									+ "<tr>"
    							}
    							if(i>9 && i< 19) {
    								str2 += "<tr style='height: 40px; border-bottom:1px solid black;'>"
    									+ "<td>"+ clist[i].boardNo +"</td>"
    									+ "<td class='goDetail1'>"+ clist[i].boardTitle +"</td>"
    									+ "<td><a id='nicknameHover' onclick='hoareyou();'>"+ clist[i].boardWriter +"</a></td>"
    									+ "<td>"+ clist[i].createDate +"</td>"
    									+ "<td>"+ clist[i].count +"</td>"
    									+ "<td>"+ clist[i].likeCount +"</td>"
    									+ "<tr>"
    							}
    							if(i>18) {
    								str3 += "<tr style='height: 40px; border-bottom:1px solid black;'>"
    									+ "<td>"+ clist[i].boardNo +"</td>"
    									+ "<td class='goDetail1'>"+ clist[i].boardTitle +"</td>"
    									+ "<td><a id='nicknameHover' onclick='hoareyou();'>"+ clist[i].boardWriter +"</a></td>"
    									+ "<td>"+ clist[i].createDate +"</td>"
    									+ "<td>"+ clist[i].count +"</td>"
    									+ "<td>"+ clist[i].likeCount +"</td>"
    									+ "<tr>"
    							}
    						}
    				}else {
    					for(var i in clist) {
    						str += "<tr style='height: 40px; border-bottom:1px solid black;'>"
								+ "<td>"+ clist[i].boardNo +"</td>"
								+ "<td class='goDetail1'>"+ clist[i].boardTitle +"</td>"
								+ "<td><a id='nicknameHover' onclick='hoareyou();'>"+ clist[i].boardWriter +"</a></td>"
								+ "<td>"+ clist[i].createDate +"</td>"
								+ "<td>"+ clist[i].count +"</td>"
								+ "<td>"+ clist[i].likeCount +"</td>"
								+ "<tr>"
    					}
    					$(".list-area").append(str);
    				}
    				}
    			},
    			error : function() {
    				alert("카테고리 조회 실패");
    			}
    		});
    }
   
   </script>
	<%@ include file="../../common/footer.jsp"%>
</body>
</html>