<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="com.udong.member.model.vo.Member"%>
 <%
	
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("MemberList");
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
<title>회원 관리</title>
    <style>
        div{
            /* border: 1px solid black; */
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
        #userListbtn{
            margin: 10px;
            padding: 20px 20px;
            
        }
        table{
            text-align: center; 
        }
        th,td{
            height: 145px;
            text-align: center;
        }
       
        .userchk{ width: 200px; height: 50px; position: absolute; left: 50%; margin-left: -200px; 
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
        transform: translate(-50%, 0%);
        }
        .search_btn{
            float: right;
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
                <a href="" id="userchk">회원 관리</a>
                <hr style="border: solid 1px gray;">
                <a href="/udong/BlackList.me" id="blacklist1">블랙 리스트</a>
                <hr style="border: solid 1px gray;">

            </div>
            <div id="content_2">
                
                <p id="content_title">회원관리</p>
                <hr style="border: solid 1px gray;">
                <table align="center">
                    <select name="search_type" class="userchk" >
                        <option id="userId" value="userId">아이디</option>
                        <option id="email" value="email">이메일</option>
                        <label>
                            <input type="search" id="search_content" class="search_content">
                            <button type="button"  id="search_btn" class="btn btn-secondary" 
                            class="btn btn-secondary" 
                            class="btn btn-secondary" 
                            style="right: 11%;
                            width: 83px;
                            height: 50px;
                            top: 10%;
                            position: absolute;
                            transform: translate(-50%, 0%);">검색</button> 
                        </label>
                    </table>
                </select>
                <table id="blacklist" border="1" align="center">
                    <br><br><br>
                    <thead>
                        <tr>
                            <th width="145px;" height="100px;">아이디</th>
                            <th width="145px;" height="100px;">이름</th>
                            <th width="145px;" height="100px;">생년월일</th>
                            <th width="145px;" height="100px;">이메일</th>
                            <th width="145px;" height="100px;">주소</th>
                            <th width="145px;" height="100px;">가입일</th>
                            <th width="145px;" height="100px;">강제추방</th>
                        </tr>
                    </thead>
           <%for(Member member : list){ %>
             <tr>
                <td><%= member.getUserId()%></td>
                <td><%= member.getUserName()%></td>
                <td><%= member.getBirthday() %></td>
                <td><%= member.getEmail() %></td>
                <td><%= member.getAddress() %></td>
                <td><%= member.getEnrollDate() %></td>
                <td><button type="button" id="userListbtn" class="btn btn-secondary">강제추방</button></td>
            </tr>
           <%} %>
       	 </table>
       	 <div align="center" class="paging-area">
	         	<%if(currentPage>10) {%> <!-- 이전 버튼  10번 페이지 이전에는 뒤로갈게 없어서 나오지않는 비노출-->
	         		<button>&lt;</button>
	         	<%} %>
	         	<%for(int i=minPage; i<=maxPage; i++) {%>
		         	<%if (currentPage == i){ %>
		         		<button style="cursor:default"><%=i %></button>
		         	<%}else{ %>
		      			<button onclick='location.href="/MemberList.me?page=<%=i%>"'><%=i %></button>
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

<script>
	$(function(){
		$("#search_btn").on('click' , function(){
			var search_type = $("#userId").val();
			var search_type = $("#email").val();
			if(user1d==userId){
				
			}
			location.href = "MemberList.me?userId="+$("#userId").val();
		});
	});
	
	/*
	$(function(){
		$("#search_btn").on('click' , function(){
			location.href = "MemberList.me?email="+$("#search_email").val();
		})
	})
	*/

</script>
</html>