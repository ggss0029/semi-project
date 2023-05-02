<%@page import="com.udong.board.common.model.vo.BoardCommon"%>
<%@page import="com.udong.board.buy.model.vo.BuyBoard"%>
<%@page import="com.udong.board.buy.model.vo.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	BuyBoard buyb = new BuyBoard();
	if(request.getAttribute("bestPost")!=null){
		BoardCommon b = (BoardCommon)request.getAttribute("bestPost");
		buyb.setBoardTitle(b.getBoardTitle());
		buyb.setBoardWriter(b.getBoardWriter());
		buyb.setCreateDate(b.getCreateDate());
		buyb.setBoardContent(b.getBoardContent());
	}else if(request.getAttribute("buyBoard")!=null){
		buyb = (BuyBoard)request.getAttribute("buyBoard");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>같이 사요</title>
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
		<div id="content">
			<p id="p1">같이 사요</p>
			<button id="report_btn" class="btn btn-basic">신고하기</button>

			<div id="line_1"></div>

			<table border="0" align="center" id="detail-area">
				<tr style="height:80px;">
					<td colspan="2"
						style="height: 50px; font-size: 30px; font-weight: 600; border-bottom: 1px solid black;"><%=buyb.getBoardTitle()%></td>
				</tr>
				<tr style="border-bottom: 1px solid black; height:80px;">
					<td style="height: 50px; font-size: 20px; font-weight: 600; ">
						<a id="nicknameHover" onclick="whoareyou();"><%=buyb.getBoardWriter()%></a>
					</td>
					
					<td style="height: 50px; font-size: 20px; font-weight: 600;"
						align="right"><%=buyb.getCreateDate()%></td>
				</tr>
				<tr style="height: 700px">
					<td colspan="2" style="height: auto; vertical-align : top "><br><%=buyb.getBoardContent()%></td>
					
				</tr>
			</table>
					
				<%
					if (loginUser != null && loginUser.getNickname().equals(buyb.getBoardWriter())) {
				%>
				<div class="board_btn" style="float: right; margin-right: 70px">
					<button
						onclick="location.href = '<%=contextPath%>/updateBoard.bo?bno=<%=buyb.getBoardNo()%>'"
						class="btn btn-secondary">수정</button>
					<button
						onclick="location.href = '<%=contextPath%>/deletePost.bo?bno=<%=buyb.getBoardNo()%>'"
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
							style="resize: none;" disabled>로그인 후 이용 가능한 서비스 입니다.</textarea>
						<div class="input-group-btn">
							<button onclick="insertReply();" class="btn btn-light" type="submit" style="height: 110px" disabled>댓글 등록</button>
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
					buySelectReplyList();
				});

				//댓글 작성
				function insertReply() {
					//게시글 번호 필요
					//게시글 번호 들고가서 성공시 -> 댓글 리스트 조회함수 실행 후 textarea 작성한 것 비워주기
					$.ajax({
						url : "buyInsertReply.bo",
						data : {
							content : $("#replyContent").val(),
							buyBoardNo : <%=buyb.getBoardNo()%>
				},
						type : "post",
						success : function(result) {
							if (result > 0) {
								alert("댓글 작성 완료!");
								buySelectReplyList(); //댓글 리스트 갱신
								$("#replyContent").val(""); // 내용을 작성한 textarea를 다 지워줌
							}
						},
						error : function() {
							alert("댓글 작성 실패");
						}
					});
				}

				//댓글 목록 죄회
				function buySelectReplyList() {
					
					$.ajax({
								url : "buySelectReplyList.bo",
								data : {
									buyBoardNo : <%=buyb.getBoardNo()%>
										},
								success : function(rlist) {
									var result = "";
									if(rlist.length < 1){
										result = "등록한 댓글이 없습니다.";
									}else {
										for ( var i in rlist) {
											result 	+= "<div id='tabs-1'>"
													+ "<div class='list-group'>"
													+ "<div class='list-group-item'>"
													+ "<span class='list-group-item-heading' style='font-size: 23px; font-weight:600'>"
													+ rlist[i].replyWriter
													+ "&nbsp;&nbsp;&nbsp;&nbsp;"
													+ "</span>"
													+ "<span style='font-size: 15px;'>"
													+ rlist[i].createDate
													+ "<button id='delete_reply' class='btn btn-dark btn-sm' onclick='buyDeleteReply(" + rlist[i].replyNo+")' style='float:right'>삭제하기</button>"
													+ "<button id='update_reply' class='btn btn-secondary btn-sm' onclick='buyUpdateReplyForm("+ rlist[i].replyNo + ",\"" + rlist[i].replyWriter + "\"" + ",\"" + rlist[i].createDate + "\"" +",\""+ rlist[i].replyContent+"\");' style='float:right'>수정하기</button>"
													+ "</span><br>"
													+ "<p class='list-group-item-text' style='white-space: pre-line;'>"
													+ rlist[i].replyContent
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
					
					//수정 삭제  버튼 조건 걸어놓는 함수
					function btnCheck(){
						var btn = $("#tabs-1 span button");
						var text = $(".list-group-item-text");
						var loginUser;
						var loginNick;
						var loginUserId;
						<%if(loginUser != null){%>
						loginUser ='<%=loginUser%>'; 
						loginUserId = '<%=loginUser.getUserId()%>'; //로그인 아이디
						loginNick = '<%=loginUser.getNickname()%>'; //로그인 닉네임
						loginBoard = '<%=buyb.getBoardWriter()%>'; //게시글 작성한 닉네임
						<%}%>
						if(loginUser==undefined){ // loginUser가 없으면 'null'로 쓰면 오류남
							$(btn).hide(); // 버튼 숨긴다.
// 							console.log(btn); //확인용
							$(text).html("로그인 후 열람 가능합니다!");
						}else{ //loginUser가 있으면 
							$(".list-group-item-heading").each(function(){ //span 선택
								var nick = $(this).text().trim(); //선택한거(댓글 작성자) 공백 지우기 후 nick에 넣기 /trim()-> 공백제거
// 								console.log(nick);
								if(loginUserId=='admin' || nick == loginNick || loginBoard == loginNick){ //아이디 = admin or 댓글작성자 = 닉네임 or 게시글작성자 = 닉네임
									console.log(loginUserId);
									$(this).next().find("button").show(); // 버튼 보여주기
									
								}else{
									$(this).next().find("button").hide();  //아니면 숨기기
								}
								
							})	
						}
						
						
					}
					
				
					//댓글 삭제
					function buyDeleteReply(replyNo) {
						
						$.ajax({
							url : "buyDeleteReply.bo",
							data : { replyNo : replyNo }, 
							type : "get",
							success : function(result) {
								if (result > 0) {
									alert("댓글 삭제 완료!");
									buySelectReplyList(); //댓글 리스트 갱신
								}
							},
							error : function() {
								alert("댓글 삭제 실패");
							}
					});
					}
					
					//댓글 수정 폼
					function buyUpdateReplyForm(replyNo, replyWriter, createDate, replyContent) {
								var result = "";
									result += "<div id='tabs-1'>"
											+ "<div class='list-group'>"
											+ "<div class='list-group-item'>"
											+ "<span class='list-group-item-heading' style='font-size: 25px'>"
											+ replyWriter
											+ "&nbsp;&nbsp;&nbsp;&nbsp;"
											+ createDate
											+ "<button id='cancel_reply' class='btn btn-dark btn-sm' onclick='buySelectReplyList()' style='float:right'>취소</button> "
											+ "<button id='update_reply' class='btn btn-secondary btn-sm' onclick='buyUpdateReply("+replyNo+")' style='float:right'>수정하기</button>"
											+ "</span>"
											+ "<p class='list-group-item-text'>"
											+ "<textarea id='changeContent' rows='3' class='form-control' style='resize: none;'>"+replyContent+"</textarea>"
											+ "</p>" 
											+ "</div>" 
											+ "</div>"
											+ "</div>"
									
								$("#tabs #tabs-1").html(result);
					}
					
					
					function buyUpdateReply(replyNo, newContent) {
						
						var newContent = $("#changeContent").val();
						$.ajax({
							url:"buyUpdateReply.bo",
							type:"post",
							data: {
								replyNo : replyNo,
								content : newContent
							},
							success : function(result) {
								alert("댓글이 수정되었습니다.");
								buySelectReplyList();
							},
							error : function() {
								alert("댓글 수정 실패...");
							}
						});
					}
			</script>
		</div>
	<%@ include file = "../../common/footer.jsp" %>
</body>
</html>