<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
         div{
            /* border: 1px solid black; */
            box-sizing: border-box;
        }

        .wrap{
        	position:relative;
			/*z-index:1;*/
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

                <a href="<%=contextPath %>/myPost.me?cPage=1" id="write_board">작성한 게시글</a>
                <div id="line_4"></div>

                <a href="<%=contextPath %>/likeList.me?currentPage=1" id="like_board">좋아요한 게시글</a>
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
                        
                    <form action="<%=contextPath %>/update.me" method="post" id="myInfoUpdate">
                    	
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
                                	<input type="text" id="nickName" name="nickName" value="<%=loginUser.getNickname() %>" required>
                                	<button type="button" id="nickBtn" onclick="myNickChk();">중복 확인</button>
                                	<font id = "colorNickName" size="2"></font>
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
                                    <button>인증번호 전송</button>
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
				                            <input type="text" id="sample6_postcode" name="sample6_postcode" value="<%=loginUser.getAddress().substring(loginUser.getAddress().length()-5, loginUser.getAddress().length())%>" placeholder="우편번호" readonly>
				                            <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" id="address"><br>
				                        </div>
				                        <div class="div2">
				                            <input type="text" id="sample6_address" name="sample6_address" value="" placeholder="주소" readonly><br>
				                        </div>
				                        <div class="div3">
				                            <input type="text" id="sample6_detailAddress" name="sample6_detailAddress" value="" placeholder="상세주소">
				                            <input type="text" id="sample6_extraAddress" name="sample6_extraAddress" value=""  placeholder="참고항목" readonly>
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
                                	<div align="right">
                                		<p class="textCount"></p><p class="textTotal"></p>
                                	</div>
                                    <textarea class="introduction" name="introduction" cols="90" rows="4" style="resize: none;" maxLength="133"><%=loginUser.getIntroduction() %></textarea>
                                </td>
                            </tr>
                        </table>

                    
                        <br><br><br>
                        <div align="center" id="write_btn">
                            <button type="submit" class="btn btn-light">등록하기</button>
                            <button type="button" class="btn btn-dark" data-toggle="modal" data-target="#changePwd">비밀번호 변경</button>
                        </div>
                        
                </form>
                
                <script>
// 	                $(document).ready(function() {
// 	                    $('#myInfoUpdate').submit(function(event) {
// 	                      var textarea = $('textarea[name=introduction]');

// 	                      if (textarea.val() === '') {
// 	                        textarea.val('');
// 	                      }
// 	                    });
// 	                  });

					var checkNickname = 0;
					
					$("#nickname").keyup(function() {
                        var $nickname = $(this).val();
                        regExp = /^[a-zA-Z0-9가-힇]{2,}$/;

                        if(!regExp.test($nickname)) {
                            $(this).parents(".input_area").find("button").attr("disabled", true);
                            $(this).siblings("sup").eq(0).text("올바른 형식이 아닙니다.");
                            $(this).siblings("sup").eq(1).text("");
                        }
                        else {
                            $(this).parents(".input_area").find("button").attr("disabled", false);
                            $(this).siblings("sup").eq(1).text("닉네임 중복확인을 해주세요.");
                            $(this).siblings("sup").eq(0).text("");
                        }
                    });
                
                	function myNickChk() {
                		
                		$.ajax({
                			url : "<%=contextPath%>/checkNickname.me",
                			data : { inputNickname : $("#nickName").val()},
                			success : function(result) {
                				if(result == "Y") {
                					if(confirm("사용 가능한 닉네임 입니다! 사용하시겠습니까?")) {
                						$("#nickName").attr("readonly",true); //닉넴 변경 불가
                						checkNickname=1;
                					}
                				}else {
                					alert("이미 사용중인 닉네임입니다.");
                        			$("#nickname").focus();
                				}
                				
                			},
                			error : function() {
                				alert("통신 실패..");
                			}
                		});
                	};
                	
                	
                	//주소
                	function sample6_execDaumPostcode() {
                        new daum.Postcode({
                            oncomplete: function(data) {
                                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                            
                                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                                var addr = ''; // 주소 변수
                                var extraAddr = ''; // 참고항목 변수
                            
                                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                                    addr = data.roadAddress;
                                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                                    addr = data.jibunAddress;
                                }
                            
                                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                                if(data.userSelectedType === 'R'){
                                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                                        extraAddr += data.bname;
                                    }
                                    // 건물명이 있고, 공동주택일 경우 추가한다.
                                    if(data.buildingName !== '' && data.apartment === 'Y'){
                                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                                    }
                                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                                    if(extraAddr !== ''){
                                        extraAddr = ' (' + extraAddr + ')';
                                    }
                                    // 조합된 참고항목을 해당 필드에 넣는다.
                                    document.getElementById("sample6_extraAddress").value = extraAddr;
                                
                                } else {
                                    document.getElementById("sample6_extraAddress").value = '';
                                }
                            
                                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                                document.getElementById('sample6_postcode').value = data.zonecode;
                                document.getElementById("sample6_address").value = addr;
                                // 커서를 상세주소 필드로 이동한다.
                                document.getElementById("sample6_detailAddress").focus();
                            }
                        }).open();
                    };

                
                //글자수 보기 (미완성......)
                	$(".introduction").keyup(function() {
                		var content = $("#introduction").val();
                		
                		//글자수 세기
                		if(content.length == 0 || content == "") {
                			$(".textCount").html('0자');
                		}else {
                			$(".textTotal").html(content.length + '자');
                		}
                		
                		//글자수 제한
                		if(content.length > 133) {
                			//133자 부터는 타이핑이 되지 않도록 하기
                			$("#introduction").val($("#introduction").val().subString(0,133));
                			
                			//200자가 넘으면 알림창 뜨도록 하기
                			alert('글자수는 133까지 입력 가능합니다.')
                		}
                	})
                	
                	
                </script>
                
                <!-- The Modal -->
				<div class="modal" id="changePwd">
				  <div class="modal-dialog modal-lg">
				    <div class="modal-content">
						
				      <!-- Modal Header -->
				      <div class="modal-header">
				        <h4 class="modal-title">비밀번호 변경</h4>
				        <button type="button" class="close" data-dismiss="modal">&times;</button>
				      </div>
				
				      <!-- Modal body -->
				      <div class="modal-body">
				      <div id="box2" style="border: 1px solid black; border-radius: 30px;">
                            <ul id="my_ul2" style="margin-top:15px">
                                <li id="my_li2">비밀번호는 <b>8자리 이상 15자리 미만의 숫자와 영문, 특수문자(!@#$%^&*)</b> 를 조합하여 입력해주세요.</li>
                                <li id="my_li2">비밀번호가 타인에게 유츨되지 않도록 주의하시고, <br>쉽게 유출 될 수 있는 전화번호, 주민등록번호 등을 
                                    비밀번호로 사용하지 마시기 바랍니다.</li>
                                <li id="my_li2"> <span style="color: red;"> *</span> 표시된 부분은 <b>필수 입력 사항</b>입니다.</li>
                            </ul>
                        </div>
                        <br>
				      	<form action="<%=contextPath %>/updatePwd.me" method="post" onsubmit="return validate();">
				      		<input type="hidden" name="userId" value="<%=loginUser.getUserId() %>">
				      		
				      		<table align="center">
				      			<tr>
	                                <th>
	                                    <span>현재 비밀번호</span>
	                                    <span style="color: red;"> *</span>
	                                </th>
	                                <td>
	                                	<input type="password" name="userPwd" id="userPwd" class="nowPwd" required style="width:300px;" required>
	                                	<font id="check" size="2"></font>
	
	                                </td>
	                            </tr>
	
	                            <tr>
	                                <th>
	                                    <span>비밀번호 변경</span>
	                                    <span style="color: red;"> *</span>
	                                </th>
	                                <td>
	                                	<input type="password" name="updatePwd" id="updatePwd" class="pw" style="width:300px;" required>
	                                </td>
	                            </tr>
	
	                            <tr>
	                                <th>
	                                    <span>비밀번호 변경 확인</span>
	                                    <span style="color: red;"> *</span>
	                                </th>
	                                <td>
	                                	<input type="password" name="chkPwd" id="chkPwd" class="pw" style="width:300px;" required>
	                                	<font id="checkPw" size="2"></font>
	                                </td>
	                            </tr>
				      		</table>
				      		<br>
				      		
				      		<div id="changebtn" style="text-align: center;">
					      		<input type="submit" class="btn btn-info" value="비밀번호 변경">
				      		</div>
				      		
				      	</form>d
				      	
				      	<script>
							function validate(){
								var loginPwd = "<%=loginUser.getUserPwd() %>";
								var inputPwd = $("#userPwd").val();
								var updatePwd = $("#updatePwd").val();
								var chkPwd = $("#chkPwd").val();
								console.log(inputPwd);
								console.log(updatePwd);
								console.log(chkPwd);
								
								
								//비밀번호 검사
								
								
								if(loginPwd == inputPwd) { //현재 비밀번호가 일치한다면
									var regExp = /^[a-zA-Z0-9!@#$%^&*]{7,14}$/; //유효성 검사를 해준다.
									if(!regExp.test(updatePwd)){ //변경할 비밀번호가 유효값이 아닐경우
										alert("유효한 비밀번호 형식이 아닙니다.");
										$("#updatePwd").focus();
										//여기서 오류떠서 유효성 검사가 안된거임.(나는 updatePwd.focus()로 했는데 벨류값을 들고갔기 떄문에 실행이 안됨.)
										return false;
									}
									else {
										if(updatePwd != chkPwd) { //바꾼비밀번호와 재확인이 일치 하지 않는다면
											alert("변경할 비밀번호와 확인이 일치하지 않습니다.");
											$("input[name=updatePwd]").select();
											return false;
										}
									}

								}else { //현재 비밀번호가 일치하지 않는다면
									alert("현재 비밀번호가 일치하지 않습니다.");
									$("input[name=userPwd]").focus();
									return false;
								}
							}
						</script>
				      </div>
				    </div>
				  </div>
				</div>
                        <br><br>

                </div>
            </div>
        </div>
    </div>
    <%@ include file = "../../common/footer.jsp" %>
</body>
</html>