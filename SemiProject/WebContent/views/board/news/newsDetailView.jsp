<%@page import="com.udong.board.news.model.vo.NewsAttachment"%>
<%@page import="com.udong.board.news.model.vo.NewsBoard"%>
<%@page import="com.udong.board.news.model.vo.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	NewsBoard nb = (NewsBoard) request.getAttribute("newsBoard");
	NewsAttachment na = (NewsAttachment) request.getAttribute("newsAttachment");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

#footer {
	height: 200px;
	background-color: darkblue;
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
		<div id="header">
			<div id="header_1"></div>
			<div id="menubar"></div>
		</div>
		<div id="content">
			<p id="p1">동네 소식</p>
			<button id="report_btn" class="btn btn-basic">신고하기</button>

			<div id="line_1"></div>

			<table border="0" align="center" id="detail-area">
				<tr style="height:80px;">
					<td colspan="2"
						style="height: 50px; font-size: 30px; font-weight: 600; border-bottom: 1px solid black;"><%=nb.getBoardTitle()%></td>
				</tr>
				<tr style="border-bottom: 1px solid black; height:80px;">
					<td style="height: 50px; font-size: 20px; font-weight: 600; ">
						<a data-toggle="modal" data-target="#profile"><%=nb.getBoardWriter()%></a>
					</td>
					
					<td style="height: 50px; font-size: 20px; font-weight: 600;"
						align="right"><%=nb.getCreateDate()%></td>
				</tr>
				<tr style="height: 700px">
					<td colspan="2" style="height: auto; vertical-align : top "><br><%=nb.getBoardContent()%></td>
					
				</tr>
				<tr style="height:60px;">
					<td colspan="2"
						style="border-top: 1px solid black; border-bottom: 1px solid;">
						<!-- 첨부파일이 없는 경우 첨부파일이 없습니다. -->
				 	<%if (na == null) { %> 
				 		첨부파일이 없습니다. 
				 	<%} else { %> 
					 <a href="<%=contextPath + na.getFilePath() + "/" + na.getChangeName()%>"
						download="<%=na.getOriginName()%>"><%=na.getOriginName()%></a> 
					<% } %>
					</td>
				</tr>
			</table>

			<div class="like-area">
					<div class="like" style="float: left;">
						<% if (loginUser != null) %>
							<button type="button" id="like_btn">
								<i class="fas fa-heart"></i>
								
								&nbsp; 
								<span class="like_count"></span> <!-- 추천 수 보여주기 -->
							</button>
					</div>
					
			<script>
				$(function(){
					//추천버튼 클릭시 (추천 추가 또는 추천 제거)
					$.ajax({
						url : "newsLikeUpdate.do",
						type : "post",
						data : {
							newsBoardNo :  <%=nb.getBoardNo()%>,
							userNo : userNo
						},
						success: function() {
							likeCount();
						},
						error : function() {
							alert("실패~")
						}
						
					});
				});
				
				function likeCount() {
					$.ajax({
						url : "newsLikeCount.do",
						type : "post",
						data : {
							newsBoardNo :  <%=nb.getBoardNo()%>
						},
						success : function(result) {
							$("#like_count").html(result);
						},
						error : function() {
							alert("카운트 실패~")
						}
					});
				};
				
				likeCount();
			</script>
				
				<%
					if (loginUser != null && loginUser.getUserId().equals(nb.getBoardWriter())) {
				%>
				<div class="board_btn" style="float: right;">
					<button
						onclick="location.href = '<%=contextPath%>/newsUpdate.bo?bno=<%=nb.getBoardNo()%>'"
						class="btn btn-secondary">수정</button>
					<button
						onclick="location.href = '<%=contextPath%>/newsDelete.bo?bno=<%=nb.getBoardNo()%>'"
						class="btn btn-dark">삭제</button>
				</div>
				<%
					}
				%>
				<br clear="both">
				<!--뭔가 넓어짐-->
			</div>

			<hr>
			<div id="tabs">
				<ul>
					<li><a href="#tabs-1">댓글</a></li>
				</ul>

				<%
					if (loginUser != null) {
				%>
				<div>
					<div class="input-group">
						<textarea id="replyContent" rows="3" class="form-control"
							style="resize: none;" placeholder="폭언, 비매너 댓글은 상처받아요ㅠ,ㅠ"></textarea>
						<div class="input-group-btn">
							<button onclick="insertReply();" class="btn btn-light"
								type="submit" style="height: 110px">댓글 등록</button>
						</div>
					</div>
				</div>
				<%
					} else {
				%>
				<div>
					<div class="input-group">
						<textarea id="replyContent" rows="3" class="form-control"
							style="resize: none;" disabled>로그인 후 이용 가능한 서비스 입니다.
								
							</textarea>
						<div class="input-group-btn">
							<button onclick="insertReply();" class="btn btn-light"
								type="submit" style="height: 110px" disabled>댓글 등록</button>
						</div>
					</div>
				</div>
				<%
					}
				%>
				<div id="tabs-1">
				<!--  
					<div class="list-group">
						<div class="list-group-item">
							<h5 class="list-group-item-heading">작성자이름, 날짜, 버튼</h5>
      						<p class="list-group-item-text">내용부분</p>
						</div>
					</div>
-->
				</div>
				<br><br><br>
			</div>
			<script>
				//부트 스트랩
				$(function() {
					$("#tabs").tabs();
				});

				$(function() {
					newsSelectReplyList();
				});

				//댓글 작성
				function insertReply() {
					//게시글 번호 필요
					//게시글 번호 들고가서 성공시 -> 댓글 리스트 조회함수 실행 후 textarea 작성한 것 비워주기
					$.ajax({
						url : "newsInsertReply.bo",
						data : {
							content : $("#replyContent").val(),
							newsBoardNo : <%=nb.getBoardNo()%>
				},
						type : "post",
						success : function(result) {
							if (result > 0) {
								alert("댓글 작성 완료!");
								newsSelectReplyList(); //댓글 리스트 갱신
								$("#replyContent").val(""); // 내용을 작성한 textarea를 다 지워줌
							}
						},
						error : function() {
							alert("댓글 작성 실패");
						}
					});
				}

				//댓글 목록 죄회
				function newsSelectReplyList() {
					
					$.ajax({
								url : "newsSelectReplyList.bo",
								data : {
									newsBoardNo : <%=nb.getBoardNo()%>
										},
								success : function(rlist) {
									var result = "";
									if(rlist.length < 1){
										result = "등록한 댓글이 없습니다.";
									}else {
										for ( var i in rlist) {
											result += "<div id='tabs-1'>"
													+ "<div class='list-group'>"
													+ "<div class='list-group-item'>"
													+ "<span class='list-group-item-heading' style='font-size: 23px; font-weight:600'>"
													+ rlist[i].replyWriter
													+ "&nbsp;&nbsp;&nbsp;&nbsp;"
													+ "</span>"
													+ "<span style='font-size: 15px;'>"
													+ rlist[i].createDate
													+ "<button id='delete_reply' class='btn btn-dark btn-sm' onclick='newsDeleteReply(" + rlist[i].replyNo+")' style='float:right'>삭제하기</button>"
													+ "<button id='update_reply' class='btn btn-secondary btn-sm' onclick='newsUpdateReplyForm("+ rlist[i].replyNo + ",\"" + rlist[i].replyWriter + "\"" + ",\"" + rlist[i].createDate + "\"" +",\""+ rlist[i].replyContent+"\");' style='float:right'>수정하기</button>"
													+ "</span><br>"
													+ "<p class='list-group-item-text'>"
													+ rlist[i].replyContent
													+ "</p>" 
													+ "</div>" 
													+ "</div>"
													+ "</div>"
										}
									}
									$("#tabs #tabs-1").html(result);
								},
								error : function() {
									alert("댓글 조회 실패!");
								}
							});
					};
					
				
					//댓글 삭제
					function newsDeleteReply(replyNo) {
						
						$.ajax({
							url : "newsDeleteReply.bo",
							data : { replyNo : replyNo }, 
							type : "get",
							success : function(result) {
								if (result > 0) {
									alert("댓글 삭제 완료!");
									newsSelectReplyList(); //댓글 리스트 갱신
								}
							},
							error : function() {
								alert("댓글 삭제 실패");
							}
					});
					}
					
					//댓글 수정 폼
					function newsUpdateReplyForm(replyNo, replyWriter, createDate, replyContent) {
								var result = "";
									result += "<div id='tabs-1'>"
											+ "<div class='list-group'>"
											+ "<div class='list-group-item'>"
											+ "<span class='list-group-item-heading' style='font-size: 25px'>"
											+ replyWriter
											+ "&nbsp;&nbsp;&nbsp;&nbsp;"
											+ createDate
											+ "<button id='cancel_reply' class='btn btn-dark btn-sm' onclick='newsSelectReplyList()' style='float:right'>취소</button> "
											+ "<button id='update_reply' class='btn btn-secondary btn-sm' onclick='newsUpdateReply("+replyNo+")' style='float:right'>수정하기</button>"
											+ "</span>"
											+ "<p class='list-group-item-text'>"
											+ "<textarea id='changeContent' rows='3' class='form-control' style='resize: none;'>"+replyContent+"</textarea>"
											+ "</p>" 
											+ "</div>" 
											+ "</div>"
											+ "</div>"
									
								$("#tabs #tabs-1").html(result);
					}
					
					
					function newsUpdateReply(replyNo, newContent) {
						
						var newContent = $("#changeContent").val();
						$.ajax({
							url:"newsUpdateReply.bo",
							type:"post",
							data: {
								replyNo : replyNo,
								content : newContent
							},
							success : function(result) {
								alert("댓글이 수정되었습니다.");
								newsSelectReplyList();
							},
							error : function() {
								alert("댓글 수정 실패...");
							}
						});
					}
				
				
						
					
				
				
				
			</script>

		





		</div>
	</div>
	<div id="footer"></div>
</body>
</html>