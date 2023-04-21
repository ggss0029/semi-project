<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.udong.member.model.vo.Member, java.util.ArrayList"%>
<%
	String contextPath = request.getContextPath();
	Member loginUser = (Member)request.getSession().getAttribute("loginUser");
	String alertMsg = (String)request.getSession().getAttribute("alertMsg");
	ArrayList<String> ms = new ArrayList<>();
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
        
        .header_1{
/*             background-color: red; */
            height: 45%; /*180px*/
        }

        .header_1>div {
            float: left;
            box-sizing: border-box;
        }

        #icon {
            width: 160px;
            height: 160px;
            margin: 10px 0.5% 10px 2%;
        }
        
        #icon>img {
        	width: 100%;
        	height: 100%;
        }

        #site_name {
            width: 15%;
            height: 160px;
            margin: 10px 0.5% 10px 2%;
        }
        
        #most_search_list {
        	width: 15%;
            margin: 3px 33.5%;
            border: 5px solid lightgray;
            background-color: white;
        	position: fixed;
        	display: none;
        	z-index: 2;
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

        .swiper-slide>table {
            width: 100%;
            height: 100%;
        }

        #search {
            width: 20%;
            height: 36px;
            margin: 72px 3% 72px 3%;
        }

        #search_form {
            width: 100%;
            height: 100%;
        }
        
        #search_form>div {
            float: left;
            height: 100%;
        }

        #search_text {
            width: 85%;
        }

        #search_btn {
            width: 15%;
        }

        #search_btn * {
            width: 100%;
            height: 100%;
        }

        #search_form input {
            width: 100%;
            height: 100%;
        }

        #login_area, #member_area {
            width: 20%;
            height: 100%;
            margin: 0px 0px 0px 1%;
        }

        #login {    /*로그인 버튼*/
            width: 40%;
            height: 40px;
            margin: 70px 3% 70px 3%;
        }

        #enroll { /*회원가입 버튼*/
            width: 40%;
            height: 40px;
            margin: 70px 3% 70px 3%;
        }
        
        #logout {
            width: 100%;
            height: 15%;
            margin: 10px auto;
        }
        
        #user_info {
            width: 100%;
            height: 70%;
            margin: 30px 5%;
        }
        
        #user_info>div {
            width: 50%;
            height: 100%;
            float: left;
        }

        .header_2{
            background-color: orange;
            height: 55%;
        }

       .outer{
            width: 1500px;
            height: 1600px;
            border: 1px solid black;
            margin: auto;
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
        }

        .content_1>div {
            float: left;
            width: 50%;
            height: 100%;
        }

        .c1 {
            background-color: yellow;
        }

        .c2 {
            background-color: green;
        }

        .content_2 {
            background-color: blue;
            width: 100%;
            height: 32.5%;
        }

        .content_3 {
            background-color: pink;
            width: 100%;
            height: 32.5%;
        }
        
        .content_2>div, .content_3>div {
            width: 100%;
        }

        .c3, .c4 {
            height: 20%;
        }

        .c3>div, .c4>div {
            height: 100%;
            float: left;
        }

        #footer{
            height: 200px;
            background-color: purple;
        }

        .main_swiper1 { position: relative; height: 80%; }
        .main_swiper2 { position: relative; height: 80%; }
		.swiper { width: 100%; height: 100%; }
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
		console.log(now);
		function callback() {
			$.ajax({
				url: "mostSearch.do",
				success: function(mostSearch) {
					$(mostSearch).each(function(index, value) {
						console.log(index + ", " + value);
						
						if((index+1) == $(".key2").eq(index).prev().text()) {
							$(".key2").eq(index).text(value);
							$(".key").eq(index).text(value);
						}
					});
				},
				error: function() {
					console.log("통신 실패");
				}
			});
		}
		callback();
		setInterval(callback, 30000); // 1분마다 검색어 순위 top10 가져옴
	});
</script>
    <div id="header">
        <div class="header_1">
            <div id="icon">
                <img src="views/common/icons/우동2.jpg" alt="아이콘">
            </div>
            <div id="site_name">
                <p>우동: 우리 동네</p>
                <p>자취생을 위한 사이트</p>
            </div>
            <div id="most_search_list">
            	<table border="1">
            		<tr>
            			<td colspan="2" align="right"><button onclick="closeList();">&times;</button></td>
            		</tr>
            		<tr>
	                    <td width="50" align="center" style="font-weight: 700; font-size: 22px">1</td>
	                    <td style="font-size: 20px;" class="key"></td>
                    </tr>
                    <tr>
                        <td width="50" align="center" style="font-weight: 700; font-size: 22px">2</td>
                        <td style="font-size: 20px;" class="key"></td>
                    </tr>
                    <tr>
                        <td width="50" align="center" style="font-weight: 700; font-size: 22px">3</td>
                        <td style="font-size: 20px;" class="key"></td>
                    </tr>
                    <tr>
                        <td width="50" align="center" style="font-weight: 700; font-size: 22px">4</td>
                        <td style="font-size: 20px;" class="key"></td>
                    </tr>
                    <tr>
                        <td width="50" align="center" style="font-weight: 700; font-size: 22px">5</td>
                        <td style="font-size: 20px;" class="key"></td>
                    </tr>
                    <tr>
                        <td width="50" align="center" style="font-weight: 700; font-size: 25px">6</td>
                        <td style="font-size: 20px;" class="key"></td>
                    </tr>
                    <tr>
                        <td width="50" align="center" style="font-weight: 700; font-size: 22px">7</td>
                        <td style="font-size: 20px;" class="key"></td>
                    </tr>
                    <tr>
                        <td width="50" align="center" style="font-weight: 700; font-size: 22px">8</td>
                        <td style="font-size: 20px;" class="key"></td>
                    </tr>
                    <tr>
                        <td width="50" align="center" style="font-weight: 700; font-size: 22px">9</td>
                        <td style="font-size: 20px;" class="key"></td>
                    </tr>
                    <tr>
                        <td width="50" align="center" style="font-weight: 700; font-size: 22px">10</td>
                        <td style="font-size: 20px;" class="key"></td>
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
                                    <td style="font-size: 20px;" class="key2"></td>
                                    <td width="50" align="center" style="font-weight: 700; font-size: 30px" onclick="showList();">∨</td>
                                </tr>
                            </table>
                        </div>
                        <div class="swiper-slide keyword2">
                            <table>
                                <tr>
                                    <td width="50" align="center" style="font-weight: 700; font-size: 22px">2</td>
                                    <td style="font-size: 20px;" class="key2"></td>
                                    <td width="50" align="center" style="font-weight: 700; font-size: 30px" onclick="showList();">∨</td>
                                </tr>
                            </table>
                        </div>
                        <div class="swiper-slide keyword3">
                            <table>
                                <tr>
                                    <td width="50" align="center" style="font-weight: 700; font-size: 22px">3</td>
                                    <td style="font-size: 20px;" class="key2"></td>
                                    <td width="50" align="center" style="font-weight: 700; font-size: 30px" onclick="showList();">∨</td>
                                </tr>
                            </table>
                        </div>
                        <div class="swiper-slide keyword4">
                            <table>
                                <tr>
                                    <td width="50" align="center" style="font-weight: 700; font-size: 22px">4</td>
                                    <td style="font-size: 20px;" class="key2"></td>
                                    <td width="50" align="center" style="font-weight: 700; font-size: 30px" onclick="showList();">∨</td>
                                </tr>
                            </table>
                        </div>
                        <div class="swiper-slide keyword5">
                            <table>
                                <tr>
                                    <td width="50" align="center" style="font-weight: 700; font-size: 22px">5</td>
                                    <td style="font-size: 20px;" class="key2"></td>
                                    <td width="50" align="center" style="font-weight: 700; font-size: 30px" onclick="showList();">∨</td>
                                </tr>
                            </table>
                        </div>
                        <div class="swiper-slide keyword6">
                            <table>
                                <tr>
                                    <td width="50" align="center" style="font-weight: 700; font-size: 22px">6</td>
                                    <td style="font-size: 20px;" class="key2"></td>
                                    <td width="50" align="center" style="font-weight: 700; font-size: 30px" onclick="showList();">∨</td>
                                </tr>
                            </table>
                        </div>
                        <div class="swiper-slide keyword7">
                            <table>
                                <tr>
                                    <td width="50" align="center" style="font-weight: 700; font-size: 22px">7</td>
                                    <td style="font-size: 20px;" class="key2"></td>
                                    <td width="50" align="center" style="font-weight: 700; font-size: 30px" onclick="showList();">∨</td>
                                </tr>
                            </table>
                        </div>
                        <div class="swiper-slide keyword8">
                            <table>
                                <tr>
                                    <td width="50" align="center" style="font-weight: 700; font-size: 22px">8</td>
                                    <td style="font-size: 20px;" class="key2"></td>
                                    <td width="50" align="center" style="font-weight: 700; font-size: 30px" onclick="showList();">∨</td>
                                </tr>
                            </table>
                        </div>
                        <div class="swiper-slide keyword9">
                            <table>
                                <tr>
                                    <td width="50" align="center" style="font-weight: 700; font-size: 22px">9</td>
                                    <td style="font-size: 20px;" class="key2"></td>
                                    <td width="50" align="center" style="font-weight: 700; font-size: 30px" onclick="showList();">∨</td>
                                </tr>
                            </table>
                        </div>
                        <div class="swiper-slide keyword10">
                            <table>
                                <tr>
                                    <td width="50" align="center" style="font-weight: 700; font-size: 22px">10</td>
                                    <td style="font-size: 20px;" class="key2"></td>
                                    <td width="50" align="center" style="font-weight: 700; font-size: 30px" onclick="showList();">∨</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div id="search">
                <form action="search.do" id="search_form">
                    <div id="search_text"><input type="search" name="keyword"></div>
                    <div id="search_btn"><button><img src="views/common/icons/free-icon-magnifying-glass-49116.png" alt=""></button></div>
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
                    	<b><%=loginUser.getNickname() %> 님</b> <a href="">로그아웃</a> <br>
	                </div>
	                <div id="user_info" align="center">
	                    <div id="myPage">
	                        <a href="https://www.naver.com" id="myPage"><img alt="마이페이지 아이콘" src="views/common/icons/free-icon-user-181549.png" id="myPageIcon" style="width: 50px; height:50px;"><br>마이페이지</a>
	                    </div>
	                    <div id="likeBoard">
	                        <a href="https://www.daum.net" id="likeBoard"><img alt="좋아요게시글 아이콘" src="views/common/icons/free-icon-heart-181527.png" id="likeBoardIcon" style="width: 50px; height:50px;"><br>관심</a>
	                    </div>
	                </div>
            	</div>
            <%} %>
        </div>
        
        <script>
        	function showList() {
        		$("#most_search_list").css("display", "block");
        	};
        	
        	function closeList() {
        		$("#most_search_list").css("display", "none");
        		swiper.autoplay.start();
        	}
        
        	function login() {
        		location.href = "<%=contextPath%>/views/member/loginPage.jsp";
        	};
        
        	function enroll() {
        		location.href = "<%=contextPath%>/enroll.me";
        	};
        </script>
        
        <div class="header_2">
            <div id="information_area">
            	<a href="<%=contextPath %>/newsList.bo?currentPage=1">정보 공유</a>
            </div>
            <div></div>
            <div></div>
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>
    <div class="outer">
        <div id="content">
            <div class="content_1">
                <div class="c1">인기글</div>
                <div class="c2">최신글</div>
            </div>
            <div class="content_2">
                <div class="c3">
                    <div style="width: 85%;">
                        <p style="font-size: 45px; font-weight: 500;">동네 맛집</p>
                    </div>
                    <div align="center" style="width: 15%;">
                        <button style="margin-top:23%; margin-left:30%;" class="btn btn-light">더보기 ></button>
                    </div>
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
                    <div style="width: 85%; ">
                        <p style="font-size: 45px; font-weight: 500;">나눔 할게요</p>
                    </div>
                    <div align="center" style="width: 15%;">
                        <button style="margin-top:23%; margin-left:30%;" class="btn btn-light">더보기 ></button>
                    </div>
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
        <div id="footer"></div>
    </div>

    <script>
    	let swiper = new Swiper('.swiper', {
            direction: 'vertical',
            loop: true,
            spaceBetween: 30,
            slidesPerView: 1,
            autoplay: {
                delay: 500,
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