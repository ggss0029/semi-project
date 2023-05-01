<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.udong.board.common.model.vo.BoardCommon, com.udong.common.model.vo.PageInfo, com.udong.board.together.model.vo.TogetherBoard"%>
<%
	ArrayList<TogetherBoard> list = (ArrayList<TogetherBoard>)request.getAttribute("myPostList");
	PageInfo pi = (PageInfo)request.getAttribute("pageInfo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.wrap {
		position:relative;
		z-index:1;
        height: 1200px;
        width: 1500px;
        margin: auto;
	}
	
	.wrap>div{
    	width: 100%;
    }
    
    #content{
    	width: 100%;
    	height: 100%;
    	position: relative;
    }

    #content>div{
    	height: 100%;
    	float: left;
    }

    #content_1{
        width: 25%;
        background-color: yellow;
    }

    #content_2{
    	width: 75%;
/*     	background-color: green; */
    	position: relative;
	}
	
	#content_1>p {
		position: absolute;
		top: 40px;
		left: 52px;
		font-size: 45px;
		font-weight: 700;
	}
	
	#line_1, #line_2, #line_3, #line_4, #line_5, #line_6 {
		position: absolute;
		border: 1px solid black;
		width: 300px;
		height: 0px;
		top: 115px;
		left: 30px;
	}
	
	#buy, #together {
		position: absolute;
		font-size: 35px;
		text-decoration: none;
		color: black;
		left: 52px;
		top: 130px;
	}
	
	#line_2 { top: 190px; }
	#line_3 { top: 265px; }
	#line_4 { top: 120px; width: 1010px; margin-left: 15px;}
	#line_5 { top: 345px; width: 1010px; margin-left: 15px; }
	#line_6 { top: 505px; }
	
	#buy { top: 205px; }
	
	#content_2_1 {
		width: 1100px;
		height: 1170px;
		border: 1px solid skyblue;
		position: absolute;
		top: 15px;
		left: 12px;
	}
	
	#pp {
		position: absolute;
		top: 45px;
		left: 54px;
		font-size: 45px;
		font-weight: 500;
	}
	
	#box{ /*지역선택, 카테고리 들어가는 박스*/
    	position: absolute;
    	border: 1px solid black;
    	width: 1010px;
    	height: 20%;
    	top: 135px;
    	left: 45px;
    	border-radius: 30px;
    }
	
	#pp2 {
		float: left;
		font-size: 25px;
		font-weight: 600;
		margin: 30px 0 0 50px;
	}
	
	#category {
		float: left;
		font-size: 18px;
		margin: 34px 0 0 30px;
		vertical-align: super;
		accent-color: darkgray;
	}
	
	label {
		margin-right: 18px;
	}
	
/* 	#category_btn{ */
/*     	float: none; */
/*     } */
	
	#list-area {
		width: 90%;
		margin: 380px auto;
		font-size: 17px;
		text-align: center;
	}
	
	#list-area>tbody>tr:hover {
		background-color: #F5F5F5;
        cursor: pointer;
	}
	
	#write-btn {
		margin: 0 auto;
		width: 90%;
	}
	
	#button-area {
		width: 90%;
/* 		margin: 0 auto; */
	}
</style>
<body>
	<%@ include file = "../../common/menubar.jsp" %>
	<div class="wrap">
		<div id="content">
			<div id="content_1">
				<p>함께 해요</p>
                <div id="line_1"></div>
                <a href="<%=contextPath%>/togetherList.bo" id="together">같이 해요</a>
                <div id="line_2"></div>
                <a href="<%=contextPath%>/buyList.bo?currentPage=1" id="buy">같이 사요</a>
                <div id="line_3"></div>
			</div>
			<div id="content_2">
				<div id="content_2_1">
					<p id="pp">같이 해요</p>
					<div id="line_4"></div>
					
					<div id="box">
						<p id="pp2">카테고리</p>
						<form action="">
							<div id="category">
								<input type="checkbox" id="food" > <label for="food">밥</label>
								<input type="checkbox" id="coffee" > <label for="coffee">커피</label>
								<input type="checkbox" id="alcohol" > <label for="alcohol">술</label>
								<input type="checkbox" id="game" > <label for="game">게임</label>
								<input type="checkbox" id="exercise" > <label for="exercise">운동</label>
								<input type="checkbox" id="walk" > <label for="walk">산책</label>
								<input type="checkbox" id="handicraft" > <label for="handicraft">공예</label>
								<br>
								<input type="checkbox" id="cook" > <label for="cook">요리</label>
								<input type="checkbox" id="fishing" > <label for="fishing">낚시</label>
								<input type="checkbox" id="leisure" > <label for="leisure">레저</label>
								<input type="checkbox" id="sing" > <label for="sing">노래</label>
								<input type="checkbox" id="movie" > <label for="movie">영화</label>
								<input type="checkbox" id="service" > <label for="service">봉사</label>
								<input type="checkbox" id="etc" > <label for="etc">기타</label>
							</div>
							<br><br><br><br><br>
							
							<div id="category_btn" align="center">
								<button type="reset" class="btn btn-light" style="margin-right: 2%">초기화</button>
                            	<button class="btn btn-primary" >검색</button>
							</div>
						</form>
					</div>
					<div id="line_5"></div>
					
					<table id="list-area" border="1" align="center">
						<thead>
							<tr height="50">
								<th width="70">No.</th>
	                            <th width="440">제목</th>
	                            <th width="150">작성자</th>
	                            <th width="150">작성일</th>
	                            <th width="65">조회</th>
	                            <th width="65">좋아요</th>
							</tr>
						</thead>
						<tbody>
							<%if(list.isEmpty()) {%>
								<tr height="40">
									<td colspan="6">글이 존재하지 않습니다.</td>
								</tr>
							<%} else { %>
								<%for(TogetherBoard tb : list) {%>
									<tr style="height: 40px; border-bottom: 1px solid black;">
										<td><%=tb.getBoardNo()%></td>
										<td class="goDetail1"><%=tb.getBoardTitle()%></td>
										<td><a data-toggle="modal" data-target="#profile"
											onclick="profile();"><%=tb.getBoardWriter()%></a></td>
										<td><%=tb.getCreateDate()%></td>
										<td><%=tb.getCount()%></td>
										<td><%=tb.getLikeCount()%></td>
									</tr>
								<%} %>
							<%} %>
						</tbody>
					</table>
					<br>
					<%if(loginUser != null) {%>
						<div id="write-btn" align="right">
							<a href="<%=request.getContextPath()%>/views/board/writeBoard.jsp" class="btn btn-light">글쓰기</a>
						</div>
					<%} %>
					<br><br>
					
					<div align="center" id="paging-area">
						<%if(pi.getStartPage() != 1) {%>
							<button class="btn btn-outline-dark" onclick="location.href='<%=contextPath%>/myPost.me?cPage=<%=pi.getStartPage()-10 %>';">&lt;&lt;</button>
						<%} %>
						<%if(pi.getCurrentPage() != 1) {%>
							<button class="btn btn-outline-dark" onclick="location.href='<%=contextPath%>/myPost.me?cPage=<%=pi.getCurrentPage()-1%>';">&lt;</button>
						<%} %>
					    <%for(int i=pi.getStartPage();i<=pi.getEndPage();i++) {%>
					    	<!-- 내가 보고있는 페이지 버튼은 비활성화 하기 -->
					    	<%if(i != pi.getCurrentPage()) {%>
					    		<button class="btn btn-outline-dark" onclick="location.href='<%=contextPath%>/myPost.me?cPage=<%=i%>';"><%=i %></button>
					    	<%} else { %> <!-- 내가 보고있는 페이지의 버튼을 누른다면 -->
					    		<button class="btn btn-outline-dark"><%=i %></button>
					    	<%} %>
					    <%} %>
					    <%if(pi.getCurrentPage() != pi.getMaxPage()) {%>
					    	<button class="btn btn-outline-dark" onclick="location.href='<%=contextPath%>/myPost.me?cPage=<%=pi.getCurrentPage()+1%>';">&gt;</button>
					    <%} %>
					    <%if(pi.getEndPage() != pi.getMaxPage()) {%>
							<button class="btn btn-outline-dark" onclick="location.href='<%=contextPath%>/myPost.me?cPage=<%=pi.getStartPage()+10 %>';">&gt;&gt;</button>
						<%} %>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file = "../../common/footer.jsp" %>
</body>
</html>