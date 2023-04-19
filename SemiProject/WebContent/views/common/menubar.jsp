<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.udong.member.model.vo.Member"%>
<%
	String contextPath = request.getContextPath();
	Member loginUser = (Member)request.getSession().getAttribute("loginUser");
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
<style>
        .header {
            border: 1px solid black;
            height: 180px;
        }

        .header>div {
            float: left;
            box-sizing: border-box;
        }

        #icon {
            width: 160px;
            height: 160px;
            margin: 10px 0.5% 10px 2%;
            background-color: black;
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

        #most_search {
             width: 15%;
            height: 63px;
            margin: 58.5px 3% 58.5px 3%;
            border: 5px solid lightgray;
        }

        #most_search>table {
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
            width: 80%;
        }

        #search_btn {
            width: 20%;
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

        .menubar {
            border: 1px solid black;
            height: 90px;
        }

        #menu {
            width: 1500px;
            box-sizing: border-box;
            list-style-type: none;
            margin: 0 auto;
            padding: 0;
            height: 100%;
        }

        #menu>li {
            float: left;
            width: 250px;
            height: 100%;
            text-align: center;
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
            color: #C8EDC9;
            font-weight: 600;
        }

        #menu>li>ul {
            list-style-type: none;
            padding: 0;
            display: none;
        }

        #menu>li>ul a{
            font-size: 20px;
        }

        /*a태그에 마우스가 올라갔을 때 옆에 있는 ul 보이게*/
        #menu>li>a:hover+ul {
            display: block;
        }

        /*서브 메뉴에도 마우스가 올라가면 보이게*/
        #menu>li>ul:hover {
            display: block;
        }
    </style>
</head>

<body>
    <div class="header">
        <div id="icon">
            <img src="<%=contextPath %>/resources/img/udong.png" alt="아이콘">
        </div>
        <div id="site_name">
            <p>우동: 우리 동네</p>
            <p>자취생을 위한 사이트</p>
        </div>
        <div id="most_search">
            <table>
                <tr>
                    <td width="30" align="center">1</td>
                    <td>당산역</td>
                </tr>
            </table>
        </div>
        <div id="search">
            <form action="search.do" id="search_form">
                <div id="search_text"><input type="search" name="keyword"></div>
                <div id="search_btn"><input type="button" value="검색"></div>
            </form>
        </div>
        <%if(loginUser==null) {%>
            <div id="login_area">
                <button id="login" class="btn btn-outline-dark">로그인</button>
                <a href="<%=request.getContextPath()%>/views/member/loginPage.jsp">로그인 페이지</a>
                <button id="enroll" class="btn btn-outline-dark" onclick="enroll();">회원가입</button>
            </div>
        <%} else { %>
            <div id="member_area" align="center">
				<div id="logout">
                    <b>채영짱 님</b> <a href="">로그아웃</a> <br>
	            </div>
	            <div id="user_info" align="center">
	                <div id="myPage">
	                    <a href="https://www.naver.com" id="myPage"><img alt="마이페이지 아이콘" src="resources/img/free-icon-user-181549.png" id="myPageIcon" style="width: 50px; height:50px;"><br>마이페이지</a>
	                </div>
	                <div id="likeBoard">
	                	<a href="https://www.daum.net" id="likeBoard"><img alt="좋아요게시글 아이콘" src="resources/img/free-icon-heart-181527.png" id="likeBoardIcon" style="width: 50px; height:50px;"><br>관심</a>
	                </div>
	            </div>
        	</div>
        <%} %>
    </div>
    <div class="menubar">
        <ul id="menu">
            <li>
                <a href="">정보 공유</a>
                <ul>
                    <li><a href="">동네 소식</a></li>
                    <li><a href="">살림 꿀팁</a></li>
                    <li><a href="">자취 레시피</a></li>
                </ul>
            </li>
            <li><a href="">동네 맛집</a></li>
            <li>
                <a href="">나눔</a>
                <ul>
                    <li><a href="">나눔할게요</a></li>
                    <li><a href="">이거 필요해요</a></li>
                </ul>
            </li>
            <li>
                <a href="">함께 해요</a>
                <ul>
                    <li><a href="">같이 해요</a></li>
                    <li><a href="">같이 사요</a></li>
                </ul>
            </li>
            <li><a href="">자유게시판</a></li>
            <li>
                <a href="">소식</a>
                <ul>
                    <li><a href="">공지사항</a></li>
                    <li><a href="">자주 묻는 질문</a></li>
                </ul>
            </li>
        </ul>
    </div>
    
    <script>
    	$(function() {
    		
    	});
    </script>
</body>
</html>