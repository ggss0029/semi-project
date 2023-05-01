<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.udong.member.model.vo.Member"%>
<%
	String contextPath = request.getContextPath();
	Member loginUser = (Member)request.getSession().getAttribute("loginUser");
	String alertMsg = (String)request.getSession().getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
        .header {
            border-bottom: 1px solid black;
            height: 180px;
        }

        .header>div {
            float: left;
            box-sizing: border-box;
        } 
        
        .header a {
        	text-decoration: none;
            color: black;
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
        	z-index: 3;
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
        
        #totalSearch_btn {
            width: 13%;
        }
        
        #totalSearch_text>input {
            width: 100%;
            height: 100%;
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
        
        #myPage * {
        	width: 100%;
        	height: 100%
        }

        .menubar {
            border-bottom: 1px solid black;
            height: 90px;
        }

        #menu {
            box-sizing: border-box;
            list-style-type: none;
            margin: 0 auto;
            padding: 0;
            height: 100%;
        }
        
        #menu * {
			background-color: rgba(255, 255, 255, 0.5);
			position:relative;
			z-index: 2;
        }

        #menu>li {
            display: inline-block;
            width: 16%;
            height: 100%;
            text-align: center;
            vertical-align: top;
            box-sizing: border-box;
        }

        #menu a {
            text-decoration: none;
            color: black;
            font-size: 30px;
            font-weight: 500;
            width: 100%;
            height: 100%;
            display: block;
            line-height: 90px;
        }

        #menu a:hover {
            color: #8EEC91;
/*             color: #C8EDC9; */
            font-weight: 600;
        }

        #menu>li>ul {
            list-style-type: none;
            padding: 0;
            display: none;
            z-index: 100;
        }

        #menu>li>ul a{
            font-size: 20px;
        }
        
        #menu>li>ul a:hover {
        	font-weight: 600;
        }

        /*a태그에 마우스가 올라갔을 때 옆에 있는 ul 보이게*/
        #menu>li>a:hover+ul {
            display: block;
        }

        /*서브 메뉴에도 마우스가 올라가면 보이게*/
        #menu>li>ul:hover {
            display: block;
        }
        
        .swiper { width: 85%; height: 100%; }
        div[class*=keyword] { width: 100%; height: 100%; margin: auto; box-sizing: border-box; }
        
        <%if(loginUser != null) {%>
	        #nicknameHover:hover {
	        	cursor: pointer;
	        	font-weight:600;
	        }
	    <%}%>
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
		var renewTime = (60-min)*60*1000 + (60-sec)*1000 + (1000-milsec) - 1; // 정각까지 얼마나 차이나는지 계산
		
		function callback() {
			$.ajax({
				url: "<%=contextPath%>/mostSearch.do",
				success: function(mostSearch) {
					$(mostSearch).each(function(index, value) {
						<!--console.log(index + ", " + value);-->
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
		callback();
		setTimeout(callback, renewTime); // 시간 계산 후 정각에 가져옴
		setTimeout(callback2, renewTime); // 정각마다 검색어 순위 top10 가져옴
	});
</script>
    <div class="header">
        <div id="icon" onclick="mainPage();">
            <img src="<%=contextPath %>/views/common/icons/우동 로고.png" alt="아이콘">
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
            		<td width="50" align="center" style="font-weight: 700; font-size: 22px">6</td>
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
        		<div id="totalSearch_btn"><button><img alt="돋보기" src="<%=contextPath %>/views/common/icons/돋보기.png"></button></div>
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
	                    <a href="<%=contextPath %>/views/member/mypage/myInfo.jsp"><img alt="마이페이지 아이콘" src="<%=contextPath %>/views/common/icons/마이페이지.png" style="width: 70px; height:70px;"><br>마이페이지</a>
	                </div>
	                <div>
	                	<a href="<%=contextPath%>/sendLetterList.le?writerNo=<%=loginUser.getUserNo()%>&currentPage=1"><img alt="쪽지아이콘" src="<%=contextPath %>/views/common/icons/쪽지함.png" style="width: 70px; height:70px;"><br>쪽지함</a>
	                </div>
	                <div id="likeBoard">
	                	<a href="<%=contextPath %>/likeList.me?currentPage=1"><img alt="좋아요게시글 아이콘" src="<%=contextPath %>/views/common/icons/관심.png" style="width: 70px; height:70px;"><br>관심</a>
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
    	})
    
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
    
    <div class="menubar">
        <ul id="menu">
            <li style="margin-left:2%">
                <a style="cursor: default;">정보 공유</a>
                <ul>
                    <li><a href="<%=contextPath %>/newsList.bo?currentPage=1">동네 소식</a></li>
                    <li><a href="<%=contextPath %>/cleanList.bo?currentPage=1">살림 꿀팁</a></li>
                    <li><a href="">자취 레시피</a></li>
                </ul>
            </li><li><a href="<%=contextPath %>/foodList.bo?currentPage=1">동네 맛집</a></li><li>
                <a href="<%=contextPath %>/giveList.bo?currentPage=1" style="cursor: default;">나눔</a>
                <ul>
                    <li><a href="">나눔할게요</a></li>
                    <li><a href="">이거 필요해요</a></li>
                </ul>
            </li><li>
                <a style="cursor: default;">함께 해요</a>
                <ul>
                    <li><a href="<%=contextPath%>/togetherList.bo?cPage=1">같이 해요</a></li>
                    <li><a href="<%=contextPath %>/buyList.bo?currentPage=1">같이 사요</a></li>
                </ul>
            </li><li><a href="">자유게시판</a></li><li style="margin-right:2%">
                <a style="cursor: default;">소식</a>
                <ul>
                    <li><a href="<%=contextPath%>/noticeList.bo?currentPage=1">공지사항</a></li>
                    <li><a href="<%=contextPath %>/faqList.bo?currentPage=1">자주 묻는 질문</a></li>
                </ul>
            </li>
        </ul>
    </div>
    
    <script>
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
    </script>

</body>
</html>