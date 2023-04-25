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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>오늘의 인기글</title>
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
            /* border: 1px solid black; */
            box-sizing: border-box;
        }

        .wrap{
            height: 1730px;
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
            width: 100%;
            height: 100%;
            font-size: 30px;
            text-align: center;
        }
        #doWrite{
            border-bottom: 1px solid black;
            font-size: 70px;
            text-align: left;
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
                    <tr  style="height:9.9%;">
                        <th style="width:7%;">랭킹</th>
                        <th style="width:13%;">게시판 이름</th>
                        <th style="width:38%;">제목</th>
                        <th style="width:9%;">작성자</th>
                        <th style="width:9%;">조회수</th>
                        <th style="width:13%;">작성일</th>
                        <th style="width:11%;">좋아요 수</th>
                    </tr>
                    <%for(int i=0;i<list.size();i++){%>
					<tr>
						<td><%=i+1%></td>
						<td><%=list.get(i).getBoardName()%></td>
						<td><%=list.get(i).getBoardTitle()%></td>
						<td><a data-toggle="modal" data-target="#profile"><%=list.get(i).getBoardWriter()%></a></td>
						<td><%=list.get(i).getCount()%></td>
						<td><%=list.get(i).getCreateDate()%></td>
						<td><%=list.get(i).getLikeCount()%></td>
					</tr>                 
                    <%}%>
                </table>
            </div>
        </div>
        <div id="footer"></div>
    </div>
</body>
</html>