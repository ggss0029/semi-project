<%@page import="com.udong.board.common.model.vo.Attachment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.udong.board.common.model.vo.BoardCommon"%>
<%@page import="com.udong.board.food.model.vo.FoodBoard"%>
<%@page import="com.udong.board.news.model.vo.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	FoodBoard fb = new FoodBoard();
	if(request.getAttribute("bestPost")!=null){
		BoardCommon b = (BoardCommon)request.getAttribute("bestPost");
		fb.setBoardTitle(b.getBoardTitle());
		fb.setBoardWriter(b.getBoardWriter());
		fb.setCreateDate(b.getCreateDate());
		fb.setBoardContent(b.getBoardContent());
	}else if(request.getAttribute("fb")!=null){
		fb = (FoodBoard)request.getAttribute("fb");
	}
	ArrayList<Attachment> alist = (ArrayList<Attachment>)request.getAttribute("alist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동네 맛집</title>
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
#foodWriter>a:hover{
	cursor:pointer;
}
</style>
</head>
<body>
	<%@ include file="../../common/menubar.jsp"%>

	<div class="wrap">
		<div id="content">
			<p id="p1">동네 맛집</p>
			<button id="report_btn" class="btn btn-basic">신고하기</button>

			<div id="line_1"></div>

			<table border="0" align="center" id="detail-area">
				<tr style="height:80px;">
					<td colspan="4"
						style="height: 50px; font-size: 30px; font-weight: 600; border-bottom: 1px solid black;"><%=fb.getBoardTitle()%></td>
				</tr>
				<tr style="border-bottom: 1px solid black; height:80px;">
					<td style="height: 50px; font-size: 20px; font-weight: 600;" id="foodWriter" colspan="3">
						작성자 <a data-toggle="modal" data-target="#profile"><%=fb.getBoardWriter()%></a>
					</td>
					<td style="height: 50px; font-size: 20px; font-weight: 600;"
						align="right">조회수 <%=fb.getCount()%> &nbsp;&nbsp;  작성일 <%=fb.getCreateDate()%></td>
				</tr>
				<tr>
					<td style="height: 50px; font-size: 30px; font-weight: 600; border-bottom: 1px solid black;">식당 이름 : <%=fb.getRegion().substring(0,fb.getRegion().indexOf("$")) %></td>
					<td colspan="3" style="height: 50px; font-size: 30px; font-weight: 600; border-bottom: 1px solid black;">식당 주소 : <%=fb.getRegion().substring(fb.getRegion().indexOf("$")+1,fb.getRegion().length())%></td>
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
				<tr style="height: auto">
					<td colspan="4" style="height: auto; vertical-align : top "><br><%=fb.getBoardContent()%></td>
				</tr>
			</table>
			<br><br>
<div id="map" style="width:100%;height:350px;"></div>
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7122a55dfee4ed591b995856dce3e752&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), 
        level: 3 
    };  

var map = new kakao.maps.Map(mapContainer, mapOption); 

var geocoder = new kakao.maps.services.Geocoder();

geocoder.addressSearch("<%=fb.getRegion().substring(fb.getRegion().indexOf("$")+1,fb.getRegion().length())%>", function(result, status) {

     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;"><%=fb.getRegion().substring(0,fb.getRegion().indexOf("$")) %></div>'
        });
        infowindow.open(map, marker);

        map.setCenter(coords);
    } 
});    
</script>

			<div class="like-area">
					<div class="like" style="float: left;">
						<% if (loginUser != null) %>
							<button type="button" id="like_btn">
								<i class="fas fa-heart"></i>
								
								&nbsp; 
								<span class="like_count"></span> <!-- 추천 수 보여주기 -->
							</button>
					</div>
					
				<%
					if (loginUser != null && loginUser.getNickname().equals(fb.getBoardWriter())) {
				%>
				<div class="board_btn" style="float: right; margin-right: 70px">
					<button
						onclick="location.href = '<%=contextPath%>/newsUpdate.bo?bno=<%=fb.getBoardNo()%>'"
						class="btn btn-secondary">수정</button>
					<button
						onclick="location.href = '<%=contextPath%>/deletePost.bo?bno=<%=fb.getBoardNo()%>'"
						class="btn btn-dark">삭제</button>
				</div>
				<%
					}
				%>
				<br clear="both">
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
// 				$(function() {
// 					$("#tabs").tabs();
// 				});

				$(function() {
					foodSelectReplyList();
				});

				function insertReply() {
					$.ajax({
						url : "foodInsertReply.bo",
						data : {
							content : $("#replyContent").val(),
							foodBoardNo : <%=fb.getBoardNo()%>,
							<%if(loginUser != null){%>
								userNo : <%=loginUser.getUserNo()%>
							<%}%>
				},
						type : "post",
						success : function(result) {
							if (result > 0) {
								alert("댓글 작성 완료!");
								foodSelectReplyList();
								$("#replyContent").val("");
							}
						},
						error : function() {
							alert("댓글 작성 실패");
						}
					});
				}

				//댓글 목록 죄회
				function foodSelectReplyList() {
					
					$.ajax({
								url : "foodSelectReplyList.bo",
								data : {
									boardNo : <%=fb.getBoardNo()%>
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
													+ "<button id='delete_reply' class='btn btn-dark btn-sm' onclick='foodDeleteReply(" + flist[i].replyNo+")' style='float:right'>삭제하기</button>"
													+ "<button id='update_reply' class='btn btn-secondary btn-sm' onclick='foodUpdateReplyForm("+ flist[i].replyNo + ",\"" + flist[i].replyWriter + "\"" + ",\"" + flist[i].createDate + "\"" +",\""+ flist[i].replyContent+"\");' style='float:right'>수정하기</button>"
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
								},
								error : function() {
									alert("댓글 조회 실패!");
								}
							});
					};
					
					function foodDeleteReply(replyNo) {
						
						$.ajax({
							url : "foodDeleteReply.bo",
							data : { replyNo : replyNo }, 
							type : "get",
							success : function(result) {
								if (result > 0) {
									alert("댓글 삭제 완료!");
									foodSelectReplyList(); //댓글 리스트 갱신
								}
							},
							error : function() {
								alert("댓글 삭제 실패");
							}
					});
					}
					
					function foodUpdateReplyForm(replyNo, replyWriter, createDate, replyContent) {
								var result = "";
									result += "<div id='tabs-1'>"
											+ "<div class='list-group'>"
											+ "<div class='list-group-item'>"
											+ "<span class='list-group-item-heading' style='font-size: 25px'>"
											+ replyWriter
											+ "&nbsp;&nbsp;&nbsp;&nbsp;"
											+ createDate
											+ "<button id='cancel_reply' class='btn btn-dark btn-sm' onclick='foodSelectReplyList()' style='float:right'>취소</button> "
											+ "<button id='update_reply' class='btn btn-secondary btn-sm' onclick='foodUpdateReply("+replyNo+")' style='float:right'>수정하기</button>"
											+ "</span>"
											+ "<p class='list-group-item-text'>"
											+ "<textarea id='changeContent' rows='3' class='form-control' style='resize: none;'>"+replyContent+"</textarea>"
											+ "</p>" 
											+ "</div>" 
											+ "</div>"
											+ "</div>"
									
								$("#tabs #tabs-1").html(result);
					}
					
					
					function foodUpdateReply(replyNo, newContent) {
						
						var newContent = $("#changeContent").val();
						$.ajax({
							url:"foodUpdateReply.bo",
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
	<%@ include file = "../../common/footer.jsp" %>
</body>
</html>