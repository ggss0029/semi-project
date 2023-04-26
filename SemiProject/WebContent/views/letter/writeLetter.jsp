<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>보낸 쪽지함</title>
    <style>
    	div{
/*     		border: 1px solid black; */
    	}
        .wrap{ 
            height: 830px;
            width: 1500px;
            margin: auto;
        }
        .wrap>div{
            width: 100%;
        }
        #content{
            width: 100%;
            height: 100%;
        }
        #content>div{
        	height: 100%;
        	float:left;
        }
        #content_1{
        	width:25%;
        	background-color:yellow;
        }
        #content_1>div{
        	width:90%;
        }
        #content_1_1{
        	font-size:50px;
        	font-weight:700;
        	text-align:left;
        	padding:50px 0px 15px 30px;
        	border-bottom:2px solid black;
        }
        #content_1_2{
        	font-size:40px;
        	font-weight:500;
        	text-align:left;
        	padding:10px 0px 10px 30px;
        	border-bottom:2px solid black;
        }
        #content_1_3{
        	font-size:40px;
        	font-weight:500;
        	text-align:left;
        	padding:10px 0px 10px 30px;
        	border-bottom:2px solid black;
        }
        #content_1_4{
        	font-size:45px;
        	font-weight:500;
        	text-align:left;
        	padding:10px 0px 10px 30px;
        	border-bottom:2px solid black;
        }
        #content_1>div>a{
        	text-decoration:none;
        	color:black;
        }
        #content_2{
        	width:74%;
        }
        #content_2>div{
        	width:90%;
        }
        #content_2_1{
        	height:15%;
        	font-size:50px;
        	font-weight:400;
        	text-align:left;
        	padding:30px 0px 10px 20px;
        	border-bottom:2px solid black;
/*           	background-color:red;   */
        }
        #content_2_2{
        	margin-top: 30px;
        }
        #searchModal>tbody>tr:hover{
        	background-color:lightgray;
        }
    </style>
</head>
<body>
	<%@include file="../common/menubar.jsp"%>
    <div class="wrap">
        <div id="content">
        	<div id="content_1" style="margin-left:10px;" align="center">
        		<div id="content_1_1">쪽지</div>
        		<div id="content_1_2"><a href="<%=contextPath%>/receiveLetterList.le?writerNo=<%=loginUser.getUserNo()%>&currentPage=1">받은 쪽지함</a></div>
        		<div id="content_1_3"><a href="<%=contextPath%>/sendLetterList.le?writerNo=<%=loginUser.getUserNo()%>&currentPage=1">보낸 쪽지함</a></div>
        		<div id="content_1_4">쪽지 보내기</div>
        	</div>
        	<div id="content_2" align="center">
        		<div id="content_2_1">쪽지 보내기</div>
	        	<div id="content_2_2">
    	    		<form action="<%=contextPath%>/writeLetter.le" method="post">
						발신자 : <input type="text" name="sender" value="<%=loginUser.getNickname()%>" readonly>
						수신자 : <input type="text" name="receiver" id="receiver" required><input type="hidden" name="receiverNo" id="receiverNo"><input type="hidden" name="senderNo" value="<%=loginUser.getUserNo()%>">
						<button type="button" onclick="searchNickname();" class="btn btn-success" data-toggle="modal" data-target="#myModal">닉네임 찾기</button>
						<br><br>
						<textarea required maxlength="300" name="letterContent" placeholder="최대 300자까지 작성 가능합니다." rows="10" cols="30" style="width:1000px; height:400px; font-size:20px; resize:none;"></textarea>
						<br><br>
						<button type="submit" class="btn btn-warning" style="margin-right:10px;">쪽지 보내기</button>
						<button type="reset" class="btn btn-danger">취소하기</button>
        			</form>
        			
        		<script>
					function searchNickname(){
						$.ajax({
							url : "<%=contextPath%>/searchNickname.le",
							success : function(list){
								
								var str="";
								
								for(var i =0; i<list.length; i++){
									str+= "<tr>"
										+ "<td>"+list[i].nickname + "</td>"
										+ "<td>"+list[i].address + "</td>"
										+ "<td>"+list[i].enrollDate + "</td>"
										+ "<td><button type='button' onclick='getInfo();' class='btn btn-info'>선택</button><input type='hidden' class='hiddenNo' value="+list[i].userNo+"></td>"
										+"</tr>";
								}
								$("#searchModal").children("tbody").html(str);
							},
							error : function(){
								console.log("ajax통신 실패");
							}
						});
					}
				</script>
        		</div>
        	</div>
    	</div> 
    </div> 
    
    <div class="modal" id="myModal">
        <div class="modal-dialog">
        <div class="modal-content">
    
            <!-- Modal Header -->
            <div class="modal-header">
            <h4 class="modal-title">닉네임 찾기</h4>
            <button type="button" class="close" data-dismiss="modal">&#127758</button>
            </div>
            <!-- Modal body -->
            <div class="modal-body">
            	<div style="margin-left:50px;">
					<input type="text" name="searchNicknameInput" id="searchNicknameInput" style="width:300px;" placeholder="검색할 닉네임을 입력하세요.">
					<button type="button" onclick="findNickname();">검색</button>
				</div>
				<br>
				<table id="searchModal" style="text-align:center;" align="center" border="1">
					<thead>
						<tr>
							<td style="width:100px;">닉네임</td>
							<td style="width:250px;">주소</td>
							<td style="width:100px;">가입일</td>
							<td style="width:100px;">선택</td>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
				<script>
				
				function getInfo(){
					var nickname = $(event.target).parent().siblings().eq(0).text();
					var hiddenNo = $(event.target).next().val();
					$("#receiver").val(nickname);
					$("#receiverNo").val(hiddenNo);
					$("#closeBtn").click();
				}
				
					function findNickname(){
						$.ajax({
							url : "<%=contextPath%>/findNickname.le",
							data : {inputNickname : $("#searchNicknameInput").val()},
							success : function(m){
								
								var str="";
								if(m == null){
									str += 	"<tr>"
										+ "<td colspan='3'>닉네임이 일치하는 회원이 없습니다.</td>"
										+ "</tr>"
								}else{
									str+= "<tr>"
										+ "<td>"+m.nickname + "</td>"
										+ "<td>"+m.address + "</td>"
										+ "<td>"+m.enrollDate + "</td>"
										+ "<td><button type='button' onclick='getInfo();' class='btn btn-info'>선택</button><input type='hidden' class='hiddenNo' value="+m.userNo+"></td>"
										+"</tr>";
								}								
								$("#searchModal").children("tbody").children().remove();
								$("#searchModal").children("tbody").html(str);
							},
							error : function(){
								console.log("ajax통신 실패");
							}	
						});
					};
				</script>
            </div>
            <!-- Modal footer -->
            <div class="modal-footer">
            <button type="button" id="closeBtn" class="btn btn-danger" data-dismiss="modal">Close</button>
            </div>
    
        </div>
        </div>
        
     </div> 
    <%@include file="../common/footer.jsp"%>
</body>
</html>