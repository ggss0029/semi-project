<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
		#footer{
            height: 200px;
            background-color: rgb(240, 240, 240);
        }
        
        #footer>div{
            width: 100%;
        }

        #footer_1{
            height: 20%;
        }
        
        #footer_1>a {
        	text-decoration: none;
            color: black;
            font-weight: 600;
            margin: 15px;
            vertical-align: middle; 
        }

        #footer_2{
            height: 80%;
        }
        
        #footer_2>p {
            text-align: center;
        }
        
        /*모달*/
        
        .modal {
        	pointer-events: none;
      	}

      	#p_img {
        	width: 100%;
        	height: 180px;
      	}

      	#p_img>img {
        	width: 180px;
        	height: 180px;
        	margin: 0 143px;
        	border-radius: 50%;
      	}

      	#p_introduction, #p_introduction>textarea {
        	width: 100%;
      	}

      	.modat_btns>button {
        	width: 90px;
        	height: 45px;
        	margin: 0 5%;
      	}

      	#rec {
        	padding: 0;
      	}

      	#rec>p {
        	box-sizing: border-box;
        	padding: 0;
        	margin: 0;
      	}
      	
</style>
</head>

<body>
	<div id="footer">
    	<div style="height:20px;"></div>
    	<div id="footer_1">
    		<a href="https://github.com/hansuung/SEMI-PROJECT">깃허브</a> |
            <a href="<%=contextPath%>/policy.do">개인정보취급방침</a> | 
            <a>서울특별시 영등포구 선유동2로 57 이레빌딩(구관) 19F, 20F</a>
    	</div>
    	<div id="footer_2">
	    	<p><b>조장</b> 한성</p>
	    	<p><b>조원</b> 권수지, 안채영, 정희재</p>
	    	<p><b>문의</b> dlstmxk12@naver.com</p>
	    	<p>Copyright © 2023 SEMI-PROJECT KH DANGSAN WEB DEVELOPMENT CLASS6 GROUP3 All Right Reserved</p>
    	</div>
    </div>
    
    
    <!-- The Modal -->
	<div class="modal" id="profile" role="dialog">
		<div class="modal-dialog modal-dialog-centered ">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header" style="border-bottom: 0;">
					<button type="button" class="close" data-dismiss="modal" id="closeModal"
						style="height: 100%;">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body" style="box-sizing: border-box;">
					<div style="border-bottom: 0.5px solid lightgray; width: 100%; height: 100%;">
						<div id="p_img">
							<!--프로필 없으면-->
							<img src="<%=contextPath %>/views/member/icons/free-icon-user-181549.png" alt="프로필사진">
							<!--프로필 있으면-->
							<!-- <img src="" alt="프로필사진"> -->
						</div>
						<br>
						<div id="p_nickname" align="center">
							<p style="font-size: 33px; font-weight: 580;"></p>
						</div>
						<div id="p_age" align="center">
							<p style="font-size: 20px; font-weight: 540;"></p>
						</div>
						<div id="p_address" align="center">
							<p style="font-size: 20px; font-weight: 540;"></p>
						</div>
						<div id="p_introduction">
							<textarea name="" id="" cols="55" rows="4" style="resize: none;" readonly></textarea>
						</div>
						<br>
					</div>

					<div align="center">
						<br>
						<div class="modal_btns">
							<button type="button" class="btn btn-secondary">쪽지</button>
							<button type="button" class="btn btn-secondary">쓴글보기</button>
						</div>
						<br>
						<button type="button" class="btn btn-primary"
							style="width: 200px; height: 80px;" id="rec">
							<p align="left" style="margin-left: 5px;">추천&#128077;</p><p id="recommend" style="font-weight: 500; font-size: 35px; margin-bottom: 10px;">1004</p>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script>
    	$("#profile").on('show.bs.modal', function(e) {
      		
      	});
    	
    	function whoareyou() {
			<%if(loginUser != null) {%>
				$("#profile").modal('show');
	    		console.log("낫널");
	    	<%} else { %>
	    		$("#profile").modal('hide');
	    		console.log("널");
	    	<%}%>
    	}
    </script>
</body>
</html>