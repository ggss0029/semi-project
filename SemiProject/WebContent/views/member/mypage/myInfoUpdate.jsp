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
            height: 76.5%;
            position: relative;
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

        #content_1>p{ /*정보공유 글씨, 위치*/
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

        #my{ /*동네 소식 글씨, 위치*/
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

        #update { /*살림 꿀팁 글씨, 위치*/
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

        #write_board{ /*자취 레시피 글씨, 위치*/
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

        #like_board{ /*자취 레시피 글씨, 위치*/
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

        #out{ /*자취 레시피 글씨, 위치*/
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

        #content_2_1>p{ /*contente2 안에 있는 동네소식 글씨 , 위치*/
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

        #box{ /*지역선택, 카테고리 들어가는 박스*/
            position: absolute;
            border: 1px solid black;
            width: 1010px;
            height: 13%;
            top: 160px;
            left: 45px;
            border-radius: 30px;
        }

        /* 개인정보수정 테이블 */
        .list-area{
            /* border: 1px solid black; */
            border-top: 2px solid black;
            /* text-align: center; */
            margin: 400px 0 0 80px;
            font-size: 17px;
            width: 950px;
        }

        .list-area th {
            width: 180px;
            height: 50px;
            background-color: #C8EDC9;
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

        #my_ul{
            font-size: 20px;
            margin-top: 25px;
        }
        #my_li{
            margin-top: 10px;
        }
    </style>
</head>
<body>
	<%@ include file = "../../common/menubar.jsp" %>
	<%
		String userId = loginUser.getUserId();
		String userName = loginUser.getUserName();
		String nickName = loginUser.getNickname();
		String userPwd = loginUser.getUserPwd();
		String birthday = loginUser.getBirthday();
		String gender = loginUser.getGender();
		String email = loginUser.getEmail();
		String address = loginUser.getAddress();
		String introduction = (loginUser.getIntroduction() == null) ? "" : loginUser.getIntroduction();
	%>
	 <div class="wrap">
<!--         <div id="header"> -->
<!--             <div id="header_1"></div> -->
<!--             <div id="menubar"></div> -->
<!--         </div> -->
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
                    <p>개인정보수정</p>
                    <div id="line_7"></div>
                        <div id="box">
                            <ul id="my_ul">
                                <li id="my_li">비밀번호는 <b>8자리 이상 15자리 미만의 숫자와 영문, 특수문자(!@#$%^&*)</b> 를 조합하여 입력해주세요.</li>
                                <li id="my_li">비밀번호가 타인에게 유츨되지 않도록 주의하시고, <br>쉽게 유출 될 수 있는 전화번호, 주민등록번호 등을 
                                    비밀번호로 사용하지 마시기 바랍니다.</li>
                                <li id="my_li"> <span style="color: red;"> *</span> 표시된 부분은 <b>필수 입력 사항</b>입니다.</li>
                            </ul>
                        </div>
                        
                    <form action="<%=contextPath %>/update.me" method="post" id="myInfoUpdate" entype="multipart/form-data">
                    	
                        <table class="list-area" border="0">
                            <tr style="border-bottom: 2px solid gray;">
                                <th>
                                    <span style="margin-left: 10px;">회원 ID</span>
                                    <span style="color: red;"> *</span>
                                </th>
                                <td colspan="3">
                                	<input type="text" name="userId" value="<%=loginUser.getUserId() %>" readonly> 
                                </td>
                            </tr>

                            <tr style="border-bottom: 2px solid gray;">
                                <th>
                                    <span style="margin-left: 10px;">이름</span>
                                    <span style="color: red;"> *</span>
                                </th>
                                <td colspan="3">
                                	<input type="text" name="userName" value="<%=loginUser.getUserName() %>" readonly>
                                </td>
                            </tr>

                            <tr style="border-bottom: 2px solid gray;">
                                <th>
                                    <span style="margin-left: 10px;">닉네임</span>
                                    <span style="color: red;"> *</span>
                                </th>
                                <td colspan="3">
                                	<input type="text" name="nickName" value="<%=loginUser.getNickname() %>" required>
                                	<button>중복 확인</button>
                                </td>
                            </tr>

                            <tr style="border-bottom: 2px solid gray;">
                                <th>
                                    <span style="margin-left: 10px;">현재 비밀번호</span>
                                    <span style="color: red;"> *</span>
                                </th>
                                <td colspan="3">
                                	<input type="password" name="userPwd" id="userPwd" required>

                                </td>
                            </tr>

                            <tr style="border-bottom: 2px solid gray;">
                                <th>
                                    <span style="margin-left: 10px;">비밀번호 변경</span>
                                </th>
                                <td colspan="3">
                                	<input type="password" name="updatePwd" id="updatePwd" placeholder="변경 시에만 입력">
                                </td>
                            </tr>

                            <tr style="border-bottom: 2px solid gray;">
                                <th>
                                    <span style="margin-left: 10px;">비밀번호 변경 확인</span>
                                </th>
                                <td colspan="3">
                                	<input type="password" name="chkPwd" id="chkPwd" placeholder="변경 시에만 입력">
                                </td>
                            </tr>

                            <tr style="border-bottom: 2px solid gray;">
                                <th>
                                    <span style="margin-left: 10px;">생년월일</span>
                                    <span style="color: red;"> *</span>
                                </th>
                                <td style="width: 430px;">
                                   <input type="text" name="birthday" value="<%=loginUser.getBirthday() %>" readonly>
                                </td>

                                <th style="width: 100px">
                                    <span style="margin-left: 10px;">성별</span>
                                    <span style="color: red;"> *</span>
                                </th>
                                <td>
                                	<!-- 성별이 여자인 경우 -->
                                	<% if(loginUser.getGender().equals("여")) {%>
	                                    <input type="radio" name="gender" id="girl" value="여" checked ><label for="girl">여자</label>	
	                                    <input type="radio" name="gender" id="boy" value="남" disabled><label for="boy">남자</label>
                                    <%} else { %> <!-- 성별이 남자인 ㄱㅇ우 -->
                                    	<input type="radio" name="gender" id="girl" value="여" disabled><label for="girl">여자</label>	
                                    	<input type="radio" name="gender" id="boy" value="남" checked><label for="boy">남자</label>
                                    <%} %>
                                </td>
                            </tr>

                            <tr style="border-bottom: 2px solid gray;">
                                <th>
                                    <span style="margin-left: 10px;">이메일</span>
                                    <span style="color: red;"> *</span>
                                </th>
                                <td colspan="3">
                                    <input type="email" name="email" value="<%=loginUser.getEmail()%>" required>
                                    <button>인증</button>
                                </td>
                            </tr>

                            <tr style="border-bottom: 2px solid gray;">
                                <th>
                                    <span style="margin-left: 10px;">주소</span>
                                    <span style="color: red;"> *</span>
                                </th>
                                <td colspan="3">
                                    <div class="input_area3">
                                        <div class="div1">
                                            <input type="text" id="sample6_postcode" placeholder="우편번호" readonly>
                                            <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" id="address"><br>
                                        </div>
                                        <div class="div2">
                                            <input type="text" id="sample6_address" placeholder="주소" readonly><br>
                                        </div>
                                        <div class="div3">
                                            <input type="text" name="address" id="sample6_detailAddress" value="<%=loginUser.getAddress() %>" placeholder="상세주소">
                                            <input type="text" id="sample6_extraAddress" placeholder="참고항목" readonly>
                                        </div>
                                    </div>
                                </td>
                            </tr>

                            <tr style="border-bottom: 2px solid gray;">
                                <th>
                                    <span style="margin-left: 10px;">사진</span>
                                </th>
                                <td colspan="3">
                                	<input type="file" name="profile">
                                </td>
                            </tr>

                            <tr style="border-bottom: 2px solid gray;">
                                <th>
                                    <span style="margin-left: 10px;">자기소개</span>
                                </th>
                                <td colspan="3">
                                    <textarea name="introduction" id=""  cols="90" rows="4" style="resize: none;">
                                    	<%=loginUser.getIntroduction() %>
                                    </textarea>
                                </td>
                            </tr>
                        </table>

                    
                        <br><br><br>
                        <div align="center" id="write_btn">
                            <button type="submit" class="btn btn-light" onclick="updateInfoConfirm();">등록하기</button>
                        </div>
                        
                </form>
                        <br><br>

                </div>
            </div>
        </div>
    </div>

    <script>
    	function updateInfoConfirm() {
    		var loginPwd ="<%=loginUser.getUserPwd()%>";
    		var inputPwd = $("#userPwd").val();
    		var updatePwd = $("#updatePwd").val();
    		var chkPwd = $("#chkPwd").val();
    		
    		if(loginPwd == inputPwd) {
    			if(updatePwd != chkPwd) { 
    				alert("변경하실 비밀번호와 일치하지 않습니다.");
    				$("#updatePwd").select();
    				return false;
    			}
    		}else { //현재 비밀번호를 잘못 입력했을때
    			alert("현재 비밀번호가 일치하지 않습니다.");
    			$("#userPwd").focus();
    			return false;
    		}
    	}
    
    </script>
    <%@ include file = "../../common/footer.jsp" %>
</body>
</html>