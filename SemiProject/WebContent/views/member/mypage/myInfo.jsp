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
            height: 1730px;
            width: 1500px;
            margin: auto;
        }

        .wrap>div{
            width: 100%;
        }

        

        #content{
            width: 100%;
            height: 76.5%;
            position: relative;
        }

        #footer{
            width: 100%;
            height: 10%;
            background-color: darkblue;
        }

        #content>div{
            height: 100%;
            float: left;
        }

        #content_1{
            width: 25%;
            background-color: yellow;
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

        #line_6 {
            position: absolute;
            border: 1px solid black;
            width: 300px;
            height: 0px;
            top: 505px;
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
            margin: 10px 0 0 10px;
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
        <div id="header">
            <div id="header_1"></div>
            <div id="menubar"></div>
        </div>
        <div id="content">
            <div id="content_1">
                <p>마이페이지</p>
                <div id="line_1"></div>

                <a href="<%=request.getContextPath() %>/views/member/mypage/myInfo.jsp" id="my">나의 정보</a>
                <div id="line_2"></div>

                <a href="<%=request.getContextPath() %>/views/member/mypage/myInfoUpdate.jsp" id="update">개인정보수정</a>
                <div id="line_3"></div>

                <a href="" id="write_board">작성한 게시글</a>
                <div id="line_4"></div>

                <a href="<%=request.getContextPath() %>/views/member/mypage/myLike.jsp" id="like_board">좋아요한 게시글</a>
                <div id="line_5"></div>

                <a href="" id="out">회원 탈퇴</a>
                <div id="line_6"></div>
            </div>
            <div id="content_2">
                <div id="content_2_1">
                    <p id="pp">나의 정보</p>
                    <div id="line_7"></div>
                        <p id="p1">프로필</p>
                        <div id="box">

                            <div id="box1">
                                
                                    <img id="photo" src="data:image/jpeg;base64,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" alt="" >
                                
                            </div>
                            
                            <div id="box2">
                                <table class="list-area" border="0">
                                    <tr >
                                        <th>
                                            <span style="margin-left: 10px;">회원 ID</span>
                                            <span style="color: red;"> *</span>
                                        </th>
                                        <td colspan="3"><%=loginUser.getUserId()%></td>
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
                                            <%=loginUser.getIntroduction() %>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        

                        </div>
                        <div align="center" id="write_btn">
                            <button class="btn btn-light" onclick="location.href='<%=request.getContextPath() %>/views/member/mypage/myInfoUpdate.jsp'">수정하기</button>
                        </div>
                        

                </div>
            </div>
        </div>
        <div id="footer"></div>
    </div>

</body>
</html>