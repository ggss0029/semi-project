<%@page import="com.udong.board.common.model.vo.Attachment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.udong.board.common.model.vo.BoardCommon"%>
<%@page import="com.udong.board.give.model.vo.GiveBoard"%>
<%@page import="com.udong.board.news.model.vo.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	GiveBoard gb = new GiveBoard();
	if(request.getAttribute("bestPost")!=null){
		BoardCommon b = (BoardCommon)request.getAttribute("bestPost");
		gb.setBoardTitle(b.getBoardTitle());
		gb.setBoardWriter(b.getBoardWriter());
		gb.setCreateDate(b.getCreateDate());
		gb.setBoardContent(b.getBoardContent());
	}else if(request.getAttribute("gb")!=null){
		gb = (GiveBoard)request.getAttribute("gb");
	}
	ArrayList<Attachment> alist = (ArrayList<Attachment>)request.getAttribute("alist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나눔 할게요</title>
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
	margin: 50px 0px 0px 1100px;
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
#foodWriter>a:hover{
	cursor:pointer;
}

#pp {
	white-space: pre-wrap;
}
</style>
</head>
<body>
	<%@ include file="../../common/menubar.jsp"%>

	<div class="wrap">
		<div id="content">
<!-- 			<p id="p1">나눔 할게요</p><button id="report_btn" class="btn btn-basic">신고하기</button> -->

			<div id="line_1"></div>

			<table border="0" align="center" id="detail-area">
				<tr style="height:80px;">
					<td colspan="4"
						style="height: 50px; font-size: 30px; font-weight: 600;"><%=gb.getBoardTitle()%></td>
				</tr>
				<tr style="border-bottom: 1px solid black; height:80px;">
					<td style="height: 50px; font-size: 20px; font-weight: 600;" id="foodWriter" colspan="3">
						작성자 <a data-toggle="modal" data-target="#profile"><%=gb.getBoardWriter()%></a>
					</td>
					<td style="height: 50px; font-size: 20px; font-weight: 600;"
						align="right">조회수 <%=gb.getCount()%> &nbsp;&nbsp;  작성일 <%=gb.getCreateDate()%></td>
				</tr>
				<tr>
					<%if(alist.size()>4){ %>
						<%for(int i=0; i<4 ; i++){ %>
							<td>
								<img src="<%=contextPath +alist.get(i).getFilePath()+alist.get(i).getChangeName()%>" width="300px" height="270px">
							</td>
						<%} %>
					<%}else{ %>
						<%for(int i=0; i<alist.size() ; i++){ %>
							<td>
								<img src="<%=contextPath +alist.get(i).getFilePath()+alist.get(i).getChangeName()%>" width="300px" height="270px">
							</td>
						<%} %>
					<%} %>
				</tr>
				<tr>
				<%if(alist.size()>4 && alist.size() != 9){ %>
					<%for(int i=4; i<alist.size() ; i++){ %>
							<td>
								<img src="<%=contextPath +alist.get(i).getFilePath()+alist.get(i).getChangeName()%>" width="300px" height="270px">
							</td>
					<%} %>
				<%}else if(alist.size() == 9){ %>
					<%for(int i=4; i<alist.size()-1 ; i++){ %>
							<td>
								<img src="<%=contextPath +alist.get(i).getFilePath()+alist.get(i).getChangeName()%>" width="300px" height="270px">
							</td>
					<%} %>
					</tr>
					<tr>
						<td><img src="<%=contextPath +alist.get(8).getFilePath()+alist.get(8).getChangeName()%>" width="300px" height="270px"></td>
					</tr>
				<%} %>
				</tr>		
				<tr style="height: 700px">
					<td colspan="4" style="height: auto; vertical-align : top "><br><p id="pp"><%=gb.getBoardContent()%></p></td>
				</tr>
			</table>
			<br><br>
<!-- 			<div class="like-area"> -->
<!-- 					<div class="like" style="float: left;"> -->
<%-- 						<% if (loginUser != null) %> --%>
<!-- 							<button type="button" id="like_btn"> -->
<!-- 								<i class="fas fa-heart"></i> -->
								
<!-- 								&nbsp;  -->
<!-- 								<span class="like_count"></span> 추천 수 보여주기 -->
<!-- 							</button> -->
<!-- 					</div> -->
					
				<%
					if (loginUser != null && loginUser.getNickname().equals(gb.getBoardWriter())) {
				%>
				<div class="board_btn" style="float: right; margin-right: 20px">
					<button
						onclick="location.href = '<%=contextPath%>/updateBoard.bo?bno=<%=gb.getBoardNo()%>'"
						class="btn btn-secondary">수정</button>
					<button
						onclick="location.href = '<%=contextPath%>/deletePost.bo?bno=<%=gb.getBoardNo()%>'"
						class="btn btn-dark">삭제</button>
				</div>
				<%
					}
				%>
				<br clear="both">
			</div>

			<hr>
			<div id="tabs">
				<ul style="list-style:none;">
					<li><a href="#tabs-1" style="color : black; text-decoration:none; font-size:30px">댓글</a></li>
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
								type="button" style="height: 110px">댓글 등록</button>
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
				</div>
				<br><br><br>
			</div>
			<script>

				$(function() {
					giveSelectReplyList();
				});

				function insertReply() {
					$.ajax({
						url : "giveInsertReply.bo",
						data : {
							content : $("#replyContent").val(),
							giveBoardNo : <%=gb.getBoardNo()%>,
							<%if(loginUser != null){%>
								userNo : <%=loginUser.getUserNo()%>
							<%}%>
				},
						type : "post",
						success : function(result) {
							if (result > 0) {
								alert("댓글 작성 완료!");
								giveSelectReplyList();
								$("#replyContent").val("");
							}
						},
						error : function() {
							alert("댓글 작성 실패");
						}
					});
				}

				//댓글 목록 죄회
				function giveSelectReplyList() {
					
					$.ajax({
								url : "giveSelectReplyList.bo",
								data : {
									boardNo : <%=gb.getBoardNo()%>
										},
								success : function(flist) {
									var result = "";
									if(flist.length < 1){
										result = "등록한 댓글이 없습니다.";
									}else {
										for ( var i in flist) {
											result += "<div id='tabs-1'>"
													+ "<div class='list-group'>"
													+ "<div class='list-group-item'>"
													+ "<span class='list-group-item-heading' style='font-size: 23px; font-weight:600'>"
													+ flist[i].replyWriter
													+ "&nbsp;&nbsp;&nbsp;&nbsp;"
													+ "</span>"
													+ "<span style='font-size: 15px;'>"
													+ flist[i].createDate
													+ "<button id='delete_reply' class='btn btn-dark btn-sm' onclick='giveDeleteReply(" + flist[i].replyNo+")' style='float:right'>삭제하기</button>"
													+ "<button id='update_reply' class='btn btn-secondary btn-sm' onclick='giveUpdateReplyForm("+ flist[i].replyNo + ",\"" + flist[i].replyWriter + "\"" + ",\"" + flist[i].createDate + "\"" +",\""+ flist[i].replyContent+"\");' style='float:right'>수정하기</button>"
													+ "</span><br>"
													+ "<p class='list-group-item-text'>"
													+ flist[i].replyContent
													+ "</p>" 
													+ "</div>" 
													+ "</div>"
													+ "</div>"
										}
									}
									$("#tabs #tabs-1").html(result);
									btnCheck();
								},
								error : function() {
									alert("댓글 조회 실패!");
								}
							});
					};
					
					function btnCheck(){
						var btn = $("#tabs-1 span button");
						var loginUser;
						var loginNick;
						var loginUserId;
						<%if(loginUser != null){%>
						loginUser ='<%=loginUser%>'; 
						loginUserId = '<%=loginUser.getUserId()%>'; 
						loginNick = '<%=loginUser.getNickname()%>'; 
						loginBoard = '<%=gb.getBoardWriter()%>';
						<%}%>
						if(loginUser==undefined){ 
							$(btn).hide(); 
						}else{
							$(".list-group-item-heading").each(function(){ 
								var nick = $(this).text().trim(); 
								if(loginUserId=='admin' || nick == loginNick || loginBoard == loginNick){ 
									console.log(loginUserId);
									$(this).next().find("button").show();
									
								}else{
									$(this).next().find("button").hide();
								}
								
							})	
						}
						
						
					}
					
					
					function giveDeleteReply(replyNo) {
						
					if(confirm("진짜 삭제하시겠습니까?")){	
						$.ajax({
							url : "giveDeleteReply.bo",
							data : { replyNo : replyNo }, 
							type : "get",
							success : function(result) {
								if (result > 0) {
									alert("댓글 삭제 완료!");
									giveSelectReplyList(); //댓글 리스트 갱신
								}
							},
							error : function() {
								alert("댓글 삭제 실패");
							}
					});
					}else{
						alert("댓글 삭제가 취소되었습니다.");
					}
					}
					
					function giveUpdateReplyForm(replyNo, replyWriter, createDate, replyContent) {
								var result = "";
									result += "<div id='tabs-1'>"
											+ "<div class='list-group'>"
											+ "<div class='list-group-item'>"
											+ "<span class='list-group-item-heading' style='font-size: 25px'>"
											+ replyWriter
											+ "&nbsp;&nbsp;&nbsp;&nbsp;"
											+ createDate
											+ "<button id='cancel_reply' class='btn btn-dark btn-sm' onclick='giveSelectReplyList()' style='float:right'>취소</button> "
											+ "<button id='update_reply' class='btn btn-secondary btn-sm' onclick='giveUpdateReply("+replyNo+")' style='float:right'>수정하기</button>"
											+ "</span>"
											+ "<p class='list-group-item-text'>"
											+ "<textarea id='changeContent' rows='3' class='form-control' style='resize: none;'>"+replyContent+"</textarea>"
											+ "</p>" 
											+ "</div>" 
											+ "</div>"
											+ "</div>"
									
								$("#tabs #tabs-1").html(result);
					}
					
					
					function giveUpdateReply(replyNo, newContent) {
						
						var newContent = $("#changeContent").val();
						$.ajax({
							url:"giveUpdateReply.bo",
							type:"post",
							data: {
								replyNo : replyNo,
								content : newContent
							},
							success : function(result) {
								alert("댓글이 수정되었습니다.");
								giveSelectReplyList();
							},
							error : function() {
								alert("댓글 수정 실패...");
							}
						});
					}
			</script>
		</div>
	</div>
	<%@ include file = "../../common/footer.jsp" %>
</body>
</html>