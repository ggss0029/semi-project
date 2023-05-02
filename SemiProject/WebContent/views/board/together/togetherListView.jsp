<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.udong.common.model.vo.PageInfo, com.udong.board.together.model.vo.TogetherBoard"%>
<%
	ArrayList<TogetherBoard> list = (ArrayList<TogetherBoard>)request.getAttribute("togetherBoardList");
	PageInfo pi = (PageInfo)request.getAttribute("pageInfo");
// 	String[] selectedCategory;
// 	if(request.getAttribute("check") != null) {
// 		selectedCategory = (String[])request.getAttribute("check");
// 		System.out.println(Arrays.toString(selectedCategory));
// 	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>같이 해요</title>
</head>
<style>
	@font-face {
		    font-family: 'BMJUA';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
	}
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
        background-color: #C8EDC9;
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
		font-size: 50px;
/* 		font-weight: 700; */
		font-family: 'BMJUA';
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
		font-family: 'BMJUA';
	}
	
	#line_2 { top: 190px; }
	#line_3 { top: 265px; }
	#line_4 { top: 120px; width: 1010px; margin-left: 15px;}
	#line_5 { top: 385px; width: 1010px; margin-left: 15px; }
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
		font-family: 'BMJUA';
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
		margin: 420px 5% 0 5%;
		font-size: 17px;
		text-align: center;
	}
	
	#list-area>tbody>tr:hover {
		background-color: #DEF5DE;
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
                <a href="<%=contextPath%>/togetherList.bo?cPage=1" id="together">같이 해요</a>
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
						<form action="togetherList2.bo" onsubmit="filter(); return false;">
							<input type="hidden" name="cPage" value=1>
							<div id="category">
								<input type="checkbox" id="food" name="check" value="밥"> <label for="food">밥</label>
								<input type="checkbox" id="coffee" name="check" value="커피"> <label for="coffee">커피</label>
								<input type="checkbox" id="alcohol" name="check" value="술"> <label for="alcohol">술</label>
								<input type="checkbox" id="game" name="check" value="게임"> <label for="game">게임</label>
								<input type="checkbox" id="exercise" name="check" value="운동"> <label for="exercise">운동</label>
								<input type="checkbox" id="walk" name="check" value="산책"> <label for="walk">산책</label>
								<input type="checkbox" id="handicraft" name="check" value="공예"> <label for="handicraft">공예</label>
								<br>
								<input type="checkbox" id="cook" name="check" value="요리"> <label for="cook">요리</label>
								<input type="checkbox" id="fishing" name="check" value="낚시"> <label for="fishing">낚시</label>
								<input type="checkbox" id="leisure" name="check" value="레저"> <label for="leisure">레저</label>
								<input type="checkbox" id="sing" name="check" value="노래"> <label for="sing">노래</label>
								<input type="checkbox" id="movie" name="check" value="영화"> <label for="movie">영화</label>
								<input type="checkbox" id="service" name="check" value="봉사"> <label for="service">봉사</label>
								<input type="checkbox" id="etc" name="check" value="기타"> <label for="etc">기타</label>
							</div>
							<br><br><br><br><br>
							
							<div id="category_btn" align="center">
								<button type="reset" class="btn btn-light" style="margin-right: 2%;" onclick="resetb();">초기화</button>
                            	<button class="btn btn-primary">검색</button>
							</div>
						</form>
					</div>
					<div id="line_5"></div>
					
					<table id="list-area" align="center">
						<thead style="height: 50px; border-top:3px solid black; border-bottom:3px solid black;">
							<tr>
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
<%-- 									<%if(tb.getCategory().equals("게임")) {%> --%>
										<tr style="height: 40px; border-bottom: 1px solid black;">
											<td><%=tb.getBoardNo()%></td>
											<td class="goDetail"><%=tb.getBoardTitle()%></td>
											<td><a id="nicknameHover" onclick="whoareyou();"><%=tb.getBoardWriter()%></a></td>
											<td><%=tb.getCreateDate()%></td>
											<td><%=tb.getCount()%></td>
											<td><%=tb.getLikeCount()%></td>
										</tr>
<%-- 									<%}%> --%>
								<%} %>
							<%} %>
						</tbody>
					</table>
					<br>
					<%if(loginUser != null) {%>
						<div id="write-btn" align="right">
							    <a onclick="goWrite();" class="btn btn-light">글쓰기</a>
                            	<script>
	                                function goWrite(){
	                                	
	                                	var boardName = $(document).find("title").eq(0).text();
	                                	location.href="<%=contextPath %>/insert.bo?boardName="+boardName;
	                                };
                            	</script>
						</div>
					<%} %>
					<br><br>
					
					<div align="center" id="paging-area">
						<%if(pi.getStartPage() != 1) {%>
							<button class="btn btn-outline-dark" onclick="location.href='<%=contextPath%>/togetherList.bo?cPage=<%=pi.getStartPage()-10 %>';">&lt;&lt;</button>
						<%} %>
						<%if(pi.getCurrentPage() != 1) {%>
							<button class="btn btn-outline-dark" onclick="location.href='<%=contextPath%>/togetherList.bo?cPage=<%=pi.getCurrentPage()-1%>';">&lt;</button>
						<%} %>
					    <%for(int i=pi.getStartPage();i<=pi.getEndPage();i++) {%>
					    	<!-- 내가 보고있는 페이지 버튼은 비활성화 하기 -->
					    	<%if(i != pi.getCurrentPage()) {%>
					    		<button class="btn btn-outline-dark" onclick="location.href='<%=contextPath%>/togetherList.bo?cPage=<%=i%>';"><%=i %></button>
					    	<%} else { %> <!-- 내가 보고있는 페이지의 버튼을 누른다면 -->
					    		<button class="btn btn-outline-dark"><%=i %></button>
					    	<%} %>
					    <%} %>
					    <%if(pi.getCurrentPage() != pi.getMaxPage()) {%>
					    	<button class="btn btn-outline-dark" onclick="location.href='<%=contextPath%>/togetherList.bo?cPage=<%=pi.getCurrentPage()+1%>';">&gt;</button>
					    <%} %>
					    <%if(pi.getEndPage() != pi.getMaxPage()) {%>
							<button class="btn btn-outline-dark" onclick="location.href='<%=contextPath%>/togetherList.bo?cPage=<%=pi.getStartPage()+10 %>';">&gt;&gt;</button>
						<%} %>
					</div>
					
					<script>
						$(function() {
							var check = new Array();
							
							<%if(request.getAttribute("check") != null){%>
								<%String[] selectedCategory = (String[])request.getAttribute("check");%>
								<%for(int i=0; i<selectedCategory.length; i++){%>
									$("input[name=check]").each(function() {
										if($(this).val() == "<%=selectedCategory[i]%>") {
											$(this).attr("checked", true);
										}
									})
								<%}%>
							<%}%>
							
				    		$(".goDetail").click(function(){
						        var bno = $(this).parent().children().first().text();
						       	location.href = '<%=contextPath %>/togetherDetail.bo?bno='+bno;
						    });
				        	
				    		window.onpageshow = function(event) {
				    		    if ( event.persisted || (window.performance && window.performance.navigation.type == 2)) {
				    		        // Back Forward Cache로 브라우저가 로딩될 경우 혹은 브라우저 뒤로가기 했을 경우
				    		        location.reload();
				    		    }
				    		};
				    		
							
				    	});
							function filter() {
								$("input[type=checkbox]").each(function() {
									if($(this).is(":checked")) {
										check.push($(this).val());
									}
								});
								console.log(check.length);
								return false;
								
// 								if(check.length == 0) {
// 									alert("선택된 카테고리가 없습니다.");
// 									return false;
// 								}
// 								else {
// 									$("#selectedCategory").val(check);
// 									return false;
<%-- 									location.href = "<%=contextPath%>/togetherList2.bo?cPage=1"; --%>
// 								}
							};
						
						function resetb() {
							$("input[type=checkbox]").each(function() {
								$(this).attr("checked", false);
							})
						};
						
					</script>
				</div>
			</div>
		</div>
	</div>
	<%@ include file = "../../common/footer.jsp" %>
</body>
</html>