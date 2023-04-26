<%@page import="com.udong.board.common.model.vo.BoardCommon"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.udong.common.model.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String totalSearch = (String)request.getSession().getAttribute("totalSearch");
// 	PageInfo pi = (PageInfo)request.getSession().getAttribute("pi");
	ArrayList<BoardCommon> list = (ArrayList<BoardCommon>)request.getAttribute("list");
	String keyword = (String)request.getAttribute("keyword");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>검색 결과</title>
    <!-- Latest compiled and minified CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <!-- jQuery library -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
        <!-- Popper JS -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        div{
/*             border: 1px solid black;  */
            box-sizing: border-box;
        }

        .wrap{
            height: 2000px;
            width: 1500px;
            margin: auto;
        }

        .wrap>div{
            width: 100%;
        }

        #header{
            height: 13.5%;
            border: 1px solid black;
        }

        #content{
            width: 100%;
            height: 76.5%;
            position: relative;
            border: 1px solid black;
            /* background-color: red; */
        }
        #footer{
            width: 100%;
            height: 10%;
            background-color: darkblue;
        }

        #header>div{
            width: 100%;
        }

        #header_1{
            height: 67%;
            /* background-color: red; */
        }

        #menubar{
            height: 33%;
            /* background-color: orange; */
            border: 1px solid black;
        }
        #keywordDiv{
        	height:10%;
/*         	border:1px solid red; */
        	width:100%;
        	font-size:60px;
        	padding-top:25px;
        }
        #searchArea{
            width: 80%;
            height: 7%;
            /* border: 1px solid red; */
        }
        #searchArea>*{
            margin: 20px 5px 5px 5px;
            border-radius: 5px;
        }
        #searchArea>select{
            width: 10%;
            height: 60%;
            font-size: 20px;
        }
        #searchArea>input{
            width: 50%;
            height: 60%;
            font-size: 20px;
        }
        #searchArea>button{
            width: 15%;
            height: 60%;
            font-size: 20px;
        }
        #resultList{
            margin-top: 20px;
            width: 93%;
            height: 75%;
        }
        #listTable{
            width: 100%;
/*             height: 100%; */
            font-size: 25px;
            text-align: center;
        }
        #paging{
            margin-top: 5px;
            height: 6%;
        }
    </style>
</head>
<body>
	<%@include file="menubar.jsp"%>
    <div class="wrap">
        <div id="content" align="center">
        <div id="keywordDiv" align="center">
        <%if(keyword.equals("검색어 입력 안함.")){%>
        	<%=keyword%>
        <%}else{ %>
        	[<%=keyword%>]에 대한 검색 결과입니다.
        <%} %>
        </div>
            <div id="searchArea">
                <select name="timeRange" id="timeRange">
                    <option value="전체">기간 선택</option>
                    <option value="1일">1일</option>
                    <option value="7일">7일</option>
                    <option value="1달">1달</option>
                    <option value="1년">1년</option>
                </select>
                <select name="detailRange" id="detailRange">
                    <option value="제목만">제목만</option>
                    <option value="게시글 내용">게시글 내용</option>
                    <option value="댓글">댓글</option>
                    <option value="작성자">작성자</option>
                </select>
                <input type="search" name="searchInput" id="searchInput" placeholder="검색어를 입력하세요.">
                <button type="button" onclick="goSearch();">검색</button>
            </div>
            <div id="resultList">
                <table id="listTable" border="1">
                    <thead style="height: 75px;">
                        <tr>
                            <th style="width:7%;">글 번호</th>
                            <th style="width:17%;">게시판 이름</th>
                            <th style="width:38%;">제목</th>
                            <th style="width:18%;">작성자</th>
                            <th style="width:9%;">조회수</th>
                            <th style="width:11%;">좋아요 수</th>
                        </tr>
                    </thead>
                    <tbody>
							<%for(BoardCommon b : list){ %>
							<tr>
								<td><%=b.getBoardNo()%></td>
								<td><%=b.getBoardName()%></td>
								<td><%=b.getBoardTitle()%></td>
								<td><%=b.getBoardWriter()%></td>
								<td><%=b.getCount()%></td>
								<td><%=b.getLikeCount()%></td>
							</tr>
							<%} %>
                    </tbody>
                </table>
            </div>
            <div id="paging">
            
            </div>
            <script>
            
                function goSearch(){
                    $.ajax({
                        url : "totalSearch.bo",
                        data : {
                                timeRange : $("#timeRange").val(),
                                detailRange : $("#detailRange").val(),
                                searchInput : $("#searchInput").val(),
                                currentPage : 1
                        },

                        success : function(total){
                        	var list = (total[0]);
                        	var check = (total[1]);
                        	
//                         	var paging = "";
//                         	if(pi.currentPage != 1){
//                         	}
                        	var str ="";
                        if(check == 'check'){
                        	$("#listTable").children("thead").children().remove();
                        	$("#listTable thead").html("<tr><th style='width:9%;'>댓글 번호</th><th style='width:15%;'>댓글 작성자</th><th style='width:40%;'>댓글 내용</th>"
                                    +"<th style='width:18%;'>댓글 작성일</th><th style='width:18%;'>댓글 수정일</th></tr>");
    						for(var i =0; i<list.length; i++){
    							str+= "<tr>"
    								+ "<td>"+list[i].replyNo + "</td>"
    								+ "<td>"+list[i].replyWriter + "</td>"
    								+ "<td>"+list[i].replyContent + "</td>"
    								+ "<td>"+list[i].createDate + "</td>"
    								+ "<td>"+list[i].modifyDate + "</td>"
    								+"</tr>";
    						}
                        }else{
    							$("#listTable").children("thead").children().remove();
    							$("#listTable thead").html("<tr><th style='width:7%;'>글 번호</th><th style='width:17%;'>게시판 이름</th>"
    		                            +"<th style='width:38%;'>제목</th><th style='width:18%;'>작성자</th><th style='width:9%;'>조회수</th>"
    		                            +"<th style='width:11%;'>좋아요 수</th></tr>");
    							for(var i =0; i<list.length; i++){
        							str+= "<tr>"
        								+ "<td>"+list[i].boardNo+ "</td>"
        								+ "<td>"+list[i].boardName + "</td>"
        								+ "<td>"+list[i].boardTitle + "</td>"
        								+ "<td>"+list[i].boardWriter + "</td>"
        								+ "<td>"+list[i].count + "</td>"
        								+ "<td>"+list[i].likeCount + "</td>"
        								+"</tr>";	
    							}	
    						}
    						$("#listTable").children("tbody").children().remove();
    						$("#listTable tbody").html(str);
                        },
                        
                        error : function(){
                            console.log("통신실패")
                        }
				
				});
                };
            </script>
        </div>
        <div id="footer"></div>
    </div>
</body>
</html>