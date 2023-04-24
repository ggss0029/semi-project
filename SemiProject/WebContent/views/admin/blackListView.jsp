<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="com.udong.member.model.vo.Member"%>
<%
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("BlackList");
	int totalPage = (int)request.getAttribute("totalPage");
	int currentPage = (int)request.getAttribute("currentPage");
	int minPage = (int)request.getAttribute("minPage");
	int maxPage = (int)request.getAttribute("maxPage");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
        	position:relative;
			z-index:1;
            height: 2000px;
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
        #adminchk{
            font-size: 50px;
            padding-left: 20px;
            padding-top: 20px;;
        }
        #blacklist{
            text-align: center;
            border: 1px solid black;
        }
        #blackListbtn{
            margin: 5px;
            padding: 5px 40px;
            
        }
        
        
    </style>
</head>
<body>
    <div class="wrap">
        <div id="header">
            <div id="header_1"></div>
            <div id="menubar"></div>
        </div>
        <div id="content">
            <div id="content_1">
                <p id="adminchk"><b>관리</b></p>
                <hr style="border: solid 1px gray;">
                <a href="/udong/MemberList.me" id="userchk">회원 관리</a>
                <hr style="border: solid 1px gray;">
                <a href="" id="blacklist1">블랙 리스트</a>
                <hr style="border: solid 1px gray;">

            </div>
            <div id="content_2">
                <p id="content_title">블랙리스트</p>
                <hr style="border: solid 1px gray;">
                
                <table id="blacklist" border="1" align="center">
                    
                    <thead>
                        <tr>
                            <th width="300px;" height="120px;">NO.</th>
                            <th width="300px;" height="120px;">이메일</th>
                            <th width="300px;" height="120px;">관리</th>
                        </tr>
                    </thead>
                    <%for(Member member : list){ %>
            <tr>
                <td><%= member.getUserNo() %></td>
                <td><%= member.getEmail() %></td>
                <form action="BlackUpdate.me" method="post">
                	<td><button type="submit" id="blackListbtn" class="btn btn-secondary">해제</button>
					<input type="hidden" name="userNo" value="<%=member.getUserNo()%>"></td>
				</form>
            </tr>
            <%} %>
            

        </table>
        <br>
        <div align="center" class="paging-area">
	         	<%if(currentPage>10) {%> <!-- 이전 버튼  10번 페이지 이전에는 뒤로갈게 없어서 나오지않는 비노출-->
	         		<button>&lt;</button>
	         	<%} %>
	         	<%for(int i=minPage; i<=maxPage; i++) {%>
		         	<%if (currentPage == i){ %>
		         		<button style="cursor:default"><%=i %></button>
		         	<%}else{ %>
		      			<button onclick='location.href="/BlackList.me?page=<%=i%>"'><%=i %></button>
		         	<%} %>
	         	<%} %>
	         	<%if(totalPage!=maxPage){ %>
	         	<button>&gt;</button>
	         	<%} %>
        
        </div>

            </div>
        </div>
        <div id="footer"></div>
    </div>
</body>
</html>