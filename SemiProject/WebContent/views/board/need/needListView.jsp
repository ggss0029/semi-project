<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="com.udong.board.need.vo.NeedBoard,java.util.ArrayList"%>
<% 
	ArrayList<NeedBoard> list = (ArrayList<NeedBoard>) request.getAttribute("NeedList");
	int totalPage = (int)request.getAttribute("totalPage");
	int currentPage = (int)request.getAttribute("currentPage");
	int minPage = (int)request.getAttribute("minPage");
	int maxPage = (int)request.getAttribute("maxPage");

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <title>Document</title>
    <style>
        div{
            /* border: 1px solid black; */
            box-sizing: border-box;
        }
        .wrap{
            height: 1530px;
			position:relative;
			z-index:1;
            width: 1500px;
            margin: auto;
        }
        .wrap>div{
            width: 100%;
        }
        #header{
            height: 13.5%;
        }
        #content{
            width: 100%;
            height: 76.5%;
            position: relative;
            
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
            background-color: red;
        }
        #menubar{
            height: 33%;
            background-color: orange;
        }
        #content>div{
            height: 100%;
            float: left;
        }
        
        #content_1{
            width: 25%;
            background-color: yellow;
        }
        #content_2{
            width: 75%;
            background-color: white;
        }
        #content a{
            font-size: 25px;
            color: black;
            padding-left: 20px;
        }
        #content_title{
            font-size: 45px;
            padding-left: 30px;
            padding-top : 50px;
        }
        #share{
            font-size: 50px;
            padding-left: 20px;
            padding-top: 20px;
        }
        #userListbtn{
            margin: 10px;
            padding: 20px 20px;
            
        }
        table{
            text-align: center; 
        }
        th,td{
            height: 65px;
            text-align: center;
        }
       
        .sharechk{ width: 161px; height: 50px; position: absolute; left: 50%; margin-left: -200px; bottom: 5%;
        }
        .search.do {
            position: absolute;
        }
        .search_content {
        width: 500px;
        height: 50px;
        border: 1px solid gray;
        position: absolute;
        left: 64%;
        bottom: 5%;
        transform: translate(-50%, 0%);
        }
        .search_btn{
            right: 15%;
            bottom: 20%;
            position: absolute;
            transform: translate(-50%, 0%);
        }
        
       
       
        </style>
</head>
<body>
<%@ include file = "../../common/menubar.jsp" %>
    <div class="wrap">
        <div id="content">
            <div id="content_1">
                <p id="share"><b>나눔</b></p>
                <hr style="border: solid 1px gray;">
                <a href="" id="sharechk">나눔 해요</a>
                <hr style="border: solid 1px gray;">
                <a href="" id="ineed">이거 필요해요</a>
                <hr style="border: solid 1px gray;">

            </div>
            <div id="content_2">
                
                <p id="content_title">이거 필요해요</p>
                <hr style="border: solid 1px gray;">
                <table align="center">
                    <select id="search_type" name="search_type" class="sharechk" >
                        <option id="search_share" value="search_share">제목+내용</option>
                        <label>
                            <input type="search" id="search_content" class="search_content">
                            <button type="button" id="search_btn" class="btn btn-secondary" 
                            style="right: 11%;
                            width: 83px;
                            height: 50px;
                            bottom: 5%;
                            position: absolute;
                            transform: translate(-50%, 0%);">검색</button> 
                        </label>
                    </table>
                </select>
                <table id="blacklist" border="1" align="center">
                    
                    <thead>
                        <tr>
                            <th width="100px;" >NO.</th>
                            <th width="500px;" >제목</th>
                            <th width="100px;" >작성자</th>
                            <th width="100px;" >작성일</th>
                            <th width="100px;" >조회</th>
                            <th width="100px;" >추천수</th>
                        </tr>
                    </thead>
            <%for(NeedBoard board : list){ %>        
            <tr>
                <td><%= board.getBoardNo() %></td>
                <td><%= board.getBoardTitle() %></td>
                <td><%= board.getBoardWriter() %></td>
                <td><%= board.getCreateDate() %></td>
                <td><%= board.getCount() %></td>
                <td><%= board.getLikeCnt() %></td>
            </tr>
            <%} %>
            
        </table>
        <br>
        <!--관리자 버튼-->
        <button type="button" class="btn btn-primary"
        style="right: 2%;
                            width: 83px;
                            height: 50px;
                            bottom: 9.5%;
                            position: absolute;
                            transform: translate(-50%, 0%);">글쓰기</button>
        <button type="button" class="btn btn-primary"
        style="right: 8%;
                            width: 83px;
                            height: 50px;
                            bottom: 9.5%;
                            position: absolute;
                            transform: translate(-50%, 0%);">수정</button>
        <button type="button" class="btn btn-primary"
        style="right: 14%;
                            width: 83px;
                            height: 50px;
                            bottom: 9.5%;
                            position: absolute;
                            transform: translate(-50%, 0%);">삭제</button>
        <!--사용자 버튼-->
        <button type="button" class="btn btn-primary"
        style="right: 11%;
                            width: 83px;
                            height: 50px;
                            bottom: 13%;
                            position: absolute;
                            transform: translate(-50%, 0%);">글쓰기</button>
        <br>
        
        
            </div>
        </div>
    </div>
    <%@ include file = "../../common/footer.jsp" %>
</body>
<script>
	$(function(){
		var contextPath = "<%= request.getContextPath()%>";
		$("#search_btn").click(function(){
			var searchType = $("#search_type").val();
			var content = $("#search_content").val();
			if(searchType == "search_share"){
				location.href = contextPath +  "/NeedBoardList.me?search_share=" + content;
			}
		});	 
	});

	
	
</script>


</html>