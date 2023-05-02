<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    
         div{
            /* border: 1px solid black; */
            box-sizing: border-box;
        }

        .wrap{
        	position:relative;
			z-index:1;
            height: 1530px;
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
            /* background-color: green; */
            position: relative;
        }

        #content_1>p{ /*마이페이지 글씨, 위치*/
            position: absolute;
            top: 40px;
            left: 52px;
            font-size: 45px;
            font-weight: 700;
        }

        #line_1 {
            position: absolute;
            border: 1px solid black;
            width: 300px;
            height: 0px;
            top: 115px;
            left: 30px;
        }

        #my{ /*나의 정보 글씨, 위치*/
            position: absolute;
            font-size: 35px;
            text-decoration: none;
            color: black;
            left: 52px;
            top: 130px;
        }

        #line_2 {
            position: absolute;
            border: 1px solid black;
            width: 300px;
            height: 0px;
            top: 190px;
            left: 30px;
        }

        #update { /*개인 정보 수정 글씨, 위치*/
            position: absolute;
            font-size: 35px;
            text-decoration: none;
            color: black;
            left: 52px;
            top: 205px;
        }

        #line_3 {
            position: absolute;
            border: 1px solid black;
            width: 300px;
            height: 0px;
            top: 265px;
            left: 30px;
        }

        #write_board{ /*작성한 게시글 글씨, 위치*/
            position: absolute;
            font-size: 35px;
            text-decoration: none;
            color: black;
            left: 52px;
            top: 280px;
        }

        #line_4 {
            position: absolute;
            border: 1px solid black;
            width: 300px;
            height: 0px;
            top: 345px;
            left: 30px;
        }

        #like_board{ /*좋아요한 게시글 글씨, 위치*/
            position: absolute;
            font-size: 35px;
            text-decoration: none;
            color: black;
            left: 52px;
            top: 360px;
        }

        #line_5 {
            position: absolute;
            border: 1px solid black;
            width: 300px;
            height: 0px;
            top: 425px;
            left: 30px;
        }

        #out{ /*회원탈퇴 글씨, 위치*/
            position: absolute;
            font-size: 35px;
            text-decoration: none;
            color: black;
            left: 52px;
            top: 440px;
        }
        
        #user_con{ /*회운 관리 글씨, 위치*/
        	position: absolute;
            font-size: 35px;
            text-decoration: none;
            color: black;
            left: 52px;
            top: 440px;
        }

        #line_6 {
            position: absolute;
            border: 1px solid black;
            width: 300px;
            height: 0px;
            top: 505px;
            left: 30px;
        }
        
        #blackList{ /*블랙리트스 글씨 위치*/
        	position: absolute;
            font-size: 35px;
            text-decoration: none;
            color: black;
            left: 52px;
            top: 520px;
        }
        
        #line_8{
         	position: absolute;
            border: 1px solid black;
            width: 300px;
            height: 0px;
            top: 585px;
            left: 30px;
        }

        #content_2>#content_2_1{ /*content2 안에 크기 지정*/
            width: 1100px;
            height: 1500px;
            border: 1px solid skyblue;
            position: absolute;
            top: 15px;
            left: 12px;
            
        }
        
        #pp{ /*contente2 안에 있는 나의 정보 글씨 , 위치*/
            position: absolute;
            top: 45px;
            left: 54px;
            font-size: 45px;
            font-weight: 500;
        }

        #line_7 {
            position: absolute;
            border: 1px solid black;
            width: 1010px;
            height: 0px;
            top: 120px;
            left: 45px;
        }

        #p1{
            position: absolute;
            top: 150px;
            left: 70px;
            font-size:35px;
            font-weight: 600; 
        }

        #box{ /*지역선택, 카테고리 들어가는 박스*/
            position: absolute;
            border: 1px solid black;
            width: 1010px;
            height: 35%;
            top: 215px;
            left: 45px;
            border-radius: 30px;
        }

        #box>#box1,#box2{
            height: 100%;
            float: left;
        }

        #box1{
            border-right: 1px solid black;
            width: 33%;
        }

        #box2{
            width: 67%;
            /* background-color: green; */
            position: relative;
        }

        #photo{
            border: 1px solid black;
            width: 270px;
            height: 270px;
            border-radius: 50%;
            margin: 120px 33px;
        }

        #b2{ /*카테고리 글씨, 위치*/
            float: left;
            font-size: 25px;
            font-weight: 600;
            margin: 30px 0 0 50px;
        }

        #category{ /*checkbox들을 감싸고 있는 div*/
            float: left;
            font-size: 18px;
            margin: 34px 0 0 16px;
            vertical-align: super;
            accent-color: darkgray; /*체크박스 색깔 바꾸기*/
        }

        label{
            margin-top: 6px;
            margin-right: 15px;
        }
        

        /* 개인정보수정 테이블 */
        .list-area{
            /* border: 1px solid black; */
            /* border-left: 1px solid black; */
            /* text-align: center; */
            /* margin: 0 0 0 350px; */
            font-size: 17px;
            width: 700px;
            margin: 50px 0 0 10px;
        }

        .list-area th {

            width: 110px;
            height: 50px;
            /* background-color: #C8EDC9; */
        }

        .list-area td {
            padding: 0 0 0 10px;
        }


        

        /* 생년월일 select */
        #year, #month, #day { 
            width: 100px;
            border: 1px solid #C4C4C4;
            box-sizing: border-box;
            /* border-radius: 10px; */
            padding: 11px 13px;
            font-family: 'Roboto';
            font-style: normal;
            font-weight: 400;
            font-size: 14px;
            line-height: 16px;
            margin-right: 5px; 
        }

    
        /* 주소부분 */
        .input_area3>div {
            width: 100%;
            height: 30%;
            margin-bottom: 5px;
        }

        .div1>input {
            box-sizing: border-box;
            float: left;
            width: 20%;
            height: 100%;
            margin-right: 10px;
        }

        .div2>input {
            box-sizing: border-box;
            width: 70%;
            height: 100%;
        }

        .div3>input {
            box-sizing: border-box;
            float: left;
            width: 40%;
            height: 100%;
            margin-right: 10px;
        }

        #write_btn{
            margin-top: 800px;
        }

        

    </style>
</head>
<body>
	<%@ include file = "../../common/menubar.jsp" %>
    <div class="wrap">
        <div id="content">
            <div id="content_1">
                <p>마이페이지</p>
                <div id="line_1"></div>

                <a href="<%=request.getContextPath() %>/views/member/mypage/myInfo.jsp" id="my">나의 정보</a>
                <div id="line_2"></div>

                <a href="<%=request.getContextPath() %>/views/member/mypage/myInfoUpdate.jsp" id="update">개인정보수정</a>
                <div id="line_3"></div>

                <a href="<%=contextPath %>/myPost.me?cPage=1" id="write_board">작성한 게시글</a>
                <div id="line_4"></div>

                <a href="<%=contextPath %>/likeList.me?currentPage=1" id="like_board">좋아요한 게시글</a>
                <div id="line_5"></div>
                
                <%if(loginUser != null && loginUser.getUserId().equals("admin") )  {%>
	                <a href="" id="user_con">회원 관리</a>
					<div id="line_6"></div>
					
					<a href="" id="blackList">블랙리스트</a>
					<div id="line_8"></div>
                <%}else {%>
                	<a href="" id="out">회원 탈퇴</a>
                	<div id="line_6"></div>
                <%} %>
                
            </div>
            <div id="content_2">
                <div id="content_2_1">
                    <p id="pp">나의 정보</p>
                    <div id="line_7"></div>
                        <p id="p1">프로필</p>
                        <div id="box">

                            <div id="box1">
                                
                                    <img id="photo" src="" alt="" >
                                
                            </div>
                            
                            <div id="box2">
                                <table class="list-area" border="0">
                                    <tr>
                                        <th>
                                            <span style="margin-left: 10px;">회원 ID</span>
                                            <span style="color: red;"> *</span>
                                        </th>
                                        <td colspan="3"><%=loginUser.getUserId() %></td>
                                    </tr>
        
                                    <tr>
                                        <th>
                                            <span style="margin-left: 10px;">이름</span>
                                            <span style="color: red;"> *</span>
                                        </th>
                                        <td colspan="3"><%=loginUser.getUserName() %></td>
                                    </tr>
        
                                    <tr>
                                        <th>
                                            <span style="margin-left: 10px;">닉네임</span>
                                            <span style="color: red;"> *</span>
                                        </th>
                                        <td colspan="3"><%=loginUser.getNickname() %></td>
                                    </tr>
        
                                    <tr>
                                        <th>
                                            <span style="margin-left: 10px;">생년월일</span>
                                            <span style="color: red;"> *</span>
                                        </th>
                                        <td style="width: 430px;">
                                            <%=loginUser.getBirthday() %>
                                        </td>
                                    </tr>
        
                                    <tr>
                                        <th style="width: 100px">
                                            <span style="margin-left: 10px;">성별</span>
                                            <span style="color: red;"> *</span>
                                        </th>
                                        <td>
                                           	 <%=loginUser.getGender() %>
                                        </td> 
                                    </tr>
        
                                    <tr>
                                        <th>
                                            <span style="margin-left: 10px;">이메일</span>
                                            <span style="color: red;"> *</span>
                                        </th>
                                        <td colspan="3">
                                            <%=loginUser.getEmail() %>
                                        </td>
                                    </tr>
        
                                    <tr>
                                        <th>
                                            <span style="margin-left: 10px;">주소</span>
                                            <span style="color: red;"> *</span>
                                        </th>
                                        <td colspan="3">
                                            <div class="input_area3">
        											<%=loginUser.getAddress() %>
                                            </div>
                                        </td>
                                    </tr>
        
                                    
        
                                    <tr>
                                        <th>
                                            <span style="margin-left: 10px;">자기소개</span>
                                        </th>
                                        <td colspan="3">
                                        	<%if (loginUser.getIntroduction() != null) {%>
                                            	<%=loginUser.getIntroduction() %>
                                            <%} else { %>
                                            	작성된 소개글이 없습니다.
                                            <%} %>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        

                        </div>
                        <div align="center" id="write_btn">
                            <button class="btn btn-light" onclick="location.href='<%=contextPath %>/views/member/mypage/myInfoUpdate.jsp'">수정하기</button>
                        </div>
                        

                </div>
            </div>
        </div>
    </div>
	<%@ include file = "../../common/footer.jsp" %>
</body>
</html>