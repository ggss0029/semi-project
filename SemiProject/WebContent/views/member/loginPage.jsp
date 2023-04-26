<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 페이지</title>
    <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
    <style>
        div{
            box-sizing: border-box;
           /* border: 1px solid black; */
        }
        .wrap{
            margin: auto;
            margin-top: 50px;
            margin-bottom: 50px;
            width: 1500px;
            height: 1000px;
        }
        .wrap>div{
            height: 100%;
            width: 50%;
            float: left;
        }
        #left>div{
            width: 100%;
        }
        #header,#footer{
            /* border: 1px solid red; */
            height: 20%;
        }
        #content{
            /* border: 1px solid blue; */
            height: 60%;
        }
        #content>div{
            height: 100%;
            float: left;
        }
        #c1,#c3{
            width: 10%;
        }
        #c2{
            width: 80%;
            border-top: 1px solid black;
            border-bottom: 1px solid black;
        }
        #c2>div{
            height: 100%;
            float: left;
        }
        #c2_outer1,#c2_outer3{
            width: 10%;
        }
        #c2_main{
            /* border: 1px solid red; */
            width: 80%;
        }
        #c2_main>div{
            width: 100%;
        }
        #login-form>div{
            height: 100%;
        }
        #m1{
            height: 55%;
            border-bottom: 1px solid black;
        }
        #m1>input,button{
            width: 100%;
            height: 15%;
            padding: 0;
            font-size: 17px;
        }
        #inputId{
            margin-top: 65px;
        }
        #inputPwd{
            margin-top: 35px;
        }
        #m2{
            /* border: 1px solid blue; */
            height: 45%;
        }
        #loginBtn{
            background-color: #555555;
            color: white;
            width: 101%;
            margin-top: 40px;   
            border-radius: 10px;
            margin-bottom: 10px;
            
        }
        #btn-kakao-login{
            width: 100%;
            height: 25%;
            margin-top: 20px;
        }
        .naver-icon{
        	align:center;
        }
         #naver-out{ 
             margin-top: 20px; 
             width: 100%; 
             height: 25%; 
             background-color: #0EC961; 
             border-radius: 10px; 
             color:white;
         } 
         #btn-naver-login{ 
             margin-top: 20px; 
             height: 25%; 
             width: 100%; 
             background-color: #0EC961; 
             border-radius: 10px; 
             position: relative; 
             padding-left: 5px; 
         } 
         #naver-login-text{ 
             color: white; 
             font-size: 23px; 
             padding-left: 16px; 
             padding-top: 17px; 
             padding-bottom: 17px; 
             text-align: center; 
             display: block; 
         } 
        #findIdPwd{
            text-align: center;
            margin-top: 15px;
        }
        #findIdPwd a{
            text-decoration: none;
            color:dimgray;
            font-size: 15px;
            font-weight: 600;
        }
        #enroll{
            text-align: center;
            margin-top: 15px;
            color:dimgray;
            font-size: 15px;
            font-weight: 600;
        }
        #enroll a{
            text-decoration: none;
            color:dimgray;
            font-size: 15px;
            font-weight: 600;
        }
        #right{
 			background-color:lightblue;
        }
    </style>
</head>
<body>
<!-- 	<script> -->
// 			$(function(){
<%-- 				<%if(request.getSession().getAttribute("loginUser")!=null){ %> --%>
// 				$("body").append("<button type='button' onclick='history.back();' id='backBtn1' style='display:none'>뒤로가자잇</button>");
// 				$("#backBtn1").click();
// 				location.href = document.referrer;
// 				$("#refreshBtn1").click();
// 				location.reload();
<%-- 				<%} %> --%>
// 			});
<!-- 	</script> -->
    <div class="wrap">
        <div id="left">
            <div id="header"></div>
            <div id="content">
                <div id="c1"></div>
                <div id="c2">
                    <div id="c2_outer1"></div>
                    <div id="c2_main">
                       <form action="/udong/login.me" id="login-form" method="post">
                            <div id="m1">
                                <input type="text" style="height: 60px;" name="inputId" id="inputId" placeholder="아이디"><br>
                                <input type="password" style="height: 60px;" name="inputPwd" id="inputPwd" placeholder="비밀번호">
                                <button type="submit" style="height: 60px;" id="loginBtn">로그인</button>
                            </div>
                        </form>
                        <div id="m2">
                            <img src="icons/kakao_login_large_wide.png" id="btn-kakao-login" onclick="kakaoLogin();">
                            <form id="form-kakao-login" method="post" action="<%=request.getContextPath()%>/kakao-login.me">
                                <input type="hidden" name="email"/>
                                <input type="hidden" name="nickname"/>
                                <input type="hidden" name="gender"/>
                                <input type="hidden" name="ageRange"/>
                                <input type="hidden" name="birthday"/>
                            </form>
							<%
							    String clientId = "CJ7qrC5nVBwBp47rzM35";//애플리케이션 클라이언트 아이디값";
							    String redirectURI = URLEncoder.encode("http://localhost:8888/udong/naverLogin.me", "UTF-8");
							    SecureRandom random = new SecureRandom();
							    String state = new BigInteger(130, random).toString();
							    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
							    apiURL += "&client_id=" + clientId;
							    apiURL += "&redirect_uri=" + redirectURI;
							    apiURL += "&state=" + state;
							    session.setAttribute("state", state);
							 %>
                            <a href="<%=apiURL%>" id="naverIdLogin"><img height="50" style="display: none;" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>
							<div id="btn-naver-login">
                                <img src="icons/btnG_아이콘사각.png" style="height: 66px; position: absolute;">
                                <div id="naver-login-text">네이버 로그인</div>
                            </div>
							<script type="text/javascript">
							$(document).on("click", "#btn-naver-login", function(){ 
								var btnNaverLogin = document.getElementById("naverIdLogin").firstChild;
								btnNaverLogin.click();
							});
  							</script>
                            <div id="findIdPwd"><a href="findIdPwdPage.jsp">아이디 찾기 / 비밀번호 찾기</a></div>
                            <div id="enroll"><label for="goEnroll">아이디가 없으신가요?</label> <a href="" id="goEnroll">회원가입</a></div>
                        </div>
                        </div>
                    </div>
                    <div id="c2_outer3"></div>
                </div>
                <div id="c3"></div>
            <div id="footer"></div>
            </div>
        <div id="right"></div>
       </div>
        
     <script>
        $(function(){
          <%if(request.getSession().getAttribute("result")!=null && (int)request.getSession().getAttribute("result")==0){%>
             var loginError = "<%=request.getSession().getAttribute("loginError")%>";
             console.log(loginError);
              alert(loginError);
          <%}else if(request.getSession().getAttribute("result")!=null && (int)request.getSession().getAttribute("result")==1){%>
          	var loginError = "<%=request.getSession().getAttribute("loginError")%>";
         	 console.log(loginError);
           		alert(loginError);
           <%}%>
             });
    </script>
        <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
		<script>
		Kakao.init('7122a55dfee4ed591b995856dce3e752');
		function kakaoLogin() {
		    Kakao.Auth.login({
		      success: function (response) {
		        Kakao.API.request({
		          url: '/v2/user/me',
		          success: function (response) {
		        	  console.log(response);
			var email = response.kakao_account.email;
			var nickname = response.kakao_account.profile.nickname;
			var gender = response.kakao_account.gender;
			var birthday = response.kakao_account.birthday;
			var ageRange = response.kakao_account.age_range;
			
			$('input[name=email]').attr('value',email);
			$('input[name=nickname]').attr('value',nickname);
			$('input[name=gender]').attr('value',gender);
			$('input[name=ageRange]').attr('value',ageRange);
			$('input[name=birthday]').attr('value',birthday);
			
			document.querySelector('#form-kakao-login').submit();
			var msg = "<%=request.getSession().getAttribute("alertKakaoMsg")%>";
				if(msg=="null"){
					alert("등록된 회원 정보가 없습니다. 회원 가입으로 이동합니다.");
				}else{
					alert(msg);
				}
		          },
		          fail: function (error) {
		            console.log(error)
		          },
		        })
		      },
		      fail: function (error) {
		        console.log(error)
		      },
		    })
		  }
		</script>
</body>
</html>