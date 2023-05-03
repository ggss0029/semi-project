<%@page import="com.udong.board.common.model.vo.BoardCommon"%>
<%@page import="com.udong.board.free.model.vo.FreeAttachment"%>
<%@page import="com.udong.board.free.model.vo.FreeBoard"%>
<%@page import="com.udong.board.free.model.vo.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	FreeBoard fb = new FreeBoard();
	if(request.getAttribute("bestPost")!=null){
		BoardCommon b = (BoardCommon)request.getAttribute("bestPost");
		fb.setBoardTitle(fb.getBoardTitle());
		fb.setBoardWriter(fb.getBoardWriter());
		fb.setCreateDate(fb.getCreateDate());
		fb.setBoardContent(fb.getBoardContent());
	}else if(request.getAttribute("freeBoard")!=null){
		fb = (FreeBoard)request.getAttribute("freeBoard");
	}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유 게시판</title>
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

.free-area {
	/* display: flex; */
	align-items: center;
	width: 100%;
	margin: 10px 0 0 50px;
}

.free-area .free {
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
			<p id="p1">자유게시판</p>
<!-- 			<button id="report_btn" class="btn btn-basic">신고하기</button> -->

			<div id="line_1"></div>

			<table border="0" align="center" id="detail-area">
				<tr style="height:80px;">
					<td colspan="2"
						style="height: 50px; font-size: 30px; font-weight: 600; border-bottom: 1px solid black;"><%=fb.getBoardTitle()%></td>
				</tr>
				<tr style="border-bottom: 1px solid black; height:80px;">
					<td style="height: 50px; font-size: 20px; font-weight: 600; ">
						<a data-toggle="modal" data-target="#profile"><%=fb.getBoardWriter()%></a>
					</td>
					
					<td style="height: 50px; font-size: 20px; font-weight: 600;"
						align="right"><%=fb.getCreateDate()%></td>
				</tr>
				<tr style="height: 700px">
					<td colspan="2" style="height: auto; vertical-align : top "><br>
					<p style="white-space: pre-line;"><%=fb.getBoardContent()%></p></td>
					
				</tr>

			</table>

			<div class="free-area">
					<div class="free" style="float: left;">
						<% if (loginUser != null) %>
							<button type="button" id="free_btn">
								<i class="fas fa-heart"></i>
								
								&nbsp; 
								<span class="free_count"></span> <!-- 추천 수 보여주기 -->
							</button>
					</div>
					
				<%
					if (loginUser != null && loginUser.getNickname().equals(fb.getBoardWriter())) {
				%>
				<div class="board_btn" style="float: right; margin-right: 70px">
					<button
						onclick="location.href = '<%=contextPath%>/freeUpdate.bo?bno=<%=fb.getBoardNo()%>'"
						class="btn btn-secondary">수정</button>
					<button
						onclick="location.href = '<%=contextPath%>/FreeDelete.bo?bno=<%=fb.getBoardNo()%>'"
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
						<textarea id="replyContent" onkeyup="keyupReply();" rows="3" class="form-control"
							style="resize: none;" placeholder="폭언, 비매너 댓글은 상처받아요ㅠ,ㅠ"></textarea>
						<div class="input-group-btn">
							<button onclick="insertReply();" id="writeReply" class="btn btn-light"
								type="submit" style="height: 110px" disabled>댓글 등록</button>
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
		//부트스트랩
			
		
		
			$(function() {
				selectReply();
			});	
			function keyupReply(){
					$("#writeReply").attr("disabled",false);
			}			
		//댓글작성
				function insertReply() {
			
					//게시글 번호 필요
					//게시글 번호 들고가서 성공시 -> 댓글 리스트 조회함수 실행 후 textarea 작성한 것 비워주기
					$.ajax({
						url : "freeReplyInsert.bo",
						data : {
							content : $("#replyContent").val(),
							freeBoardNo : <%=fb.getBoardNo()%>
				},
						type : "post",
						success : function(result) {
							if (result > 0) {
								alert("댓글 작성 완료!");
								selectReply(); //댓글 리스트 갱신
								$("#replyContent").val(""); // 내용을 작성한 textarea를 다 지워줌
							}
						},
						error : function() {
							alert("댓글 작성 실패");
						}
					});
				}
		
		//댓글 목록 조회
		function selectReply(){
			$.ajax({
				url : "freeReplyList.bo",
				data : {
					freeBoardNo : <%=fb.getBoardNo()%>
						},
				success : function(list){
					var result = "";
					if(list.length < 1){
						result = "등록한 댓글이 없습니다.";
					}else{
						for( var i in list){
							result +=  "<div id='tabs-1'>"
								+ "<div class='list-group'>"
								+ "<div class='list-group-item'>"
								+ "<span class='list-group-item-heading' style='font-size: 23px; font-weight:600'>"
								+ list[i].replyWriter
								+ "&nbsp;&nbsp;&nbsp;&nbsp;"
								+ "</span>"
								+ "<span style='font-size: 15px;'>"
								+ list[i].createDate
								+ "<button id='delete_reply' class='btn btn-dark btn-sm' onclick='freeDeleteReply(" + list[i].replyNo+")' style='float:right'>삭제하기</button>"
								+ "<button id='update_reply' class='btn btn-secondary btn-sm' onclick='freeUpdateReplyForm("+ list[i].replyNo + ",\"" + list[i].replyWriter + "\"" + ",\"" + list[i].createDate + "\"" +",\""+ list[i].replyContent+"\");' style='float:right'>수정하기</button>"
								+ "</span><br>"
								+ "<p class='list-group-item-text'>"
								+ list[i].replyContent
								+ "</p>" 
								+ "</div>" 
								+ "</div>"
								+ "</div>"
								
						}
					}
					$("#tabs #tabs-1").html(result);
					btnCheck();
				},
				error : function(){
					alert("댓글 조회 실패!");
				}
			
			});
		};
		
		function btnCheck(){
			var btn = $("#tabs-1 span button"); //#tabs-1>span button
			var loginUser;
			var loginNick;
			var loginUserId;
			<%if(loginUser != null){%>
			loginUser ='<%=loginUser%>'; 
			loginUserId = '<%=loginUser.getUserId()%>'; //로그인 아이디
			loginNick = '<%=loginUser.getNickname()%>'; //로그인 닉네임
			loginBoard = '<%=fb.getBoardWriter()%>'; //게시글 작성한 닉네임
			<%}%>
			if(loginUser==undefined){ // loginUser가 없으면 'null'로 쓰면 오류남
				$(btn).hide(); // 버튼 숨긴다.
//					console.log(btn); //확인용
			}else{ //loginUser가 있으면 
				$(".list-group-item-heading").each(function(){ //span 선택
					var nick = $(this).text().trim(); //선택한거(댓글 작성자) 공백 지우기 후 nick에 넣기 /trim()-> 공백제거
//						console.log(nick);
					if(loginUserId=='admin' || nick == loginNick || loginBoard == loginNick){ //아이디 = admin or 댓글작성자 = 닉네임 or 게시글작성자 = 닉네임
//						console.log(loginUserId);
						$(this).next().find("button").show(); // 버튼 보여주기
						
					}else{
						$(this).next().find("button").hide();  //아니면 숨기기
					}
					
				})	
			}
			
			
		}
		
		
		//댓글 삭제
		function freeDeleteReply(replyNo){
			
			$.ajax({
				url : "freeReplyDelete.bo",
				data : {replyNo : replyNo },
				type : "get",
				success : function(result){
					if(result > 0){
						alert("댓글 삭제 완료!");
						selectReply(); //댓글리스트 갱신
					}
				},
				error : function(){
					alert("댓글 삭제 실패");
				}
				
			});
		}
				
		//댓글 수정 
		function freeUpdateReplyForm(replyNo, replyWriter, createDate,replyContent) {
			var result = "";
			result += "<div id='tabs-1'>"
					+ "<div class='list-group'>"
					+ "<div class='list-group-item'>"
					+ "<span class='list-group-item-heading' style='font-size: 25px'>"
					+ replyWriter
					+ "&nbsp;&nbsp;&nbsp;&nbsp;"
					+ createDate
					+ "<button id='cancel_reply' class='btn btn-dark btn-sm' onclick='selectReply()' style='float:right'>취소</button> "
					+ "<button id='update_reply' class='btn btn-secondary btn-sm' onclick='freeUpdateReply("+replyNo+")' style='float:right'>수정하기</button>"
					+ "</span>"
					+ "<p class='list-group-item-text'>"
					+ "<textarea id='changeContent' rows='3' class='form-control' style='resize: none;'>"+replyContent+"</textarea>"
					+ "</p>" 
					+ "</div>" 
					+ "</div>"
					+ "</div>"
			
		$("#tabs #tabs-1").html(result);
	}
	
	function freeUpdateReply(replyNo , newContent){
		
		var newContent = $("#changeContent").val();
		$.ajax({
			url : "freeUpdateReply.bo",
			type : "post",
			data : {
				replyNo : replyNo,
				content : newContent
			},
			success : function(result){
				alert("댓글 수정되었습니다.");
				selectReply();
			},
			error : function(){
				alert("댓글 수정 실패 ...");
			}
		});
	}
		
	</script>
	
				
				
			

		</div>
	</div>
</body>
</html>