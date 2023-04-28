<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.udong.member.model.vo.Member"%>
  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>유저탈퇴</title>
    <style>
        * {
            box-sizing: border-box;
            /* box-sizing:content-box; */
        }

        body {
            margin: 0;
            padding: 0;
        }
        .wrap{
        	position:relative;
			z-index:1;
            width: 1500px;
            height: 1530px;
            border: 1px solid black;
            margin: auto;
        }

        .wrap>div{
            height: 100%;
            width: 100%;
        }

        #header{
            height: 13.5%;
        }

        #header>div{
            width: 100%;
        }

        .header_1{
            background-color: red;
            height: 180px;
        }

        .header_2{ /*메뉴바*/
            background-color: orange;
            height: 90px;
        }

        #content {
            width: 100%;
            height: 76.5%;
        }

        #content>div {
            float: left;
            height: 100%;
        }

        .content_1 {
            background-color: yellow;
            width: 25%;
        }

        .content_2 {
            width: 75%;
            position: relative;/*놓침*/
        }

        .page-area{
            border: 1.5px solid darkgrey;
            background-color: white;
            width: 1100px;
            height: 1500px;
            margin: 12.5px;
        }

        #p1 {
            font-size: 45px;
            font-weight: 550;
        }

        .leave-discription {
            font-size: 16px;
        }

        .category>a {
            text-decoration: none;
            color: black;
            font-size: 30px;
        }

        .category {
            margin: 30px;
        }

        /* 표 스타일 */
        #deldtetable {
            border-collapse: collapse;
        }
        #deldtetable>tr{
            border: 1px solid darkgrey; 
        }

        #deldtetable>tr>td {
            border: 1px solid darkgrey; 
            height: 50px;
            /*width: 25%;*/
            padding: 5px 10px;
        }
        

        #deldtetable>tr>td .wordArea{
            width: 20%;
        }
        
        #delete-form {
        	height: 30%;
        }


        
        
        input.full-size {
            width: 100%;
            height: 100%;
        }

        .apply-wrapper{
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 30px 0;
            border: 1px solid #dddddd;
            background-color: #eeeeee;
            margin-top: 20px;
            margin-bottom: 20px;
        }

        .apply-wrapper input{
            margin-right: 12px;
        }
        
        .filter-wrapper{
            display: flex;
            padding: 30px 0;
            border: 1px solid #dddddd;
            background-color: #eeeeee;
            margin-bottom: 30px;
        }
        
     
        /*탈퇴버튼 여백*/
        .deleteAccButton{
            border: 0;
            padding: 18px 45px;
            border-radius: 1px;
            margin-right: 12px;
            font-size: 17px;
            background-color:#113387;
            color: whitesmoke;

        }

        /*취소버튼 여백*/
        .refreshButton{
            border: 0;
            padding: 18px 45px;
            border-radius: 1px;
            margin-right: 12px;
            font-size: 17px;
            background-color:#555555;
            color: whitesmoke;

        }

        /* select 태그의 크기 조정 */
        .box {
        width: 110px;
        height: 40px;
        padding: 1px;
        }

        /* option 태그의 크기 조정 */
        .box option {
        height: 30px;
        padding: 1px;
        }

        /**/

        .wordArea{
            background-color: #f5f5f5;
        }

        .wordArea label{
            font-weight: 800;
        }

    </style>
    
</head>
<body>
<%@ include file = "../common/menubar.jsp" %>
    <div class="wrap">
        <div id="content">
            <div class="content_1">
                <div class="category">
                    <p id="p1">
                       	 자주 묻는 질문
                    </p>
                    <hr>
                    <a href="">나의 정보</a> <br>
                    <hr>
                    <a href="">개인정보 수정</a> <br>
                    <hr>
                    <a href="">작성한 게시글</a> <br>
                    <hr>
                    <a href="">좋아요한 게시글</a> <br>
                    <hr>
                    <a href="">회원 탈퇴</a> <br>
                </div>
            </div>
            <div class="content_2">
               
                <!--page-area-->
                <div class="page-area">


                       <div id="container">

                            <!--회원탈퇴 안내란-->
                            <div id="deleteInform" width="1098px" height="500px"  >
                                <h1>회원탈퇴</h1>
                                <p class="leave-discription">
                                    	회원탈퇴를 신청하기전에 안내사항을 꼭 확인해주세요.
                                </p>

                                <hr>
                                <p style="font-size: 15px">
					                                    탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니 신중하게 선택하시기 바랍니다.<br>
					                <br>
					                                    각종 게시판에 올린 게시글 및 댓글은 탈퇴 시 자동 삭제되지 않고 그대로 남아 있습니다.<br>
					                <br>
					                                    삭제를 원하는 게시글이 있다면 반드시 탈퇴 전 비공개 처리하거나 삭제하시기 바랍니다.<br>
                                    <br>
                                </p>
                            </div>

                            <hr>

                            <form id="delete-form" action="<%=contextPath%>/UserDelete.me" method="post">
                    
                            	<table align="center"class="tg" width="1098px" id="deldtetable">
                               
	                                <tr>
	                                    <td class="wordArea">
	                                        <label for="userId">  아이디 :</label>
	                                    </td>
	                                    <td class="tg-0lax">
	                                        <input class="full-size" type="text" id="userId" name="userId" placeholder="아이디를 입력해주세요"><br>
	
	                                    </td>
	                                    <td class="wordArea">
	                                        <label for="userPwd">  비밀번호 :</label>
	                                    </td>
	                                    <td class="tg-0lax">
	                                        <input class="full-size" type="password" id="userPwd" name="userPwd" placeholder="비밀번호를 입력해주세요" ><br>
	
	                                    </td>
	                                </tr>
                              	</table>

								<div>
									
	                                <div class="apply-wrapper">
	                                    <label for="myCheckbox">안내 사항을 모두 확인하였으며, 이에 동의합니다.
										<input type="checkbox" id="myCheckbox">
										</label>
	                                </div>
	                              
	
	                                <div align="center"> 
	                                    <a href="javascript:void(0)" id="mybutton"  class="deleteAccButton" >탈퇴</a>
	                                </div>
								</div>
							
                            </form>

                       </div>

                </div>
                
            </div>
        </div>
    </div>
    <%@ include file = "../common/footer.jsp" %>
</body>
<script>

$(function(){
	var flag = <%=request.getAttribute("flag") %>
	//첫진입시와 실패한후 동일한 화면을 띄우는데 flag에 대한 구분값
	if(flag){
		alert("회원탈퇴에 실패했습니다.")
	}
	
	$("#mybutton").prop("disabled" , true)	
	var contextPath = "<%= request.getContextPath()%>";
	var userId;
	var userPwd;
	var checked = false;
	
		//change userId의 value가 변할시 (포커스아웃) 
		$("#userId").change(function(){
			userId = $("#userId").val();
		}); 
		
		$("#userPwd").change(function(){
			userPwd = $("#userPwd").val();
		});
		
	
		$("#myCheckbox").change(function(){
			checked = $(this).prop("checked");
			
			if($(this).prop("checked")){
				$("#mybutton").prop("disabled" , false)
			}else{
				$("#mybutton").prop("disabled" , true)
			}
		});
	
		$("#mybutton").click(function(){
			
		// 입력된 값이 유효한지 확인합니다.
		//confirm 예 아니오
		if(userId && userPwd && checked){
			if(confirm("회원탈퇴 하시겠습니까?")){
				var form = $("#delete-form"); 
				form.submit();
			}else{
				return false;	
			}
		}
	});
});
</script>

    

</html>