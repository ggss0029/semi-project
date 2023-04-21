<%@page import="com.udong.board.news.model.vo.NewsAttachment"%>
<%@page import="com.udong.board.news.model.vo.NewsBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	NewsBoard nb = (NewsBoard)request.getAttribute("newsBoard");
	NewsAttachment na = (NewsAttachment)request.getAttribute("newsAttachment");
%>
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
            width: 1500px;
            height: auto;
            overflow: hidden;
            margin: auto;
        }


        #p1{ /*카테고리 글씨, 위치*/
            font-size: 45px;
            font-weight: 700;
            margin: 25px 0 0 30px;
            float: left;
        }
        
        #report_btn{
            float: left;
            margin: 60px 0 0 1170px;
        }

        #line_1 {
            position: absolute;
            border: 1px solid black;
            width: 1440px;
            height: 0px;
            top: 360px;
            margin-left: 30px;
        }
        

        table{
            width: 1400px;
        }

        #line_3{
            border: 1px solid black;
            width: 1440px;
            height: 0px;
            margin: auto;
        }

        /* 좋아요 */
        #like-area{
            float: left;
            margin: 0 0 0 50px;
        }
        #btn-area {
            margin: 0 50px 0 0;
        }

        #p2{
            font-size: 25px;
            margin: 10px 0 0 40px;
        }

        #reply-area>p{
            font-size: 25px;
            font-weight: 700;
        }

        #reply_insert_btn{
            margin: 40px 0 0 0px;
        }
        
        #profile{
        	font-decoration: none;
        	color: black;
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
                <p id="p1">동네 소식</p>
                <button id="report_btn" class="btn btn-basic">신고하기</button>
                
                <div id="line_1"></div>

                <table border="0" align="center" id="detail-area">
                    <tr>
                        <td colspan="2" style="height: 50px; font-size: 30px; font-weight: 600; border-bottom: 1px solid black;"><%=nb.getBoardTitle() %></td>
                    </tr>
                    <tr>
                        <td style="height: 50px; font-size: 20px; font-weight: 600;"><a href="" id="profile"><%=nb.getBoardWriter() %></a> </td>
                        <td style="height: 50px; font-size: 20px; font-weight: 600;" align="right"><%=nb.getCreateDate() %></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="height: auto;"><%=nb.getBoardContent() %></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="border-top: 1px solid black; border-bottom: 1px solid;">
                        	<!-- 첨부파일이 없는 경우 첨부파일이 없습니다. -->
                        	<%if(na == null) {%>
                        		첨부파일이 없습니다.
                        	<%} else { %>
                        	<a href="<%=contextPath + na.getFilePath() + "/" + na.getChangeName()%>"
                        		download="<%=na.getOriginName()%>"><%=na.getOriginName() %></a>
                        	<%} %>
                        </td>
                    </tr>
                </table>
                
                <div id="like-area">
                   	 좋아요 구현
                </div>
                <%
                	if(loginUser != null && loginUser.getUserId().equals(nb.getBoardWriter()) && loginUser.getUserId().equals("admin") ) {
                %>
                <div id="btn-area" align="right">
                    <button onclick="location.href = '<%=contextPath %>/newsUpdate.bo?bno=<%=nb.getBoardNo() %>'" class="btn btn-light">수정</button>
                    <button onclick="location.href = '<%=contextPath %>/newsDelete.bo?bno=<%=nb.getBoardNo() %>'" class="btn btn-dark">삭제</button>
                </div>
                <%
                	}
                %>
                
                <br>
                <div id="reply-area">
                    <p id="p2">댓글</p>
                    <table border="0" align="center">
                    	<thead>
                    		<%
                    			if (loginUser != null) {
                    		%>
	                        <tr>
	                            <td colspan="1" style="font-size: 17px; font-weight: 700;">사용자 이름</td>
	                        </tr>
	                        <tr>
	                            <td>
	                                <textarea id="replyContent" cols="175" rows="3" style="resize: none;"></textarea>
	                            </td>
	                            <td>
	                                <button onclick="insertReply();" id="reply_insert_btn" style="width: 80px;" class="btn btn-light">등록</button>
	                            </td>
	                        </tr>
	                        <%} else { %>
	                        	<tr>
	                            <td colspan="1" style="font-size: 17px; font-weight: 700;">회원 이름</td>
	                        </tr>
	                        <tr>
	                            <td>
	                                <textarea cols="175" rows="3" style="resize: none;" readonly>
	                                	로그인 후 이용 가능한 서비스 입니다.
	                                </textarea>
	                            </td>
	                        </tr>
	                        <%} %>
	                        <tr>
	                        	<td colspan="2">&nbsp;</td>
	                        </tr>
	                     </thead>
	                     
	                     <tbody>
                                <tr>
                                    <td style="font-size: 17px; font-weight: 700;">회원</td>
                                    <td>2023-04-21</td>
                                </tr>
                                <tr>
                                    <td>블라블라</td>
                                </tr>

                            </tbody>
                    </table>
                    <br><br>
                    
                    <script>
                    	$(function() {
                    		selectReplyList();
                    	});
                    	
                    	function insertReply() {
                    		//댓글 삽입
                    		//게시글 번호 필요
                    		//게시글 번호 들고가서 성공시 -> 댓글 리스트 조회함수 실행 후 textarea 작성한 것 비워주기
                    		$.ajax({
                    			url : "newsInsertReply.bo",
                    			data : {
                    				content : $("#replyContent").val(),
                    				newsBoardNo : <%=nb.getBoardNo()%>
                    			},
                    			type : "post",
                    			success : function(result) {
                    				if(result>0) {
                    					alert("댓글 작성 완료!");
                    					newsSelectReplyList(); //댓글 리스트 갱신
                    					$("#replyContent").val("");
                    				}
                    			},
                    			error : function() {
                    				alert("댓글 작성 실패");
                    			}
                    		});
                    	}
                    	
                    	
                    </script>
                </div>

                
                
                

            </div>
        </div>
        <div id="footer"></div>
    </div>
</body>
</html>