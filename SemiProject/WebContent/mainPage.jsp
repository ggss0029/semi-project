<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.udong.member.model.vo.Member, java.util.ArrayList"%>
<%
	String contextPath = request.getContextPath();
	Member loginUser = (Member)request.getSession().getAttribute("loginUser");
	String alertMsg = (String)request.getSession().getAttribute("alertMsg");
%>
<%request.getSession().setAttribute("count",0);%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
    <title>우리동네 Udong</title>
    <!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<!-- jQuery library -->
	<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
	<!-- Popper JS -->
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<!-- Latest compiled JavaScript -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css"/>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <style>
        #header{
            height: 400px;
        }
        
        #header a {
        	text-decoration: none;
            color: black;
        }
        
        .header_1{
            border-bottom: 1px solid black;
            height: 45%; /*180px*/
/*             background-color: red; */
        }

        .header_1>div {
            float: left;
            box-sizing: border-box;
        }

        #icon {
            width: 26%;
            height: 160px;
            margin: 10px 0.5% 10px 2%;
        }
        
        #icon>img {
        	width: 100%;
        	height: 100%;
        }
        
        #most_search_list {
        	width: 18%;
            margin: 3px 28.5%;
            border: 5px solid lightgray;
            background-color: white;
        	position: fixed;
        	display: none;
        	z-index: 2;
        }
        
        #viewTable {
        	cursor: pointer;
        }
        
        #most_search_list>table {
        	width: 100%;
        }

        #most_search {
            width: 15%;
            height: 63px;
            margin: 58.5px 3% 58.5px 3%;
            border: 5px solid lightgray;
            z-index: 1;
        }
        
        #most_search>div {
        	float: left;
        }

        .swiper-slide>table {
            width: 100%;
            height: 100%;
        }

        #totalSearch {
            width: 20%;
            height: 36px;
            margin: 72px 3% 72px 3%;
        }

        #totalSearch_form {
            width: 100%;
            height: 100%;
        }
        
        #totalSearch_form>div {
            float: left;
            height: 100%;
        }

        #totalSearch_text {
            width: 87%;
        }
        
        #totalSearch_text>input {
            width: 100%;
            height: 100%;
        }

        #totalSearch_btn {
            width: 13%;
        }

        #totalSearch_btn * {
            width: 100%;
            height: 100%;
        }

        #login_area, #member_area {
            width: 20%;
            height: 100%;
            margin: 0px 0px 0px 1%;
        }

        #login, #enroll {
            width: 40%;
            height: 40px;
            margin: 70px 3% 70px 3%;
        }

        #logout {
            margin-top: 5%;
        	margin-bottom: 5%;
            width: 100%;
            height: 15%;
        }
        
        #user_info {
            width: 100%;
            height: 75%;
        }
        
        #user_info>div {
            width: 33%;
            height: 100%;
            float: left;
        }

        .header_2{
            height: 55%;
            border-bottom: 1px solid black;
/*             background-color: orange; */
        }
        
        .header_2>div {
        	width: 14%;
        	height: 100%;
        	float: left;
        	align-items: center;
        }
        
        .header_2>div * {
        	display: block;
        }
        
        .header_2>div>a {
        	width: 70%;
        	height: 70%;
        	margin:15% auto;
        	font-size: 18px;
        	font-weight: 550;
        }
        
        .header_2>div>a>img {
        	width: 70%;
        	height: 70%;
        	margin: 15% auto;
        }

       .outer{
            width: 1500px;
            height: 1400px;
            margin: auto;
            border-left: 1px solid black;
            border-right: 1px solid black;
            border-bottom: 1px solid black;
        }

        .outer>div{
            height: 100%;
            width: 100%;
        }

        #content{
            height: 1400px;
        }

        .content_1 {
            width: 100%;
            height: 35%;
            border-bottom: 1px solid black;
        }

        .content_1>div {
            float: left;
            width: 50%;
            height: 100%;
        }

        .c1 {
/*             background-color: yellow; */
            border-right: 1px solid black;
/*             overflow: hidden; */
        }
        
        .c1>div {
        	width: 100%;
        }
        
        .c1_title {
        	height: 99px;
        }
        
        .c1_title>* {
        	float:left;
        }
        
        .contentline1 {
        	height: 1px;
        }
        
        .c1_table {
        	height: 390px;
        }
        
        .c1_table>table {
        	width: 80%;
        	height: 80%;
        	margin-top: 39px;
        	margin-left: 10%;
        }

        .c2 {
/*             background-color: green; */
        }
        
        .c2>div {
        	width: 100%;
        }
        
        .c2_title>* {
        	float:left;
        }
        
        .c2_table>table {
        	width: 80%;
        	height: 80%;
        	margin: 40px 10%;
        }

        .content_2 {
/*             background-color: blue; */
            width: 100%;
            height: 32.5%;
            border-bottom: 1px solid black;
        }

        .content_3 {
/*             background-color: pink; */
            width: 100%;
            height: 32.5%;
            border-bottom: 1px solid black;
        }
        
        .content_2>div, .content_3>div {
            width: 100%;
        }

        .c3, .c4 {
            height: 20%;
        }
        
        .c3 *, .c4 * {
        	float: left;
        }

        #footer{
            height: 200px;
            background-color: rgb(240, 240, 240);
        }
        
        #footer>div{
            width: 100%;
        }

        #footer_1{
            height: 20%;
        }
        
        #footer_1>a {
        	text-decoration: none;
            color: black;
            font-weight: 600;
            margin: 15px;
            vertical-align: middle; 
        }

        #footer_2{
            height: 80%;
        }
        
        #footer_2>p {
            text-align: center;
        }
        
        .boardNameTag{
        	margin: 0 auto;
        	text-align:center; 
        	width:140px; 
        	border-radius:5px; 
        	font-size: 17px;
        	font-height: 530;
         	color:white;
        }
        
        .bgc1 { background-color: #BE5EC2; }
        .bgc2 { background-color: #F862A7; }
        .bgc3 { background-color: #FF7B87; }
        .bgc4 { background-color: #FFA26A; }
        .bgc5 { background-color: #FFCE5E; }
        .bgc6 { background-color: #F9F871; color:black; }
        .bgc7 { background-color: #9BDE7E; }
        .bgc8 { background-color: #4BBC8E; }
        .bgc9 { background-color: #1C6E7D; }

        .main_swiper1 { position: relative; height: 80%; }
        .main_swiper2 { position: relative; height: 80%; }
		.swiper { width: 85%; height: 100%; }
        .swiper1 { position: absolute; width: 90%; height: 100%; margin: 0px 5% auto; overflow: hidden; }
        .swiper2 { position: absolute; width: 90%; height: 100%; margin: 0px 5% auto; overflow: hidden; }
        .swiper-pagination { position: absolute; margin-bottom: 10px; }
        .swiper-pagination-bullet { width: 10px; height: 10px; background: transparent; border: 1px solid lightgray; opacity: 1; margin: 0px 2px;}
        .swiper-pagination-bullet-active { width: 20px; transition: width .5s; border-radius: 5px; background: lightgray; border: 1px solid transparent; }
        .swiper-slide { width: 250px; height: 250px; margin: auto; box-sizing: border-box; }
        div[class*=keyword] { width: 100%; height: 100%; margin: auto; box-sizing: border-box; }
        .swiper-slide.slide01 { background-color: #BE5EC2; }
        .swiper-slide.slide02 { background-color: #F862A7; }
        .swiper-slide.slide03 { background-color: #FF7B87; }
        .swiper-slide.slide04 { background-color: #FFA26A; }
        .swiper-slide.slide05 { background-color: #FFCE5E; }
        .swiper-slide.slide06 { background-color: #F9F871; }
        .swiper-slide.slide07 { background-color: #9BDE7E; }
        .swiper-slide.slide08 { background-color: #4BBC8E; }
        .swiper-slide.slide09 { background-color: #039590; }
        .swiper-slide.slide10 { background-color: #1C6E7D; }
        div[class*=swiper-button] {position: absolute; margin-top: -40px;}
        .swiper-button-prev { margin-left: 1px;}
        .swiper-button-next { margin-right: 1px; }
    </style>
</head>
<body>
<script>
	var msg = "<%=alertMsg%>";
	var ms = new Array(10);
	
	if(msg != "null") {
		alert(msg);
		<%request.getSession().removeAttribute("alertMsg");%>
	}
	
	$(function() {
		var now = new Date();
		var hour = now.getHours();
		var min = now.getMinutes();
		var sec = now.getSeconds();
		var milsec = now.getMilliseconds();
		var renewTime = (60-min-1)*60*1000 + (60-sec)*1000 + (1000-milsec); // 정각까지 얼마나 차이나는지 계산
		
		function callback() {
			$.ajax({
				url: "mostSearch.do",
				success: function(mostSearch) {
					$(mostSearch).each(function(index, value) {
						console.log(index + ", " + value);
						$("."+(index+1)).text(value);
					});
				},
				error: function() {
					console.log("통신 실패");
				}
			});
		}
		
		function callback2() {
			setInterval(callback, 1000*60*60);
		}
		
		function showBestPost() {
			$.ajax({
				url: "bestPost.bo",
				method: "post",
				success: function(list) {
					var str = "";
					
					for(var i=0;i<5;i++) {
						var j=0;
						switch(list[i].boardName) {
							case "동네 소식":
								j=1;
								break;
							case "살림 꿀팁":
								j=2;
								break;
							case "자취 레시피":
								j=3;
								break;
							case "동네 맛집":
								j=4;
								break;
							case "나눔 할게요":
								j=5;
								break;
							case "이거 필요해요":
								j=6;
								break;
							case "같이 해요":
								j=7;
								break;
							case "같이 사요":
								j=8;
								break;
							case "자유 게시판":
								j=9;
								break;
						};
						
						if(i==0) {
							str += "<tr>"
								 + "<td style='color:red; width: 15%; font-size: 20px; font-weight:550; text-align:center;'>" + (i+1) + "</td>";
						}
						else {
							str += "<tr>"
								 + "<td style='font-size: 20px; font-weight:550; text-align:center;'>" + (i+1) + "</td>";
						}
						str += "<td style='width: 25%;'><div class='boardNameTag bgc" + j + "'>" + list[i].boardName + "</div></td>"
							 + "<td style='font-size: 20px;'>" + list[i].boardTitle + "</td>"
							 + "</tr>";
					}
					
					$(".c1_table").children().html(str);
				},
				error: function() {
					console.log("통신 실패");
				}
			});
		}
		
		function showLastestPost() {
			$.ajax({
				url: "lastestPost.bo",
				method: "post",
				success: function(list) {
					var str = "";
					
					for(var i=0;i<list.length;i++) {
						var j=0;
						switch(list[i].boardName) {
							case "동네 소식":
								j=1;
								break;
							case "살림 꿀팁":
								j=2;
								break;
							case "자취 레시피":
								j=3;
								break;
							case "동네 맛집":
								j=4;
								break;
							case "나눔 할게요":
								j=5;
								break;
							case "이거 필요해요":
								j=6;
								break;
							case "같이 해요":
								j=7;
								break;
							case "같이 사요":
								j=8;
								break;
							case "자유 게시판":
								j=9;
								break;
						};
						
						str += "<tr>"
						 	 + "<td style='width: 25%;'><div class='boardNameTag bgc" + j +"'>" + list[i].boardName + "</div></td>"
						 	 + "<td style='font-size: 20px;'>" + list[i].boardTitle + "</td>"
						 	 + "</tr>";
					}
					
					$(".c2_table").children().html(str);
				},
				error: function() {
					console.log("통신 실패");
				}
			});
		}
		
		callback();
		setTimeout(callback, renewTime); // 시간 계산 후 정각에 가져옴
		setTimeout(callback2, renewTime); // 정각마다 검색어 순위 top10 가져옴
		showBestPost();
		showLastestPost();
	});
</script>
    <div id="header">
        <div class="header_1">
            <div id="icon" onclick="mainPage();">
                <img src="views/common/icons/우동 로고.png" alt="아이콘">
            </div>
            <div id="most_search_list">
            	<table>
            		<tr>
            			<td colspan="2" align="right"><button style="border:0;" onclick="closeList();">&times;</button></td>
            		</tr>
            		<tr>
	                    <td width="50" align="center" style="font-weight: 700; font-size: 22px">1</td>
	                    <td style="font-size: 20px;" class="1"></td>
                    </tr>
                    <tr>
                        <td width="50" align="center" style="font-weight: 700; font-size: 22px">2</td>
                        <td style="font-size: 20px;" class="2"></td>
                    </tr>
                    <tr>
                        <td width="50" align="center" style="font-weight: 700; font-size: 22px">3</td>
                        <td style="font-size: 20px;" class="3"></td>
                    </tr>
                    <tr>
                        <td width="50" align="center" style="font-weight: 700; font-size: 22px">4</td>
                        <td style="font-size: 20px;" class="4"></td>
                    </tr>
                    <tr>
                        <td width="50" align="center" style="font-weight: 700; font-size: 22px">5</td>
                        <td style="font-size: 20px;" class="5"></td>
                    </tr>
                    <tr>
                        <td width="50" align="center" style="font-weight: 700; font-size: 25px">6</td>
                        <td style="font-size: 20px;" class="6"></td>
                    </tr>
                    <tr>
                        <td width="50" align="center" style="font-weight: 700; font-size: 22px">7</td>
                        <td style="font-size: 20px;" class="7"></td>
                    </tr>
                    <tr>
                        <td width="50" align="center" style="font-weight: 700; font-size: 22px">8</td>
                        <td style="font-size: 20px;" class="8"></td>
                    </tr>
                    <tr>
                        <td width="50" align="center" style="font-weight: 700; font-size: 22px">9</td>
                        <td style="font-size: 20px;" class="9"></td>
                    </tr>
                    <tr>
                        <td width="50" align="center" style="font-weight: 700; font-size: 22px">10</td>
                        <td style="font-size: 20px;" class="10"></td>
                    </tr>
            	</table>
            </div>
            <div id="most_search">
                <div class="swiper-container swiper">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide keyword1">
                            <table>
                                <tr>
                                    <td width="50" align="center" style="font-weight: 700; font-size: 22px">1</td>
                                    <td style="font-size: 20px;" class="1"></td>
                                </tr>
                            </table>
                        </div>
                        <div class="swiper-slide keyword2">
                            <table>
                                <tr>
                                    <td width="50" align="center" style="font-weight: 700; font-size: 22px">2</td>
                                    <td style="font-size: 20px;" class="2"></td>
                                </tr>
                            </table>
                        </div>
                        <div class="swiper-slide keyword3">
                            <table>
                                <tr>
                                    <td width="50" align="center" style="font-weight: 700; font-size: 22px">3</td>
                                    <td style="font-size: 20px;" class="3"></td>
                                </tr>
                            </table>
                        </div>
                        <div class="swiper-slide keyword4">
                            <table>
                                <tr>
                                    <td width="50" align="center" style="font-weight: 700; font-size: 22px">4</td>
                                    <td style="font-size: 20px;" class="4"></td>
                                </tr>
                            </table>
                        </div>
                        <div class="swiper-slide keyword5">
                            <table>
                                <tr>
                                    <td width="50" align="center" style="font-weight: 700; font-size: 22px">5</td>
                                    <td style="font-size: 20px;" class="5"></td>
                                </tr>
                            </table>
                        </div>
                        <div class="swiper-slide keyword6">
                            <table>
                                <tr>
                                    <td width="50" align="center" style="font-weight: 700; font-size: 22px">6</td>
                                    <td style="font-size: 20px;" class="6"></td>
                                </tr>
                            </table>
                        </div>
                        <div class="swiper-slide keyword7">
                            <table>
                                <tr>
                                    <td width="50" align="center" style="font-weight: 700; font-size: 22px">7</td>
                                    <td style="font-size: 20px;" class="7"></td>
                                </tr>
                            </table>
                        </div>
                        <div class="swiper-slide keyword8">
                            <table>
                                <tr>
                                    <td width="50" align="center" style="font-weight: 700; font-size: 22px">8</td>
                                    <td style="font-size: 20px;" class="8"></td>
                                </tr>
                            </table>
                        </div>
                        <div class="swiper-slide keyword9">
                            <table>
                                <tr>
                                    <td width="50" align="center" style="font-weight: 700; font-size: 22px">9</td>
                                    <td style="font-size: 20px;" class="9"></td>
                                </tr>
                            </table>
                        </div>
                        <div class="swiper-slide keyword10">
                            <table>
                                <tr>
                                    <td width="50" align="center" style="font-weight: 700; font-size: 22px">10</td>
                                    <td style="font-size: 20px;" class="10"></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div style="width:15%;">
                	<p style="font-weight: 700; font-size: 30px" onclick="showList();" id="viewTable">∨</p>
                </div>
            </div>
            <div id="totalSearch">
                <form action="totalSearch.do" id="totalSearch_form">
                	<input type="hidden" name="currentPage" value="1">
                    <div id="totalSearch_text"><input type="search" name="inputKeyword"></div>
                    <div id="totalSearch_btn"><button><img src="views/common/icons/돋보기.png" alt=""></button></div>
                </form>
            </div>
            <%if(loginUser==null) {%>
            	<div id="login_area">
                	<button id="login" class="btn btn-outline-dark" onclick="login();">로그인</button>
                	<button id="enroll" class="btn btn-outline-dark" onclick="enroll();">회원가입</button>
            	</div>
            <%} else { %>
            	<div id="member_area" align="center">
					<div id="logout">
                    	<b><%=loginUser.getNickname() %> 님</b> <a href="<%=contextPath%>/logout.me">로그아웃</a> <br>
	                </div>
	                <div id="user_info" align="center">
	                    <div id="myPage">
		                    <a href="<%=contextPath %>/views/member/mypage/myInfo.jsp" id="myPage"><img alt="마이페이지 아이콘" src="<%=contextPath %>/views/common/icons/마이페이지.png" id="myPageIcon" style="width: 70px; height:70px;"><br>마이페이지</a>
		                </div>
		                <div>
		                	<a href="<%=contextPath%>/sendLetterList.le?writerNo=<%=loginUser.getUserNo()%>&currentPage=1" id="letter"><img alt="쪽지아이콘" src="<%=contextPath %>/views/common/icons/쪽지함.png" id="letterIcon" style="width: 70px; height:70px;"><br>쪽지함</a>
		                </div>
		                <div id="likeBoard">
		                	<a href="https://www.daum.net" id="likeBoard"><img alt="좋아요게시글 아이콘" src="<%=contextPath %>/views/common/icons/관심.png" id="likeBoardIcon" style="width: 70px; height:70px;"><br>관심</a>
		                </div>
	                </div>
            	</div>
            <%} %>
        </div>
        
        <script>
	        $(function() {
	    		window.onpageshow = function(event) {
	    		    if ( event.persisted || (window.performance && window.performance.navigation.type == 2)) {
	    		        // Back Forward Cache로 브라우저가 로딩될 경우 혹은 브라우저 뒤로가기 했을 경우
	    		        location.reload();
	    		    }
	    		}
	    	});
	        
        	function mainPage() {
        		location.href = "<%=contextPath%>";
        	}
        
        	function showList() {
        		$("#most_search_list").css("display", "block");
        	};
        	
        	function closeList() {
        		$("#most_search_list").css("display", "none");
        		swiper.autoplay.start();
        	}
        
        	function login() {
        		location.href = "<%=contextPath%>/login.me";
        	};
        
        	function enroll() {
        		location.href = "<%=contextPath%>/enroll.me";
        	};
        </script>
            
        <div class="header_2">
            <div style="margin-left:3%"><a align="center" href="<%=contextPath %>/newsList.bo?currentPage=1"><img src="views/common/icons/정보공유.png" alt="정보공유">정보 공유</a></div>
            <div style="margin-left:2%"><a align="center" href=""><img src="views/common/icons/동네맛집.png" alt="동네맛집">동네 맛집</a></div>
            <div style="margin-left:2%"><a align="center" href=""><img src="views/common/icons/나눔.png" alt="나눔">나눔</a></div>
            <div style="margin-left:2%"><a align="center" href=""><img src="views/common/icons/함께해요.png" alt="함께해요">함께 해요 </a></div>
            <div style="margin-left:2%"><a align="center" href="<%=contextPath %>/FreeBoardList.bo?currentPage=1"><img src="views/common/icons/자유게시판.png" alt="자유게시판">자유게시판</a></div>
            <div style="margin-left:2%; margin-right:3%"><a align="center" href=""><img src="views/common/icons/소식.png" alt="소식">소식</a></div>
        </div>
    </div>
    <div class="outer">
        <div id="content">
            <div class="content_1">
                <div class="c1">
                	<div class="c1_title">
                		<p style="padding:0; margin:20px; font-size: 40px">인기글</p>
                		<button style="margin-left: 470px; margin-top: 30px;" class="btn" onclick="bestPost();">더보기 ></button>
                	</div>
                	<div style="background-color:black; height:1px"></div>
                	<div class="c1_table">
                		<table></table>
                	</div>
                </div>
                <div class="c2">
                	<div class="c2_title" style="height: 99px">
                		<p style="padding:0; margin:20px; font-size: 40px">최신글</p>
                	</div>
                	<div style="background-color:black; height:1px"></div>
                	<div class="c2_table" style="height: 390px">
                		<table></table>
                	</div>
                </div>
            </div>
            <div class="content_2">
                <div class="c3">
                	<p style="padding:0; margin:16px; font-size: 40px; font-weight: 500;">동네 맛집</p>
                	<button style="margin-top:25px; margin-left:1150px;" class="btn">더보기 ></button>
                </div>
                <div class="main_swiper1">
                    <div class="swiper-container swiper1">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide slide01"></div>
                            <div class="swiper-slide slide02"></div>
                            <div class="swiper-slide slide03"></div>
                            <div class="swiper-slide slide04"></div>
                            <!-- <div class="swiper-slide slide05"></div> -->
                            <div class="swiper-slide slide06"></div>
                            <div class="swiper-slide slide07"></div>
                            <div class="swiper-slide slide08"></div>
                            <!-- <div class="swiper-slide slide09"></div> -->
                            <div class="swiper-slide slide10"></div>
                        </div>
                    </div>
                    <div class="swiper-button-prev sb1_1"></div>
                    <div class="swiper-button-next sb1_2"></div>
                    <div class="swiper-pagination sp1"></div>
                </div>
            </div>
            <div class="content_3" >
                <div class="c4">
                	<p style="padding:0; margin:16px; font-size: 40px; font-weight: 500;">나눔 할게요</p>
                	<button style="margin-top:25px; margin-left:1150px;" class="btn">더보기 ></button>
                </div>
                <div class="main_swiper2">
                    <div class="swiper-container swiper2">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide slide01"></div>
                            <div class="swiper-slide slide02"></div>
                            <div class="swiper-slide slide03"></div>
                            <div class="swiper-slide slide04"></div>
                            <!-- <div class="swiper-slide slide05"></div> -->
                            <div class="swiper-slide slide06"></div>
                            <div class="swiper-slide slide07"></div>
                            <div class="swiper-slide slide08"></div>
                            <!-- <div class="swiper-slide slide09"></div> -->
                            <div class="swiper-slide slide10"></div>
                        </div>
                    </div>
                    <div class="swiper-button-prev sb2_1"></div>
                    <div class="swiper-button-next sb2_2"></div>
                    <div class="swiper-pagination sp2"></div>
                </div>
            </div>
        </div>
    </div>
    <div id="footer">
    	<div style="height:20px;"></div>
    	<div id="footer_1">
    		<a href="https://github.com/hansuung/SEMI-PROJECT">조원 깃허브페이지</a> |
            <a href="<%=contextPath%>/policy.do">개인정보취급방침</a> | 
            <a>서울특별시 영등포구 선유동2로 57 이레빌딩(구관) 19F, 20F</a>
    	</div>
    	<div id="footer_2">
	    	<p><b>조장</b> 한성</p>
	    	<p><b>조원</b> 권수지, 안채영, 정희재</p>
	    	<p><b>문의</b> dlstmxk12@naver.com</p>
	    	<p>Copyright © 2023 SEMI-PROJECT KH DANGSAN WEB DEVELOPMENT CLASS6 GROUP3 All Right Reserved</p>
    	</div>
    </div>

    <script>
    	function bestPost() {
    		location.href = "<%=contextPath%>/bestPost.bo";
    	}
    
    	let swiper = new Swiper('.swiper', {
            direction: 'vertical',
            loop: true,
            spaceBetween: 30,
            slidesPerView: 1,
            autoplay: {
                delay: 2000,
                disableOnInteraction: false,
            },
            effect: 'slide',
            observer: true,
            observeParents: true
        });
    
        let swiper1 = new Swiper('.swiper1', {
            loop: true,
            spaceBetween: 30,
            slidesPerView: 4,
            autoplay: {
                delay: 1000,
                disableOnInteraction: false,
            },
            pagination: {
                el: '.sp1',
                clickable: true,
                type: 'bullets',
            },
            navigation: {
                nextEl: '.sb1_2',
                prevEl: '.sb1_1'
            },
            effect: 'slide',
            observer: true,
            observeParents: true
        });

        let swiper2 = new Swiper('.swiper2', {
            loop: true,
            spaceBetween: 30,
            slidesPerView: 4,
            autoplay: {
                delay: 1500,
                disableOnInteraction: false,
            },
            pagination: {
                el: '.sp2',
                clickable: true,
                type: 'bullets',
            },
            navigation: {
                nextEl: ' .sb2_2',
                prevEl: ' .sb2_1',
            },
            effect: 'slide',
            observer: true,
            observeParents: true
        });
    </script>
</body>
</html>