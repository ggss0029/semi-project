<%@page import="com.udong.board.common.model.vo.BoardCommon"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<BoardCommon> list = (ArrayList<BoardCommon>)request.getAttribute("bestPostList");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>오늘의 인기글</title>
    <style>
        div{
            /* border: 1px solid black; */
            box-sizing: border-box;
        }

        .wrap{
      		position:relative;
			z-index:1;
            height: 1530px;
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
        #content_1{
            margin-top: 60px;
            height:10%;
            width: 90%;
            /* background-color: yellow; */
        }
        #content_2{
            /* border: 1px solid red; */
            height: 75%;
            width: 90%;
        }
        #content_2>table{
        	margin-top:30px;
        	width:90%;
            font-size: 25px;
            text-align: center;
        }
        #doWrite{
            border-bottom: 1px solid black;
            font-size: 70px;
            text-align: left;
        }
        #listTable>tbody tr:hover{
        	background-color:#F5F5F5;
        	cursor:pointer; 
        }
    </style>
</head>
<body>
	<%@include file="menubar.jsp"%>
    <div class="wrap">
        <div id="content" align="center">
            <div id="content_1">
                <div id="doWrite">오늘의 인기글</div> <br>
            </div>
            <div id="content_2">
                <table id="listTable" border="1">
                	<thead>
	                    <tr>
	                        <th style="width:7%;">랭킹</th>
	                        <th style="width:15%;">게시판 이름</th>
	                        <th style="width:36%;">제목</th>
	                        <th style="width:9%;">작성자</th>
	                        <th style="width:9%;">조회수</th>
	                        <th style="width:13%;">작성일</th>
	                        <th style="width:11%;">좋아요 수</th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <%for(int i=0;i<list.size();i++){%>
						<tr>
							<td><input type="hidden" id="bNoHidden" value="<%=list.get(i).getBoardNo()%>"><%=i+1%></td>
							<td><%=list.get(i).getBoardName()%></td>
							<td><%=list.get(i).getBoardTitle()%></td>
							<td><a id="nicknameHover" onclick="whoareyou();"><%=list.get(i).getBoardWriter()%></a></td>
							<td><%=list.get(i).getCount()%></td>
							<td><%=list.get(i).getCreateDate()%></td>
							<td><%=list.get(i).getLikeCount()%></td>
						</tr>
					</tbody>                 
                    <%}%>
                </table>
                <script>
                	$("#listTable>tbody>tr").click(function(){
                		var bno = $(this).children().children("input").val();
                		location.href="<%=contextPath%>/bestDetail.bo?bno="+bno;
                	});
                </script>
            </div>
        </div>
    </div>
    <%@include file="footer.jsp"%>
</body>
</html>