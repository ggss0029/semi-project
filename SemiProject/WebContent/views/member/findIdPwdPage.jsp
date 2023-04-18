<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String contextPath = request.getContextPath(); %>
<%!
	public int getRandom(){
	int random = 0;
	random = (int)Math.floor((Math.random()*(99999-10000+1)))+10000;
	return random;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디/비밀번호 찾기</title>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        div{
            box-sizing: border-box;
            /* border: 1px solid black; */
        }
        .wrap{
            margin: auto;
            margin-top: 100px;
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
        #header{
            /* border: 1px solid red; */
            height: 7%;
        } 
        #title{
            font-size: 35px;
            text-align: center;
            font-weight: 600;
            padding-top: 20px;
        }   
        #footer{
            /* border: 1px solid red; */
            height: 10%;
        }
        #content{
            /* border: 1px solid blue; */
            height: 83%;
        }
        #content>div{
            height: 100%;
            float: left;
        }
        #c1,#c3{
            width: 7%;
        }
        #c2{
            width: 86%;
        }
        #c2>div{
            height: 100%;
            float: left;
        }
        #c2_outer1,#c2_outer3{
            width: 5%;
        }
        #c2_main{
            /* border: 1px solid red; */
            width: 90%;
        }
        #c2_main>div{
            width: 100%;
            margin: 30px 0;
            border: 2px solid black;
            border-radius: 10px;
        }
        #findId{
            height: 47%;
        }
        #idTitle{
            text-align: center;
            margin: 15px 0;
            padding-bottom: 10px;
            font-size: 25px;
            font-weight: 600;
            border-bottom: 1px solid black;
        }
        .find-form>*{
            width: 80%;
            height: 50px;
            margin: 10px;
        }
        .find-form>input,button{
            border-radius: 5px;
        }
        .info{
            margin-left: 50px;
            font-weight: 400;
        }
        #findPwd{
            height: 47%;
        }
        #pwdTitle{
            text-align: center;
            margin: 15px 0;
            padding-bottom: 10px;
            font-size: 25px;
            font-weight: 600;
            border-bottom: 1px solid black;
        }
        #btns{
            margin-top: 40px;
        }
        #btns>a{
            margin: 0 10px;
        }
        #right{
            background-color: lightblue;
        }
    </style>
</head>
<body>
    <div class="wrap">
        <div id="left">
            <div id="header">
                <div id="title">아이디 / 비밀번호 찾기</div>
            </div>
            <div id="content">
                <div id="c1"></div>
                <div id="c2">
                    <div id="c2_outer1"></div>
                    <div id="c2_main">
                        <div id="findId">
                            <div id="idTitle">아이디 찾기</div>
                            <div class="find-form" align="center">
                                <input type="text" name="inputName" id="idFindName" placeholder="이름"> <br>
                                <input type="email" name="inputEmail" id="idFindEmail" placeholder="이메일"><br>
                                <input type="hidden" readonly="readonly" name="code_check" id="code_check" value="<%=getRandom()%>">
                                <div class="info">
                                    가입시 등록한 이메일 주소를 입력해주세요. <br>
                                    이메일로 아이디를 보내드립니다.
                                </div>
                                <button id="findIdBtn">아이디 찾기</button>
                            </div>
                        </div>
                        <script>
                        	$("#findIdBtn").click(function(){
            					$.ajax({
            						url : "<%=contextPath%>/findId.me",
            						
            						data : {
            							inputName : $("#idFindName").val(),
            							inputEmail : $("#idFindEmail").val()
            						},
            						type: "post",
            						
            						success : function(result){
            							console.log(result);
            							if(result.loginType==1){
            								alert("이메일 발송 완료.\n회원님은 일반 로그인 방식입니다.");
            							}else if(result.loginType==2){
            								alert("회원님은 카카오 로그인 방식입니다.");
            							}else if(result.loginType==3){
            								alert("회원님은 네이버 로그인 방식입니다.");
            							}else{
            								alert("잘못된 이름 또는 이메일입니다. 다시 입력해주세요.");
            								$("#idFindName").select();
            							}
            						},
            						error : function(){
            							console.log("통신실패");
            						}
            					});
                        	});
                        </script>
                        <div id="findPwd">
                            <div id="pwdTitle">비밀번호 찾기</div>
                            <div id="findPwdArea" class="find-form" align="center">
                                <input type="text" name="inputId" id="pwdFindId" placeholder="아이디"> <br>
                                <input type="email" name="inputEmail" id="pwdFindEmail" placeholder="이메일"><br>
                                <input type="hidden" readonly="readonly" name="code_check" id="code_check" value="<%=getRandom()%>">
                                <div class="info">
                                    가입시 등록한 이메일 주소를 입력해주세요. <br>
                                    이메일로 인증 코드를 보내드립니다.
                                </div>
                                <button id="findPwdBtn">비밀번호 찾기</button>
                            </div>
                        </div>
                          <script>
                        	$("#findPwdBtn").click(function(){
            					$.ajax({
            						url : "<%=contextPath%>/findPwd.me",
            						
            						data : {
            							inputId : $("#pwdFindId").val(),
            							inputEmail : $("#pwdFindEmail").val(),
            							code_check : $("#code_check").val()
            						},
            						type: "post",
            						
            						success : function(result){
            							console.log(result);
            							if(result.loginType==1){
            								alert("이메일 발송 완료. \n인증 코드를 입력해주세요.");
            								$("#findPwdArea>*").remove();
            								$("#findPwdArea").append("<input type='text' name='inputCode' id='inputCode' style='width: 464.4px; height: 50px; border-radius: 5px;' placeholder='이메일로 받으신 코드를 입력해주세요.'>");
            								$("#findPwdArea").append("<button type='button' id='btnCode' style='width: 464.4px; height: 50px; border-radius: 5px;'>코드 인증하기</button>");
            						      	$("#btnCode").click(function(){
            	                        		if($("#inputCode").val() == result.code){
            	                        			$("#findPwdArea>*").remove();
            	                        			$("#findPwdArea").append("<form action='<%=contextPath%>/resetPwd.me' method='post' id='resetPwdForm'></form>");
            	                        			$("#resetPwdForm").append("<input type='hidden' name='hiddenId' id='hiddenId' value='false'>");
            	                        			$("#resetPwdForm").append("<input type='text' name='resetPwd' id='resetPwd' style='width: 464.4px; height: 50px; border-radius: 5px; margin-top:20px;' placeholder='재설정할 비밀번호를 입력해주세요.'><br>");
            	                        			$("#resetPwdForm").append("<input type='text' name='resetPwd1' id='resetPwd1' style='width: 464.4px; height: 50px; border-radius: 5px; margin-top:20px;' placeholder='재설정할 비밀번호를 다시 입력해주세요.'><br><br>");
            	                        			$("#resetPwdForm").append("<button type='submit' id='btnResetPwd' style='width: 464.4px; height: 50px; border-radius: 5px;'>비밀번호 재설정</button>");
	            	                        			$("#btnResetPwd").click(function(){
	            	                        				$("#hiddenId").val(result.inputId);
	                	                        			if($("#hiddenId").val() == result.inputId && $("#resetPwd").val()==$("#resetPwd1").val()){
	                	                        				alert("비밀번호가 성공적으로 재설정 되었습니다.\n로그인 페이지로 이동합니다.");
	                	                        				location.href="loginPage.jsp";
	                	                        			}else{
	                	                        				alert("비밀번호를 잘못 입력하셨습니다.\n다시 시도해주세요.");
	                	                        			}
	            	                        			});
            	                        		}else{
            	                        			alert("코드가 다릅니다. 다시 시도해주세요.");
            	                        		}
            						      	});
            							}else if(result.loginType==2){
            								alert("회원님은 카카오 로그인 방식입니다.\n카카오 로그인을 이용해주세요.");
            							}else if(result.loginType==3){
            								alert("회원님은 네이버 로그인 방식입니다.\n네이버 로그인을 이용해주세요.");
            							}else{
            								alert("잘못된 이름 또는 이메일입니다. 다시 입력해주세요.");
            								$("#idFindName").select();
            							}
            						},
            						error : function(){
            							console.log("통신실패");
            						}
            					});
                        	});
                        </script>
                    </div>
                    <div id="c2_outer3"></div>
                </div>
                <div id="c3"></div>
            </div>
            <div id="footer">
                <div id="btns" align="center">
                    <a href="" id="back" class="btn btn-outline-secondary">이전</a>
                    <a href="" id="main" class="btn btn-outline-secondary">메인 페이지</a>
                    <a href="loginPage.jsp" id="goLogin" class="btn btn-outline-secondary">로그인 하러 가기</a>
                </div>
            </div>
        </div>
        <div id="right"></div>
    </div>
</body>
</html>