<%@page import="com.udong.board.common.model.vo.BoardCommon"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.udong.common.model.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String totalSearch = (String)request.getSession().getAttribute("totalSearch");
 	PageInfo pi = (PageInfo)request.getAttribute("pi");
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
		#pagingDiv>button{
			width:30px;
			height:30px;
			margin: 5px 5px;
		}
    </style>
</head>
<body>
	<%@include file="menubar.jsp"%>
    <div class="wrap">
        <div id="content" align="center">
        <div id="keywordDiv" align="center">
        	[<%=keyword%>]의 검색하신 결과입니다.
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
                    	<%if(list.isEmpty()){ %>
                    		<tr><td colspan="6">검색 결과가 없습니다.</td></tr>
                    	<%}else{ %>
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
						<%} %>
                    </tbody>
                </table>
                 <br>
            <div id="pagingDiv">
            	<%if(pi.getCurrentPage()!= 1){ %>
				<button onclick="location.href='<%=contextPath%>/totalSearch.do?currentPage=<%=pi.getCurrentPage()-1%>&inputKeyword=<%=keyword%>'">&lt;</button>
				<%} %>
				
				<%for(int i=pi.getStartPage(); i<=pi.getEndPage(); i++ ){ %>
					<%if(i != pi.getCurrentPage()){ %>
						<button onclick="location.href='<%=contextPath%>/totalSearch.do?currentPage=<%=i%>&inputKeyword=<%=keyword%>';"><%=i %></button>
					<%}else{ %>
						<button disabled><%=i %></button>
					<%} %>
				<%} %>
				<%if(!list.isEmpty() && pi.getCurrentPage() != pi.getMaxPage()){ %>
					<button onclick="location.href='<%=contextPath%>/totalSearch.do?currentPage=<%=pi.getCurrentPage()+1%>&inputKeyword=<%=keyword%>'">&gt;</button>
				<%} %>
            </div>
            </div>
            <script>
            
            	$("#pagingDiv").on("click","button",function(){
            		goSearch($(this).text());
            	});
            
                function goSearch(cp){
                	var currentPage;
                	console.log(cp);
                	if(cp==undefined){
                		currentPage = 1;
                	}else{
                		currentPage = cp;
                	}
                	
                    $.ajax({
                        url : "totalSearch.bo",
                        data : {
                                timeRange : $("#timeRange").val(),
                                detailRange : $("#detailRange").val(),
                                searchInput : $("#searchInput").val(),
                                currentPage : currentPage
                        },

                        success : function(total){
                        	var time = (total[0])
                        	var searchInput = (total[1]);
                        	var detailRange = (total[2]);
                        	var pi = (total[3]);
                        	var list = (total[4]);
                        	var check = (total[5]);
                        	
                        	$("#keywordDiv").html("["+searchInput+"]의 검색하신 결과입니다.");
                        	
                        	var str ="";
                        	
                        $("#pagingDiv").children().remove();	
                        	
                        	for(var i=pi.startPage; i<=pi.endPage; i++){
                        		if(i != pi.currentPage){
									$("#pagingDiv").append("<button type='button'>"+i+"</button>");
                        		}else{
                        			$("#pagingDiv").append("<button disabled>"+i+"</button>");
                        		}
                        	}
                        	
							if(list.length==0){
								$("#listTable").children("tbody").children().remove();
								str+="<tr><td colspan='5'>검색 결과가 없습니다.</td></tr>";
	    						$("#listTable tbody").html(str);
							};
                        
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
    					}else if(check == 'content'){
   							$("#listTable").children("thead").children().remove();
							$("#listTable thead").html("<tr><th style='width:7%;'>글 번호</th><th style='width:17%;'>게시판 이름</th>"
		                            +"<th style='width:38%;'>게시글 내용</th><th style='width:18%;'>작성자</th><th style='width:9%;'>조회수</th>"
		                            +"<th style='width:11%;'>좋아요 수</th></tr>");
							for(var i =0; i<list.length; i++){
    							str+= "<tr>"
    								+ "<td>"+list[i].boardNo+ "</td>"
    								+ "<td>"+list[i].boardName + "</td>"
    								+ "<td>"+list[i].boardContent + "</td>"
    								+ "<td>"+list[i].boardWriter + "</td>"
    								+ "<td>"+list[i].count + "</td>"
    								+ "<td>"+list[i].likeCount + "</td>"
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
    </div>
	<%@include file="footer.jsp" %>        
</body>
</html>