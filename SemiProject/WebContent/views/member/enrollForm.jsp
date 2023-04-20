<%@page import="com.udong.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Random"%>
<%
	String contextPath = request.getContextPath();
	Member kakaoUser = (Member)request.getAttribute("kakaoUser");
	Member naverUser =(Member)request.getAttribute("naverLoginUser");
	int random = 0;
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <style>
        div{
            box-sizing: border-box;
            /* border: 1px solid black; */
        }

        .wrap{
            margin: 0 auto;
            width: 1500px;
            height: 1000px;
        }

        .wrap>div{
            height: 100%;
            width: 50%;
            float: left;
        }

        #left{
            border: 1px solid red;
        }

        #right{
            border: 1px solid blue;
        }

        #right>form {
            box-sizing: border-box;
            width: 600px;
            height: 100%;
            margin: 0px 75px;
        }

        #enroll-form {
            margin: auto;
            width: 90%;
            height: 100%;
        }

        #enroll-form>div {
            width: 100%;
        }
        
        .input_area {
            height: 3%;
        }

        .input_area2 {
            height: 10%;
        }

        .read {
            height: 10%;
        }

        .input_area>div{
            height: 100%;
            float: left;
        }

        #d1 {
            width: 80%;
        }

        #d2 {
            width: 20%;
        }

        .input_area input, .input_area button {
            box-sizing: border-box;
            width: 100%;
            height: 100%;
        }

        .input_area2 {
            width: 100%;
            height: 4%;
        }

        .input_area3 {
            width: 100%;
            height: 10%;
        }

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
    </style>
</head>
<body>
<script>
	<%if(request.getAttribute("alertNaverMsg")!=null){%>
		var alertNaverMsg = "<%=request.getAttribute("alertNaverMsg")%>";
		console.log(alertNaverMsg);
		alert(alertNaverMsg);
		<%request.removeAttribute("alertNaverMsg");%>
	<%}%>
</script>
    <div class="wrap">
        <div id="left" style="background-color: lightpink;"></div>
        <div id="right">
            <form action="<%=contextPath%>/enroll.me" method="post" onsubmit="return checkForm();">
                <div id="enroll-form">
                    <br>
                    <label for="userId">아이디 (필수)</label> <br>
                    <div class="input_area">
                        <div id="d1">
                            <input type="text" name="userId" id="userId" placeholder="영문자, 숫자를 포함하여 총 3~12자로 입력하세요." required>
                        </div>
                        <div id="d2">
                            <button type="button" onclick="checkId();" disabled>중복 확인</button>
                        </div>
                        <sup style="font-size: 5px; color: red;"></sup>
                        <sup style="font-size: 5px; color: green;"></sup>
                    </div>
                    <br>
                    <label for="userPwd">비밀번호 (필수)</label> <br>
                    <div class="input_area">
                        <input type="password" name="userPwd" id="userPwd" placeholder="영문자, 숫자, 특수문자(!@#$%^&*)로 총 8~15자로 입력하세요." required>
                        <sup style="font-size: 5px; color: red;"></sup>
                        <sup style="font-size: 5px; color: green;"></sup>
                    </div>
                    <br>
                    <label for="checkPwd">비밀번호 재확인 (필수)</label> <br>
                    <div class="input_area">
                        <input type="password" name="" id="checkPwd" placeholder="위의 비밀번호와 동일하게 입력해주세요." required>
                        <sup style="font-size: 5px; color: red;"></sup>
                        <sup style="font-size: 5px; color: green;"></sup>
                    </div>
                    <br>
                    <label for="userName">이름 (필수)</label> <br>
                    <div class="input_area">
                        <input type="text" name="userName" id="userName" required>
                        <sup style="font-size: 5px; color: red;"></sup>
                    </div>
                    <br>
                    <label for="nickname">닉네임 (필수)</label> <br>
                    <div class="input_area">
                        <div id="d1">
                            <input type="text" name="nickname" id="nickname" required>
                            <sup style="font-size: 5px; color: red;"></sup>
                        	<sup style="font-size: 5px; color: green;"></sup>
                        </div>
                        <div id="d2">
                            <button type="button" onclick="checkNick();" disabled>중복 확인</button>
                        </div>
                    </div>
                    <br>
                    <label for="">생년월일 (필수)</label> <br>
                    <div class="input_area2">
                        <select name="year" id="year"><option value="none">&nbsp; 선택 &nbsp;</option></select>년
                        <select name="month" id="month" onchange="selectMonth(this);"><option value="none"> 선택 </option></select>월
                        <select name="day" id="day"><option value="none"> 선택 </option></select>일
                        <input type="radio" name="gender" id="male" value="남"> <label for="male">남</label>
                        <input type="radio" name="gender" id="female" value="여"> <label for="female">여</label>
                    </div>
                    <br>
                    <label for="email">이메일 (필수)</label> <sup style="font-size: 5px; color: red;"></sup><br>
                    <div class="input_area">
                        <div id="d1">
                            <input type="text" name="email" id="email" required>
                        </div>
                        <div id="d2">
                            <button type="button" onclick="sendNum();" disabled >인증번호 전송</button>
                        </div>
                    </div>
                    <label for="num">인증번호 입력</label>
                    <div class="input_area">
                        <div id="d1">
                            <input type="text" name="num" id="num" required>
                        </div>
                        <div id="d2">
                            <button type="button" onclick="checkEmail();" disabled>인증번호 확인</button>
                        </div>
                    </div>
                    <br>
                    <label for="address">주소 (필수)</label> <br>
                    <div class="input_area3">
                        <div class="div1">
                            <input type="text" id="sample6_postcode" name="sample6_postcode" placeholder="우편번호" readonly>
                            <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" id="address"><br>
                        </div>
                        <div class="div2">
                            <input type="text" id="sample6_address" name="sample6_address" placeholder="주소" readonly><br>
                        </div>
                        <div class="div3">
                            <input type="text" id="sample6_detailAddress" name="sample6_detailAddress" placeholder="상세주소">
                            <input type="text" id="sample6_extraAddress" name="sample6_extraAddress" placeholder="참고항목" readonly>
                        </div>
                    </div>
                    <input type="hidden" name="loginType" id="loginType">
                    <br>
                    <label for="">개인정보동의</label> <br>
                    <div class="read">
                        <textarea style="resize: none; width: 100%; height: 100%; box-sizing: border-box;" readonly>
여러분을 환영합니다.

우동 : 우리 동네 서비스 및 제품(이하 '서비스')을 이용해주셔서 감사합니다. 본 약관은 다양한 우동(우리 동네) 서비스의 이용과 관련하여 우동 서비스를 제공하는 우동 주식회사(이하 '우동')와 이를 이용하는 우동 서비스 회원(이하 '회원')또는 비회원과의 관계를 설명하며, 아울러 여러분의 우동 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.

우동 서비스를 이용하시거나 우동 서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다.

다양한 우동 서비스를 즐겨보세요.
우동은 여러 도메인의 웹 사이트 및 응용 프로그램 (어플리케이션, 앱)을 통해 정보 검색, 다른 이용자와의 커뮤니케이션, 콘텐츠 제공, 상품 쇼핑 등 여러분의 생활에 편리함을 더할 수 있는 다양한 서비스를 제공하고 있습니다.
여러분은 PC, 휴대폰 등 인터넷 이용이 가능한 각종 단말기를 통해 각양각색의 네이버 서비스를 자유롭게 이용하실 수 있으며, 개별 서비스들의 구체적인 내용은 각 서비스 상의 안내, 공지사항, 우동 웹 고객센터(이하 '고객센터') 도움말 등에서 쉽게 확인하실 수 있습니다.
우동은 기본적으로 여러분 모두에게 동일한 내용의 서비스를 제공합니다. 다만, '청소년보호법' 등 관련 법령이나 기타 개별 서비스 제공에서의 특별한 필요에 의해서 연령 또는 일정한 등급을 기준으로 이용자를 구분하여 제공하는 서비스의 내용, 이용 시간, 이용 횟수 등을 다르게 하는 등 일부 이용을 제한하는 경우가 있습니다. 자세한 내용은 역시 각 서비스 상의 안내, 공지사항, 고객센터 도움말 등에서 확인하실 수 있습니다.
                        </textarea>
                    </div>
                    <div class="check_area" align="right" style="width: 30; height: 10;">
                        <input type="radio" name="checkAgree" id="agree" value="agree"><label for="agree" style="margin-right: 5px;">동의</label> <input type="radio" name="checkAgree" id="disagree" value="disagree"><label for="disagree" checked>동의하지 않음</label>
                    </div>
                    <br><br>
                    <button type="submit" style="width: 500px; height: 50px; margin: 0 20px;">가입하기</button>
                    <br><br>
                </div>
             </form>
             <script>
                var checkUserId = 0;
                var checkUserPwd = 0;
                var checkCheckPwd = 0;
                var checkUserName = 0;
                var checkNickname = 0;
                var checkBirthday = 0;
                var checkNum = 0;

                $(function() {
                    var regExp;

                    $("#userId").keyup(function() {
                        regExp = /^[a-zA-Z0-9]{3,12}$/;

                        if(!regExp.test($(this).val())) {
                            $(this).parent().siblings("sup").eq(0).text("아이디는 영문자, 숫자를 포함하여 총 3~12자로 입력하세요.");
                            $(this).parent().siblings("sup").eq(1).text("");
                            $(this).parents(".input_area").find("button").attr("disabled", true);
                        }
                        else {
                            $(this).parent().siblings("sup").eq(0).text("");
                            $(this).parent().siblings("sup").eq(1).text("아이디 중복확인을 해주세요.");
                            $(this).parents(".input_area").find("button").attr("disabled", false);
                        }

                    });

                    $("#userPwd").keyup(function() {  /*시간되면 정규표현식 하나로 합치기*/
                        regExp = /^[a-zA-Z0-9]{7,14}$/;
                        var regExp2 = /[!@#$%^&*]/g; // 특수문자 들어갔는지 확인
                        var $userPwd = $(this).val();

                        if($userPwd.length<8 || $userPwd.length>15) { // 글자수 확인
                            $(this).siblings("sup").eq(0).text("비밀번호의 길이를 다시 확인해주세요.");
                            $(this).siblings("sup").eq(1).text("");
                            checkUserPwd=0;
                        }
                        else {
                            if(!regExp.test($userPwd)) { // 영문자, 숫자 확인
                                if(!regExp2.test($userPwd)) { // 특수문자 포함여부 확인
                                    $(this).siblings("sup").eq(0).text("비밀번호는 영문자, 숫자, 특수문자(!@#$%^&*)로 총 8~15자로 입력하세요.");
                                    $(this).siblings("sup").eq(1).text("");
                                    checkUserPwd=0;
                                }
                                else {
                                    $(this).siblings("sup").eq(1).text("적합한 비밀번호입니다.");
                                    $(this).siblings("sup").eq(0).text("");
                                    checkUserPwd=1;
                                }
                            }
                            else {
                                $(this).siblings("sup").eq(0).text("비밀번호는 영문자, 숫자, 특수문자(!@#$%^&*)로 총 8~15자로 입력하세요.");
                                $(this).siblings("sup").eq(1).text("");
                                checkUserPwd=0;
                            }
                        }
                    });

                    $("#checkPwd").keyup(function() {
                        var $userPwd = $("#userPwd").val();

                        if($userPwd == $(this).val()) {
                            $(this).siblings("sup").eq(1).text("비밀번호가 일치합니다.");
                            $(this).siblings("sup").eq(0).text("");
                            checkCheckPwd=1;
                        }
                        else {
                            $(this).siblings("sup").eq(0).text("비밀번호가 일치하지 않습니다.");
                            $(this).siblings("sup").eq(1).text("");
                            checkCheckPwd=0
                        }
                    });

                    $("#userName").keyup(function() {
                        var $userName = $(this).val();
                        regExp = /^[가-힣]{2,5}$/;

                        if(!regExp.test($userName)) {
                            $(this).siblings("sup").text("올바른 형식이 아닙니다.");
                            checkUserName=0;
                        }
                        else {
                            $(this).siblings("sup").text("");
                            checkUserName=1;
                        }
                    });

                    var now = new Date();
                    // 년도 option 추가
                    for(var i=1940;i<=now.getFullYear();i++) {
                        $("#year").append('<option value="' + i + '">' + i + ' </option>');
                    }
                    // 월별 option 추가
                    for(var i=1;i<=12;i++) {
                        var m = i > 9 ? i : "0"+i;
                        $("#month").append('<option value="' + m + '">' + m + '</option>');
                    }

                    $("#email").keyup(function() {
                        var $email = $(this).val();
                        regExp = /^[a-zA-Z0-9+-\_.]+@[a-z]+\.[a-z]+$/;

                        if(!regExp.test($email)) {
                            $(this).parents(".input_area").prev().siblings("sup").text("올바른 형식이 아닙니다.");
                            $(this).parents(".input_area").find("button").attr("disabled", true);
                        }
                        else {
                            $(this).parents(".input_area").prev().siblings("sup").text("");
                            $(this).parents(".input_area").find("button").attr("disabled", false);
                        }
                    });
                    
                <%if(kakaoUser!=null && kakaoUser.getLoginType()==2){%>
                	$("#userId").attr("placeholder","카카오 로그인 유저는 아이디를 기입하지 않아도 됩니다.").attr("disabled",true);
                	$("#userPwd").attr("placeholder","카카오 로그인 유저는 비밀번호를 기입하지 않아도 됩니다.").attr("disabled",true);
                	$("#checkPwd").attr("placeholder","카카오 로그인 유저는 비밀번호를 기입하지 않아도 됩니다.").attr("disabled",true);
                	$("#userName").attr("placeholder","이름을 입력해주세요.");
                	$("#nickname").attr("placeholder","사용하실 닉네임을 입력 후 중복확인을 해주세요.")
            		$("#email").val("<%=kakaoUser.getEmail()%>");
            		$("#num").attr("placeholder","카카오 로그인 유저는 이메일 인증을 하지 않아도 됩니다.").attr("disabled",true);
            		<%if(kakaoUser.getGender().equals("male")){%>
            			$("#male").val("남").prop("checked", true);
            			$("#female").attr("disabled",true);
            		<%}else{%>
            			$("#female").val("여").prop("checked", true);
            			$("#male").attr("disabled",true);
            		<%}%>
            		$("#month").children().remove();
            		var option = $("<option>"+<%=kakaoUser.getBirthday().substring(0, 2)%>+"</option>");
                    $('#month').append(option);
            		$("#day").children().remove();
            		var option1 = $("<option>"+<%=kakaoUser.getBirthday().substring(2,4)%>+"</option>");
                    $('#day').append(option1);
                    $("#loginType").val(2);
                    
                    checkUserId = 1;
                    checkUserPwd = 1;
                    checkCheckPwd = 1;
                    checkNum = 1;
            	<%}%>
                    
            	<%if(naverUser!=null && naverUser.getLoginType()==3){%>
            	$("#userId").attr("placeholder","네이버 로그인 유저는 아이디를 기입하지 않아도 됩니다.").attr("disabled",true);
            	$("#userPwd").attr("placeholder","네이버 로그인 유저는 비밀번호를 기입하지 않아도 됩니다.").attr("disabled",true);
            	$("#checkPwd").attr("placeholder","네이버 로그인 유저는 비밀번호를 기입하지 않아도 됩니다.").attr("disabled",true);
            	$("#userName").val('<%=naverUser.getUserName()%>').attr("readonly",true);
            	$("#nickname").attr("placeholder","사용하실 닉네임을 입력 후 중복확인을 해주세요.");
        		$("#email").val("<%=naverUser.getEmail()%>");
        		$("#num").attr("placeholder","네이버 로그인 유저는 이메일 인증을 하지 않아도 됩니다.").attr("disabled",true);
        		<%if(naverUser.getGender().equals("남")){%>
        			$("#male").val("남").prop("checked", true);
        			$("#female").attr("disabled",true);
        		<%}else{%>
        			$("#female").val("여").prop("checked", true);
        			$("#male").attr("disabled",true);
        		<%}%>
        		$("#year").children().remove();
        		var option1 = $("<option>"+<%=naverUser.getBirthday().substring(0,4)%>+"</option>");
        		$("#year").append(option1);
        		
        		$("#month").children().remove();
        		var option2 = $("<option>"+<%=naverUser.getBirthday().substring(4,6)%>+"</option>");
                $('#month').append(option2);
                
        		$("#day").children().remove();
        		var option3 = $("<option>"+<%=naverUser.getBirthday().substring(6,8)%>+"</option>");
                $('#day').append(option3);
                
                $("#loginType").val(3);
                
                checkUserId = 1;
                checkUserPwd = 1;
                checkUserName = 1;
                checkCheckPwd = 1;
                checkNum = 1;
        	<%}%>
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
                    
                });

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

                function checkId() {
                    $.ajax({
                    	url: "checkId.me",
                    	data: {inputId: $("#userId").val()},
                    	success: function(result) {
                    		if(result == "Y") {
                    			if(confirm("사용 가능한 아이디입니다. 사용하시겠습니까?")) {
                    				$("#userId").attr("readonly", true); // 아이디값 변경 불가
                    				$("#userId").parents(".input_area").find("button").attr("disabled", true);
                    				$("#userId").parent().siblings("sup").eq(1).text("");
                                    checkUserId=1;
                    			}
                    			else {
                    				$("#userId").focus();
                    			}
                    		}
                    		else {
                    			alert("이미 사용중인 아이디입니다.");
                    			$("#userId").focus();
                    		}
                    	},
                    	error: function() {
                    		console.log("통신 실패");
                    	}
                    });
                };

                function checkNick() {
                    $.ajax({
                    	url: "checkNickname.me",
                    	data: {inputNickname: $("#nickname").val()},
                    	success: function(result) {
                    		if(result == "Y") {
                    			if(confirm("사용 가능한 닉네임입니다. 사용하시겠습니까?")) {
                    				$("#nickname").attr("readonly", true); // 닉네임 변경 불가
                    				$("#nickname").parents(".input_area").find("button").attr("disabled", true);
                    				$("#nickname").siblings("sup").eq(1).text("");
                                    checkNickname=1;
                    			}
                    			else {
                    				$("#nickname").focus();
                    			}
                    		}
                    		else {
                    			alert("이미 사용중인 닉네임입니다.");
                    			$("#nickname").focus();
                    		}
                    	},
                    	error: function() {
                    		console.log("통신 실패");
                    	}
                    });
                };

                function selectMonth(e) {
                    if(e.value == 1 || e.value == 3 || e.value == 5 || e.value == 7 || e.value == 8 || e.value == 10 || e.value == 12) {
                        for(var i=1;i<=31;i++) {
                            var d = i>9 ? i : "0"+i;
                            $("#day").append('<option value="' + d + '">' + d + '</option>');
                        }
                    }
                    else {
                        for(var i=1;i<=30;i++) {
                            var d = i>9 ? i : "0"+i;
                            $("#day").append('<option value="' + d + '">' + d + '</option>');
                        }
                    }
                };

                function sendNum() {
                	<%!
	                	public int getRandom() {
	                		Random r = new Random();
	                		int ran = r.nextInt(99999) + 10000;
	                		return ran;
	                	};
                	%>
                	<%random = getRandom();%>
                	
                	$.ajax({
                		url: "checkEmail.me",
                		type: "post",
                		data: {
                			random: <%=random%>,
                			email: $("#email").val()
                		},
                		success: function(result) {
                			if(result == "N") {
                				alert("이미 존재하는 이메일 주소입니다. 다시 확인해주세요.")
                				$("#email").focus();
                				$("#email").parents(".input_area").find("button").attr("disabled", true);
                			}
                			else {
                				alert("인증 메일을 확인해주세요.");
                				$("#num").focus();
                				$("#num").parents(".input_area").find("button").attr("disabled", false);
                			}
                		},
                		error: function() {
                			console.log("통신 실패");
                		}
                	});
                }
                
                function checkEmail() {
                	if($("#num").val() == <%=random%>) {
                		alert("인증이 완료되었습니다.");
                		$("#email").parents(".input_area").find("button").attr("disabled", true);
                		$("#num").parents(".input_area").find("button").attr("disabled", true);
                		checkNum=1;
                	}
                	else {
                		alert("인증번호를 다시 확인해주세요.");
                	}
                };

                function checkForm() {
                    if(checkUserId==1 && checkUserPwd==1 && checkCheckPwd==1 && checkUserName==1 && checkNickname==1 && checkNum==1
                        && $("#year").val()!="none" && $("#month").val()!="none" && $("#day").val()!="none"
                        && $(".input_area2").children("input:radio:checked")!=null
                        && $("#sample6_postcode").val()!="" && $(".check_area").children("input:radio:checked").val()=="agree") {
                            return true;
                    }
                    else {
                    	alert("회원가입에 실패하였습니다. 다시 확인해주세요.");
                    	return false;
                    }
                }
</script>
        </div>
    </div>
</body>
</html>